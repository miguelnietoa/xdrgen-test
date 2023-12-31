defmodule StellarBase.XDR.Signer do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `Signer` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    SignerKey,
    Uint32
  }

  @struct_spec XDR.Struct.new(
    key: SignerKey,
    weight: Uint32
  )

  @type key_type :: SignerKey.t()
  @type weight_type :: Uint32.t()

  @type t :: %__MODULE__{key: key_type(), weight: weight_type()}

  defstruct [:key, :weight]

  @spec new(key :: key_type(), weight :: weight_type()) :: t()
  def new(
    %SignerKey{} = key,
    %Uint32{} = weight
  ),
  do: %__MODULE__{key: key, weight: weight}

  @impl true
  def encode_xdr(%__MODULE__{key: key, weight: weight}) do
    [key: key, weight: weight]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{key: key, weight: weight}) do
    [key: key, weight: weight]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok, {%XDR.Struct{components: [key: key, weight: weight]}, rest}} ->
        {:ok, {new(key, weight), rest}}
      error -> error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [key: key, weight: weight]}, rest} =
      XDR.Struct.decode_xdr!(bytes, struct)
    {new(key, weight), rest}
  end
end
