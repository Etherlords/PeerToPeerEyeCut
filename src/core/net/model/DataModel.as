package core.net.model 
{
	/**
	 * ...
	 * @author Nikro
	 */
	public class DataModel 
	{
		private var _sender:UserModel;
		
		public function DataModel(sender:UserModel = null) 
		{
			this.sender = sender;
			
		}
		
		public function get sender():UserModel 
		{
			return _sender;
		}
		
		public function set sender(value:UserModel):void 
		{
			_sender = value;
		}
		
	}

}