package com.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="courses")
public class ECourse {
	@Id
	@GeneratedValue
	@Column(name="id")
	private int id;
	@Column(name="courseId")
	private String courseId;
	@Column(name="courseName")
	private String courseName;
	@Column(name="datetime")
	private Date date;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCourseId() {
		return courseId;
	}
	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "ECourse [id=" + id + ", courseId=" + courseId + ", courseName=" + courseName + ", date=" + date + "]";
	}
	
	
}
