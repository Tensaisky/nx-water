package nx.water.biz.monitoring.dao;

import java.util.List;

import nx.water.entity.mapShowInfo;
import nx.water.entity.position;

public interface monitorDao {
	public void add(position map);

	public List<position> find();
	
	public List<mapShowInfo> mapShow();
	
	public List<mapShowInfo> mapShow1();
}
