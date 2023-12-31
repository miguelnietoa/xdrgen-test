defmodule StellarBase.XDR.StoredDebugTransactionSet do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `StoredDebugTransactionSet` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    StoredTransactionSet,
    Uint32,
    StellarValue
  }

  @struct_spec XDR.Struct.new(
    tx_set: StoredTransactionSet,
    ledger_seq: Uint32,
    scp_value: StellarValue
  )

  @type tx_set_type :: StoredTransactionSet.t()
  @type ledger_seq_type :: Uint32.t()
  @type scp_value_type :: StellarValue.t()

  @type t :: %__MODULE__{tx_set: tx_set_type(), ledger_seq: ledger_seq_type(), scp_value: scp_value_type()}

  defstruct [:tx_set, :ledger_seq, :scp_value]

  @spec new(tx_set :: tx_set_type(), ledger_seq :: ledger_seq_type(), scp_value :: scp_value_type()) :: t()
  def new(
    %StoredTransactionSet{} = tx_set,
    %Uint32{} = ledger_seq,
    %StellarValue{} = scp_value
  ),
  do: %__MODULE__{tx_set: tx_set, ledger_seq: ledger_seq, scp_value: scp_value}

  @impl true
  def encode_xdr(%__MODULE__{tx_set: tx_set, ledger_seq: ledger_seq, scp_value: scp_value}) do
    [tx_set: tx_set, ledger_seq: ledger_seq, scp_value: scp_value]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{tx_set: tx_set, ledger_seq: ledger_seq, scp_value: scp_value}) do
    [tx_set: tx_set, ledger_seq: ledger_seq, scp_value: scp_value]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok, {%XDR.Struct{components: [tx_set: tx_set, ledger_seq: ledger_seq, scp_value: scp_value]}, rest}} ->
        {:ok, {new(tx_set, ledger_seq, scp_value), rest}}
      error -> error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [tx_set: tx_set, ledger_seq: ledger_seq, scp_value: scp_value]}, rest} =
      XDR.Struct.decode_xdr!(bytes, struct)
    {new(tx_set, ledger_seq, scp_value), rest}
  end
end
