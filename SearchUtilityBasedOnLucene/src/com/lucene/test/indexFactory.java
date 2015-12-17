package com.lucene.test;

import java.sql.SQLException;

public interface indexFactory {
	public void createMethodTableIndex()throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException;
	public void createClassTableIndex()throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException;
	public void createCommentTableIndex()throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException;

}
