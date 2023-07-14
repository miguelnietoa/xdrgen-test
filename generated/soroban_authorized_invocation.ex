defmodule StellarBase.XDR.SorobanAuthorizedInvocation do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `SorobanAuthorizedInvocation` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    SorobanAuthorizedFunction,
    SorobanAuthorizedInvocationList
  }

  @struct_spec XDR.Struct.new(
    function: SorobanAuthorizedFunction,
    sub_invocations: SorobanAuthorizedInvocationList
  )

  @type function_type :: SorobanAuthorizedFunction.t()
  @type sub_invocations_type :: SorobanAuthorizedInvocationList.t()

  @type t :: %__MODULE__{function: function_type(), sub_invocations: sub_invocations_type()}

  defstruct [:function, :sub_invocations]

  @spec new(function :: function_type(), sub_invocations :: sub_invocations_type()) :: t()
  def new(
    %SorobanAuthorizedFunction{} = function,
    %SorobanAuthorizedInvocationList{} = sub_invocations
  ),
  do: %__MODULE__{function: function, sub_invocations: sub_invocations}

  @impl true
  def encode_xdr(%__MODULE__{function: function, sub_invocations: sub_invocations}) do
    [function: function, sub_invocations: sub_invocations]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{function: function, sub_invocations: sub_invocations}) do
    [function: function, sub_invocations: sub_invocations]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok, {%XDR.Struct{components: [function: function, sub_invocations: sub_invocations]}, rest}} ->
        {:ok, {new(function, sub_invocations), rest}}
      error -> error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [function: function, sub_invocations: sub_invocations]}, rest} =
      XDR.Struct.decode_xdr!(bytes, struct)
    {new(function, sub_invocations), rest}
  end
end
