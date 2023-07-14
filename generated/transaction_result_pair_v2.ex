defmodule StellarBase.XDR.TransactionResultPairV2 do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `TransactionResultPairV2` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    Hash
  }

  @struct_spec XDR.Struct.new(
    transaction_hash: Hash,
    hash_of_meta_hashes: Hash
  )

  @type transaction_hash_type :: Hash.t()
  @type hash_of_meta_hashes_type :: Hash.t()

  @type t :: %__MODULE__{transaction_hash: transaction_hash_type(), hash_of_meta_hashes: hash_of_meta_hashes_type()}

  defstruct [:transaction_hash, :hash_of_meta_hashes]

  @spec new(transaction_hash :: transaction_hash_type(), hash_of_meta_hashes :: hash_of_meta_hashes_type()) :: t()
  def new(
    %Hash{} = transaction_hash,
    %Hash{} = hash_of_meta_hashes
  ),
  do: %__MODULE__{transaction_hash: transaction_hash, hash_of_meta_hashes: hash_of_meta_hashes}

  @impl true
  def encode_xdr(%__MODULE__{transaction_hash: transaction_hash, hash_of_meta_hashes: hash_of_meta_hashes}) do
    [transaction_hash: transaction_hash, hash_of_meta_hashes: hash_of_meta_hashes]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{transaction_hash: transaction_hash, hash_of_meta_hashes: hash_of_meta_hashes}) do
    [transaction_hash: transaction_hash, hash_of_meta_hashes: hash_of_meta_hashes]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok, {%XDR.Struct{components: [transaction_hash: transaction_hash, hash_of_meta_hashes: hash_of_meta_hashes]}, rest}} ->
        {:ok, {new(transaction_hash, hash_of_meta_hashes), rest}}
      error -> error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [transaction_hash: transaction_hash, hash_of_meta_hashes: hash_of_meta_hashes]}, rest} =
      XDR.Struct.decode_xdr!(bytes, struct)
    {new(transaction_hash, hash_of_meta_hashes), rest}
  end
end
