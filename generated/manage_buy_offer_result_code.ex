defmodule StellarBase.XDR.ManageBuyOfferResultCode do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `ManageBuyOfferResultCode` type.
  """

  @behaviour XDR.Declaration

  @declarations [
    MANAGE_BUY_OFFER_SUCCESS: 0,
    MANAGE_BUY_OFFER_MALFORMED: -1,
    MANAGE_BUY_OFFER_SELL_NO_TRUST: -2,
    MANAGE_BUY_OFFER_BUY_NO_TRUST: -3,
    MANAGE_BUY_OFFER_SELL_NOT_AUTHORIZED: -4,
    MANAGE_BUY_OFFER_BUY_NOT_AUTHORIZED: -5,
    MANAGE_BUY_OFFER_LINE_FULL: -6,
    MANAGE_BUY_OFFER_UNDERFUNDED: -7,
    MANAGE_BUY_OFFER_CROSS_SELF: -8,
    MANAGE_BUY_OFFER_SELL_NO_ISSUER: -9,
    MANAGE_BUY_OFFER_BUY_NO_ISSUER: -10,
    MANAGE_BUY_OFFER_NOT_FOUND: -11,
    MANAGE_BUY_OFFER_LOW_RESERVE: -12
  ]

  @enum_spec %XDR.Enum{declarations: @declarations, identifier: nil}

  @type t :: %__MODULE__{identifier: atom()}

  defstruct [:identifier]

  @spec new(type :: atom()) :: t()
  def new(type \\ :MANAGE_BUY_OFFER_SUCCESS), do: %__MODULE__{identifier: type}

  @impl true
  def encode_xdr(%__MODULE__{identifier: type}) do
    @declarations
    |> XDR.Enum.new(type)
    |> XDR.Enum.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{identifier: type}) do
    @declarations
    |> XDR.Enum.new(type)
    |> XDR.Enum.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, spec \\ @enum_spec)

  def decode_xdr(bytes, spec) do
    case XDR.Enum.decode_xdr(bytes, spec) do
      {:ok, {%XDR.Enum{identifier: type}, rest}} -> {:ok, {new(type), rest}}
      error -> error
    end
  end

  @impl true
  def decode_xdr!(bytes, spec \\ @enum_spec)

  def decode_xdr!(bytes, spec) do
    {%XDR.Enum{identifier: type}, rest} = XDR.Enum.decode_xdr!(bytes, spec)
    {new(type), rest}
  end
end
