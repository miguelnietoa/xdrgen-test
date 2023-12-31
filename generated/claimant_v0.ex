defmodule StellarBase.XDR.ClaimantV0 do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `ClaimantV0` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    AccountID,
    ClaimPredicate
  }

  @struct_spec XDR.Struct.new(
    destination: AccountID,
    predicate: ClaimPredicate
  )

  @type destination_type :: AccountID.t()
  @type predicate_type :: ClaimPredicate.t()

  @type t :: %__MODULE__{destination: destination_type(), predicate: predicate_type()}

  defstruct [:destination, :predicate]

  @spec new(destination :: destination_type(), predicate :: predicate_type()) :: t()
  def new(
    %AccountID{} = destination,
    %ClaimPredicate{} = predicate
  ),
  do: %__MODULE__{destination: destination, predicate: predicate}

  @impl true
  def encode_xdr(%__MODULE__{destination: destination, predicate: predicate}) do
    [destination: destination, predicate: predicate]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{destination: destination, predicate: predicate}) do
    [destination: destination, predicate: predicate]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok, {%XDR.Struct{components: [destination: destination, predicate: predicate]}, rest}} ->
        {:ok, {new(destination, predicate), rest}}
      error -> error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [destination: destination, predicate: predicate]}, rest} =
      XDR.Struct.decode_xdr!(bytes, struct)
    {new(destination, predicate), rest}
  end
end
