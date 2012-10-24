package com.reyco1.multiuser.events
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	/**
	 * Centralized event dispatcher that handles the dispatching of and listening to all events. 
	 * @author reyco1
	 * 
	 */	
	public class P2PDispatcher extends EventDispatcher
	{
		private static var _instance:P2PDispatcher;
		
		static public function get instance():P2PDispatcher 
		{
			if (!_instance)
				_instance = new P2PDispatcher;
				
			return _instance;
		}
		
	}
}