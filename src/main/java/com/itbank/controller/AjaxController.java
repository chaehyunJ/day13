package com.itbank.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.service.BoardService;

@RestController
public class AjaxController{
	
	@Autowired private BoardService bs;
	
	@GetMapping("/getBoardData/{offset}")
	public List<HashMap<String, Object>> getBoardData(@PathVariable int offset){
		return bs.getBoardData(offset);
	}
}