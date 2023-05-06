package com.controler;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.model.EClasses;
import com.model.ECourse;
import com.util.HibernateUtil;

public class CourseControler {
	
	public static List<ECourse> getCourses(){
		SessionFactory factory = HibernateUtil.getSessionFactory();
		
		Session session = factory.openSession();
		List<ECourse> courseList = session.createQuery("from ECourse ").list();
		return courseList;
	}
	
	public static ECourse getCoursesById(String courseId){
		SessionFactory factory = HibernateUtil.getSessionFactory();
		
		Session session = factory.openSession();
		List<ECourse> courseList = session.createQuery("from ECourse where courseId="+courseId).list();
		return courseList.get(0);
	}
	
	public static boolean isCourseMappedtoClass(String courseId){
		SessionFactory factory = HibernateUtil.getSessionFactory();
		
		Session session = factory.openSession();
		List<EClasses> classList = session.createQuery("from EClasses where courseId="+courseId).list();
		if (classList.size()!=0)
			return true;
		else
			return false;
		
	}
	
	public static boolean addData(ECourse course){
		SessionFactory factory = HibernateUtil.getSessionFactory();
		
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(course);
		tx.commit();
		return true;
	}
	
	public static boolean remove(int id) {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		
		Session session_db = factory.openSession();
		//List<ECourse> courseList = session_db.createQuery("from EClasses where").list();
		Query q = session_db.createQuery("delete ECourse where courseId="+id);
		Transaction tx = session_db.beginTransaction();
		q.executeUpdate();
		tx.commit();
		
		return true;
	}
	

}
