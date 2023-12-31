defmodule StellarBase.XDR.AllowTrustResult do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `AllowTrustResult` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    AllowTrustResultCode,
    Void
  }

  @arms [
    ALLOW_TRUST_SUCCESS: Void,
    ALLOW_TRUST_MALFORMED: Void,
    ALLOW_TRUST_NO_TRUST_LINE: Void,
    ALLOW_TRUST_TRUST_NOT_REQUIRED: Void,
    ALLOW_TRUST_CANT_REVOKE: Void,
    ALLOW_TRUST_SELF_NOT_ALLOWED: Void,
    ALLOW_TRUST_LOW_RESERVE: Void
  ]

  @type value ::
          Void.t()

  @type t :: %__MODULE__{value: value(), type: AllowTrustResultCode.t()}

  defstruct [:value, :type]

  @spec new(value :: value(), type :: AllowTrustResultCode.t()) :: t()
  def new(value, %AllowTrustResultCode{} = type), do: %__MODULE__{value: value, type: type}

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
    |> AllowTrustResultCode.new()
    |> XDR.Union.new(@arms)
  end
end
