///(buffer1,buffer2,u,i,color,alpha)
var bv,bi,gen_u,gen_i,color,alpha;

bv=argument0
bi=argument1
gen_u=argument2
gen_i=argument3
color=argument4
alpha=argument5

__gm82sf_vertex_helper(bv,gen_u       ,0     , 0,0, color,alpha)
__gm82sf_vertex_helper(bv,gen_u+char_w,0     , 1,0, color,alpha)
__gm82sf_vertex_helper(bv,gen_u       ,char_h, 0,1, color,alpha)
__gm82sf_vertex_helper(bv,gen_u+char_w,char_h, 1,1, color,alpha)

buffer_write_u16(bi,gen_i+0)
buffer_write_u16(bi,gen_i+1)
buffer_write_u16(bi,gen_i+2)
buffer_write_u16(bi,gen_i+2)
buffer_write_u16(bi,gen_i+1)
buffer_write_u16(bi,gen_i+3)
