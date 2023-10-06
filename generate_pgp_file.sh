#!/bin/bash

#Function to get name of output file

get_file_output_name() {

	read -p "Please provide the file output: " output_name
	echo "$output_name"
}

#Function to get recipient email

get_recipient_email() {
	read -p "Please provide recipient email: " recipient_email
	echo "$recipient_email"
}

#Function to get name of input file

get_file_input_name() {
	read -p "Please provide the file input: " input_name
	echo "$input_name"
}

#Function to create PGP message from user inputs

write_pgp_message() {

	input_name="$1"
	output_name="$2"
	recipient_email="$3"

	gpg --output "$output_name" --armor --encrypt --recipient "$recipient_email" "$input_name"
}


#Main script

input_name=$(get_file_input_name)
output_name=$(get_file_output_name)
recipient_email=$(get_recipient_email)

if [ -n "$input_name" ]; then
	write_pgp_message "$input_name" "$output_name" "$recipient_email"
else
	echo "Need more information"
fi
