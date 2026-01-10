class_name MessageData
extends Resource

enum MessageType { TEXT, IMAGE, AUDIO, SYSTEM }
enum Sender { ME, OTHER }

@export_group("Contenido")
@export var type: MessageType = MessageType.TEXT
@export var sender: Sender = Sender.OTHER
@export_multiline var text: String = ""
@export var image: Texture2D
@export var audio: AudioStream

@export_group("Comportamiento")
@export var delay: float = 1.5
@export var is_read: bool = false

@export_group("Flujo Narrativo")
# CASO A: El NPC sigue hablando solo (Mensaje 1 -> Mensaje 2)
@export var next_message_auto: MessageData 
# CASO B: El jugador debe elegir una respuesta (Ramificación)
@export var reply_options: Array[ReplyOption] = []

@export_group("Eventos de Historia")
@export var on_read_event: StoryEvent
