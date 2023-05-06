package com.controler;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.model.EFaculty;

import com.util.HibernateUtil;

public class FacultyControler {
	public static List<EFaculty> getFaculty(){
		SessionFactory factory = HibernateUtil.getSessionFactory();
		
		Session session = factory.openSession();
		List<EFaculty> facultyList = session.createQuery("from EFaculty ").list();
		return facultyList;
	}
	
	public static boolean addData(EFaculty faculty) {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		
		Session session_db = factory.openSession();
		Transaction tx = session_db.beginTransaction();
		session_db.save(faculty);
		tx.commit();
		return true;
	}
	
	public static boolean remove(int id) {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		
		Session session_db = factory.openSession();
		Query q = session_db.createQuery("delete EFaculty where id="+id);
		Transaction tx = session_db.beginTransaction();
		q.executeUpdate();
		tx.commit();
		
		return true;
	}
	
	public static boolean update(EFaculty faculty) {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		
		Session session_db = factory.openSession();
		Transaction tx = session_db.beginTransaction();
		session_db.update(faculty);
		tx.commit();
		return true;
	}
}
