package com.javaclimb.Qomolangma.utils;

import java.io.IOException;
import java.nio.file.*;
import java.nio.file.attribute.BasicFileAttributes;

/**
 *
 * 前端vue打包封装好dist文件夹后将vue/dist文件夹复制到后端resources/static文件夹下
 * 
 * @author Wang Yishuo
 * @date 2023/7/6 18:51 update
 */


public class DistCopyUtil {
    public static void main(String[] args) {
        Path source_client = Paths.get("vue/music/client/dist");
        Path target_client = Paths.get("src/main/resources/static/client/dist");

        Path source_manage = Paths.get("vue/music/manage/dist");
        Path target_manage = Paths.get("src/main/resources/static/manage/dist");

        // manage复制
        try {
            // 删除目标文件夹及其下所有文件
            if (Files.exists(target_manage)) {
                System.out.println("manage/dist文件夹已存在！");
                Files.walkFileTree(target_manage, new SimpleFileVisitor<Path>() {
                    @Override
                    public FileVisitResult visitFile(Path file, BasicFileAttributes attrs) throws IOException {
                        Files.delete(file);
                        return FileVisitResult.CONTINUE;
                    }

                    @Override
                    public FileVisitResult postVisitDirectory(Path dir, IOException exc) throws IOException {
                        Files.delete(dir);
                        return FileVisitResult.CONTINUE;
                    }
                });
                System.out.println("manage/dist文件夹已删除！");
            }

            // 复制源文件夹到目标文件夹
            Files.walkFileTree(source_manage, new SimpleFileVisitor<Path>() {
                @Override
                public FileVisitResult preVisitDirectory(Path dir, BasicFileAttributes attrs) throws IOException {
                    Path targetDir = target_manage.resolve(source_manage.relativize(dir));
                    Files.createDirectories(targetDir);
                    return FileVisitResult.CONTINUE;
                }

                @Override
                public FileVisitResult visitFile(Path file, BasicFileAttributes attrs) throws IOException {
                    Files.copy(file, target_manage.resolve(source_manage.relativize(file)), StandardCopyOption.REPLACE_EXISTING);
                    return FileVisitResult.CONTINUE;
                }
            });
            System.out.println("manage/dist复制完成！");
        } catch (IOException e) {
            e.printStackTrace();
        }


        // client复制
        try {
            // 删除目标文件夹及其下所有文件
            if (Files.exists(target_client)) {
                System.out.println("client/dist文件夹已存在！");
                Files.walkFileTree(target_client, new SimpleFileVisitor<Path>() {
                    @Override
                    public FileVisitResult visitFile(Path file, BasicFileAttributes attrs) throws IOException {
                        Files.delete(file);
                        return FileVisitResult.CONTINUE;
                    }

                    @Override
                    public FileVisitResult postVisitDirectory(Path dir, IOException exc) throws IOException {
                        Files.delete(dir);
                        return FileVisitResult.CONTINUE;
                    }
                });
                System.out.println("client/dist文件夹已删除！");
            }

            // 复制源文件夹到目标文件夹
            Files.walkFileTree(source_client, new SimpleFileVisitor<Path>() {
                @Override
                public FileVisitResult preVisitDirectory(Path dir, BasicFileAttributes attrs) throws IOException {
                    Path targetDir = target_client.resolve(source_client.relativize(dir));
                    Files.createDirectories(targetDir);
                    return FileVisitResult.CONTINUE;
                }

                @Override
                public FileVisitResult visitFile(Path file, BasicFileAttributes attrs) throws IOException {
                    Files.copy(file, target_client.resolve(source_client.relativize(file)), StandardCopyOption.REPLACE_EXISTING);
                    return FileVisitResult.CONTINUE;
                }
            });
            System.out.println("client/dist复制完成！");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
