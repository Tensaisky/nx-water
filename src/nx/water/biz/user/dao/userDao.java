package nx.water.biz.user.dao;

import java.util.List;

import nx.water.entity.test;
import nx.water.entity.user;

public interface userDao {
	 public  user findByName (String name);
	 
	 //��������ѯ
	 public List<test> findByTime();
}
