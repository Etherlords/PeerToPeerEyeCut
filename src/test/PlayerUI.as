package test 
{
	import core.game.model.PlayerModel;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	/**
	 * ...
	 * @author Nikro
	 */
	public class PlayerUI extends Sprite 
	{
		private var playerData:PlayerModel;
		
		public function PlayerUI(playerData:PlayerModel) 
		{
			super();
			this.playerData = playerData;
			
			graphics.beginFill(0x0);
			graphics.drawCircle(0, 0, 10);
			
			var tf:TextField = new TextField();
			tf.text = playerData.userData.name;
			tf.autoSize = TextFieldAutoSize.LEFT;
			tf.x = (this.width - tf.width) / 2;
			tf.selectable = false;
			this.mouseEnabled = false;
			this.mouseChildren = false;
			
			addChild(tf);
			tf.y = -25
			
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void 
		{
			this.x = playerData.x;
			this.y = playerData.y;
		}
		
	}

}