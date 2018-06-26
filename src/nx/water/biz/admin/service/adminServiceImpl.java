package nx.water.biz.admin.service;

import java.util.List;

import nx.water.biz.admin.dao.adminDao;
import nx.water.biz.admin.dao.adminDaoImpl;
import nx.water.entity.PageBean;
import nx.water.entity.user;

public class adminServiceImpl implements adminService {
	adminDao dao = new adminDaoImpl();

	// ��ѯ�����û�
	@Override
	public List<user> findAll() {

		return dao.findAll();
	}

	// �����û�
	@Override
	public int add(user c) {
		return dao.add(c);

	}

	// ɾ���û�
	@Override
	public int delById(String USER_NAME) {
		return dao.delById(USER_NAME);

	}

	// �޸��û�
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

	// ��װPageBean����
	@Override
	public PageBean queryPageBean(Integer currentPage,Integer pageSize) {
		PageBean pageBean = new PageBean();

		// ���û������л�ȡ��ǰҳ����
		pageBean.setCurrentPage(currentPage);
		// �ܼ�¼��
		int count = dao.queryCount();
		pageBean.setTotalCount(count);
		// ÿҳ��ʾ�ļ�¼��
		pageBean.setPageSize(pageSize);
		// �����ݿ��ѯ����
		List<user> list = dao.findAllP(currentPage, pageBean.getPageSize());
		pageBean.setUser(list);
		return pageBean;
	}

}
