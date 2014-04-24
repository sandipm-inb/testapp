package com.sdm.mongo;

import java.net.UnknownHostException;
import java.util.ArrayList;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.MongoClient;

public class SMongoUtil {
	public int collCount = 0;
	private DB mongoDB = null;
	private DBCollection dbColl = null;
	private StringBuffer EXCEPTION_MSG = null;
	private MongoClient mongoClient= null;
	public String resultData = null;
	public int getMongoDBConn() {
		DBCollection mongoColl = null;
		
		try {
			
			mongoClient = new MongoClient("localhost:27017");
			mongoColl = null;
			// Get course database
			DB db = mongoClient.getDB("test");

			// create meta-data insert
			BasicDBObject meta = new BasicDBObject("description","Mongo db course"+Math.random());
			ArrayList<String> tags = new ArrayList<String>();
			tags.add("Learning"+Math.random());
			tags.add("Mongodb DBA course"+Math.random());
			tags.add("Donald Ark"+Math.random());
			
			meta.append("search_tag", tags);

			mongoColl = db.getCollection("video_data");

			mongoColl.insert(meta);
			
			collCount = (int) mongoColl.getCount();
			

		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		finally {
			//Close mongoDB connection
			closeMongoClient();
		}
		return collCount;
	}	
	
	//get MongoDB Connection 
	private DBCollection getMongoCollection(String collName){
		//check if Mongo connection exists
		if(mongoDB!=null ){
			dbColl = mongoDB.getCollection(collName);
		}else{
			EXCEPTION_MSG.append("Couldnt get MongoDB Connection");
			dbColl = mongoClient.getDB("test").getCollection(collName);			
		}		
		return dbColl;
		
	}
	
	//display collection data on page	
	public String getResultData(){		
		resultData = getMongoCollection("video_data").findOne().toMap().toString();
		return resultData;
	}
	
	//close mongo connection
	private void closeMongoClient(){
		if(mongoClient!=null){
			mongoClient.close();
		}
	}

	
}
