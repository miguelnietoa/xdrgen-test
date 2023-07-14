defmodule StellarBase.XDR.SCSpecUDTStructFieldV0 do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `SCSpecUDTStructFieldV0` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    String1024,
    String30,
    SCSpecTypeDef
  }

  @struct_spec XDR.Struct.new(
    doc: String1024,
    name: String30,
    type: SCSpecTypeDef
  )

  @type doc_type :: String1024.t()
  @type name_type :: String30.t()
  @type type_type :: SCSpecTypeDef.t()

  @type t :: %__MODULE__{doc: doc_type(), name: name_type(), type: type_type()}

  defstruct [:doc, :name, :type]

  @spec new(doc :: doc_type(), name :: name_type(), type :: type_type()) :: t()
  def new(
    %String1024{} = doc,
    %String30{} = name,
    %SCSpecTypeDef{} = type
  ),
  do: %__MODULE__{doc: doc, name: name, type: type}

  @impl true
  def encode_xdr(%__MODULE__{doc: doc, name: name, type: type}) do
    [doc: doc, name: name, type: type]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{doc: doc, name: name, type: type}) do
    [doc: doc, name: name, type: type]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok, {%XDR.Struct{components: [doc: doc, name: name, type: type]}, rest}} ->
        {:ok, {new(doc, name, type), rest}}
      error -> error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [doc: doc, name: name, type: type]}, rest} =
      XDR.Struct.decode_xdr!(bytes, struct)
    {new(doc, name, type), rest}
  end
end
