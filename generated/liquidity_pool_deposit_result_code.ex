defmodule StellarBase.XDR.LiquidityPoolDepositResultCode do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `LiquidityPoolDepositResultCode` type.
  """

  @behaviour XDR.Declaration

  @declarations [
    LIQUIDITY_POOL_DEPOSIT_SUCCESS: 0,
    LIQUIDITY_POOL_DEPOSIT_MALFORMED: -1,
    LIQUIDITY_POOL_DEPOSIT_NO_TRUST: -2,
    LIQUIDITY_POOL_DEPOSIT_NOT_AUTHORIZED: -3,
    LIQUIDITY_POOL_DEPOSIT_UNDERFUNDED: -4,
    LIQUIDITY_POOL_DEPOSIT_LINE_FULL: -5,
    LIQUIDITY_POOL_DEPOSIT_BAD_PRICE: -6,
    LIQUIDITY_POOL_DEPOSIT_POOL_FULL: -7
  ]

  @enum_spec %XDR.Enum{declarations: @declarations, identifier: nil}

  @type t :: %__MODULE__{identifier: atom()}

  defstruct [:identifier]

  @spec new(type :: atom()) :: t()
  def new(type \\ :LIQUIDITY_POOL_DEPOSIT_SUCCESS), do: %__MODULE__{identifier: type}

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
