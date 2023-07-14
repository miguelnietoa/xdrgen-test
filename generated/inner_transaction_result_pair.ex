defmodule StellarBase.XDR.InnerTransactionResultPair do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `InnerTransactionResultPair` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    Hash,
    InnerTransactionResult
  }

  @struct_spec XDR.Struct.new(
    transaction_hash: Hash,
    result: InnerTransactionResult
  )

  @type transaction_hash_type :: Hash.t()
  @type result_type :: InnerTransactionResult.t()

  @type t :: %__MODULE__{transaction_hash: transaction_hash_type(), result: result_type()}

  defstruct [:transaction_hash, :result]

  @spec new(transaction_hash :: transaction_hash_type(), result :: result_type()) :: t()
  def new(
    %Hash{} = transaction_hash,
    %InnerTransactionResult{} = result
  ),
  do: %__MODULE__{transaction_hash: transaction_hash, result: result}

  @impl true
  def encode_xdr(%__MODULE__{transaction_hash: transaction_hash, result: result}) do
    [transaction_hash: transaction_hash, result: result]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{transaction_hash: transaction_hash, result: result}) do
    [transaction_hash: transaction_hash, result: result]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok, {%XDR.Struct{components: [transaction_hash: transaction_hash, result: result]}, rest}} ->
        {:ok, {new(transaction_hash, result), rest}}
      error -> error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [transaction_hash: transaction_hash, result: result]}, rest} =
      XDR.Struct.decode_xdr!(bytes, struct)
    {new(transaction_hash, result), rest}
  end
end
