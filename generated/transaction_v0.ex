defmodule StellarBase.XDR.TransactionV0 do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `TransactionV0` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    Uint256,
    Uint32,
    SequenceNumber,
    OptionalTimeBounds,
    Memo,
    OperationList100,
    TransactionV0Ext
  }

  @struct_spec XDR.Struct.new(
    source_account_ed25519: Uint256,
    fee: Uint32,
    seq_num: SequenceNumber,
    time_bounds: OptionalTimeBounds,
    memo: Memo,
    operations: OperationList100,
    ext: TransactionV0Ext
  )

  @type source_account_ed25519_type :: Uint256.t()
  @type fee_type :: Uint32.t()
  @type seq_num_type :: SequenceNumber.t()
  @type time_bounds_type :: OptionalTimeBounds.t()
  @type memo_type :: Memo.t()
  @type operations_type :: OperationList100.t()
  @type ext_type :: TransactionV0Ext.t()

  @type t :: %__MODULE__{source_account_ed25519: source_account_ed25519_type(), fee: fee_type(), seq_num: seq_num_type(), time_bounds: time_bounds_type(), memo: memo_type(), operations: operations_type(), ext: ext_type()}

  defstruct [:source_account_ed25519, :fee, :seq_num, :time_bounds, :memo, :operations, :ext]

  @spec new(source_account_ed25519 :: source_account_ed25519_type(), fee :: fee_type(), seq_num :: seq_num_type(), time_bounds :: time_bounds_type(), memo :: memo_type(), operations :: operations_type(), ext :: ext_type()) :: t()
  def new(
    %Uint256{} = source_account_ed25519,
    %Uint32{} = fee,
    %SequenceNumber{} = seq_num,
    %OptionalTimeBounds{} = time_bounds,
    %Memo{} = memo,
    %OperationList100{} = operations,
    %TransactionV0Ext{} = ext
  ),
  do: %__MODULE__{source_account_ed25519: source_account_ed25519, fee: fee, seq_num: seq_num, time_bounds: time_bounds, memo: memo, operations: operations, ext: ext}

  @impl true
  def encode_xdr(%__MODULE__{source_account_ed25519: source_account_ed25519, fee: fee, seq_num: seq_num, time_bounds: time_bounds, memo: memo, operations: operations, ext: ext}) do
    [source_account_ed25519: source_account_ed25519, fee: fee, seq_num: seq_num, time_bounds: time_bounds, memo: memo, operations: operations, ext: ext]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{source_account_ed25519: source_account_ed25519, fee: fee, seq_num: seq_num, time_bounds: time_bounds, memo: memo, operations: operations, ext: ext}) do
    [source_account_ed25519: source_account_ed25519, fee: fee, seq_num: seq_num, time_bounds: time_bounds, memo: memo, operations: operations, ext: ext]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok, {%XDR.Struct{components: [source_account_ed25519: source_account_ed25519, fee: fee, seq_num: seq_num, time_bounds: time_bounds, memo: memo, operations: operations, ext: ext]}, rest}} ->
        {:ok, {new(source_account_ed25519, fee, seq_num, time_bounds, memo, operations, ext), rest}}
      error -> error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [source_account_ed25519: source_account_ed25519, fee: fee, seq_num: seq_num, time_bounds: time_bounds, memo: memo, operations: operations, ext: ext]}, rest} =
      XDR.Struct.decode_xdr!(bytes, struct)
    {new(source_account_ed25519, fee, seq_num, time_bounds, memo, operations, ext), rest}
  end
end
