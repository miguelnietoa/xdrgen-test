defmodule StellarBase.XDR.AlphaNum12 do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `AlphaNum12` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    AssetCode12,
    AccountID
  }

  @struct_spec XDR.Struct.new(
    asset_code: AssetCode12,
    issuer: AccountID
  )

  @type asset_code_type :: AssetCode12.t()
  @type issuer_type :: AccountID.t()

  @type t :: %__MODULE__{asset_code: asset_code_type(), issuer: issuer_type()}

  defstruct [:asset_code, :issuer]

  @spec new(asset_code :: asset_code_type(), issuer :: issuer_type()) :: t()
  def new(
    %AssetCode12{} = asset_code,
    %AccountID{} = issuer
  ),
  do: %__MODULE__{asset_code: asset_code, issuer: issuer}

  @impl true
  def encode_xdr(%__MODULE__{asset_code: asset_code, issuer: issuer}) do
    [asset_code: asset_code, issuer: issuer]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{asset_code: asset_code, issuer: issuer}) do
    [asset_code: asset_code, issuer: issuer]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok, {%XDR.Struct{components: [asset_code: asset_code, issuer: issuer]}, rest}} ->
        {:ok, {new(asset_code, issuer), rest}}
      error -> error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [asset_code: asset_code, issuer: issuer]}, rest} =
      XDR.Struct.decode_xdr!(bytes, struct)
    {new(asset_code, issuer), rest}
  end
end
