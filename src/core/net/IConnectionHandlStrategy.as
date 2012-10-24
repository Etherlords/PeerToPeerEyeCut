package core.net 
{
	import flash.events.Event;
	import patterns.strategy.SimpleAlgorithm;
	
	/**
	 * ...
	 * @author Nikro
	 */
	public interface IConnectionHandlStrategy 
	{
		
		function handleConnectionEvent(e:Event):void;
		
		function addHandlStrategy(key:String, command:SimpleAlgorithm):IConnectionHandlStrategy;
	}
	
}