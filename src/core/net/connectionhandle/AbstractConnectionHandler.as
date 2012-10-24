package core.net.connectionhandle 
{
	import com.reyco1.multiuser.data.MessageObject;
	import com.reyco1.multiuser.events.ChatMessageEvent;
	import com.reyco1.multiuser.events.UserStatusEvent;
	import core.net.IConnectionHandlStrategy;
	import flash.events.Event;
	import flash.utils.getQualifiedClassName;
	import patterns.strategy.SimpleAlgorithm;
	import patterns.strategy.Strategy;
	import patterns.strategy.StrategyController;
	/**
	 * ...
	 * @author Nikro
	 */
	public class AbstractConnectionHandler implements IConnectionHandlStrategy 
	{
		private var strategy:StrategyController;
		
		public function AbstractConnectionHandler() 
		{
			initilize();
		}
		
		private function initilize():void 
		{
			strategy = new StrategyController();
		}
		
		public function addHandlStrategy(key:String, command:SimpleAlgorithm):IConnectionHandlStrategy
		{
			strategy.crateNewStrategy(key, command);
			
			return this;
		}
		
		/* INTERFACE core.net.IConnectionHandlStrategy */
		
		public function handleConnectionEvent(e:Event):void 
		{
			
			var key:String = /*getQualifiedClassName(e) + */e.type;
			trace('handle connection event', key);
			trace(strategy.hasStrategy(key));
			strategy.execute(key, e);
		}
		
		
		
	}

}