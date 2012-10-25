package core.net.model 
{
	/**
	 * ...
	 * @author Nikro
	 */
	public class UserStatusCommandModel extends DataModel
	{
		private var _sender:UserModel;
		private var _status:String;
		
		public function UserStatusCommandModel(sender:UserModel, status:String) 
		{
			_status = status;
			_sender = sender;
		}
		
		public function get sender():UserModel 
		{
			return _sender;
		}
		
		public function get status():String 
		{
			return _status;
		}
		
	}

}