defmodule StellarBase.XDR.HostFunctionArgs do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `HostFunctionArgs` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    HostFunctionType,
    SCVec,
    CreateContractArgs,
    UploadContractWasmArgs
  }

  @arms [
    HOST_FUNCTION_TYPE_INVOKE_CONTRACT: SCVec,
    HOST_FUNCTION_TYPE_CREATE_CONTRACT: CreateContractArgs,
    HOST_FUNCTION_TYPE_UPLOAD_CONTRACT_WASM: UploadContractWasmArgs
  ]

  @type value ::
          SCVec.t()
          | CreateContractArgs.t()
          | UploadContractWasmArgs.t()

  @type t :: %__MODULE__{value: value(), type: HostFunctionType.t()}

  defstruct [:value, :type]

  @spec new(value :: value(), type :: HostFunctionType.t()) :: t()
  def new(value, %HostFunctionType{} = type), do: %__MODULE__{value: value, type: type}

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
    |> HostFunctionType.new()
    |> XDR.Union.new(@arms)
  end
end