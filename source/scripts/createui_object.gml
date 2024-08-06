instance_create(0,240,ObjectEvents)

i=instance_create(8,32+8,TextField)
i.type=3
i.maxlen=14
i.action="object name"
i.alt="Object Name"
i.w=200-16

i=instance_create(8,32+48,Button)
i.type=1
i.action="visible"
i.text="Visible"
i.alt="Whether the object will run its draw events."

i=instance_create(8,32+48+32,Button)
i.type=1
i.action="solid"
i.text="Solid"
i.alt="Whether the object cannot be overlapped#when performing collision events."

i=instance_create(8,32+48+64,Button)
i.type=1
i.action="persistent"
i.text="Persistent"
i.alt="Whether the object persists between rooms."
