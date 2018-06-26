package nx.water.biz.user.service;

import java.util.List;

import nx.water.biz.user.dao.userDao;
import nx.water.biz.user.dao.userDaoImpl;
import nx.water.entity.test;
import nx.water.entity.user;

public class userServiceImpl implements userService {
    userDao dao = new userDaoImpl();
	@Override
	public user login(String USER_NAME) {
		return dao.findByName(USER_NAME);
	}
	

}
