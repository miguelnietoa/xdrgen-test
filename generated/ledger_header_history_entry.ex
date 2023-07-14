defmodule StellarBase.XDR.LedgerHeaderHistoryEntry do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `LedgerHeaderHistoryEntry` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    Hash,
    LedgerHeader,
    LedgerHeaderHistoryEntryExt
  }

  @struct_spec XDR.Struct.new(
    hash: Hash,
    header: LedgerHeader,
    ext: LedgerHeaderHistoryEntryExt
  )

  @type hash_type :: Hash.t()
  @type header_type :: LedgerHeader.t()
  @type ext_type :: LedgerHeaderHistoryEntryExt.t()

  @type t :: %__MODULE__{hash: hash_type(), header: header_type(), ext: ext_type()}

  defstruct [:hash, :header, :ext]

  @spec new(hash :: hash_type(), header :: header_type(), ext :: ext_type()) :: t()
  def new(
    %Hash{} = hash,
    %LedgerHeader{} = header,
    %LedgerHeaderHistoryEntryExt{} = ext
  ),
  do: %__MODULE__{hash: hash, header: header, ext: ext}

  @impl true
  def encode_xdr(%__MODULE__{hash: hash, header: header, ext: ext}) do
    [hash: hash, header: header, ext: ext]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{hash: hash, header: header, ext: ext}) do
    [hash: hash, header: header, ext: ext]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok, {%XDR.Struct{components: [hash: hash, header: header, ext: ext]}, rest}} ->
        {:ok, {new(hash, header, ext), rest}}
      error -> error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [hash: hash, header: header, ext: ext]}, rest} =
      XDR.Struct.decode_xdr!(bytes, struct)
    {new(hash, header, ext), rest}
  end
end