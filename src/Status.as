package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Nikro
	 */
	public class Status extends Sprite 
	{
		private static var _instance:Status;
		
		private var tf:TextField;
		
		public function Status() 
		{
			super();
			
			tf = new TextField();
			addChild(tf);
			tf.border = true;
			tf.width = 500;
			tf.height = 500;
			
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			_instance = this;
		}
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			tf.width = stage.stageWidth;
			tf.height = stage.stageHeight;
		}
		
		public function addMessage(...rest:Array):void
		{
			tf.appendText(rest.join(', ') + String.fromCharCode(10));
			tf.scrollV = tf.maxScrollV;
		}
		
		static public function get instance():Status 
		{
			return _instance;
		}
		
	}

}