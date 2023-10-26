defmodule StellarBase.XDR.SorobanTransactionData do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `SorobanTransactionData` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    ExtensionPoint,
    SorobanResources,
    Int64
  }

  @struct_spec XDR.Struct.new(
    ext: ExtensionPoint,
    resources: SorobanResources,
    resource_fee: Int64
  )

  @type ext_type :: ExtensionPoint.t()
  @type resources_type :: SorobanResources.t()
  @type resource_fee_type :: Int64.t()

  @type t :: %__MODULE__{ext: ext_type(), resources: resources_type(), resource_fee: resource_fee_type()}

  defstruct [:ext, :resources, :resource_fee]

  @spec new(ext :: ext_type(), resources :: resources_type(), resource_fee :: resource_fee_type()) :: t()
  def new(
    %ExtensionPoint{} = ext,
    %SorobanResources{} = resources,
    %Int64{} = resource_fee
  ),
  do: %__MODULE__{ext: ext, resources: resources, resource_fee: resource_fee}

  @impl true
  def encode_xdr(%__MODULE__{ext: ext, resources: resources, resource_fee: resource_fee}) do
    [ext: ext, resources: resources, resource_fee: resource_fee]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{ext: ext, resources: resources, resource_fee: resource_fee}) do
    [ext: ext, resources: resources, resource_fee: resource_fee]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok, {%XDR.Struct{components: [ext: ext, resources: resources, resource_fee: resource_fee]}, rest}} ->
        {:ok, {new(ext, resources, resource_fee), rest}}
      error -> error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [ext: ext, resources: resources, resource_fee: resource_fee]}, rest} =
      XDR.Struct.decode_xdr!(bytes, struct)
    {new(ext, resources, resource_fee), rest}
  end
end
