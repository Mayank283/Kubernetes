/*
 * Copyright 2012-2013 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.prgx.simple.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
public class MicroOneController
{
    @Autowired
    private RestTemplate mRestTemplate;

    private static final Logger logger = LoggerFactory.getLogger(MicroOneController.class);

    @GetMapping("/greetfirst")
    public String getHelloMessage()
    {
        logger.info("Service first method getHelloMessage");
        return "Hello from first microservice v1";
    }

    @GetMapping("/firstgreetsecond")
    public String greetSecond()
    {
        logger.info("Service first method greetSecond");
        HttpHeaders headers = new HttpHeaders();
        HttpEntity entity = new HttpEntity(headers);
        ResponseEntity<String> stringResponseEntity = mRestTemplate.exchange("http://service-second:8021/greetsecond",
                HttpMethod.GET, entity, String.class);
        return "first->second:: " + stringResponseEntity.getBody();
    }
}
