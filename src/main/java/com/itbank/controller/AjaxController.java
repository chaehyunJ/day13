package com.itbank.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.service.BoardService;

import oracle.jdbc.proxy.annotation.Post;

@RestController
public class AjaxController{
	
	@Autowired private BoardService bs;
	
	@GetMapping("/getBoardData/{offset}")
	public List<HashMap<String, Object>> getBoardData(@PathVariable int offset){
		return bs.getBoardData(offset);
	}
	
	@PostMapping("/postBoardData")
	public int postBoardData(@RequestBody HashMap<String, String> map) {
		int row = bs.writeBoard(map);
		System.out.println(map);
		return row;
	}
}