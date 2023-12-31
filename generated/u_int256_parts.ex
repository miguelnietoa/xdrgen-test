defmodule StellarBase.XDR.UInt256Parts do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `UInt256Parts` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    Uint64
  }

  @struct_spec XDR.Struct.new(
    hi_hi: Uint64,
    hi_lo: Uint64,
    lo_hi: Uint64,
    lo_lo: Uint64
  )

  @type hi_hi_type :: Uint64.t()
  @type hi_lo_type :: Uint64.t()
  @type lo_hi_type :: Uint64.t()
  @type lo_lo_type :: Uint64.t()

  @type t :: %__MODULE__{hi_hi: hi_hi_type(), hi_lo: hi_lo_type(), lo_hi: lo_hi_type(), lo_lo: lo_lo_type()}

  defstruct [:hi_hi, :hi_lo, :lo_hi, :lo_lo]

  @spec new(hi_hi :: hi_hi_type(), hi_lo :: hi_lo_type(), lo_hi :: lo_hi_type(), lo_lo :: lo_lo_type()) :: t()
  def new(
    %Uint64{} = hi_hi,
    %Uint64{} = hi_lo,
    %Uint64{} = lo_hi,
    %Uint64{} = lo_lo
  ),
  do: %__MODULE__{hi_hi: hi_hi, hi_lo: hi_lo, lo_hi: lo_hi, lo_lo: lo_lo}

  @impl true
  def encode_xdr(%__MODULE__{hi_hi: hi_hi, hi_lo: hi_lo, lo_hi: lo_hi, lo_lo: lo_lo}) do
    [hi_hi: hi_hi, hi_lo: hi_lo, lo_hi: lo_hi, lo_lo: lo_lo]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{hi_hi: hi_hi, hi_lo: hi_lo, lo_hi: lo_hi, lo_lo: lo_lo}) do
    [hi_hi: hi_hi, hi_lo: hi_lo, lo_hi: lo_hi, lo_lo: lo_lo]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok, {%XDR.Struct{components: [hi_hi: hi_hi, hi_lo: hi_lo, lo_hi: lo_hi, lo_lo: lo_lo]}, rest}} ->
        {:ok, {new(hi_hi, hi_lo, lo_hi, lo_lo), rest}}
      error -> error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [hi_hi: hi_hi, hi_lo: hi_lo, lo_hi: lo_hi, lo_lo: lo_lo]}, rest} =
      XDR.Struct.decode_xdr!(bytes, struct)
    {new(hi_hi, hi_lo, lo_hi, lo_lo), rest}
  end
end
