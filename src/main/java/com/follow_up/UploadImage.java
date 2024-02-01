package com.follow_up;

import java.io.File;

public class UploadImage {
    public static synchronized String getUploadDir() {
        String path = "";
        if (File.separator.equals("\\")) {
            //경로 수정
            path = "D:/fullstack/web/deploy/project3/images/storage/";
            System.out.println("Windows 10: " + path);

        } else {
            System.out.println("Linux"+  path);
            path = "/home/ubuntu/deploy/images/storage/";
        }

        return path;
    }
}
