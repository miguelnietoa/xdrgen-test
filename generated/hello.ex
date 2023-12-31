defmodule StellarBase.XDR.Hello do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `Hello` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    Uint32,
    Hash,
    String100,
    Int,
    NodeID,
    AuthCert,
    Uint256
  }

  @struct_spec XDR.Struct.new(
    ledger_version: Uint32,
    overlay_version: Uint32,
    overlay_min_version: Uint32,
    network_id: Hash,
    version_str: String100,
    listening_port: Int,
    peer_id: NodeID,
    cert: AuthCert,
    nonce: Uint256
  )

  @type ledger_version_type :: Uint32.t()
  @type overlay_version_type :: Uint32.t()
  @type overlay_min_version_type :: Uint32.t()
  @type network_id_type :: Hash.t()
  @type version_str_type :: String100.t()
  @type listening_port_type :: Int.t()
  @type peer_id_type :: NodeID.t()
  @type cert_type :: AuthCert.t()
  @type nonce_type :: Uint256.t()

  @type t :: %__MODULE__{ledger_version: ledger_version_type(), overlay_version: overlay_version_type(), overlay_min_version: overlay_min_version_type(), network_id: network_id_type(), version_str: version_str_type(), listening_port: listening_port_type(), peer_id: peer_id_type(), cert: cert_type(), nonce: nonce_type()}

  defstruct [:ledger_version, :overlay_version, :overlay_min_version, :network_id, :version_str, :listening_port, :peer_id, :cert, :nonce]

  @spec new(ledger_version :: ledger_version_type(), overlay_version :: overlay_version_type(), overlay_min_version :: overlay_min_version_type(), network_id :: network_id_type(), version_str :: version_str_type(), listening_port :: listening_port_type(), peer_id :: peer_id_type(), cert :: cert_type(), nonce :: nonce_type()) :: t()
  def new(
    %Uint32{} = ledger_version,
    %Uint32{} = overlay_version,
    %Uint32{} = overlay_min_version,
    %Hash{} = network_id,
    %String100{} = version_str,
    %Int{} = listening_port,
    %NodeID{} = peer_id,
    %AuthCert{} = cert,
    %Uint256{} = nonce
  ),
  do: %__MODULE__{ledger_version: ledger_version, overlay_version: overlay_version, overlay_min_version: overlay_min_version, network_id: network_id, version_str: version_str, listening_port: listening_port, peer_id: peer_id, cert: cert, nonce: nonce}

  @impl true
  def encode_xdr(%__MODULE__{ledger_version: ledger_version, overlay_version: overlay_version, overlay_min_version: overlay_min_version, network_id: network_id, version_str: version_str, listening_port: listening_port, peer_id: peer_id, cert: cert, nonce: nonce}) do
    [ledger_version: ledger_version, overlay_version: overlay_version, overlay_min_version: overlay_min_version, network_id: network_id, version_str: version_str, listening_port: listening_port, peer_id: peer_id, cert: cert, nonce: nonce]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{ledger_version: ledger_version, overlay_version: overlay_version, overlay_min_version: overlay_min_version, network_id: network_id, version_str: version_str, listening_port: listening_port, peer_id: peer_id, cert: cert, nonce: nonce}) do
    [ledger_version: ledger_version, overlay_version: overlay_version, overlay_min_version: overlay_min_version, network_id: network_id, version_str: version_str, listening_port: listening_port, peer_id: peer_id, cert: cert, nonce: nonce]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok, {%XDR.Struct{components: [ledger_version: ledger_version, overlay_version: overlay_version, overlay_min_version: overlay_min_version, network_id: network_id, version_str: version_str, listening_port: listening_port, peer_id: peer_id, cert: cert, nonce: nonce]}, rest}} ->
        {:ok, {new(ledger_version, overlay_version, overlay_min_version, network_id, version_str, listening_port, peer_id, cert, nonce), rest}}
      error -> error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [ledger_version: ledger_version, overlay_version: overlay_version, overlay_min_version: overlay_min_version, network_id: network_id, version_str: version_str, listening_port: listening_port, peer_id: peer_id, cert: cert, nonce: nonce]}, rest} =
      XDR.Struct.decode_xdr!(bytes, struct)
    {new(ledger_version, overlay_version, overlay_min_version, network_id, version_str, listening_port, peer_id, cert, nonce), rest}
  end
end
