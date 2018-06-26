package nx.water.biz.dataRep.service;

import java.util.List;

import nx.water.entity.PageBean;
import nx.water.entity.query;
import nx.water.entity.queryTest;
import nx.water.entity.test;

public interface dataRepService {
	// ��ѯ���е���ʷ����
	public List<test> findAllData();

	// ��ҳ��ѯ��������
	public List<test> findAllDataP(int currentPage, int pageSize);

	// ����������
	public int queryCount();

	// �ṩһ����װ�õ�PageBean����
	public PageBean dataQueryPageBean(Integer currentPage, Integer pageSize,queryTest query);
	
	// ������ѯ+��ҳ��ѯ ����
	public List<test> findDataP(int currentPage, int pageSize, queryTest query);

	// ������ѯ+��ҳ��ѯ ����
	public int count(queryTest query);
	//����excel;
	public void Export(List<test> employ, queryTest query);
	
	// ��������ѯ��ʷ����
	public List<test> queryFind(query que);
	
	//������ѯ+��ҳ��ѯ  ����
	public List<test> hispage(int currentPage,int pageSize,List<test> te,int total);
	
	// ��������ѯ��ʷ����
	public List<test> queryFind1(query que);
}
