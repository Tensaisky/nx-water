package nx.water.biz.admin.service;

import java.util.List;

import nx.water.entity.PageBean;
import nx.water.entity.user;

public interface adminService {
	//查询所有用户
	public List<user> findAll();
	//增加用户
	public int add(user c);
	//根据id删除用户
	public int delById(String USER_NAME);
	//修改用户
	public int updateUser(user c);
	//分页查询
	public List<user> findAllP(int currentPage,int pageSize);
	//查询记录数
	public int queryCount();
	
	//提供一个封装好的PageBean对象
	public PageBean queryPageBean(Integer currentPage,Integer pageSize);
}
