defmodule StellarBase.XDR.PathPaymentStrictSendResultCode do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `PathPaymentStrictSendResultCode` type.
  """

  @behaviour XDR.Declaration

  @declarations [
    PATH_PAYMENT_STRICT_SEND_SUCCESS: 0,
    PATH_PAYMENT_STRICT_SEND_MALFORMED: -1,
    PATH_PAYMENT_STRICT_SEND_UNDERFUNDED: -2,
    PATH_PAYMENT_STRICT_SEND_SRC_NO_TRUST: -3,
    PATH_PAYMENT_STRICT_SEND_SRC_NOT_AUTHORIZED: -4,
    PATH_PAYMENT_STRICT_SEND_NO_DESTINATION: -5,
    PATH_PAYMENT_STRICT_SEND_NO_TRUST: -6,
    PATH_PAYMENT_STRICT_SEND_NOT_AUTHORIZED: -7,
    PATH_PAYMENT_STRICT_SEND_LINE_FULL: -8,
    PATH_PAYMENT_STRICT_SEND_NO_ISSUER: -9,
    PATH_PAYMENT_STRICT_SEND_TOO_FEW_OFFERS: -10,
    PATH_PAYMENT_STRICT_SEND_OFFER_CROSS_SELF: -11,
    PATH_PAYMENT_STRICT_SEND_UNDER_DESTMIN: -12
  ]

  @enum_spec %XDR.Enum{declarations: @declarations, identifier: nil}

  @type t :: %__MODULE__{identifier: atom()}

  defstruct [:identifier]

  @spec new(type :: atom()) :: t()
  def new(type \\ :PATH_PAYMENT_STRICT_SEND_SUCCESS), do: %__MODULE__{identifier: type}

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
