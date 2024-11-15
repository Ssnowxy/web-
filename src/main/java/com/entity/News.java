package com.entity;

import java.util.Date;

public class News {
    private int newsId;
    private String title;
    private String author;
    private String content;
    private Date publishTime;
    private Date updateTime;
    private String imagePath;

    // Constructor
    public News(int newsId, String title, String author, String content, Date publishTime, Date updateTime, String imagePath) {
        this.newsId =newsId;
        this.title = title;
        this.author = author;
        this.content = content;
        this.publishTime = publishTime;
        this.updateTime = updateTime;
        this.imagePath = imagePath;
    }

    // Getters and setters
    public int getNewsId() {
        return newsId;
    }

    public void setNewsId(int newsId) {
        this.newsId = newsId;
    }
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Date getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

}
