defmodule StellarBase.XDR.DataEntry do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `DataEntry` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    AccountID,
    String64,
    DataValue,
    DataEntryExt
  }

  @struct_spec XDR.Struct.new(
    account_id: AccountID,
    data_name: String64,
    data_value: DataValue,
    ext: DataEntryExt
  )

  @type account_id_type :: AccountID.t()
  @type data_name_type :: String64.t()
  @type data_value_type :: DataValue.t()
  @type ext_type :: DataEntryExt.t()

  @type t :: %__MODULE__{account_id: account_id_type(), data_name: data_name_type(), data_value: data_value_type(), ext: ext_type()}

  defstruct [:account_id, :data_name, :data_value, :ext]

  @spec new(account_id :: account_id_type(), data_name :: data_name_type(), data_value :: data_value_type(), ext :: ext_type()) :: t()
  def new(
    %AccountID{} = account_id,
    %String64{} = data_name,
    %DataValue{} = data_value,
    %DataEntryExt{} = ext
  ),
  do: %__MODULE__{account_id: account_id, data_name: data_name, data_value: data_value, ext: ext}

  @impl true
  def encode_xdr(%__MODULE__{account_id: account_id, data_name: data_name, data_value: data_value, ext: ext}) do
    [account_id: account_id, data_name: data_name, data_value: data_value, ext: ext]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{account_id: account_id, data_name: data_name, data_value: data_value, ext: ext}) do
    [account_id: account_id, data_name: data_name, data_value: data_value, ext: ext]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok, {%XDR.Struct{components: [account_id: account_id, data_name: data_name, data_value: data_value, ext: ext]}, rest}} ->
        {:ok, {new(account_id, data_name, data_value, ext), rest}}
      error -> error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [account_id: account_id, data_name: data_name, data_value: data_value, ext: ext]}, rest} =
      XDR.Struct.decode_xdr!(bytes, struct)
    {new(account_id, data_name, data_value, ext), rest}
  end
end