package ajax.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;

import ajax.model.vo.User;

@WebServlet("/ajaxJson")
public class AjaxJsonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public AjaxJsonServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//JSON��ü�� �����Ͽ� �������� �ڷḦ �����ϱ� ����
		//��ü�� map�� ��ӹ޾� �����Ǿ� key:valu������� ����
		//map�̶� ����� �����.
//		JSONObject jsobj=new JSONObject();
//		jsobj.put("name","�ֽ���");
//		jsobj.put("age",29);
//		jsobj.put("height",180.5);
//		jsobj.put("phone","010-3644-6259");
		//json�� ������ ��ü�� ���� �� ����
		//jsobj.put("uesr",new User('c',23));
		response.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		String userAddr = request.getParameter("userAddr");
		System.out.println(userId+userName+userAddr);
//		response.setContentType("application/json;charset=UTF-8");
//		PrintWriter out=response.getWriter();
//		//out.print(jsobj);	
//		//��ü�� �ڷḦ ������ ���ؼ� array ���
//		JSONArray jsonArray = new JSONArray();  //==list
		List<User> list = new ArrayList<>();
		list.add(new User("jung","������","����"));
		list.add(new User("choi","�ֽ���","������"));
		list.add(new User(userId,userName,userAddr));
//		for(User u:list) {
//			JSONObject temp = new JSONObject();
//			temp.put("id", u.getName());
//			temp.put("name" , u.getPhone());
//			temp.put("address", u.getProfile());
//			jsonArray.add(temp);
//		}
//		System.out.println(jsonArray);
//		out.print(jsonArray);
		new Gson().toJson(list, response.getWriter());
		//user ��ü ����������� �׳� ��� success �Լ� ���� ��ü�� ȣ���� �� ��
		//�ٿ����� ��ü�� ������ ��Ī���� ȣ��
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
