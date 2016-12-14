package uk.origami.forgetmap;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import org.junit.Test;


public class ForgetmapTest {
	
	@Test
	public void shouldbeAddedToForgetMapAndFoundSuccessfully() {
		//Given
		ForgetMap<String, String> forgetMap = new ForgetMap<String, String>(1);
		
		//When
		forgetMap.add("key", "value");
		
		//Then
		assertEquals("value", forgetMap.find("key"));
	}
	
	@Test
	public void shouldbeabletoAddToForgetMapAsperCapacity() {
		//Given
		ForgetMap<String, String> forgetMap = new ForgetMap<String, String>(3);
		
		//When
		forgetMap.add("key1", "value");
		forgetMap.add("key2", "value");
		forgetMap.add("key3", "value");
		
		//Then
		assertEquals(3, forgetMap.size());
	}
	
	@Test
	public void shouldbeAbleToRemoveLeastUsedKeysFromForgetMapWhenTryingToAddMoreThanSpecifiedCapacity() {
		//Given
		ForgetMap<String, String> forgetMap = new ForgetMap<String, String>(2);
		forgetMap.add("key1", "value");
		forgetMap.add("key2", "value");
		forgetMap.find("key1");
		
		//When
		forgetMap.add("key3", "value");
		
		//Then
		assertEquals(1, forgetMap.currentUsage("key1"));
		assertEquals(0, forgetMap.currentUsage("key3"));
		assertEquals(2, forgetMap.size());
		assertNull(forgetMap.find("key2"));
	}

}
