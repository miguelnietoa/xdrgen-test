defmodule StellarBase.XDR.SCSpecEntry do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `SCSpecEntry` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    SCSpecEntryKind,
    SCSpecFunctionV0,
    SCSpecUDTStructV0,
    SCSpecUDTUnionV0,
    SCSpecUDTEnumV0,
    SCSpecUDTErrorEnumV0
  }

  @arms [
    SC_SPEC_ENTRY_FUNCTION_V0: SCSpecFunctionV0,
    SC_SPEC_ENTRY_UDT_STRUCT_V0: SCSpecUDTStructV0,
    SC_SPEC_ENTRY_UDT_UNION_V0: SCSpecUDTUnionV0,
    SC_SPEC_ENTRY_UDT_ENUM_V0: SCSpecUDTEnumV0,
    SC_SPEC_ENTRY_UDT_ERROR_ENUM_V0: SCSpecUDTErrorEnumV0
  ]

  @type value ::
          SCSpecFunctionV0.t()
          | SCSpecUDTStructV0.t()
          | SCSpecUDTUnionV0.t()
          | SCSpecUDTEnumV0.t()
          | SCSpecUDTErrorEnumV0.t()

  @type t :: %__MODULE__{value: value(), type: SCSpecEntryKind.t()}

  defstruct [:value, :type]

  @spec new(value :: value(), type :: SCSpecEntryKind.t()) :: t()
  def new(value, %SCSpecEntryKind{} = type), do: %__MODULE__{value: value, type: type}

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
    |> SCSpecEntryKind.new()
    |> XDR.Union.new(@arms)
  end
end