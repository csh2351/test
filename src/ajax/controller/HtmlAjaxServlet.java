package ajax.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ajax.model.vo.User;


@WebServlet("/test1.do")
public class HtmlAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public HtmlAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//비지니스로직처리 Service <-> Dao
		List<User> list=new ArrayList();
		list.add(new User("박보검","010-5564-1234","parkBogum.jpg"));
		list.add(new User("멧데이먼","010-4257-5561","mattDamon.jpg"));
		list.add(new User("줄리아로버츠","010-8674-1677","juliaRoberts.jpg"));
		//view로 처리 위임
		request.setAttribute("list", list);
		RequestDispatcher rd=request.getRequestDispatcher("/Jquery_Ajax/sample1.jsp");
		rd.forward(request, response);
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
