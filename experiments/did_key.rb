B58_ALPHABET = "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz"

# Multicodec prefix for a secp256k1 public key (varint of 0xe7).
SECP256K1_PUB_MULTICODEC = [0xe7, 0x01].freeze

# Base58btc (Bitcoin alphabet); each leading zero byte becomes a leading "1".
def base58btc_encode(bytes)
  bytes = bytes.bytes if bytes.is_a?(String)
  n = bytes.inject(0) { |acc, byte| (acc << 8) | byte }
  encoded = +""
  while n.positive?
    n, remainder = n.divmod(58)
    encoded << B58_ALPHABET[remainder]
  end
  leading_zeros = bytes.take_while(&:zero?).length
  ("1" * leading_zeros) + encoded.reverse
end

# did:key for a 33-byte compressed secp256k1 public key (binary String or byte Array).
def secp256k1_did_key(compressed_public_key)
  key_bytes = compressed_public_key.is_a?(String) ? compressed_public_key.bytes : compressed_public_key.to_a
  unless key_bytes.length == 33 && [0x02, 0x03].include?(key_bytes.first)
    raise ArgumentError, "expected a 33-byte compressed secp256k1 public key"
  end

  "did:key:z#{base58btc_encode(SECP256K1_PUB_MULTICODEC + key_bytes)}"
end
