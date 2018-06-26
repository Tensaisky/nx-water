package nx.water.biz.admin.service;

import java.util.List;

import nx.water.entity.PageBean;
import nx.water.entity.user;

public interface adminService {
	//��ѯ�����û�
	public List<user> findAll();
	//�����û�
	public int add(user c);
	//����idɾ���û�
	public int delById(String USER_NAME);
	//�޸��û�
	public int updateUser(user c);
	//��ҳ��ѯ
	public List<user> findAllP(int currentPage,int pageSize);
	//��ѯ��¼��
	public int queryCount();
	
	//�ṩһ����װ�õ�PageBean����
	public PageBean queryPageBean(Integer currentPage,Integer pageSize);
}
