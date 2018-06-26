package nx.water.biz.admin.service;

import java.util.List;

import nx.water.biz.admin.dao.adminDao;
import nx.water.biz.admin.dao.adminDaoImpl;
import nx.water.entity.PageBean;
import nx.water.entity.user;

public class adminServiceImpl implements adminService {
	adminDao dao = new adminDaoImpl();

	// 查询所有用户
	@Override
	public List<user> findAll() {

		return dao.findAll();
	}

	// 增加用户
	@Override
	public int add(user c) {
		return dao.add(c);

	}

	// 删除用户
	@Override
	public int delById(String USER_NAME) {
		return dao.delById(USER_NAME);

	}

	// 修改用户
	@Override
	public int updateUser(user c) {
		return dao.updateUser(c);

	}

	@Override
	public List<user> findAllP(int currentPage, int pageSize) {
		return dao.findAllP(currentPage, pageSize);
	}

	@Override
	public int queryCount() {
		// TODO Auto-generated method stub
		return dao.queryCount();
	}

	// 封装PageBean对象
	@Override
	public PageBean queryPageBean(Integer currentPage,Integer pageSize) {
		PageBean pageBean = new PageBean();

		// 从用户输入中获取当前页数据
		pageBean.setCurrentPage(currentPage);
		// 总记录数
		int count = dao.queryCount();
		pageBean.setTotalCount(count);
		// 每页显示的记录数
		pageBean.setPageSize(pageSize);
		// 从数据库查询数据
		List<user> list = dao.findAllP(currentPage, pageBean.getPageSize());
		pageBean.setUser(list);
		return pageBean;
	}

}
