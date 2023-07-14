defmodule StellarBase.XDR.TransactionEnvelopeList do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `TransactionEnvelopeList` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.TransactionEnvelope

  @array_type TransactionEnvelope

  @array_spec %{type: @array_type}

  @type t :: %__MODULE__{items: list(TransactionEnvelope.t())}

  defstruct [:items]

  @spec new(items :: list(TransactionEnvelope.t())) :: t()
  def new(items), do: %__MODULE__{items: items}

  @impl true
  def encode_xdr(%__MODULE__{items: items}) do
    items
    |> XDR.VariableArray.new(@array_type)
    |> XDR.VariableArray.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{items: items}) do
    items
    |> XDR.VariableArray.new(@array_type)
    |> XDR.VariableArray.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, spec \\ @array_spec)

  def decode_xdr(bytes, spec) do
    case XDR.VariableArray.decode_xdr(bytes, spec) do
      {:ok, {items, rest}} -> {:ok, {new(items), rest}}
      error -> error
    end
  end

  @impl true
  def decode_xdr!(bytes, spec \\ @array_spec)

  def decode_xdr!(bytes, spec) do
    {items, rest} = XDR.VariableArray.decode_xdr!(bytes, spec)
    {new(items), rest}
  end
end
