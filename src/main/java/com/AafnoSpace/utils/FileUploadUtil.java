package com.AafnoSpace.utils;

import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

public class FileUploadUtil {

    /*to extracts the extension from a filename 
     */
    public static String getFileExtension(String fileName) {
        if (fileName == null || !fileName.contains(".")) {
            return "";
        }
        return fileName.substring(fileName.lastIndexOf("."));
    }

    /*to validate if the uploaded part is actually an image based on MIME type
     */
    public static boolean isImage(Part part) {
        String contentType = part.getContentType(); // e.g., "image/jpeg"
        return contentType != null && contentType.startsWith("image/");
    }

    /*to handles the physical saving of the file to the local device
     */
    public static void saveFile(Part part, String uploadDir, String fileName) throws IOException {
        // convert a String path to Path object
        Path uploadPath = Paths.get(uploadDir);

        // creating a directory if it doesn't exist
        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }

        // resolving the full path (root_path + filename)
        Path filePath = uploadPath.resolve(fileName);

        // saving the file (overwrite if it already exists)
        try (InputStream inputStream = part.getInputStream()) {
            Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
        }
    }
}