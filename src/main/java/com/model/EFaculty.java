package com.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="teacher")
public class EFaculty {
	@Id
	@GeneratedValue
	@Column(name="id")
	private int id;
	@Column(name="facultyId")
	private String facultyId;
	@Column(name="name")
	private String name;
	@Column(name="classID")
	private String facultyClass;
	@Column(name="datetime")
	private Date date;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFacultyId() {
		return facultyId;
	}
	public void setFacultyId(String facultyId) {
		this.facultyId = facultyId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFacultyClass() {
		return facultyClass;
	}
	public void setFacultyClass(String facultyClass) {
		this.facultyClass = facultyClass;
	}
	
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "EFaculty [id=" + id + ", facultyId=" + facultyId + ", name=" + name + ", facultyClass=" + facultyClass
				+ "]";
	}
	
	
}
