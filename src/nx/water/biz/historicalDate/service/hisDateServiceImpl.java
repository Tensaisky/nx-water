package nx.water.biz.historicalDate.service;

import java.util.List;

import net.sf.json.JSONArray;
import nx.water.biz.historicalDate.dao.hisDateDao;
import nx.water.biz.historicalDate.dao.hisDateDaoImpl;
import nx.water.entity.pgroup;
import nx.water.entity.query;
import nx.water.entity.rmd;
import nx.water.entity.rtu;
import nx.water.entity.test;

public class hisDateServiceImpl implements hisDateService {
	hisDateDao dao = new hisDateDaoImpl();
	//查询历史数据
	@Override
	public List<rmd> findAllData() {
		
		return dao.findAllData();
	}
	//查询所有项目名称
	@Override
	public List<pgroup> findAllGroup() {		
		return dao.findAllGroup();
	}
	//查询所有设备
	@Override
	public List<rtu> findAllEquipment() {
		
		return dao.findAllEquipment();
	}
	public static void main(String[] args) {
		hisDateServiceImpl dao = new hisDateServiceImpl();
		List<rtu> list = dao.findAllEquipment();
		 JSONArray json=JSONArray.fromObject(list);
		for (Object object : json) {
			System.out.println(object);
		}
	}
	@Override
	public List<test> queryFind(query que) {
		// TODO Auto-generated method stub
		return dao.queryFind(que);
	}
	@Override
	public List<test> find() {
		// TODO Auto-generated method stub
		return dao.find();
	}
	@Override
	public List<test> queryFind1(query que) {
		// TODO Auto-generated method stub
		return dao.queryFind1(que);
	}


}
