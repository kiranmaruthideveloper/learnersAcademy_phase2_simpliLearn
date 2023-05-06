package com.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="classes")
public class EClasses {
	
	@Id
	@GeneratedValue
	@Column(name="id")
	private int id;
	@Column(name="className")
	private String className;
	@Column(name="courseId")
	private String courseId;
	@Column(name="datetime")
	private Date date;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getCourseId() {
		return courseId;
	}
	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "EClasses [id=" + id + ", className=" + className + ", courseId=" + courseId + ", date=" + date + "]";
	}
	
	

}
