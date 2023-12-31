defmodule StellarBase.XDR.CreateAccountOp do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `CreateAccountOp` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    AccountID,
    Int64
  }

  @struct_spec XDR.Struct.new(
    destination: AccountID,
    starting_balance: Int64
  )

  @type destination_type :: AccountID.t()
  @type starting_balance_type :: Int64.t()

  @type t :: %__MODULE__{destination: destination_type(), starting_balance: starting_balance_type()}

  defstruct [:destination, :starting_balance]

  @spec new(destination :: destination_type(), starting_balance :: starting_balance_type()) :: t()
  def new(
    %AccountID{} = destination,
    %Int64{} = starting_balance
  ),
  do: %__MODULE__{destination: destination, starting_balance: starting_balance}

  @impl true
  def encode_xdr(%__MODULE__{destination: destination, starting_balance: starting_balance}) do
    [destination: destination, starting_balance: starting_balance]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{destination: destination, starting_balance: starting_balance}) do
    [destination: destination, starting_balance: starting_balance]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok, {%XDR.Struct{components: [destination: destination, starting_balance: starting_balance]}, rest}} ->
        {:ok, {new(destination, starting_balance), rest}}
      error -> error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [destination: destination, starting_balance: starting_balance]}, rest} =
      XDR.Struct.decode_xdr!(bytes, struct)
    {new(destination, starting_balance), rest}
  end
end
