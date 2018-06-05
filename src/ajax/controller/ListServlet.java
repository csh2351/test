package ajax.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ajax.model.dao.AjaxDao;


@WebServlet("/list.do")
public class ListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public ListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String srchName=request.getParameter("srchName");
		System.out.println(srchName);
		
		List<String> nameList=null;
		String csv="";
		
		if(!srchName.trim().isEmpty())
		{
			nameList=new AjaxDao().selectByName(srchName);
			if(!nameList.isEmpty())
			{
				for(int i=0;i<nameList.size();i++)
				{
					if(i!=0) csv+=",";
					csv+=nameList.get(i);
				}
			}
		}
		System.out.println(csv);
		
		response.setContentType("text/csv;charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.append(csv);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
