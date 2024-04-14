package com.hana;

import com.hana.util.StringEnc;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
class Sb2ApplicationTests {

    @Test
    void contextLoads() {
        log.info("======= LOG =======");
        String text = "abc";
//        StandardPBEStringEncryptor standardPBEStringEncryptor = new StandardPBEStringEncryptor();
//        standardPBEStringEncryptor.setPassword("mykey");
//        String atext = standardPBEStringEncryptor.encrypt(text);
//        String aatext = standardPBEStringEncryptor.decrypt(atext);
        String atext = StringEnc.encryptor(text);
        String aatext = StringEnc.decryptor(atext);
        log.info("------- Encrypt -------" + atext);
        log.info("------- Decrypt -------" + aatext);
    }

}
