defmodule StellarBase.XDR.PaymentResult do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `PaymentResult` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    PaymentResultCode,
    Void
  }

  @arms [
    PAYMENT_SUCCESS: Void,
    PAYMENT_MALFORMED: Void,
    PAYMENT_UNDERFUNDED: Void,
    PAYMENT_SRC_NO_TRUST: Void,
    PAYMENT_SRC_NOT_AUTHORIZED: Void,
    PAYMENT_NO_DESTINATION: Void,
    PAYMENT_NO_TRUST: Void,
    PAYMENT_NOT_AUTHORIZED: Void,
    PAYMENT_LINE_FULL: Void,
    PAYMENT_NO_ISSUER: Void
  ]

  @type value ::
          Void.t()

  @type t :: %__MODULE__{value: value(), type: PaymentResultCode.t()}

  defstruct [:value, :type]

  @spec new(value :: value(), type :: PaymentResultCode.t()) :: t()
  def new(value, %PaymentResultCode{} = type), do: %__MODULE__{value: value, type: type}

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
    |> PaymentResultCode.new()
    |> XDR.Union.new(@arms)
  end
end