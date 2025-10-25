key_left  = keyboard_check(vk_left)
key_right = keyboard_check(vk_right)
key_jump  = keyboard_check_pressed(vk_space)

hsp = (key_right - key_left) * move_speed

vsp += gravity_force
if (vsp > max_fall_speed) vsp = max_fall_speed

if (key_jump && jump_count < max_jumps) {
    vsp = -jump_speed
    jump_count += 1
    on_ground = false
}

if (place_meeting(x + hsp, y, obj_solid)) {
    while (!place_meeting(x + sign(hsp), y, obj_solid)) {
        x += sign(hsp)
    }
    hsp = 0
}
x += hsp

if (place_meeting(x, y + vsp, obj_solid)) {
    while (!place_meeting(x, y + sign(vsp), obj_solid)) {
        y += sign(vsp)
    }
    if (vsp > 0) on_ground = true
    vsp = 0
} else {
    on_ground = false
}
y += vsp

if (on_ground) jump_count = 0
