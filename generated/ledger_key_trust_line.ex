defmodule StellarBase.XDR.LedgerKeyTrustLine do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `LedgerKeyTrustLine` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    AccountID,
    TrustLineAsset
  }

  @struct_spec XDR.Struct.new(
    account_id: AccountID,
    asset: TrustLineAsset
  )

  @type account_id_type :: AccountID.t()
  @type asset_type :: TrustLineAsset.t()

  @type t :: %__MODULE__{account_id: account_id_type(), asset: asset_type()}

  defstruct [:account_id, :asset]

  @spec new(account_id :: account_id_type(), asset :: asset_type()) :: t()
  def new(
    %AccountID{} = account_id,
    %TrustLineAsset{} = asset
  ),
  do: %__MODULE__{account_id: account_id, asset: asset}

  @impl true
  def encode_xdr(%__MODULE__{account_id: account_id, asset: asset}) do
    [account_id: account_id, asset: asset]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{account_id: account_id, asset: asset}) do
    [account_id: account_id, asset: asset]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok, {%XDR.Struct{components: [account_id: account_id, asset: asset]}, rest}} ->
        {:ok, {new(account_id, asset), rest}}
      error -> error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [account_id: account_id, asset: asset]}, rest} =
      XDR.Struct.decode_xdr!(bytes, struct)
    {new(account_id, asset), rest}
  end
end