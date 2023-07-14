defmodule StellarBase.XDR.SurveyResponseMessage do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `SurveyResponseMessage` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    NodeID,
    Uint32,
    SurveyMessageCommandType,
    EncryptedBody
  }

  @struct_spec XDR.Struct.new(
    surveyor_peer_id: NodeID,
    surveyed_peer_id: NodeID,
    ledger_num: Uint32,
    command_type: SurveyMessageCommandType,
    encrypted_body: EncryptedBody
  )

  @type surveyor_peer_id_type :: NodeID.t()
  @type surveyed_peer_id_type :: NodeID.t()
  @type ledger_num_type :: Uint32.t()
  @type command_type_type :: SurveyMessageCommandType.t()
  @type encrypted_body_type :: EncryptedBody.t()

  @type t :: %__MODULE__{surveyor_peer_id: surveyor_peer_id_type(), surveyed_peer_id: surveyed_peer_id_type(), ledger_num: ledger_num_type(), command_type: command_type_type(), encrypted_body: encrypted_body_type()}

  defstruct [:surveyor_peer_id, :surveyed_peer_id, :ledger_num, :command_type, :encrypted_body]

  @spec new(surveyor_peer_id :: surveyor_peer_id_type(), surveyed_peer_id :: surveyed_peer_id_type(), ledger_num :: ledger_num_type(), command_type :: command_type_type(), encrypted_body :: encrypted_body_type()) :: t()
  def new(
    %NodeID{} = surveyor_peer_id,
    %NodeID{} = surveyed_peer_id,
    %Uint32{} = ledger_num,
    %SurveyMessageCommandType{} = command_type,
    %EncryptedBody{} = encrypted_body
  ),
  do: %__MODULE__{surveyor_peer_id: surveyor_peer_id, surveyed_peer_id: surveyed_peer_id, ledger_num: ledger_num, command_type: command_type, encrypted_body: encrypted_body}

  @impl true
  def encode_xdr(%__MODULE__{surveyor_peer_id: surveyor_peer_id, surveyed_peer_id: surveyed_peer_id, ledger_num: ledger_num, command_type: command_type, encrypted_body: encrypted_body}) do
    [surveyor_peer_id: surveyor_peer_id, surveyed_peer_id: surveyed_peer_id, ledger_num: ledger_num, command_type: command_type, encrypted_body: encrypted_body]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{surveyor_peer_id: surveyor_peer_id, surveyed_peer_id: surveyed_peer_id, ledger_num: ledger_num, command_type: command_type, encrypted_body: encrypted_body}) do
    [surveyor_peer_id: surveyor_peer_id, surveyed_peer_id: surveyed_peer_id, ledger_num: ledger_num, command_type: command_type, encrypted_body: encrypted_body]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok, {%XDR.Struct{components: [surveyor_peer_id: surveyor_peer_id, surveyed_peer_id: surveyed_peer_id, ledger_num: ledger_num, command_type: command_type, encrypted_body: encrypted_body]}, rest}} ->
        {:ok, {new(surveyor_peer_id, surveyed_peer_id, ledger_num, command_type, encrypted_body), rest}}
      error -> error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [surveyor_peer_id: surveyor_peer_id, surveyed_peer_id: surveyed_peer_id, ledger_num: ledger_num, command_type: command_type, encrypted_body: encrypted_body]}, rest} =
      XDR.Struct.decode_xdr!(bytes, struct)
    {new(surveyor_peer_id, surveyed_peer_id, ledger_num, command_type, encrypted_body), rest}
  end
end
