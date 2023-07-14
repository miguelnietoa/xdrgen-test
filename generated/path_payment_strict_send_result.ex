defmodule StellarBase.XDR.PathPaymentStrictSendResult do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `PathPaymentStrictSendResult` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    PathPaymentStrictSendResultCode,
    PathPaymentStrictSendResultSuccess,
    Void,
    Asset
  }

  @arms [
    PATH_PAYMENT_STRICT_SEND_SUCCESS: PathPaymentStrictSendResultSuccess,
    PATH_PAYMENT_STRICT_SEND_MALFORMED: Void,
    PATH_PAYMENT_STRICT_SEND_UNDERFUNDED: Void,
    PATH_PAYMENT_STRICT_SEND_SRC_NO_TRUST: Void,
    PATH_PAYMENT_STRICT_SEND_SRC_NOT_AUTHORIZED: Void,
    PATH_PAYMENT_STRICT_SEND_NO_DESTINATION: Void,
    PATH_PAYMENT_STRICT_SEND_NO_TRUST: Void,
    PATH_PAYMENT_STRICT_SEND_NOT_AUTHORIZED: Void,
    PATH_PAYMENT_STRICT_SEND_LINE_FULL: Void,
    PATH_PAYMENT_STRICT_SEND_NO_ISSUER: Asset,
    PATH_PAYMENT_STRICT_SEND_TOO_FEW_OFFERS: Void,
    PATH_PAYMENT_STRICT_SEND_OFFER_CROSS_SELF: Void,
    PATH_PAYMENT_STRICT_SEND_UNDER_DESTMIN: Void
  ]

  @type value ::
          PathPaymentStrictSendResultSuccess.t()
          | Void.t()
          | Asset.t()

  @type t :: %__MODULE__{value: value(), type: PathPaymentStrictSendResultCode.t()}

  defstruct [:value, :type]

  @spec new(value :: value(), type :: PathPaymentStrictSendResultCode.t()) :: t()
  def new(value, %PathPaymentStrictSendResultCode{} = type), do: %__MODULE__{value: value, type: type}

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
    |> PathPaymentStrictSendResultCode.new()
    |> XDR.Union.new(@arms)
  end
end