package yoon.qreply.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import yoon.qreply.model.QreplyDTO;
import yoon.qreply.model.QreplyManager;

public class QreplyControl extends HttpServlet {
	public void service(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException{
		String m = req.getParameter("method");
		if(m !=null){
			m = m.trim();
			if(m.equals("reply")){
				//질문 리스트
				qinsert(req, res);
			}else if(m.equals("delete")){
				//질문 클릭 후 댓글 리스트
				qdelete(req, res);
			}else{
				RequestDispatcher rd = req.getRequestDispatcher("main.do");
				rd.forward(req, res);
			}
		}else{
			RequestDispatcher rd = req.getRequestDispatcher("main.do");
			rd.forward(req, res);
		}	
	}
	//질문 리스트
	private void qdelete(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {	
		QreplyManager manager = QreplyManager.getInstance();
		String pnum = req.getParameter("pnum");
		String noStr = req.getParameter("num");
		String memChk = req.getParameter("memchk");
		int num = -1;
		if(noStr !=null)noStr = noStr.trim();
		num = Integer.parseInt(noStr);
		int delchk = -1;
		if(memChk.equals("none")){
			String pwd = req.getParameter("pwd");
			String cmpPwd = manager.getPwdB(num);
			if(cmpPwd==null)cmpPwd="";
			if(cmpPwd.equals(pwd)){
				manager.qrdelB(num);
				delchk=0;//0=>삭제 성공;
				System.out.println("pws del suc");
			}
			else{
				delchk=1;//삭제 실패
				System.out.println("pws flase");
			}
		}else if(memChk.equals("member")){
			manager.qrdelB(num);
			delchk=0;
		}
		req.setAttribute("delchk", delchk);
		String view = "main.do?method=qinfo&num="+pnum;
		String rt_mobile = req.getParameter("rt");
		if(rt_mobile != null){
			rt_mobile = rt_mobile.trim();
			if(rt_mobile.equals("mobile")){
				view = "main.do?rt=mobile&method=qinfo&num="+pnum;
			}
		}
		RequestDispatcher rd = req.getRequestDispatcher(view);
		rd.forward(req, res);
	}
	private void qinsert(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		QreplyManager manager = QreplyManager.getInstance();
		String memChk = req.getParameter("mcheck");
		if(memChk != null) {
			memChk = memChk.trim();
		}
		int qnum = 0;
		String strNum = req.getParameter("num");//질문 번호
		if(strNum != null) {
			strNum=strNum.trim();
			qnum = Integer.parseInt(strNum);
		}
		QreplyDTO dto = null;
		int result = 0;
		if(memChk.equals("member")){//회원일때
			String id = req.getParameter("id");
			String replyContent = req.getParameter("reply");
			//String nick = req.getParameter("nick");
			dto = new QreplyDTO(-1, qnum, id, null , null, replyContent, null, null);
			result = manager.qrinsertB(dto);
		}else{ //비회원일때 //memChk == none
			String name = req.getParameter("name");
			String replyContent = req.getParameter("reply");
			String pwd = req.getParameter("pwd");
			dto = new QreplyDTO(-1, qnum, null, pwd, name, replyContent, null, null);
			result = manager.qrinsertB(dto);
		}
		req.setAttribute("result", result);
		String view = "main.do?method=qinfo&num=" + qnum;
		String rt_mobile = req.getParameter("rt");
		if(rt_mobile != null){
			rt_mobile = rt_mobile.trim();
			if(rt_mobile.equals("mobile")){
				view = "main.do?rt=mobile&method=qinfo&num="+qnum;
			}
		}
		RequestDispatcher rd = req.getRequestDispatcher(view);
		rd.forward(req, res);
	}
}
