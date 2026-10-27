defmodule Membrane.AudioMixer.NativeMixerInitTest do
  @moduledoc false

  use ExUnit.Case, async: true

  alias Membrane.AudioMixer.Mixer.Native
  alias Membrane.RawAudio

  test "init rejects a sample format with no byte size" do
    assert {:ok, _state} = Native.init(2, RawAudio.SampleFormat.serialize(:s16le), 44_100)
    assert_raise ErlangError, fn -> Native.init(2, 0, 44_100) end
  end
end
