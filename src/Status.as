package  
{
	import adobe.utils.ProductManager;
	import flash.display.BlendMode;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.filters.BlurFilter;
	import flash.geom.Rectangle;
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
		private var convasWidth:Number;
		private var convasHeight:Number;
		
		public function Status(convasWidth:Number = 350, convasHeight:Number = 250) 
		{
			super();
			this.convasHeight = convasHeight;
			this.convasWidth = convasWidth;
			
			tf = new TextField();
			addChild(tf);
			//tf.border = true;
			tf.width = convasWidth;
			tf.height = convasHeight - 30;
			tf.wordWrap = true;
			tf.textColor = 0xFFFFFF;
			
			input = new TextField();
			addChild(input);
			//input.border = true;
			input.width = convasWidth;
			input.height = 25;
			input.useRichTextClipboard = true;
			
			input.type = TextFieldType.INPUT;
			input.multiline = false;
			
			input.y = convasHeight - 25
			input.x = 2.5
			
			
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			addEventListener(Event.ENTER_FRAME, focusInput);
			_instance = this;
			
			setChildIndex((addChild(drawBack(this, 0x0, 0.9)) as Sprite), 0);
			
			var inputbg:Sprite = drawBack(new Rectangle(2.5, input.y - 2.5, input.width - 5, input.height - 2.5), 0xFFFFFF, 0.8);
			inputbg.filters = [new BlurFilter(2, 2, 3)];
			
			addChild(inputbg);
			
			swapChildren(input, inputbg)
		}
		
		private function focusInput(e:Event):void 
		{
			if (stage.focus != input)
			{
				
				stage.focus = input
				input.setSelection(input.length, input.length);
			}
		}
		
		private function drawBack(bgSource:Object, color:uint, alpha:Number):Sprite
		{
			var bgSprite:Sprite = new Sprite();
			var graphic:Graphics = bgSprite.graphics;
			
			graphic.beginFill(color, alpha);
			graphic.drawRect(bgSource.x, bgSource.y, bgSource.width, bgSource.height);
			graphic.endFill();
			bgSprite.mouseChildren = false;
			bgSprite.mouseEnabled = false;
			return bgSprite;
		}
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

			//input.y = stage.stageHeight - input.height;
			//input.width = tf.width = stage.stageWidth - 400;
			//tf.height = stage.stageHeight - input.height - 10;
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