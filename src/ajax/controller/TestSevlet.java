package ajax.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test.do")
public class TestSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public TestSevlet() {
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String name=request.getParameter("name");
		String age=request.getParameter("age");
		System.out.println("name"+name);
		System.out.println("age"+age);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.append("전달받은 값 : ")
		.append("이름 : "+name+"<br>")
		.append("나이 : "+age+"<br>")
		.append("----------요기까지-------");

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
