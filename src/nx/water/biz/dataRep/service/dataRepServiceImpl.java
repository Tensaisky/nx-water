package nx.water.biz.dataRep.service;

import java.util.List;

import nx.water.biz.dataRep.dao.dataRepDao;
import nx.water.biz.dataRep.dao.dataRepDaoImpl;
import nx.water.entity.PageBean;
import nx.water.entity.query;
import nx.water.entity.queryTest;
import nx.water.entity.test;
import nx.water.entity.user;

public class dataRepServiceImpl implements dataRepService {
	dataRepDao dao = new dataRepDaoImpl();
	
	public static void main(String[] args) {	
		
	}
	// 查询所有的历史数据
	@Override
	public List<test> findAllData() {

		return dao.findAllData();
	}

	// 分页查询所有数据
	@Override
	public List<test> findAllDataP(int currentPage, int pageSize) {

		return dao.findAllDataP(currentPage, pageSize);
	}

	// 数据总个数
	@Override
	public int queryCount() {

		return dao.queryCount();
	}

	// 封装一个PageBean
	@Override
	public PageBean dataQueryPageBean(Integer currentPage, Integer pageSize,queryTest query) {
		PageBean pageBean = new PageBean();
		
		// 从用户输入中获取当前页数据
		pageBean.setCurrentPage(currentPage);
		// 总记录数
		int count = dao.count(query);
		pageBean.setTotalCount(count);
		// 每页显示的记录数
		pageBean.setPageSize(pageSize);
		// 从数据库查询数据
		List<test> list = dao.findDataP(currentPage, pageBean.getPageSize(),query);
		pageBean.setTest(list);
		;
		return pageBean;
	}

	// 条件+分页 查询
	@Override
	public List<test> findDataP(int currentPage, int pageSize, queryTest query) {

		return dao.findDataP(currentPage, pageSize, query);
	}

	// 条件+分页 总数目
	@Override
	public int count(queryTest query) {

		return dao.count(query);
	}
	//导出excel
	@Override
	public void Export(List<test> employ, queryTest query) {
		dao.Export(employ, query);
		
	}
	@Override
	public List<test> queryFind(query que) {
		// TODO Auto-generated method stub
		return dao.queryFind(que);
	}
	@Override
	public List<test> hispage(int currentPage, int pageSize, List<test> te, int total) {
		// TODO Auto-generated method stub
		return dao.hispage(currentPage, pageSize, te, total);
	}
	@Override
	public List<test> queryFind1(query que) {
		// TODO Auto-generated method stub
		return dao.queryFind1(que);
	}

	/*// 条件封装PageBean对象
	@Override
	public PageBean dataQueryPageBean(Integer currentPage, Integer pageSize, queryTest query) {
		PageBean pageBean = new PageBean();
		// 从用户输入中获取当前页数据
		pageBean.setCurrentPage(currentPage);
		// 总记录数
		int count = dao.count(query);
		pageBean.setTotalCount(count);
		// 每页显示的记录数
		pageBean.setPageSize(pageSize);
		// 从数据库查询数据
		List<test> list = dao.findDataP(currentPage, pageSize, query);
		pageBean.setTest(list);
		return pageBean;

	}*/

}
