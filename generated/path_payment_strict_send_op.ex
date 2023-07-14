defmodule StellarBase.XDR.PathPaymentStrictSendOp do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `PathPaymentStrictSendOp` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    Asset,
    Int64,
    MuxedAccount,
    AssetList5
  }

  @struct_spec XDR.Struct.new(
    send_asset: Asset,
    send_amount: Int64,
    destination: MuxedAccount,
    dest_asset: Asset,
    dest_min: Int64,
    path: AssetList5
  )

  @type send_asset_type :: Asset.t()
  @type send_amount_type :: Int64.t()
  @type destination_type :: MuxedAccount.t()
  @type dest_asset_type :: Asset.t()
  @type dest_min_type :: Int64.t()
  @type path_type :: AssetList5.t()

  @type t :: %__MODULE__{send_asset: send_asset_type(), send_amount: send_amount_type(), destination: destination_type(), dest_asset: dest_asset_type(), dest_min: dest_min_type(), path: path_type()}

  defstruct [:send_asset, :send_amount, :destination, :dest_asset, :dest_min, :path]

  @spec new(send_asset :: send_asset_type(), send_amount :: send_amount_type(), destination :: destination_type(), dest_asset :: dest_asset_type(), dest_min :: dest_min_type(), path :: path_type()) :: t()
  def new(
    %Asset{} = send_asset,
    %Int64{} = send_amount,
    %MuxedAccount{} = destination,
    %Asset{} = dest_asset,
    %Int64{} = dest_min,
    %AssetList5{} = path
  ),
  do: %__MODULE__{send_asset: send_asset, send_amount: send_amount, destination: destination, dest_asset: dest_asset, dest_min: dest_min, path: path}

  @impl true
  def encode_xdr(%__MODULE__{send_asset: send_asset, send_amount: send_amount, destination: destination, dest_asset: dest_asset, dest_min: dest_min, path: path}) do
    [send_asset: send_asset, send_amount: send_amount, destination: destination, dest_asset: dest_asset, dest_min: dest_min, path: path]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{send_asset: send_asset, send_amount: send_amount, destination: destination, dest_asset: dest_asset, dest_min: dest_min, path: path}) do
    [send_asset: send_asset, send_amount: send_amount, destination: destination, dest_asset: dest_asset, dest_min: dest_min, path: path]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok, {%XDR.Struct{components: [send_asset: send_asset, send_amount: send_amount, destination: destination, dest_asset: dest_asset, dest_min: dest_min, path: path]}, rest}} ->
        {:ok, {new(send_asset, send_amount, destination, dest_asset, dest_min, path), rest}}
      error -> error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [send_asset: send_asset, send_amount: send_amount, destination: destination, dest_asset: dest_asset, dest_min: dest_min, path: path]}, rest} =
      XDR.Struct.decode_xdr!(bytes, struct)
    {new(send_asset, send_amount, destination, dest_asset, dest_min, path), rest}
  end
end