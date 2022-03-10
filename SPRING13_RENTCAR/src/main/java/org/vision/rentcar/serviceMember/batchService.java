package org.vision.rentcar.serviceMember;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.vision.rentcar.dao.MemberDAO;
import org.vision.rentcar.model.RentMember;

public class batchService implements ServiceMember {
	SqlSession sqlSession = Constant.sqlSession;

	@Override
	public void execute(Model model) {
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String data = request.getParameter("batchData");
		String rows[] = data.split("\n");
		RentMember dto = null;
		List<RentMember> list = new ArrayList<>();
		for(String x:rows) {
			String meminfo[] = x.split(",");
			dto = new RentMember(meminfo[0],meminfo[1],meminfo[2],meminfo[3],meminfo[4],meminfo[5],meminfo[6]);
			list.add(dto);
		}
		try {
			dao.batch(list);
		} catch (Exception e) {
			System.err.println("배치처리 실패: 아이디 중복여부 확인");
		}
	}

}
