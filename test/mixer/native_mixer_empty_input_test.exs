defmodule Membrane.AudioMixer.NativeMixerEmptyInputTest do
  @moduledoc false

  use ExUnit.Case, async: true

  alias Membrane.AudioMixer.Mixer.Native
  alias Membrane.RawAudio

  test "mix with no input keeps the queue and returns nothing" do
    assert {:ok, state} = Native.init(1, RawAudio.SampleFormat.serialize(:s16le), 16_000)

    # samples of one sign are queued until the sign changes
    assert {:ok, <<>>, state} = Native.mix([<<1, 0, 2, 0>>], state)
    assert {:ok, <<>>, state} = Native.mix([], state)
    assert {:ok, <<>>, state} = Native.mix([<<>>], state)
    assert {:ok, <<1, 0, 2, 0>>, _state} = Native.flush(state)
  end
end
