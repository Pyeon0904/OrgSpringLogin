package com.kh.mvc.member.model.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mvc.member.model.mapper.MemberMapper;
import com.kh.mvc.member.model.vo.Member;

// service 계층의 service class 파일에 @Service annotation 써주기
@Service //@Service("빈 ID를 지정")
public class MemberServiceImpl implements MemberService {
	// @Annotation을 붙이고서 Bean 등록이 필요한데, 기본적으로 component-scan이 되고 있기에 appliacation-context를 통해 주입받기만 하면 된다(new X)
	
/*	[1] @Autowired로 session 주입 받는 방법
 
	//[6] dao가 선언되어있지 않아서 선언! -> 이후에 create Method! MemberDao.java
	@Autowired
	private MemberDao dao;
	// private MemberDao dao = new MemberDao(); -> Bean 등록 안할시
	
	@Autowired
	private SqlSession session;
	// 기존에는 getSession으로 session을 받았더라면, 이젠 Bean등록을 했기에 Autowired로 받아준다!
	
	@Override
	public Member login(String id, String pwd) {
		
		//[6] userId를 넘겨받아 member로
		Member member = dao.findMemberById(session, id);
		
		return member;	
	}
*/

	
/*	[2] @Mapper 로 session 처리하는 방법 */
//	- session부분 @Autowired는 주석처리
//	- findMemberById의 매개변수 session 제거
//	- bean 추가 (class="org.mybatis.spring.mapper.MapperScannerConfigurer")
	
	
	@Autowired
	private MemberMapper mapper;
	
//	@Autowired
//	private SqlSession session;
	
	@Override
	public Member login(String id, String pwd) {
		
		Member member = mapper.selectMember(id); // 아이디로 조회해오고
		
		
		//[로직 Impl 구현 1]
		if(member != null && member.getPassword().equals(pwd)) {
			return member; // 조회한 아이디가 null이 아니고, 패스워드가 pwd와 동일하다면 member를 리턴
		}
		else {
			return null;
		}
		
	}
	
//	[회원가입 메소드 로직1]
	@Override
	public int save(Member member) {
		int result = 0;
		
		if(member.getNo() != 0) { // DB에 존재 O 데이터 --> "update!"
 			
		}
		else { // DB에 존재 X 데이터(이제 첫 기록) --> "Insert!"
			result = mapper.insertMember(member);
			// result로 mapper 중 insertMember를 써서 member를 넘겨줘!
		}
		
		return result;
	}
	
	
	
	
}
