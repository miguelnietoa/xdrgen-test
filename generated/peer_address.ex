defmodule StellarBase.XDR.PeerAddress do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `PeerAddress` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    PeerAddressIp,
    Uint32
  }

  @struct_spec XDR.Struct.new(
    ip: PeerAddressIp,
    port: Uint32,
    num_failures: Uint32
  )

  @type ip_type :: PeerAddressIp.t()
  @type port_type :: Uint32.t()
  @type num_failures_type :: Uint32.t()

  @type t :: %__MODULE__{ip: ip_type(), port: port_type(), num_failures: num_failures_type()}

  defstruct [:ip, :port, :num_failures]

  @spec new(ip :: ip_type(), port :: port_type(), num_failures :: num_failures_type()) :: t()
  def new(
    %PeerAddressIp{} = ip,
    %Uint32{} = port,
    %Uint32{} = num_failures
  ),
  do: %__MODULE__{ip: ip, port: port, num_failures: num_failures}

  @impl true
  def encode_xdr(%__MODULE__{ip: ip, port: port, num_failures: num_failures}) do
    [ip: ip, port: port, num_failures: num_failures]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{ip: ip, port: port, num_failures: num_failures}) do
    [ip: ip, port: port, num_failures: num_failures]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok, {%XDR.Struct{components: [ip: ip, port: port, num_failures: num_failures]}, rest}} ->
        {:ok, {new(ip, port, num_failures), rest}}
      error -> error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [ip: ip, port: port, num_failures: num_failures]}, rest} =
      XDR.Struct.decode_xdr!(bytes, struct)
    {new(ip, port, num_failures), rest}
  end
end
