package nx.water.biz.admin.dao;

import java.util.List;

import nx.water.entity.PageBean;
import nx.water.entity.optResult;
import nx.water.entity.user;



public interface adminDao {
	public List<user> findAll();
	public int add(user c);
	public int delById(String USER_NAME);
	public int updateUser(user c);
	public List<user> findAllP(int currentPage,int pageSize);
	public int queryCount();
	
}
