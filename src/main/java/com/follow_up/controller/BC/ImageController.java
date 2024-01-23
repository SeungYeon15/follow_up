package com.follow_up.controller.BC;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ImageController {
    @GetMapping("/api/test")
    public String hello() {
        return "테스트입니다.";
    }
}
