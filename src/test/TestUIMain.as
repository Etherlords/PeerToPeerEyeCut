package test 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Nikro
	 */
	public class TestUIMain extends Sprite 
	{
		private var chat:Status;
		static private const PADDING:Number = 5;
		
		public function TestUIMain() 
		{
			super();
			
			initilize();
		}
		
		private function initilize():void 
		{
			chat = new Status();
			addChild(chat);
			
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			addChild(new PlayersConvas);
			
		}
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			stage.addEventListener(Event.RESIZE, onStageResize);
			
			alignInterface();
		}
		
		private function onStageResize(e:Event):void 
		{
			
		}
		
		private function alignInterface():void
		{
			chat.y = stage.stageHeight - chat.height - PADDING
			chat.x = PADDING;
		}
		
	}

}