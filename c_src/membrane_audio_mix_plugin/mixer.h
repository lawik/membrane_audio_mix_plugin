#pragma once

#include "raw_audio_format.h"
#include <erl_nif.h>
#include <stdbool.h>
#include <stdint.h>

// Longest run of same-sign values (samples of all channels) kept back while
// waiting for a sign change, 8 MiB of int64 values. Keeps the queue, and the
// output of a single mix, bounded for silence or constant-sign input.
#define MAX_QUEUE_LENGTH (1u << 20)

typedef struct _mixer_state {
  RawAudioFormat stream_format;
  int32_t sample_size;
  int32_t sample_max;
  int32_t sample_min;
  bool is_wave_positive;
  int64_t *queue;
  uint32_t queue_length;
} State;

#include "_generated/mixer.h"
