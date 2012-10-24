package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	
	/**
	 * ...
	 * @author Nikro
	 */
	public class Status extends Sprite 
	{
		private static var _instance:Status;
		
		private var tf:TextField;
		private var input:TextField;
		
		public function Status() 
		{
			super();
			
			tf = new TextField();
			addChild(tf);
			tf.border = true;
			tf.width = 500;
			tf.height = 500;
			
			input = new TextField();
			addChild(input);
			input.border = true;
			input.width = 500;
			input.height = 25;
			input.type = TextFieldType.INPUT;
			input.multiline = false;
			
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			_instance = this;
		}
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

			input.y = stage.stageHeight - input.height;
			input.width = tf.width = stage.stageWidth;
			tf.height = stage.stageHeight - input.height - 10;
		}
		
		public function getInput():String
		{
			var text:String = input.text;
			input.text = '';
			return text;
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