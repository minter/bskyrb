# frozen_string_literal: true

require "test_helper"
require_relative "../../experiments/did_key"

class DidKeyTest < Minitest::Test
  # Bitcoin base58 test vectors (hex input => encoding).
  BASE58_VECTORS = {
    "" => "",
    "61" => "2g",
    "626262" => "a3gV",
    "636363" => "aPEr",
    "516b6fcd0f" => "ABnLTmg",
    "00000000000000000000" => "1111111111",
    "00eb15231dfceb60925886b67d065299925915aeb172c06647" => "1NS17iag9jJgTHD1VXjvLCEnZuQ3rJDE9L"
  }.freeze

  def test_base58btc_encode_matches_bitcoin_vectors
    BASE58_VECTORS.each do |hex, expected|
      assert_equal expected, base58btc_encode([hex].pack("H*")), "base58 of #{hex.inspect}"
    end
  end

  def test_base58btc_encode_accepts_byte_arrays
    assert_equal "1112g", base58btc_encode([0, 0, 0, 0x61])
  end

  # Test vector from the W3C did:key spec (secp256k1).
  def test_secp256k1_did_key_matches_spec_vector
    public_key = ["03874c15c7fda20e539c6e5ba573c139884c351188799f5458b4b41f7924f235cd"].pack("H*")

    assert_equal "did:key:zQ3shokFTS3brHcDQrn82RUDfCZESWL1ZdCEJwekUDPQiYBme", secp256k1_did_key(public_key)
    assert_equal secp256k1_did_key(public_key), secp256k1_did_key(public_key.bytes)
  end

  def test_secp256k1_did_key_rejects_uncompressed_or_malformed_keys
    assert_raises(ArgumentError) { secp256k1_did_key("\x04".b + ("\x01".b * 64)) }
    assert_raises(ArgumentError) { secp256k1_did_key("\x05".b + ("\x01".b * 32)) }
    assert_raises(ArgumentError) { secp256k1_did_key("\x02".b * 10) }
  end
end
