defmodule StellarBase.XDR.ContractID do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `ContractID` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    ContractIDType,
    Uint256,
    ContractIDFromEd25519PublicKey,
    Asset
  }

  @arms [
    CONTRACT_ID_FROM_SOURCE_ACCOUNT: Uint256,
    CONTRACT_ID_FROM_ED25519_PUBLIC_KEY: ContractIDFromEd25519PublicKey,
    CONTRACT_ID_FROM_ASSET: Asset
  ]

  @type value ::
          Uint256.t()
          | ContractIDFromEd25519PublicKey.t()
          | Asset.t()

  @type t :: %__MODULE__{value: value(), type: ContractIDType.t()}

  defstruct [:value, :type]

  @spec new(value :: value(), type :: ContractIDType.t()) :: t()
  def new(value, %ContractIDType{} = type), do: %__MODULE__{value: value, type: type}

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
    |> ContractIDType.new()
    |> XDR.Union.new(@arms)
  end
end