package com.kh.mvc.member.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.mvc.member.model.vo.Member;

// [1] 'Bean 등록한 session을 @Autowired 주입받는 방법'을 사용하는 방법
/*
@Repository
public class MemberDao {

	public Member findMemberById(SqlSession session, String userId) {
	
		
		//return new Member(); 에서 아래처럼!
		return session.selectOne("memberMapper.selectMember", userId);
		/*
		 (1)session 객체를 Bean으로 등록했고, 
		 (2)이를 serviceImpl에서 @Autowired로 받아줬다. 그리고 dao에 넘겨주기 위해 매개변수로 session을 추가했다.
		 (3)Dao로 와서 selectOne 메소드 호출해주면서, memberMapper의 selectMember를 호출하고 여기에 파라미터로 userId를 넘겨준다!
		 (4)이후, 실행시켜 로그인해보면 정보가 나온다!	
	}
*/


// [2] Mapperscan을 통한 @mapper 주입방식('@Autowired를 통해 주입받는 게 아닌 방법'을 사용하는 방법)
//  - @Mapper 사용! 
//  - 이후 mapper에서 namespace를 패키지경로로 새로 지정(복붙)해준다!
//  - 메소드명을 findMemberById -> selectMember(mapper의 사용할 select id명과 동일하게!) - Impl에서도 바꿔주고!
@Mapper
public interface MemberMapper {
	public Member selectMember(@Param("id") String id);
	
	
	
}
