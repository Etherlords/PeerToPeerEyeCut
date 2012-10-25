package core.net.events 
{
	import core.net.model.DataModel;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Nikro
	 */
	public class ConnectionActivityEvent extends Event 
	{
		private var _data:DataModel;
		public static const CONENCTION_ACTIVITY:String = 'CONENCTION_ACTIVITY';
		
		public function ConnectionActivityEvent(type:String, data:DataModel, bubbles:Boolean=false, cancelable:Boolean=false) 
		{
			super(type, bubbles, cancelable);
			_data = data;
			
		}
		
		override public function clone():Event 
		{
			return new ConnectionActivityEvent(type, data, bubbles, cancelable);
		}
		
		public function get data():DataModel 
		{
			return _data;
		}
		
	}

}