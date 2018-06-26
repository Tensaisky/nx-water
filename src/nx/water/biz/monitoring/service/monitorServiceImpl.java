package nx.water.biz.monitoring.service;

import java.util.List;

import nx.water.biz.monitoring.dao.monitorDao;
import nx.water.biz.monitoring.dao.monitorDaoImpl;
import nx.water.entity.mapShowInfo;
import nx.water.entity.position;

public class monitorServiceImpl implements monitorService {
    monitorDao dao  =  new monitorDaoImpl();
	@Override
	public void add(position map) {
		dao.add(map);

	}

	@Override
	public List<position> find() {
		
		return dao.find();
	}

	@Override
	public List<mapShowInfo> mapShow() {
		// TODO Auto-generated method stub
		return dao.mapShow();
	}

	@Override
	public List<mapShowInfo> mapShow1() {
		// TODO Auto-generated method stub
		return dao.mapShow1();
	}

}
