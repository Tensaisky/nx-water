package nx.water.biz.monitoring.service;

import java.util.List;

import nx.water.entity.mapShowInfo;
import nx.water.entity.position;

public interface monitorService {
	public void add(position map);

	public List<position> find();
	
	public List<mapShowInfo> mapShow();
	
	public List<mapShowInfo> mapShow1();
}
