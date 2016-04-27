module EncryptorHelper
  def encrypt_string(name)
  	key = Digest::SHA1.hexdigest(name)
  	crypt = ActiveSupport::MessageEncryptor.new(key)
    encrypted_data = crypt.encrypt_and_sign(name)
  end

  def decrypt_string(name)
  	key = Digest::SHA1.hexdigest(name)
  	crypt = ActiveSupport::MessageEncryptor.new(key)
    decrypted_data = crypt.encrypt_and_sign(name)
  end
end