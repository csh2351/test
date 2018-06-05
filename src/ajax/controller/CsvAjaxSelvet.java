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

import ajax.model.vo.User;

@WebServlet("/test3.do")
public class CsvAjaxSelvet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public CsvAjaxSelvet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<User> list=new ArrayList();
		list.add(new User("박보검","010-5564-1234","parkBogum.jpg"));
		list.add(new User("멧데이먼","010-4257-5561","mattDamon.jpg"));
		list.add(new User("줄리아로버츠","010-8674-1677","juliaRoberts.jpg"));
		
		String csv="";
		for(int i=0;i<list.size();i++)
		{
			if(i!=0) csv+="\n";
			csv+=list.get(i);
		}
		System.out.println("csv"+csv);
		response.setContentType("text/csv;charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.append(csv);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
