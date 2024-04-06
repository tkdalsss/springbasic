package com.hana.admin.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class FileUploadUtil {
    public static void saveFile(MultipartFile mf, String dir) {
        byte [] data;
        String imgname = mf.getOriginalFilename();

        try {
            data = mf.getBytes();
            FileOutputStream fo = new FileOutputStream(dir + imgname);
            fo.write(data);
            fo.close();
        } catch (Exception e) {

        }
    }

    public static void saveFileChangingName(MultipartFile mf, String dir, String changeName) {
        byte [] data;
//        String imgname = mf.getOriginalFilename();

        try {
            data = mf.getBytes();
            FileOutputStream fo = new FileOutputStream(dir + changeName);
            fo.write(data);
            fo.close();
        } catch (Exception e) {

        }
    }

    public static void deleteFile(String filename, String dir) throws IOException {
        Path filePath = Paths.get(dir+filename);
        Files.delete(filePath);
    }

    public static String changeDuplicateImageName(MultipartFile mf, String dir) {
        String imgName = mf.getOriginalFilename();
        String imgHead = imgName.substring(0, imgName.lastIndexOf("."));
        String imgTail = imgName.substring(imgName.lastIndexOf(".")+1);
        String newImgName = "";

        // 동일한 파일명을 가진 파일이 없다면 기존 파일명으로 저장되게
        if (!Files.exists(Paths.get(dir+imgName))) return imgName;

        // 동일한 파일명을 가진 파일이 있다면 동일하지 않게 숫자 늘려가며 확인 후 저장
        for (int i = 1; i < Integer.MAX_VALUE; i++) {
            newImgName = String.format("%s(%d)%s%s", imgHead, i, ".", imgTail);
            System.out.println(newImgName);
            if (!Files.exists(Paths.get(dir + newImgName))) break;
        }

        return newImgName;
    }
}
