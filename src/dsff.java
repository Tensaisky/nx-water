import java.util.ArrayList;
import java.util.List;

public class dsff {
   public static void main(String[] args) {
	   List<String> list1 = new ArrayList<String>();
	   list1.add("a");
	   list1.add("b");
	   list1.add("c");
	   list1.add("d");
	   list1.add("e");
	   List<String> list2 = new ArrayList<String>();
	   list2.add("d");
	   list2.add("e");
	   list2.add("f");
	   list2.add("g");
	   list2.add("h");
	   System.out.println("list1"+list1);
	   System.out.println("list2"+list2);
	   List<String> lista = new ArrayList<String>(list1);//构建list1的副本
	   lista.removeAll(list2);// 去除1中与2相同元素
	   List<String> listb = new ArrayList<String>(list2);//构建list2的副本
	   listb.removeAll(list1);// 去除相同元素
	   System.out.println(lista);
	   System.out.println(listb);
}
}
