defmodule StellarBase.XDR.Duration do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `Duration` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.Uint64

  @type t :: %__MODULE__{duration: Uint64.t()}

  defstruct [:duration]

  @spec new(duration :: Uint64.t()) :: t()
  def new(%Uint64{} = duration), do: %__MODULE__{duration: duration}

  @impl true
  def encode_xdr(%__MODULE__{duration: duration}) do
    Uint64.encode_xdr(duration)
  end

  @impl true
  def encode_xdr!(%__MODULE__{duration: duration}) do
    Uint64.encode_xdr!(duration)
  end

  @impl true
  def decode_xdr(bytes, term \\ nil)

  def decode_xdr(bytes, _term) do
    case Uint64.decode_xdr(bytes) do
      {:ok, {%Uint64{} = duration, rest}} -> {:ok, {new(duration), rest}}
      error -> error
    end
  end

  @impl true
  def decode_xdr!(bytes, term \\ nil)

  def decode_xdr!(bytes, _term) do
    {%Uint64{} = duration, rest} = Uint64.decode_xdr!(bytes)
    {new(duration), rest}
  end
end
