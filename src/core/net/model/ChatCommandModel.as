package core.net.model 
{
	/**
	 * ...
	 * @author Nikro
	 */
	public class ChatCommandModel extends DataModel
	{
		private var _sender:UserModel;
		private var _message:String;
		
		public function ChatCommandModel(sender:UserModel, message:String) 
		{
			_message = message;
			_sender = sender;
		}
		
		public function get sender():UserModel 
		{
			return _sender;
		}
		
		public function get message():String 
		{
			return _message;
		}
		
	}

}