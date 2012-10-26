package core.net 
{
	import flash.events.IEventDispatcher;
	/**
	 * ...
	 * @author Nikro
	 */
	public interface IConnection extends IEventDispatcher
	{
		
		function sendData(data:Object):void
		
	}

}