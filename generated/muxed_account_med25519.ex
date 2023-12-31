defmodule StellarBase.XDR.MuxedAccountMed25519 do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `MuxedAccountMed25519` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    Uint64,
    Uint256
  }

  @struct_spec XDR.Struct.new(
    id: Uint64,
    ed25519: Uint256
  )

  @type id_type :: Uint64.t()
  @type ed25519_type :: Uint256.t()

  @type t :: %__MODULE__{id: id_type(), ed25519: ed25519_type()}

  defstruct [:id, :ed25519]

  @spec new(id :: id_type(), ed25519 :: ed25519_type()) :: t()
  def new(
    %Uint64{} = id,
    %Uint256{} = ed25519
  ),
  do: %__MODULE__{id: id, ed25519: ed25519}

  @impl true
  def encode_xdr(%__MODULE__{id: id, ed25519: ed25519}) do
    [id: id, ed25519: ed25519]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{id: id, ed25519: ed25519}) do
    [id: id, ed25519: ed25519]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok, {%XDR.Struct{components: [id: id, ed25519: ed25519]}, rest}} ->
        {:ok, {new(id, ed25519), rest}}
      error -> error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [id: id, ed25519: ed25519]}, rest} =
      XDR.Struct.decode_xdr!(bytes, struct)
    {new(id, ed25519), rest}
  end
end
