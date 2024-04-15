//test string
str="stuffing your face as usual. I gotta have a good meal Garfield you fat cat. You are so big and fat. why are you so fat I eat, Jon. it's what I do it's time to kick odie of the table dont do it garfielf, that's our pet dog odie you're going into orbit, you stupid mutt GAAAAARRRFIIIELD!!! time for a nap. I'm a cat who loves to snooze garfield you lazy cat I hate alram clocks I'm am hungry I want some lasaga you're eating us out of house and home, garmfield enough with The Chit Chat let's get some grub going where Are the 3-cheese pizzas I ate those food where are the taco shells ? i ate those food where did all the hamburger helper go *brup* You're such a bad kitty that's it I've had it with you that does it I'm done that's the last straw grarfileld "
str=string_repeat(str,ceil(line_width*line_height/string_length(str)))

//some more test strings
//str="" i=1 repeat (255) {str+=ansi_char(i) i+=1}
//str=string_repeat("a",500)
//str=script_get_text(gm82sf_init)

//make the normal text wide so it visually matches the shader approach
text_normal=str
i=line_width+1 repeat (line_height-1) {
    text_normal=string_insert("#",text_normal,i)
i+=line_width+1}
text_normal+=string_repeat(" ",line_width-string_length(string_replace_all(text_normal,"#","")) mod line_width)

return str
