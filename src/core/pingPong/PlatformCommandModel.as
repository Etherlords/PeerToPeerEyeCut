package core.pingPong 
{
	import core.net.model.DataModel;
	import core.net.model.UserModel;
	/**
	 * ...
	 * @author Nikro
	 */
	public class PlatformCommandModel extends DataModel
	{
		private var _turnState:Number;
		private var _mouseY:Number;
		
		public function PlatformCommandModel(sender:UserModel = null, turnState:Number = 0, mouseY:Number = 0) 
		{
			super(sender);
			
			this.mouseY = mouseY;
			this.turnState = turnState;
		}
		
		public function get turnState():Number 
		{
			return _turnState;
		}
		
		public function set turnState(value:Number):void 
		{
			_turnState = value;
		}
		
		public function get mouseY():Number 
		{
			return _mouseY;
		}
		
		public function set mouseY(value:Number):void 
		{
			_mouseY = value;
		}
	}

}