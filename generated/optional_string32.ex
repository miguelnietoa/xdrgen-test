defmodule StellarBase.XDR.OptionalString32 do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `OptionalString32` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.String32

  @optional_spec XDR.Optional.new(String32)

  @type string32 :: String32.t() | nil

  @type t :: %__MODULE__{string32: string32()}

  defstruct [:string32]

  @spec new(string32 :: string32()) :: t()
  def new(string32 \\ nil), do: %__MODULE__{string32: string32}

  @impl true
  def encode_xdr(%__MODULE__{string32: string32}) do
    string32
    |> XDR.Optional.new()
    |> XDR.Optional.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{string32: string32}) do
    string32
    |> XDR.Optional.new()
    |> XDR.Optional.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, optional_spec \\ @optional_spec)

  def decode_xdr(bytes, optional_spec) do
    case XDR.Optional.decode_xdr(bytes, optional_spec) do
      {:ok, {%XDR.Optional{type: string32}, rest}} -> {:ok, {new(string32), rest}}
      {:ok, {nil, rest}} -> {:ok, {new(), rest}}
      error -> error
    end
  end

  @impl true
  def decode_xdr!(bytes, optional_spec \\ @optional_spec)

  def decode_xdr!(bytes, optional_spec) do
    case XDR.Optional.decode_xdr!(bytes, optional_spec) do
      {%XDR.Optional{type: string32}, rest} -> {new(string32), rest}
      {nil, rest} -> {new(), rest}
    end
  end

end