package com.follow_up;
import java.io.File;
 
public class UploadCon {
 
    // Windows, VMWare, AWS cloud 절대 경로 설정
    public static synchronized String getUploadDir() {
        String path = "";
        if (File.separator.equals("\\")) {
            path = "C:\\ksnu\\deploy\\contents\\storage";
//          path = "D:/fullstack/web/deploy/contents/storage/";
            System.out.println("Windows 10: " + path);
            
        } else {
            // System.out.println("Linux");
            path = "/home/ubuntu/deploy/contents/storage/";
        }
        
        return path;
    }
    
}