package com.escape.www.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.escape.www.dao.CommentDAO;
import com.escape.www.dto.CommentDTO;

public class writeCommentOkCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CommentDTO comtdto = new CommentDTO();
		comtdto.setComt_id(request.getParameter("id"));
		comtdto.setComt_contents(request.getParameter("contents"));
		comtdto.setComt_revno(Integer.parseInt(request.getParameter("rNo")));
		CommentDAO comtdao = CommentDAO.getCommentDAO();
		comtdao.write(comtdto);
	}

}
