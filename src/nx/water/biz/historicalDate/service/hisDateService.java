package nx.water.biz.historicalDate.service;

import java.util.List;

import nx.water.entity.pgroup;
import nx.water.entity.query;
import nx.water.entity.rmd;
import nx.water.entity.rtu;
import nx.water.entity.test;

public interface hisDateService {
	// 查询所有的历史数据
    public List<rmd> findAllData();
    // 查询所有的项目名称
    public List<pgroup> findAllGroup();
    // 查询所有的设备
    public List<rtu> findAllEquipment();
    // 按条件查询历史数据
    public List<test> queryFind(query que);
 // 按条件查询历史数据
    public List<test> queryFind1(query que);
   //查询实时数据
    public List<test> find();
}
