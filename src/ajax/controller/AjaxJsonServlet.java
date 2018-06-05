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
		//JSON객체를 생성하여 서블릿에서 자료를 전송하기 위한
		//객체로 map을 상속받아 구현되어 key:valu방식으로 저장
		//map이랑 사용이 비슷함.
//		JSONObject jsobj=new JSONObject();
//		jsobj.put("name","최승훈");
//		jsobj.put("age",29);
//		jsobj.put("height",180.5);
//		jsobj.put("phone","010-3644-6259");
		//json은 값으로 객체를 받을 수 없음
		//jsobj.put("uesr",new User('c',23));
		response.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		String userAddr = request.getParameter("userAddr");
		System.out.println(userId+userName+userAddr);
//		response.setContentType("application/json;charset=UTF-8");
//		PrintWriter out=response.getWriter();
//		//out.print(jsobj);	
//		//객체의 자료를 보내기 위해선 array 사용
//		JSONArray jsonArray = new JSONArray();  //==list
		List<User> list = new ArrayList<>();
		list.add(new User("jung","박정현","서울"));
		list.add(new User("choi","최승훈","강동구"));
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
		//user 객체 멤버변수명을 그냥 사용 success 함수 에서 객체를 호출할 때 자
		//바에서의 객체와 동일한 명칭으로 호출
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
