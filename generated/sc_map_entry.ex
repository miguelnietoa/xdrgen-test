defmodule StellarBase.XDR.SCMapEntry do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `SCMapEntry` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    SCVal
  }

  @struct_spec XDR.Struct.new(
    key: SCVal,
    val: SCVal
  )

  @type key_type :: SCVal.t()
  @type val_type :: SCVal.t()

  @type t :: %__MODULE__{key: key_type(), val: val_type()}

  defstruct [:key, :val]

  @spec new(key :: key_type(), val :: val_type()) :: t()
  def new(
    %SCVal{} = key,
    %SCVal{} = val
  ),
  do: %__MODULE__{key: key, val: val}

  @impl true
  def encode_xdr(%__MODULE__{key: key, val: val}) do
    [key: key, val: val]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{key: key, val: val}) do
    [key: key, val: val]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok, {%XDR.Struct{components: [key: key, val: val]}, rest}} ->
        {:ok, {new(key, val), rest}}
      error -> error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [key: key, val: val]}, rest} =
      XDR.Struct.decode_xdr!(bytes, struct)
    {new(key, val), rest}
  end
end