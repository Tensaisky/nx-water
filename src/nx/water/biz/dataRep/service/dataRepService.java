package nx.water.biz.dataRep.service;

import java.util.List;

import nx.water.entity.PageBean;
import nx.water.entity.query;
import nx.water.entity.queryTest;
import nx.water.entity.test;

public interface dataRepService {
	// 查询所有的历史数据
	public List<test> findAllData();

	// 分页查询所有数据
	public List<test> findAllDataP(int currentPage, int pageSize);

	// 数据总条数
	public int queryCount();

	// 提供一个封装好的PageBean对象
	public PageBean dataQueryPageBean(Integer currentPage, Integer pageSize,queryTest query);
	
	// 条件查询+分页查询 数据
	public List<test> findDataP(int currentPage, int pageSize, queryTest query);

	// 条件查询+分页查询 总数
	public int count(queryTest query);
	//导出excel;
	public void Export(List<test> employ, queryTest query);
	
	// 按条件查询历史数据
	public List<test> queryFind(query que);
	
	//条件查询+分页查询  数据
	public List<test> hispage(int currentPage,int pageSize,List<test> te,int total);
	
	// 按条件查询历史数据
	public List<test> queryFind1(query que);
}
