package core.net.model 
{
	/**
	 * ...
	 * @author Nikro
	 */
	public class UserModel 
	{
		private var _ident:String;
		private var _name:String;
		

		public function UserModel(ident:String, name:String) 
		{
			_name = name;
			_ident = ident;
		}
		
		public function get ident():String 
		{
			return _ident;
		}
		
		public function get name():String 
		{
			return _name;
		}
		
	}

}