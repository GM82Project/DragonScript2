instance_create(0,0,ObjectEvents)

i=instance_create(8,32+8,TextField)
i.type=3
i.maxlen=14
i.action="object name"
i.alt="Name used to reference this object in code"
i.w=200-16

i=instance_create(84,84,TextField)
i.type=3
i.maxlen=14
i.action="sprite"
i.alt="Sprite used for representing instances of the object"
i.w=200-96

i=instance_create(84,84+32+4,Button)
i.w=48
i.h=24
i.action="new sprite"
i.text="New"

i=instance_create(140,84+32+4,Button)
i.w=48
i.h=24
i.action="edit sprite"
i.text="Edit"

i=instance_create(84,148,TextField)
i.type=3
i.maxlen=14
i.action="mask"
i.alt="Mask used for collisions instead of the sprite"
i.w=200-96

i=instance_create(84,84+96+4,Button)
i.w=48
i.h=24
i.action="new mask"
i.text="New"

i=instance_create(140,84+96+4,Button)
i.w=48
i.h=24
i.action="edit mask"
i.text="Edit"

i=instance_create(80,220,TextField)
i.type=3
i.maxlen=14
i.action="depth"
i.alt="Depth used to sort the object's instances for drawing"
i.w=200-88

i=instance_create(80,256,TextField)
i.type=3
i.maxlen=14
i.action="parent"
i.alt="Parent object from which to inherit events and collisions"
i.w=200-88


i=instance_create(8,292,Button)
i.w=132
i.h=24
i.action="edit parent"
i.text="Children..."
i.alt="View a list of this object's children"


i=instance_create(144,292,Button)
i.w=48
i.h=24
i.action="edit parent"
i.text="Edit"
i.alt="Open the parent object for editing"


i=instance_create(8,324,Button)
i.type=1
i.action="visible"
i.text="Visible"
i.alt="Whether the object will run its draw events"

i=instance_create(8,324+32,Button)
i.type=1
i.action="solid"
i.text="Solid"
i.alt="Whether the object cannot be overlapped#when performing collision events"

i=instance_create(8,324+64,Button)
i.type=1
i.action="persistent"
i.text="Persistent"
i.alt="Whether the object persists between rooms."
