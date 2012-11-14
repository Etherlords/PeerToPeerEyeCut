package core.net.model 
{
	/**
	 * ...
	 * @author Nikro
	 */
	public class ChatCommandModel extends DataModel
	{
		private var _message:String;
		
		public function ChatCommandModel(sender:UserModel, message:String) 
		{
			_message = message;
			super(sender);
		}
		
		public function get message():String 
		{
			return _message;
		}
		
		public function set message(value:String):void 
		{
			_message = value;
		}
		
		
		
	}

}