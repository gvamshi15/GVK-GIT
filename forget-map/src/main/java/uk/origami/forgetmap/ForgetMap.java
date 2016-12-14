/**
 * 
 */
package uk.origami.forgetmap;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * <p>
 * <p>Objective</p>
 * 
 * <p>The objective of this task is design, implement and test a thread-safe
 * 'forgetting map'.</p>
 * 
 * <p>A 'forgetting' map should hold associations between a ‘key’ and some
 * ‘content’. It should implement at least two methods:</p>
 * 
 * <p>1. add (add an association)</p>
 * 
 * <p>2. find (find content using the specified key).</p>
 * 
 * <p>It should hold as many associations as it can, but no more than x
 * associations at any time, with x being a parameter passed to the constructor. Associations that are least used (in a
 * sense of 'find') are removed from the map as needed.</p>
 * </p>
 * 
 * @author Vamshi
 *
 */
public class ForgetMap<Key, Value> {

	private int capacity;

	private Map<Key, Value> forgettingMapCache;
	private Map<Key, AtomicInteger> keyUsageCache;
	private Object lockMonitor = new Object();

	/**
	 * @param capacity
	 */
	public ForgetMap(int capacity) {
		this.capacity = capacity;
		forgettingMapCache = new HashMap<Key, Value>();
		keyUsageCache = new HashMap<Key, AtomicInteger>();
	}

	public void add(Key k, Value v) {
		synchronized (lockMonitor) {
			if (!forgettingMapCache.containsKey(k)) {
				// capacity unfilled
				if (forgettingMapCache.size() < capacity) {
					forgettingMapCache.put(k, v);
					keyUsageCache.put(k, new AtomicInteger(0));
				} else { // filled
					int tempCount = 0;
					Key leastUsedKey = null;
					for (Map.Entry<Key, AtomicInteger> entry : keyUsageCache.entrySet()) {
						int usageCount = entry.getValue().get();
						if (usageCount <= tempCount) {
							tempCount = usageCount;
							leastUsedKey = entry.getKey();
						}
					}
					forgettingMapCache.remove(leastUsedKey);
					keyUsageCache.remove(leastUsedKey);
					forgettingMapCache.put(k, v);
					keyUsageCache.put(k, new AtomicInteger(0));
				}

			}
		}
	}

	public Value find(Key k) {
		synchronized (lockMonitor) {
			if (forgettingMapCache.containsKey(k)) {
				AtomicInteger counter = new AtomicInteger(keyUsageCache.remove(k).incrementAndGet());
				keyUsageCache.put(k, counter);
				return forgettingMapCache.get(k);
			}
			return null;
		}
	}

	// only for test purposes
	public int size() {
		return forgettingMapCache.size();
	}

	// only for test purposes
	public int currentUsage(Key k) {
		return keyUsageCache.get(k).get();
	}

}
