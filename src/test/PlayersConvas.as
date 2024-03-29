package test 
{
	import core.game.events.PlayerEvent;
	import core.game.GameProcessor;
	import core.game.model.PlayerModel;
	import core.services.ServicesLocator;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Nikro
	 */
	public class PlayersConvas extends Sprite 
	{
		private var gameProcessor:GameProcessor = ServicesLocator.instance.getService(GameProcessor) as GameProcessor;
		
		private var __x:Number = 0;
		public function PlayersConvas() 
		{
			super();
			
			gameProcessor.addEventListener(PlayerEvent.PLAYER_SPAWN_EVENT, onPlayerSpawn);
			
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			stage.addEventListener(MouseEvent.MOUSE_MOVE, movePlayer);
		}
		
		private function movePlayer(e:* = 0):void 
		{
			gameProcessor.moveMe(e.stageY);
			
		}
		
		private function onPlayerSpawn(e:PlayerEvent):void 
		{
			var player:PlayerModel = e.playerModel;
			
			var playerSprite:PlayerUI = new PlayerUI(player);
			
			
			addChild(playerSprite);
		}
		
	}

}