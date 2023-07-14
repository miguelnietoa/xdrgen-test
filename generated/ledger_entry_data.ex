defmodule StellarBase.XDR.LedgerEntryData do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `LedgerEntryData` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    LedgerEntryType,
    AccountEntry,
    TrustLineEntry,
    OfferEntry,
    DataEntry,
    ClaimableBalanceEntry,
    LiquidityPoolEntry,
    ContractDataEntry,
    ContractCodeEntry,
    ConfigSettingEntry
  }

  @arms [
    ACCOUNT: AccountEntry,
    TRUSTLINE: TrustLineEntry,
    OFFER: OfferEntry,
    DATA: DataEntry,
    CLAIMABLE_BALANCE: ClaimableBalanceEntry,
    LIQUIDITY_POOL: LiquidityPoolEntry,
    CONTRACT_DATA: ContractDataEntry,
    CONTRACT_CODE: ContractCodeEntry,
    CONFIG_SETTING: ConfigSettingEntry
  ]

  @type value ::
          AccountEntry.t()
          | TrustLineEntry.t()
          | OfferEntry.t()
          | DataEntry.t()
          | ClaimableBalanceEntry.t()
          | LiquidityPoolEntry.t()
          | ContractDataEntry.t()
          | ContractCodeEntry.t()
          | ConfigSettingEntry.t()

  @type t :: %__MODULE__{value: value(), type: LedgerEntryType.t()}

  defstruct [:value, :type]

  @spec new(value :: value(), type :: LedgerEntryType.t()) :: t()
  def new(value, %LedgerEntryType{} = type), do: %__MODULE__{value: value, type: type}

  @impl true
  def encode_xdr(%__MODULE__{value: value, type: type}) do
    type
    |> XDR.Union.new(@arms, value)
    |> XDR.Union.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{value: value, type: type}) do
    type
    |> XDR.Union.new(@arms, value)
    |> XDR.Union.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, spec \\ union_spec())

  def decode_xdr(bytes, spec) do
    case XDR.Union.decode_xdr(bytes, spec) do
      {:ok, {{type, value}, rest}} -> {:ok, {new(value, type), rest}}
      error -> error
    end
  end

  @impl true
  def decode_xdr!(bytes, spec \\ union_spec())

  def decode_xdr!(bytes, spec) do
    {{type, value}, rest} = XDR.Union.decode_xdr!(bytes, spec)
    {new(value, type), rest}
  end

  @spec union_spec() :: XDR.Union.t()
  defp union_spec do
    nil
    |> LedgerEntryType.new()
    |> XDR.Union.new(@arms)
  end
end