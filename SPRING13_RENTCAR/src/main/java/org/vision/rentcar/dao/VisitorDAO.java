package org.vision.rentcar.dao;

import java.util.List;

import org.vision.rentcar.model.RentVisitor;

public interface VisitorDAO{
    public int insertVisitor(RentVisitor vo);
    public List<String> selectVisitorDate();
    public List<String> selectVisitorNum();
   }
