package nx.water.biz.historicalDate.service;

import java.util.List;

import nx.water.entity.pgroup;
import nx.water.entity.query;
import nx.water.entity.rmd;
import nx.water.entity.rtu;
import nx.water.entity.test;

public interface hisDateService {
	// ��ѯ���е���ʷ����
    public List<rmd> findAllData();
    // ��ѯ���е���Ŀ����
    public List<pgroup> findAllGroup();
    // ��ѯ���е��豸
    public List<rtu> findAllEquipment();
    // ��������ѯ��ʷ����
    public List<test> queryFind(query que);
 // ��������ѯ��ʷ����
    public List<test> queryFind1(query que);
   //��ѯʵʱ����
    public List<test> find();
}
