package nx.water.biz.dataRep.dao;

import java.util.List;

import nx.water.entity.query;
import nx.water.entity.queryTest;
import nx.water.entity.rmd;
import nx.water.entity.test;
import nx.water.entity.user;


public interface dataRepDao {
	// ��ѯ���е���ʷ����
	public List<test> findAllData();
	//��ҳ��ѯ��������
	public List<test> findAllDataP(int currentPage,int pageSize);
	//����������
	public int queryCount();
	//������ѯ+��ҳ��ѯ  ����
	public List<test> findDataP(int currentPage,int pageSize,queryTest query);
	//������ѯ+��ҳ��ѯ   ����
	public int count(queryTest query);
	//������excel
	public void  Export(List<test> employ,queryTest query);
	
	// ��������ѯ��ʷ����
	public List<test> queryFind(query que);
	
	// ��������ѯ��ʷ����
	public List<test> queryFind1(query que);
	
	//������ѯ+��ҳ��ѯ  ����
	public List<test> hispage(int currentPage,int pageSize,List<test> te,int total);
	
	
	
	
}
