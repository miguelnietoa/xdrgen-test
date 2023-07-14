defmodule StellarBase.XDR.NodeID do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `NodeID` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.PublicKey

  @type t :: %__MODULE__{node_id: PublicKey.t()}

  defstruct [:node_id]

  @spec new(node_id :: PublicKey.t()) :: t()
  def new(%PublicKey{} = node_id), do: %__MODULE__{node_id: node_id}

  @impl true
  def encode_xdr(%__MODULE__{node_id: node_id}) do
    PublicKey.encode_xdr(node_id)
  end

  @impl true
  def encode_xdr!(%__MODULE__{node_id: node_id}) do
    PublicKey.encode_xdr!(node_id)
  end

  @impl true
  def decode_xdr(bytes, term \\ nil)

  def decode_xdr(bytes, _term) do
    case PublicKey.decode_xdr(bytes) do
      {:ok, {%PublicKey{} = node_id, rest}} -> {:ok, {new(node_id), rest}}
      error -> error
    end
  end

  @impl true
  def decode_xdr!(bytes, term \\ nil)

  def decode_xdr!(bytes, _term) do
    {%PublicKey{} = node_id, rest} = PublicKey.decode_xdr!(bytes)
    {new(node_id), rest}
  end
end