defmodule StellarBase.XDR.FeeBumpTransaction do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `FeeBumpTransaction` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    MuxedAccount,
    Int64,
    FeeBumpTransactionInnerTx,
    FeeBumpTransactionExt
  }

  @struct_spec XDR.Struct.new(
    fee_source: MuxedAccount,
    fee: Int64,
    inner_tx: FeeBumpTransactionInnerTx,
    ext: FeeBumpTransactionExt
  )

  @type fee_source_type :: MuxedAccount.t()
  @type fee_type :: Int64.t()
  @type inner_tx_type :: FeeBumpTransactionInnerTx.t()
  @type ext_type :: FeeBumpTransactionExt.t()

  @type t :: %__MODULE__{fee_source: fee_source_type(), fee: fee_type(), inner_tx: inner_tx_type(), ext: ext_type()}

  defstruct [:fee_source, :fee, :inner_tx, :ext]

  @spec new(fee_source :: fee_source_type(), fee :: fee_type(), inner_tx :: inner_tx_type(), ext :: ext_type()) :: t()
  def new(
    %MuxedAccount{} = fee_source,
    %Int64{} = fee,
    %FeeBumpTransactionInnerTx{} = inner_tx,
    %FeeBumpTransactionExt{} = ext
  ),
  do: %__MODULE__{fee_source: fee_source, fee: fee, inner_tx: inner_tx, ext: ext}

  @impl true
  def encode_xdr(%__MODULE__{fee_source: fee_source, fee: fee, inner_tx: inner_tx, ext: ext}) do
    [fee_source: fee_source, fee: fee, inner_tx: inner_tx, ext: ext]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{fee_source: fee_source, fee: fee, inner_tx: inner_tx, ext: ext}) do
    [fee_source: fee_source, fee: fee, inner_tx: inner_tx, ext: ext]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok, {%XDR.Struct{components: [fee_source: fee_source, fee: fee, inner_tx: inner_tx, ext: ext]}, rest}} ->
        {:ok, {new(fee_source, fee, inner_tx, ext), rest}}
      error -> error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [fee_source: fee_source, fee: fee, inner_tx: inner_tx, ext: ext]}, rest} =
      XDR.Struct.decode_xdr!(bytes, struct)
    {new(fee_source, fee, inner_tx, ext), rest}
  end
end