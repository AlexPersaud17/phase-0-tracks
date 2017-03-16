=begin
ENCRYPT
-get password
-breaking string into individual characters
-moving each character up by one
-if there's a space, leave it unchanged
=end
def encrypt(password)
	index=0
	encrypted_password=[]
	while index < password.length
		if password[index]==" "
			puts " "
			encrypted_password << " "
			index+=1
		elsif password[index]=="z"
			puts "a"
			encrypted_password << "a"
			index+=1
		else
			print password[index].next
			encrypted_password << password[index].next
			index+=1
		end
	end
	puts " "
	encrypted_password
end

#puts"What's your password?"
#encrypt(gets.chomp)

=begin
DECRYPT
-get encrypted password
-breaking string into individual characters
-moving each character back by one
-if there's a space, leave it unchanged
=end

def decrypt(encrypted_password)
	e_index=0
	while e_index < encrypted_password.length
		decrypter=" abcdefghijklmnopqrstuvwxyz"
		d_index=0
		while d_index < decrypter.length
			if encrypted_password[e_index]==decrypter[d_index]
				if encrypted_password[e_index]==" "
					print " "
					e_index+=1
				elsif encrypted_password[e_index]=="a"
					print "z"
					e_index+=1
				else
					print decrypter[d_index-1]
				end
			end
			d_index+=1
		end
		e_index+=1
	end
end

#puts "What's your encrypted password?"
#decrypt(gets.chomp)


decrypt(encrypt("swordfish"))

=begin
-encrypt of decrypt?
-ask for password
-performs necessary operation
-print results
=end
puts ""
puts "Would you like to encrypt or decrypt?"
user_input=gets.chomp.downcase
if user_input == "encrypt"
	puts "What would you like to encrypt?"
	encrypt(gets.chomp)
elsif  user_input == "decrypt"
	puts "What would you like to decrypt?"
	decrypt(gets.chomp)
end
