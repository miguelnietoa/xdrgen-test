defmodule StellarBase.XDR.OperationBody do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `OperationBody` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    OperationType,
    CreateAccountOp,
    PaymentOp,
    PathPaymentStrictReceiveOp,
    ManageSellOfferOp,
    CreatePassiveSellOfferOp,
    SetOptionsOp,
    ChangeTrustOp,
    AllowTrustOp,
    MuxedAccount,
    Void,
    ManageDataOp,
    BumpSequenceOp,
    ManageBuyOfferOp,
    PathPaymentStrictSendOp,
    CreateClaimableBalanceOp,
    ClaimClaimableBalanceOp,
    BeginSponsoringFutureReservesOp,
    RevokeSponsorshipOp,
    ClawbackOp,
    ClawbackClaimableBalanceOp,
    SetTrustLineFlagsOp,
    LiquidityPoolDepositOp,
    LiquidityPoolWithdrawOp,
    InvokeHostFunctionOp
  }

  @arms [
    CREATE_ACCOUNT: CreateAccountOp,
    PAYMENT: PaymentOp,
    PATH_PAYMENT_STRICT_RECEIVE: PathPaymentStrictReceiveOp,
    MANAGE_SELL_OFFER: ManageSellOfferOp,
    CREATE_PASSIVE_SELL_OFFER: CreatePassiveSellOfferOp,
    SET_OPTIONS: SetOptionsOp,
    CHANGE_TRUST: ChangeTrustOp,
    ALLOW_TRUST: AllowTrustOp,
    ACCOUNT_MERGE: MuxedAccount,
    INFLATION: Void,
    MANAGE_DATA: ManageDataOp,
    BUMP_SEQUENCE: BumpSequenceOp,
    MANAGE_BUY_OFFER: ManageBuyOfferOp,
    PATH_PAYMENT_STRICT_SEND: PathPaymentStrictSendOp,
    CREATE_CLAIMABLE_BALANCE: CreateClaimableBalanceOp,
    CLAIM_CLAIMABLE_BALANCE: ClaimClaimableBalanceOp,
    BEGIN_SPONSORING_FUTURE_RESERVES: BeginSponsoringFutureReservesOp,
    END_SPONSORING_FUTURE_RESERVES: Void,
    REVOKE_SPONSORSHIP: RevokeSponsorshipOp,
    CLAWBACK: ClawbackOp,
    CLAWBACK_CLAIMABLE_BALANCE: ClawbackClaimableBalanceOp,
    SET_TRUST_LINE_FLAGS: SetTrustLineFlagsOp,
    LIQUIDITY_POOL_DEPOSIT: LiquidityPoolDepositOp,
    LIQUIDITY_POOL_WITHDRAW: LiquidityPoolWithdrawOp,
    INVOKE_HOST_FUNCTION: InvokeHostFunctionOp
  ]

  @type value ::
          CreateAccountOp.t()
          | PaymentOp.t()
          | PathPaymentStrictReceiveOp.t()
          | ManageSellOfferOp.t()
          | CreatePassiveSellOfferOp.t()
          | SetOptionsOp.t()
          | ChangeTrustOp.t()
          | AllowTrustOp.t()
          | MuxedAccount.t()
          | Void.t()
          | ManageDataOp.t()
          | BumpSequenceOp.t()
          | ManageBuyOfferOp.t()
          | PathPaymentStrictSendOp.t()
          | CreateClaimableBalanceOp.t()
          | ClaimClaimableBalanceOp.t()
          | BeginSponsoringFutureReservesOp.t()
          | RevokeSponsorshipOp.t()
          | ClawbackOp.t()
          | ClawbackClaimableBalanceOp.t()
          | SetTrustLineFlagsOp.t()
          | LiquidityPoolDepositOp.t()
          | LiquidityPoolWithdrawOp.t()
          | InvokeHostFunctionOp.t()

  @type t :: %__MODULE__{value: value(), type: OperationType.t()}

  defstruct [:value, :type]

  @spec new(value :: value(), type :: OperationType.t()) :: t()
  def new(value, %OperationType{} = type), do: %__MODULE__{value: value, type: type}

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
    |> OperationType.new()
    |> XDR.Union.new(@arms)
  end
end