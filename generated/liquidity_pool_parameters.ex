defmodule StellarBase.XDR.LiquidityPoolParameters do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `LiquidityPoolParameters` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    LiquidityPoolType,
    LiquidityPoolConstantProductParameters
  }

  @arms [
    LIQUIDITY_POOL_CONSTANT_PRODUCT: LiquidityPoolConstantProductParameters
  ]

  @type value ::
          LiquidityPoolConstantProductParameters.t()

  @type t :: %__MODULE__{value: value(), type: LiquidityPoolType.t()}

  defstruct [:value, :type]

  @spec new(value :: value(), type :: LiquidityPoolType.t()) :: t()
  def new(value, %LiquidityPoolType{} = type), do: %__MODULE__{value: value, type: type}

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
    |> LiquidityPoolType.new()
    |> XDR.Union.new(@arms)
  end
end
