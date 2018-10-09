package com.need02.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.need02.pojo.Company;
import com.need02.pojo.Technology;;



public class Tbase extends HibernateDaoSupport {
	
	/**查询*/
	@SuppressWarnings("unchecked")
	public List<Technology> getObjects(String queryString) throws Exception
	{
		return (List<Technology>)this.getHibernateTemplate().find(queryString);
	}
	
	/**查询所有*/
	public List<Technology> getAllObjects(Class<Technology> clazz){
		return this.getHibernateTemplate().loadAll(clazz);
	}
	
	
	/**添加一个*/
	public <T> void addObject(T clazz){
		this.getHibernateTemplate().save(clazz);
	}
	
	/**更新指定的*/
	public <T> void updateObject(T clazz){
		this.getHibernateTemplate().update(clazz);
	}

	/**删除指定的*/
	public <T> void deleteObject(T clazz){
		this.getHibernateTemplate().delete(clazz);
	}
	
	/**通过tid获取*/
	public <T> T getObject(Class<T> clazz,Serializable tid){
		return this.getHibernateTemplate().get(clazz, tid);
	}
	
}

