
package org.prgx.simple.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MicroTwoController
{
    private static final Logger logger = LoggerFactory.getLogger(MicroTwoController.class);

    @GetMapping("/greetsecond")
    public String getHelloMessage()
    {
        logger.info("Service second method getHelloMessage");
        return "Hello from MicroTwo v2";
    }
}
