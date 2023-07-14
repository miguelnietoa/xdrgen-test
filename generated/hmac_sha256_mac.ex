defmodule StellarBase.XDR.HmacSha256Mac do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `HmacSha256Mac` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    Opaque32
  }

  @struct_spec XDR.Struct.new(
    mac: Opaque32
  )

  @type mac_type :: Opaque32.t()

  @type t :: %__MODULE__{mac: mac_type()}

  defstruct [:mac]

  @spec new(mac :: mac_type()) :: t()
  def new(
    %Opaque32{} = mac
  ),
  do: %__MODULE__{mac: mac}

  @impl true
  def encode_xdr(%__MODULE__{mac: mac}) do
    [mac: mac]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{mac: mac}) do
    [mac: mac]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok, {%XDR.Struct{components: [mac: mac]}, rest}} ->
        {:ok, {new(mac), rest}}
      error -> error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [mac: mac]}, rest} =
      XDR.Struct.decode_xdr!(bytes, struct)
    {new(mac), rest}
  end
end
