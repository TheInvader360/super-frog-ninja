var curX = camera_get_view_x(view_camera[0]);
var curY = camera_get_view_y(view_camera[0]);
// aim to focus on player while respecting room bounds, lerping to smooth out jitter
var newX = lerp(curX, clamp(objPlayer.x - wCam / 2, 0, room_width - wCam), 0.1);
var newY = lerp(curY, clamp(objPlayer.y - hCam / 2, 0, room_height - hCam), 0.1);
camera_set_view_pos(view_camera[0], newX, newY);
