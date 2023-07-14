defmodule StellarBase.XDR.ManageOfferSuccessResult do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `ManageOfferSuccessResult` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    ClaimAtomList,
    ManageOfferSuccessResultOffer
  }

  @struct_spec XDR.Struct.new(
    offers_claimed: ClaimAtomList,
    offer: ManageOfferSuccessResultOffer
  )

  @type offers_claimed_type :: ClaimAtomList.t()
  @type offer_type :: ManageOfferSuccessResultOffer.t()

  @type t :: %__MODULE__{offers_claimed: offers_claimed_type(), offer: offer_type()}

  defstruct [:offers_claimed, :offer]

  @spec new(offers_claimed :: offers_claimed_type(), offer :: offer_type()) :: t()
  def new(
    %ClaimAtomList{} = offers_claimed,
    %ManageOfferSuccessResultOffer{} = offer
  ),
  do: %__MODULE__{offers_claimed: offers_claimed, offer: offer}

  @impl true
  def encode_xdr(%__MODULE__{offers_claimed: offers_claimed, offer: offer}) do
    [offers_claimed: offers_claimed, offer: offer]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{offers_claimed: offers_claimed, offer: offer}) do
    [offers_claimed: offers_claimed, offer: offer]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok, {%XDR.Struct{components: [offers_claimed: offers_claimed, offer: offer]}, rest}} ->
        {:ok, {new(offers_claimed, offer), rest}}
      error -> error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [offers_claimed: offers_claimed, offer: offer]}, rest} =
      XDR.Struct.decode_xdr!(bytes, struct)
    {new(offers_claimed, offer), rest}
  end
end