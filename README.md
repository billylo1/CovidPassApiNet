# CovidPassApiNet
C# implementation of the CovidPass API

Pre-req:  brew install dotnet
          docker
          https://dotnet.microsoft.com/en-us/download/dotnet

for setup instructions, and cert renewal

    setup Apple Developer Certificate (assume current directory is the above)

        1. Sign into your Apple Developer Account
        2. Go to Certificates, Identifiers and Profiles
        3. Register a new Pass Type Identifier under the Identifiers tab
        4. Create a new Pass Type ID Certificate under the Certificates tab
        5. Select your previously created Pass Type Identifier in the process
        6. Move your new certificate to the My Certificates tab in the keychain
        7. Export your certificate as a .p12 file (make a note of passphrase)
        8. Convert .p12 to .pem using openssl
               openssl pkcs12 -in Certificates.p12 -out AppleDeveloperCerticate.pem -legacy
        9. copy the .pem file to ~/web/CovidPassApiNet/CovidPassApiNet/AppleDeveloperCerticate.pem
        10. Create a text file named AppleDeveloperPassword with your passphrase in it
        11. Open keychain - System Keychain - Certificates
        12. Export Apple Developer Relations Certification Authority to AppleCaCertificate.pem
        13. chmod 600 Apple*.pem 

        (Reminder: pls protect these files as they contain private key and passphrases. Do not add them to your repo.)
    

