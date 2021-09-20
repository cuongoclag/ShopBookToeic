package com.webtoeic.entities;

import javax.persistence.*;

@Entity
public class WarehouseExam {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "idQuestion", nullable = false)
    private Integer idQuestion;

    @Column(name = "image")
    private String image;

    @Column(name = "audiomp3")
    private String audiomp3;

    @Column(name = "part")
    private int part;

    @Column(name = "difficult")
    private int difficult;

    @Column(name = "time")
    private int time;

    @Column(name ="question", columnDefinition = "TEXT")
    private String question;

    @Column(name = "answer_1")
    private String answer_1;

    @Column(name = "answer_2")
    private String answer_2;

    @Column(name = "answer_3")
    private String answer_3;

    @Column(name = "answer_4")
    private String answer_4;

    @Column(name = "correctAnswer")
    private String correctAnswer;

    public Integer getIdQuestion() {
        return idQuestion;
    }

    public void setIdQuestion(Integer idQuestion) {
        this.idQuestion = idQuestion;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getAudiomp3() {
        return audiomp3;
    }

    public void setAudiomp3(String audiomp3) {
        this.audiomp3 = audiomp3;
    }

    public int getPart() {
        return part;
    }

    public void setPart(int part) {
        this.part = part;
    }

    public int getDifficult() {
        return difficult;
    }

    public void setDifficult(int difficult) {
        this.difficult = difficult;
    }

    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getAnswer_1() {
        return answer_1;
    }

    public void setAnswer_1(String answer_1) {
        this.answer_1 = answer_1;
    }

    public String getAnswer_2() {
        return answer_2;
    }

    public void setAnswer_2(String answer_2) {
        this.answer_2 = answer_2;
    }

    public String getAnswer_3() {
        return answer_3;
    }

    public void setAnswer_3(String answer_3) {
        this.answer_3 = answer_3;
    }

    public String getAnswer_4() {
        return answer_4;
    }

    public void setAnswer_4(String answer_4) {
        this.answer_4 = answer_4;
    }

    public String getCorrectAnswer() {
        return correctAnswer;
    }

    public void setCorrectAnswer(String correctAnswer) {
        this.correctAnswer = correctAnswer;
    }

    public WarehouseExam() {
    }

    public WarehouseExam(Integer idQuestion, String image, String audiomp3, int part, int difficult, int time, String question, String answer_1, String answer_2, String answer_3, String answer_4, String correctAnswer) {
        this.idQuestion = idQuestion;
        this.image = image;
        this.audiomp3 = audiomp3;
        this.part = part;
        this.difficult = difficult;
        this.time = time;
        this.question = question;
        this.answer_1 = answer_1;
        this.answer_2 = answer_2;
        this.answer_3 = answer_3;
        this.answer_4 = answer_4;
        this.correctAnswer = correctAnswer;
    }
}
