defmodule StellarBase.XDR.OperationEvents do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `OperationEvents` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    ContractEventList
  }

  @struct_spec XDR.Struct.new(
    events: ContractEventList
  )

  @type events_type :: ContractEventList.t()

  @type t :: %__MODULE__{events: events_type()}

  defstruct [:events]

  @spec new(events :: events_type()) :: t()
  def new(
    %ContractEventList{} = events
  ),
  do: %__MODULE__{events: events}

  @impl true
  def encode_xdr(%__MODULE__{events: events}) do
    [events: events]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{events: events}) do
    [events: events]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok, {%XDR.Struct{components: [events: events]}, rest}} ->
        {:ok, {new(events), rest}}
      error -> error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [events: events]}, rest} =
      XDR.Struct.decode_xdr!(bytes, struct)
    {new(events), rest}
  end
end