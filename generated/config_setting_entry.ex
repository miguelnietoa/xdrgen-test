defmodule StellarBase.XDR.ConfigSettingEntry do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `ConfigSettingEntry` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    ConfigSettingID,
    Uint32,
    ConfigSettingContractComputeV0,
    ConfigSettingContractLedgerCostV0,
    ConfigSettingContractHistoricalDataV0,
    ConfigSettingContractMetaDataV0,
    ConfigSettingContractBandwidthV0,
    ContractCostParams
  }

  @arms [
    CONFIG_SETTING_CONTRACT_MAX_SIZE_BYTES: Uint32,
    CONFIG_SETTING_CONTRACT_COMPUTE_V0: ConfigSettingContractComputeV0,
    CONFIG_SETTING_CONTRACT_LEDGER_COST_V0: ConfigSettingContractLedgerCostV0,
    CONFIG_SETTING_CONTRACT_HISTORICAL_DATA_V0: ConfigSettingContractHistoricalDataV0,
    CONFIG_SETTING_CONTRACT_META_DATA_V0: ConfigSettingContractMetaDataV0,
    CONFIG_SETTING_CONTRACT_BANDWIDTH_V0: ConfigSettingContractBandwidthV0,
    CONFIG_SETTING_CONTRACT_COST_PARAMS_CPU_INSTRUCTIONS: ContractCostParams,
    CONFIG_SETTING_CONTRACT_COST_PARAMS_MEMORY_BYTES: ContractCostParams,
    CONFIG_SETTING_CONTRACT_DATA_KEY_SIZE_BYTES: Uint32,
    CONFIG_SETTING_CONTRACT_DATA_ENTRY_SIZE_BYTES: Uint32
  ]

  @type value ::
          Uint32.t()
          | ConfigSettingContractComputeV0.t()
          | ConfigSettingContractLedgerCostV0.t()
          | ConfigSettingContractHistoricalDataV0.t()
          | ConfigSettingContractMetaDataV0.t()
          | ConfigSettingContractBandwidthV0.t()
          | ContractCostParams.t()

  @type t :: %__MODULE__{value: value(), type: ConfigSettingID.t()}

  defstruct [:value, :type]

  @spec new(value :: value(), type :: ConfigSettingID.t()) :: t()
  def new(value, %ConfigSettingID{} = type), do: %__MODULE__{value: value, type: type}

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
    |> ConfigSettingID.new()
    |> XDR.Union.new(@arms)
  end
end
