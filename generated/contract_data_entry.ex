defmodule StellarBase.XDR.ContractDataEntry do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `ContractDataEntry` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    SCAddress,
    SCVal,
    ContractDataDurability,
    ContractDataEntryBody,
    Uint32
  }

  @struct_spec XDR.Struct.new(
    contract: SCAddress,
    key: SCVal,
    durability: ContractDataDurability,
    body: ContractDataEntryBody,
    expiration_ledger_seq: Uint32
  )

  @type contract_type :: SCAddress.t()
  @type key_type :: SCVal.t()
  @type durability_type :: ContractDataDurability.t()
  @type body_type :: ContractDataEntryBody.t()
  @type expiration_ledger_seq_type :: Uint32.t()

  @type t :: %__MODULE__{contract: contract_type(), key: key_type(), durability: durability_type(), body: body_type(), expiration_ledger_seq: expiration_ledger_seq_type()}

  defstruct [:contract, :key, :durability, :body, :expiration_ledger_seq]

  @spec new(contract :: contract_type(), key :: key_type(), durability :: durability_type(), body :: body_type(), expiration_ledger_seq :: expiration_ledger_seq_type()) :: t()
  def new(
    %SCAddress{} = contract,
    %SCVal{} = key,
    %ContractDataDurability{} = durability,
    %ContractDataEntryBody{} = body,
    %Uint32{} = expiration_ledger_seq
  ),
  do: %__MODULE__{contract: contract, key: key, durability: durability, body: body, expiration_ledger_seq: expiration_ledger_seq}

  @impl true
  def encode_xdr(%__MODULE__{contract: contract, key: key, durability: durability, body: body, expiration_ledger_seq: expiration_ledger_seq}) do
    [contract: contract, key: key, durability: durability, body: body, expiration_ledger_seq: expiration_ledger_seq]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{contract: contract, key: key, durability: durability, body: body, expiration_ledger_seq: expiration_ledger_seq}) do
    [contract: contract, key: key, durability: durability, body: body, expiration_ledger_seq: expiration_ledger_seq]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok, {%XDR.Struct{components: [contract: contract, key: key, durability: durability, body: body, expiration_ledger_seq: expiration_ledger_seq]}, rest}} ->
        {:ok, {new(contract, key, durability, body, expiration_ledger_seq), rest}}
      error -> error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [contract: contract, key: key, durability: durability, body: body, expiration_ledger_seq: expiration_ledger_seq]}, rest} =
      XDR.Struct.decode_xdr!(bytes, struct)
    {new(contract, key, durability, body, expiration_ledger_seq), rest}
  end
end
