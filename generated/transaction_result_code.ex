defmodule StellarBase.XDR.TransactionResultCode do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `TransactionResultCode` type.
  """

  @behaviour XDR.Declaration

  @declarations [
    txFEE_BUMP_INNER_SUCCESS: 1,
    txSUCCESS: 0,
    txFAILED: -1,
    txTOO_EARLY: -2,
    txTOO_LATE: -3,
    txMISSING_OPERATION: -4,
    txBAD_SEQ: -5,
    txBAD_AUTH: -6,
    txINSUFFICIENT_BALANCE: -7,
    txNO_ACCOUNT: -8,
    txINSUFFICIENT_FEE: -9,
    txBAD_AUTH_EXTRA: -10,
    txINTERNAL_ERROR: -11,
    txNOT_SUPPORTED: -12,
    txFEE_BUMP_INNER_FAILED: -13,
    txBAD_SPONSORSHIP: -14,
    txBAD_MIN_SEQ_AGE_OR_GAP: -15,
    txMALFORMED: -16,
    txSOROBAN_INVALID: -17
  ]

  @enum_spec %XDR.Enum{declarations: @declarations, identifier: nil}

  @type t :: %__MODULE__{identifier: atom()}

  defstruct [:identifier]

  @spec new(type :: atom()) :: t()
  def new(type \\ :txFEE_BUMP_INNER_SUCCESS), do: %__MODULE__{identifier: type}

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
