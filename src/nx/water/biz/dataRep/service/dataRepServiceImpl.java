package nx.water.biz.dataRep.service;

import java.util.List;

import nx.water.biz.dataRep.dao.dataRepDao;
import nx.water.biz.dataRep.dao.dataRepDaoImpl;
import nx.water.entity.PageBean;
import nx.water.entity.query;
import nx.water.entity.queryTest;
import nx.water.entity.test;
import nx.water.entity.user;

public class dataRepServiceImpl implements dataRepService {
	dataRepDao dao = new dataRepDaoImpl();
	
	public static void main(String[] args) {	
		
	}
	// ��ѯ���е���ʷ����
	@Override
	public List<test> findAllData() {

		return dao.findAllData();
	}

	// ��ҳ��ѯ��������
	@Override
	public List<test> findAllDataP(int currentPage, int pageSize) {

		return dao.findAllDataP(currentPage, pageSize);
	}

	// �����ܸ���
	@Override
	public int queryCount() {

		return dao.queryCount();
	}

	// ��װһ��PageBean
	@Override
	public PageBean dataQueryPageBean(Integer currentPage, Integer pageSize,queryTest query) {
		PageBean pageBean = new PageBean();
		
		// ���û������л�ȡ��ǰҳ����
		pageBean.setCurrentPage(currentPage);
		// �ܼ�¼��
		int count = dao.count(query);
		pageBean.setTotalCount(count);
		// ÿҳ��ʾ�ļ�¼��
		pageBean.setPageSize(pageSize);
		// �����ݿ��ѯ����
		List<test> list = dao.findDataP(currentPage, pageBean.getPageSize(),query);
		pageBean.setTest(list);
		;
		return pageBean;
	}

	// ����+��ҳ ��ѯ
	@Override
	public List<test> findDataP(int currentPage, int pageSize, queryTest query) {

		return dao.findDataP(currentPage, pageSize, query);
	}

	// ����+��ҳ ����Ŀ
	@Override
	public int count(queryTest query) {

		return dao.count(query);
	}
	//����excel
	@Override
	public void Export(List<test> employ, queryTest query) {
		dao.Export(employ, query);
		
	}
	@Override
	public List<test> queryFind(query que) {
		// TODO Auto-generated method stub
		return dao.queryFind(que);
	}
	@Override
	public List<test> hispage(int currentPage, int pageSize, List<test> te, int total) {
		// TODO Auto-generated method stub
		return dao.hispage(currentPage, pageSize, te, total);
	}
	@Override
	public List<test> queryFind1(query que) {
		// TODO Auto-generated method stub
		return dao.queryFind1(que);
	}

	/*// ������װPageBean����
	@Override
	public PageBean dataQueryPageBean(Integer currentPage, Integer pageSize, queryTest query) {
		PageBean pageBean = new PageBean();
		// ���û������л�ȡ��ǰҳ����
		pageBean.setCurrentPage(currentPage);
		// �ܼ�¼��
		int count = dao.count(query);
		pageBean.setTotalCount(count);
		// ÿҳ��ʾ�ļ�¼��
		pageBean.setPageSize(pageSize);
		// �����ݿ��ѯ����
		List<test> list = dao.findDataP(currentPage, pageSize, query);
		pageBean.setTest(list);
		return pageBean;

	}*/

}
