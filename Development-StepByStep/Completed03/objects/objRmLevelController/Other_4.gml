// focus on player while respecting room bounds (immediately jump to position)
var camStartX = clamp(objPlayer.x - wCam / 2, 0, room_width - wCam);
var camStartY = clamp(objPlayer.y - hCam / 2, 0, room_height - hCam);
camera_set_view_pos(view_camera[0], camStartX, camStartY);
