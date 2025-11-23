package com.example.college.model;

public class Timetable {
    private String day;
    private String time;
    private String subject;
    private String batch;
    private String room;

    public Timetable(String day, String time, String subject, String batch, String room) {
        this.day = day;
        this.time = time;
        this.subject = subject;
        this.batch = batch;
        this.room = room;
    }

    // Getters and Setters
    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getBatch() {
        return batch;
    }

    public void setBatch(String batch) {
        this.batch = batch;
    }

    public String getRoom() {
        return room;
    }

    public void setRoom(String room) {
        this.room = room;
    }
}
