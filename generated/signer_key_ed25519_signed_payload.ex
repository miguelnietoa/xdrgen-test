defmodule StellarBase.XDR.SignerKeyEd25519SignedPayload do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `SignerKeyEd25519SignedPayload` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    Uint256,
    VariableOpaque64
  }

  @struct_spec XDR.Struct.new(
    ed25519: Uint256,
    payload: VariableOpaque64
  )

  @type ed25519_type :: Uint256.t()
  @type payload_type :: VariableOpaque64.t()

  @type t :: %__MODULE__{ed25519: ed25519_type(), payload: payload_type()}

  defstruct [:ed25519, :payload]

  @spec new(ed25519 :: ed25519_type(), payload :: payload_type()) :: t()
  def new(
    %Uint256{} = ed25519,
    %VariableOpaque64{} = payload
  ),
  do: %__MODULE__{ed25519: ed25519, payload: payload}

  @impl true
  def encode_xdr(%__MODULE__{ed25519: ed25519, payload: payload}) do
    [ed25519: ed25519, payload: payload]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{ed25519: ed25519, payload: payload}) do
    [ed25519: ed25519, payload: payload]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok, {%XDR.Struct{components: [ed25519: ed25519, payload: payload]}, rest}} ->
        {:ok, {new(ed25519, payload), rest}}
      error -> error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [ed25519: ed25519, payload: payload]}, rest} =
      XDR.Struct.decode_xdr!(bytes, struct)
    {new(ed25519, payload), rest}
  end
end
