defmodule StellarBase.XDR.SorobanAuthorizationEntry do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `SorobanAuthorizationEntry` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    SorobanCredentials,
    SorobanAuthorizedInvocation
  }

  @struct_spec XDR.Struct.new(
    credentials: SorobanCredentials,
    root_invocation: SorobanAuthorizedInvocation
  )

  @type credentials_type :: SorobanCredentials.t()
  @type root_invocation_type :: SorobanAuthorizedInvocation.t()

  @type t :: %__MODULE__{credentials: credentials_type(), root_invocation: root_invocation_type()}

  defstruct [:credentials, :root_invocation]

  @spec new(credentials :: credentials_type(), root_invocation :: root_invocation_type()) :: t()
  def new(
    %SorobanCredentials{} = credentials,
    %SorobanAuthorizedInvocation{} = root_invocation
  ),
  do: %__MODULE__{credentials: credentials, root_invocation: root_invocation}

  @impl true
  def encode_xdr(%__MODULE__{credentials: credentials, root_invocation: root_invocation}) do
    [credentials: credentials, root_invocation: root_invocation]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{credentials: credentials, root_invocation: root_invocation}) do
    [credentials: credentials, root_invocation: root_invocation]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok, {%XDR.Struct{components: [credentials: credentials, root_invocation: root_invocation]}, rest}} ->
        {:ok, {new(credentials, root_invocation), rest}}
      error -> error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [credentials: credentials, root_invocation: root_invocation]}, rest} =
      XDR.Struct.decode_xdr!(bytes, struct)
    {new(credentials, root_invocation), rest}
  end
end