package com.itbank.board;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface BoardDAO {

	@Select("select a.writer, a.content, to_char(a.writeDate, 'yyyy-MM-dd') writeDate from board2 a " + 
			"order by idx desc " + 
			"offset #{offset} rows " + 
			"fetch next 5 rows only")
	List<HashMap<String, Object>> selectBoardData(int offset);

}
