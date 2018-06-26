package nx.water.biz.user.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import nx.water.entity.test;
import nx.water.entity.user;
import nx.water.util.DataSourceUtils;
import nx.water.util.JdbcUtil;



public class userDaoImpl implements userDao {
	public static void main(String[] args) {
		userDaoImpl dao = new userDaoImpl();
		
		
	}


	@Override
	public user findByName(String name) {
		try {
			QueryRunner qr = new QueryRunner(JdbcUtil.getDataSource());
			return (user) qr.query("select *from user where USER_NAME=?", new BeanHandler(user.class),new Object[] {name});
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}



	@Override
	public List<test> findByTime() {
		// TODO Auto-generated method stub
		return null;
	}

}
