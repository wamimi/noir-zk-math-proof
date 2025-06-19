#!/bin/bash
set -e
echo "📦 Compiling circuit..."
if ! nargo compile; then
    echo "❌ Compilation failed. Exiting..."
    exit 1
fi
echo "🔑 Generating vkey..."
bb write_vk --oracle_hash keccak -b ./target/noir_solidity.json -o ./target
echo "🛠️  Generating Solidity verifier..."
bb write_solidity_verifier -k ./target/vk -o ../contract/Verifier.sol
echo "✅ Done."