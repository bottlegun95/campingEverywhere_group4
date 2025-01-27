package co.group.camping.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.group.camping.common.Command;
import co.group.camping.member.service.MemberService;
import co.group.camping.member.service.MemberServiceImpl;
import co.group.camping.member.service.MemberVO;

public class MemberEdit implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		MemberService ms = new MemberServiceImpl();
		MemberVO member = new MemberVO();
		member.setMemberId(request.getParameter("memberId"));
		member.setMemberName(request.getParameter("memberName"));
		member.setMemberAddr(request.getParameter("memberAddr"));
		member.setMemberTel(request.getParameter("memberTel"));

		int n = ms.memberFullUpdate(member);
		if (n != 0) {
			HttpSession session = request.getSession();
			session.invalidate();
			request.setAttribute("message", " 정보 수정 완료, 다시 로그인 해주세요.");
			return "member/memberMessage";
		} else {
			request.setAttribute("message", " 정보 수정 실패");
			return "member/memberMessage";
		}
	}

}
