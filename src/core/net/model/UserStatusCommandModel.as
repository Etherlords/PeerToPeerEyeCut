package core.net.model 
{
	/**
	 * ...
	 * @author Nikro
	 */
	public class UserStatusCommandModel extends DataModel
	{
		private var _status:String;
		
		public function UserStatusCommandModel(sender:UserModel, status:String) 
		{
			_status = status;
			super(sender);
		}
		
		public function get status():String 
		{
			return _status;
		}
		
		public function set status(value:String):void 
		{
			_status = value;
		}
		
		
	}

}