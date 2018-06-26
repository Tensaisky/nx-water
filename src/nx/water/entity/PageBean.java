package nx.water.entity;

import java.util.List;

public class PageBean {
	List<user> user; // ��ǰҳ�û�����
	List<test> test;
	int firstPage; // ��ҳ
	int prePage; // ��һҳ
	int nextPage;// ��һҳ
	int totalPage;// ĩҳ/��ҳ��
	int currentPage;// ��ǰҳ
	int totalCount;// �ܼ�¼��
	int pageSize;// ÿҳ��ʾ��¼��

	@Override
	public String toString() {
		return "PageBean [user=" + user + ", test=" + test + ", firstPage=" + firstPage + ", prePage=" + prePage
				+ ", nextPage=" + nextPage + ", totalPage=" + totalPage + ", currentPage=" + currentPage
				+ ", totalCount=" + totalCount + ", pageSize=" + pageSize + "]";
	}
    
	public PageBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PageBean(List<nx.water.entity.user> user, List<nx.water.entity.test> test, int firstPage, int prePage,
			int nextPage, int totalPage, int currentPage, int totalCount, int pageSize) {
		super();
		this.user = user;
		this.test = test;
		this.firstPage = firstPage;
		this.prePage = prePage;
		this.nextPage = nextPage;
		this.totalPage = totalPage;
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		this.pageSize = pageSize;
	}

	public List<test> getTest() {
		return test;
	}

	public void setTest(List<test> test) {
		this.test = test;
	}

	public List<user> getUser() {
		return user;
	}
	public void setUser(List<user> user) {
		this.user = user;
	}
	/**
	 * ��ҳ
	 * @return
	 */
	public int getFirstPage() {
		return 1;
	}
	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}
	/**
	 * ��һҳ �㷨�������ǰҳ����ҳ����Ϊ1������Ϊ����ǰҳ-1��
	 * @return
	 */
	public int getPrePage() {
		return this.getCurrentPage()==this.getFirstPage()
					?1:
					this.getCurrentPage()-1;
	}
	public void setPrePage(int prePage) {
		this.prePage = prePage;
	}
	
	/**
	 * ��һҳ  �㷨�� �����ǰҳ��ĩҳ����Ϊĩҳ������Ϊ����ǰҳ+1��
	 * @return
	 */
	public int getNextPage() {
		return this.getCurrentPage()==this.getTotalPage()
				? this.getTotalPage()
				: this.getCurrentPage()+1;
	}
	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
	/**
	 * ��ҳ��  �㷨��  ���   �ܼ�¼��%ÿҳ��ʾ��¼���ܹ����� ,��Ϊ���ܼ�¼��/ÿҳ��ʾ��¼����������  ���ܼ�¼��/ÿҳ��ʾ��¼��+1��  
	 * @return
	 */
	public int getTotalPage() {
		return this.getTotalCount()%this.getPageSize()==0
				? this.getTotalCount()/this.getPageSize()
				: this.getTotalCount()/this.getPageSize()+1;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	
}

