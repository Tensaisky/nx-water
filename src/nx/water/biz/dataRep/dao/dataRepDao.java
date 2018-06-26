package nx.water.biz.dataRep.dao;

import java.util.List;

import nx.water.entity.query;
import nx.water.entity.queryTest;
import nx.water.entity.rmd;
import nx.water.entity.test;
import nx.water.entity.user;


public interface dataRepDao {
	// 查询所有的历史数据
	public List<test> findAllData();
	//分页查询所有数据
	public List<test> findAllDataP(int currentPage,int pageSize);
	//数据总条数
	public int queryCount();
	//条件查询+分页查询  数据
	public List<test> findDataP(int currentPage,int pageSize,queryTest query);
	//条件查询+分页查询   总数
	public int count(queryTest query);
	//导出到excel
	public void  Export(List<test> employ,queryTest query);
	
	// 按条件查询历史数据
	public List<test> queryFind(query que);
	
	// 按条件查询历史数据
	public List<test> queryFind1(query que);
	
	//条件查询+分页查询  数据
	public List<test> hispage(int currentPage,int pageSize,List<test> te,int total);
	
	
	
	
}
