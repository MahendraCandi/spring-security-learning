package com.mahendra.candi;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.jupiter.api.Test;

class AppTest {

    private final static Logger log = LogManager.getLogger(AppTest.class);

    @Test
    public void testMethod(){
        log.info("This is info");
        log.debug("This is debug");
        log.error("This is error");
        log.warn("This is warn");

    }
}