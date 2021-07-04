package com.samith.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Arrays;
import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.PBEParameterSpec;
import officerdatamanager.VariableStorage;

public class FileEncryptor {

    //Arbitrarily selected 8-byte salt sequence:
    private static final byte[] salt = {
        (byte) 0x43, (byte) 0x76, (byte) 0x95, (byte) 0xc7,
        (byte) 0x5b, (byte) 0xd7, (byte) 0x45, (byte) 0x17 
    };

    private static Cipher makeCipher(Boolean decryptMode) throws GeneralSecurityException{

        //Use a KeyFactory to derive the corresponding key from the passphrase:
        PBEKeySpec keySpec = new PBEKeySpec(VariableStorage.getFileKey().toCharArray());
        SecretKeyFactory keyFactory = SecretKeyFactory.getInstance(VariableStorage.getKeyFactory());
        SecretKey key = keyFactory.generateSecret(keySpec);

        //Create parameters from the salt and an arbitrary number of iterations:
        PBEParameterSpec pbeParamSpec = new PBEParameterSpec(salt, 42);

        //Set up the cipher:
        Cipher cipher = Cipher.getInstance(VariableStorage.getKeyFactory());

        //Set the cipher mode to decryption or encryption:
        if(decryptMode){
            cipher.init(Cipher.ENCRYPT_MODE, key, pbeParamSpec);
        } else {
            cipher.init(Cipher.DECRYPT_MODE, key, pbeParamSpec);
        }

        return cipher;
    }


    /**Encrypts one file to a second file using a key derived from a passphrase
     * @throws java.io.IOException
     * @throws java.security.GeneralSecurityException*/
    public static void encryptFile()
                                throws IOException, GeneralSecurityException{
        byte[] decData;
        byte[] encData;
        File inFile = new File(VariableStorage.getDbFile());
        //Generate the cipher using pass:
        Cipher cipher = FileEncryptor.makeCipher( true);

        int paddedCount;
        int padded;
        try ( //Read in the file:
                FileInputStream inStream = new FileInputStream(inFile)) {
            int blockSize = 8;
            //Figure out how many bytes are padded
            paddedCount = blockSize - ((int)inFile.length()  % blockSize );
            //Figure out full size including padding
            padded = (int)inFile.length() + paddedCount;
            decData = new byte[padded];
            inStream.read(decData);
        }

        //Write out padding bytes as per PKCS5 algorithm
        for( int i = (int)inFile.length(); i < padded; ++i ) {
            decData[i] = (byte)paddedCount;
        }

        //Encrypt the file data:
        encData = cipher.doFinal(decData);


        try ( //Write the encrypted data to a new file:
                FileOutputStream outStream = new FileOutputStream(new File(VariableStorage.getDbFile()))) {
            outStream.write(encData);
        }
    }


    /**Decrypts one file to a second file using a key derived from a passphrase
     * @throws java.security.GeneralSecurityException
     * @throws java.io.IOException*/
    public static void decryptFile()
                            throws GeneralSecurityException, IOException{
        byte[] encData;
        byte[] decData;
        File inFile = new File(VariableStorage.getDbFile());

        //Generate the cipher using pass:
        Cipher cipher = FileEncryptor.makeCipher(false);

        try ( //Read in the file:
                FileInputStream inStream = new FileInputStream(inFile )) {
            encData = new byte[(int)inFile.length()];
            inStream.read(encData);
        }
        //Decrypt the file data:
        decData = cipher.doFinal(encData);

        //Figure out how much padding to remove

        int padCount = (int)decData[decData.length - 1];

        //Naive check, will fail if plaintext file actually contained
        //this at the end
        //For robust check, check that padCount bytes at the end have same value
        if( padCount >= 1 && padCount <= 8 ) {
            decData = Arrays.copyOfRange( decData , 0, decData.length - padCount);
        }

        //Write the decrypted data to a new file:
        try (FileOutputStream target = new FileOutputStream(new File(VariableStorage.getDbFile()))) {
            target.write(decData);
        }
    }

}