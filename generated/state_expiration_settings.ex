defmodule StellarBase.XDR.StateExpirationSettings do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `StateExpirationSettings` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    Uint32,
    Int64,
    Uint64
  }

  @struct_spec XDR.Struct.new(
    max_entry_expiration: Uint32,
    min_temp_entry_expiration: Uint32,
    min_persistent_entry_expiration: Uint32,
    persistent_rent_rate_denominator: Int64,
    temp_rent_rate_denominator: Int64,
    max_entries_to_expire: Uint32,
    bucket_list_size_window_sample_size: Uint32,
    eviction_scan_size: Uint64,
    starting_eviction_scan_level: Uint32
  )

  @type max_entry_expiration_type :: Uint32.t()
  @type min_temp_entry_expiration_type :: Uint32.t()
  @type min_persistent_entry_expiration_type :: Uint32.t()
  @type persistent_rent_rate_denominator_type :: Int64.t()
  @type temp_rent_rate_denominator_type :: Int64.t()
  @type max_entries_to_expire_type :: Uint32.t()
  @type bucket_list_size_window_sample_size_type :: Uint32.t()
  @type eviction_scan_size_type :: Uint64.t()
  @type starting_eviction_scan_level_type :: Uint32.t()

  @type t :: %__MODULE__{max_entry_expiration: max_entry_expiration_type(), min_temp_entry_expiration: min_temp_entry_expiration_type(), min_persistent_entry_expiration: min_persistent_entry_expiration_type(), persistent_rent_rate_denominator: persistent_rent_rate_denominator_type(), temp_rent_rate_denominator: temp_rent_rate_denominator_type(), max_entries_to_expire: max_entries_to_expire_type(), bucket_list_size_window_sample_size: bucket_list_size_window_sample_size_type(), eviction_scan_size: eviction_scan_size_type(), starting_eviction_scan_level: starting_eviction_scan_level_type()}

  defstruct [:max_entry_expiration, :min_temp_entry_expiration, :min_persistent_entry_expiration, :persistent_rent_rate_denominator, :temp_rent_rate_denominator, :max_entries_to_expire, :bucket_list_size_window_sample_size, :eviction_scan_size, :starting_eviction_scan_level]

  @spec new(max_entry_expiration :: max_entry_expiration_type(), min_temp_entry_expiration :: min_temp_entry_expiration_type(), min_persistent_entry_expiration :: min_persistent_entry_expiration_type(), persistent_rent_rate_denominator :: persistent_rent_rate_denominator_type(), temp_rent_rate_denominator :: temp_rent_rate_denominator_type(), max_entries_to_expire :: max_entries_to_expire_type(), bucket_list_size_window_sample_size :: bucket_list_size_window_sample_size_type(), eviction_scan_size :: eviction_scan_size_type(), starting_eviction_scan_level :: starting_eviction_scan_level_type()) :: t()
  def new(
    %Uint32{} = max_entry_expiration,
    %Uint32{} = min_temp_entry_expiration,
    %Uint32{} = min_persistent_entry_expiration,
    %Int64{} = persistent_rent_rate_denominator,
    %Int64{} = temp_rent_rate_denominator,
    %Uint32{} = max_entries_to_expire,
    %Uint32{} = bucket_list_size_window_sample_size,
    %Uint64{} = eviction_scan_size,
    %Uint32{} = starting_eviction_scan_level
  ),
  do: %__MODULE__{max_entry_expiration: max_entry_expiration, min_temp_entry_expiration: min_temp_entry_expiration, min_persistent_entry_expiration: min_persistent_entry_expiration, persistent_rent_rate_denominator: persistent_rent_rate_denominator, temp_rent_rate_denominator: temp_rent_rate_denominator, max_entries_to_expire: max_entries_to_expire, bucket_list_size_window_sample_size: bucket_list_size_window_sample_size, eviction_scan_size: eviction_scan_size, starting_eviction_scan_level: starting_eviction_scan_level}

  @impl true
  def encode_xdr(%__MODULE__{max_entry_expiration: max_entry_expiration, min_temp_entry_expiration: min_temp_entry_expiration, min_persistent_entry_expiration: min_persistent_entry_expiration, persistent_rent_rate_denominator: persistent_rent_rate_denominator, temp_rent_rate_denominator: temp_rent_rate_denominator, max_entries_to_expire: max_entries_to_expire, bucket_list_size_window_sample_size: bucket_list_size_window_sample_size, eviction_scan_size: eviction_scan_size, starting_eviction_scan_level: starting_eviction_scan_level}) do
    [max_entry_expiration: max_entry_expiration, min_temp_entry_expiration: min_temp_entry_expiration, min_persistent_entry_expiration: min_persistent_entry_expiration, persistent_rent_rate_denominator: persistent_rent_rate_denominator, temp_rent_rate_denominator: temp_rent_rate_denominator, max_entries_to_expire: max_entries_to_expire, bucket_list_size_window_sample_size: bucket_list_size_window_sample_size, eviction_scan_size: eviction_scan_size, starting_eviction_scan_level: starting_eviction_scan_level]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{max_entry_expiration: max_entry_expiration, min_temp_entry_expiration: min_temp_entry_expiration, min_persistent_entry_expiration: min_persistent_entry_expiration, persistent_rent_rate_denominator: persistent_rent_rate_denominator, temp_rent_rate_denominator: temp_rent_rate_denominator, max_entries_to_expire: max_entries_to_expire, bucket_list_size_window_sample_size: bucket_list_size_window_sample_size, eviction_scan_size: eviction_scan_size, starting_eviction_scan_level: starting_eviction_scan_level}) do
    [max_entry_expiration: max_entry_expiration, min_temp_entry_expiration: min_temp_entry_expiration, min_persistent_entry_expiration: min_persistent_entry_expiration, persistent_rent_rate_denominator: persistent_rent_rate_denominator, temp_rent_rate_denominator: temp_rent_rate_denominator, max_entries_to_expire: max_entries_to_expire, bucket_list_size_window_sample_size: bucket_list_size_window_sample_size, eviction_scan_size: eviction_scan_size, starting_eviction_scan_level: starting_eviction_scan_level]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok, {%XDR.Struct{components: [max_entry_expiration: max_entry_expiration, min_temp_entry_expiration: min_temp_entry_expiration, min_persistent_entry_expiration: min_persistent_entry_expiration, persistent_rent_rate_denominator: persistent_rent_rate_denominator, temp_rent_rate_denominator: temp_rent_rate_denominator, max_entries_to_expire: max_entries_to_expire, bucket_list_size_window_sample_size: bucket_list_size_window_sample_size, eviction_scan_size: eviction_scan_size, starting_eviction_scan_level: starting_eviction_scan_level]}, rest}} ->
        {:ok, {new(max_entry_expiration, min_temp_entry_expiration, min_persistent_entry_expiration, persistent_rent_rate_denominator, temp_rent_rate_denominator, max_entries_to_expire, bucket_list_size_window_sample_size, eviction_scan_size, starting_eviction_scan_level), rest}}
      error -> error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [max_entry_expiration: max_entry_expiration, min_temp_entry_expiration: min_temp_entry_expiration, min_persistent_entry_expiration: min_persistent_entry_expiration, persistent_rent_rate_denominator: persistent_rent_rate_denominator, temp_rent_rate_denominator: temp_rent_rate_denominator, max_entries_to_expire: max_entries_to_expire, bucket_list_size_window_sample_size: bucket_list_size_window_sample_size, eviction_scan_size: eviction_scan_size, starting_eviction_scan_level: starting_eviction_scan_level]}, rest} =
      XDR.Struct.decode_xdr!(bytes, struct)
    {new(max_entry_expiration, min_temp_entry_expiration, min_persistent_entry_expiration, persistent_rent_rate_denominator, temp_rent_rate_denominator, max_entries_to_expire, bucket_list_size_window_sample_size, eviction_scan_size, starting_eviction_scan_level), rest}
  end
end
