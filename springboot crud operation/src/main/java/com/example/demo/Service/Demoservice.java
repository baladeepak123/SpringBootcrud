package com.example.demo.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.Model.DemoModel;

@Service
public interface Demoservice {

	void save(DemoModel insobj);

	List<DemoModel> demodetails();

	DemoModel demoedit(int id);

	void update(DemoModel updateobj);

	void delete(int id);

}
