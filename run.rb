require 'xdrgen'

# create a compilation object, specifying your options

c = Xdrgen::Compilation.new(
  [
    "stellar-files/Stellar-contract-config-setting.x",
    "stellar-files/Stellar-contract-env-meta.x",
    "stellar-files/Stellar-contract-meta.x",
    "stellar-files/Stellar-contract-spec.x",
    "stellar-files/Stellar-contract.x",
    "stellar-files/Stellar-internal.x",
    "stellar-files/Stellar-ledger-entries.x",
    "stellar-files/Stellar-ledger.x",
    "stellar-files/Stellar-overlay.x",
    "stellar-files/Stellar-SCP.x",
    "stellar-files/Stellar-transaction.x",
    "stellar-files/Stellar-types.x"
  ],
  output_dir:"generated",
  language: :elixir,
  namespace: "StellarBase.XDR"
)

# then run compile

c.compile
