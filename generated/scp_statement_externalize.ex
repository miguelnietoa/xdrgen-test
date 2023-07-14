defmodule StellarBase.XDR.SCPStatementExternalize do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `SCPStatementExternalize` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    SCPBallot,
    Uint32,
    Hash
  }

  @struct_spec XDR.Struct.new(
    commit: SCPBallot,
    n_h: Uint32,
    commit_quorum_set_hash: Hash
  )

  @type commit_type :: SCPBallot.t()
  @type n_h_type :: Uint32.t()
  @type commit_quorum_set_hash_type :: Hash.t()

  @type t :: %__MODULE__{commit: commit_type(), n_h: n_h_type(), commit_quorum_set_hash: commit_quorum_set_hash_type()}

  defstruct [:commit, :n_h, :commit_quorum_set_hash]

  @spec new(commit :: commit_type(), n_h :: n_h_type(), commit_quorum_set_hash :: commit_quorum_set_hash_type()) :: t()
  def new(
    %SCPBallot{} = commit,
    %Uint32{} = n_h,
    %Hash{} = commit_quorum_set_hash
  ),
  do: %__MODULE__{commit: commit, n_h: n_h, commit_quorum_set_hash: commit_quorum_set_hash}

  @impl true
  def encode_xdr(%__MODULE__{commit: commit, n_h: n_h, commit_quorum_set_hash: commit_quorum_set_hash}) do
    [commit: commit, n_h: n_h, commit_quorum_set_hash: commit_quorum_set_hash]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{commit: commit, n_h: n_h, commit_quorum_set_hash: commit_quorum_set_hash}) do
    [commit: commit, n_h: n_h, commit_quorum_set_hash: commit_quorum_set_hash]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok, {%XDR.Struct{components: [commit: commit, n_h: n_h, commit_quorum_set_hash: commit_quorum_set_hash]}, rest}} ->
        {:ok, {new(commit, n_h, commit_quorum_set_hash), rest}}
      error -> error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [commit: commit, n_h: n_h, commit_quorum_set_hash: commit_quorum_set_hash]}, rest} =
      XDR.Struct.decode_xdr!(bytes, struct)
    {new(commit, n_h, commit_quorum_set_hash), rest}
  end
end