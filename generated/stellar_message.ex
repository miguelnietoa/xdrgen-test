defmodule StellarBase.XDR.StellarMessage do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `StellarMessage` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    MessageType,
    Error,
    Hello,
    Auth,
    DontHave,
    Void,
    PeerAddressList100,
    Uint256,
    TransactionSet,
    GeneralizedTransactionSet,
    TransactionEnvelope,
    SignedSurveyRequestMessage,
    SignedSurveyResponseMessage,
    SCPQuorumSet,
    SCPEnvelope,
    Uint32,
    SendMore,
    FloodAdvert,
    FloodDemand
  }

  @arms [
    ERROR_MSG: Error,
    HELLO: Hello,
    AUTH: Auth,
    DONT_HAVE: DontHave,
    GET_PEERS: Void,
    PEERS: PeerAddressList100,
    GET_TX_SET: Uint256,
    TX_SET: TransactionSet,
    GENERALIZED_TX_SET: GeneralizedTransactionSet,
    TRANSACTION: TransactionEnvelope,
    SURVEY_REQUEST: SignedSurveyRequestMessage,
    SURVEY_RESPONSE: SignedSurveyResponseMessage,
    GET_SCP_QUORUMSET: Uint256,
    SCP_QUORUMSET: SCPQuorumSet,
    SCP_MESSAGE: SCPEnvelope,
    GET_SCP_STATE: Uint32,
    SEND_MORE: SendMore,
    FLOOD_ADVERT: FloodAdvert,
    FLOOD_DEMAND: FloodDemand
  ]

  @type value ::
          Error.t()
          | Hello.t()
          | Auth.t()
          | DontHave.t()
          | Void.t()
          | PeerAddressList100.t()
          | Uint256.t()
          | TransactionSet.t()
          | GeneralizedTransactionSet.t()
          | TransactionEnvelope.t()
          | SignedSurveyRequestMessage.t()
          | SignedSurveyResponseMessage.t()
          | SCPQuorumSet.t()
          | SCPEnvelope.t()
          | Uint32.t()
          | SendMore.t()
          | FloodAdvert.t()
          | FloodDemand.t()

  @type t :: %__MODULE__{value: value(), type: MessageType.t()}

  defstruct [:value, :type]

  @spec new(value :: value(), type :: MessageType.t()) :: t()
  def new(value, %MessageType{} = type), do: %__MODULE__{value: value, type: type}

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
    |> MessageType.new()
    |> XDR.Union.new(@arms)
  end
end