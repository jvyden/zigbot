const robot = @import("./robot.zig");

pub fn dance_move_1(r: robot.device_t) void {
    robot.move_robot(r, .upward);
    robot.move_robot(r, .downward);
}

pub fn dance_move_2(r: robot.device_t) void {
    robot.move_robot(r, .upward);
    robot.turn_robot(r, .left);
    robot.turn_robot(r, .left);
    robot.turn_robot(r, .left);
    robot.turn_robot(r, .left);
    robot.move_robot(r, .downward);
}

pub fn dance_move_3(r: robot.device_t) void {
    robot.move_robot(r, .upward);
    robot.turn_robot(r, .right);
    robot.turn_robot(r, .right);
    robot.turn_robot(r, .right);
    robot.turn_robot(r, .right);
    robot.move_robot(r, .downward);
}

pub fn dance_move_4(r: robot.device_t) void {
    robot.turn_robot(r, .left);
    robot.turn_robot(r, .left);
    robot.turn_robot(r, .left);
    robot.turn_robot(r, .left);
}

pub fn dance_move_5(r: robot.device_t) void {
    robot.turn_robot(r, .right);
    robot.turn_robot(r, .right);
    robot.turn_robot(r, .right);
    robot.turn_robot(r, .right);
}

pub fn dance_move_6(r: robot.device_t) void {
    robot.turn_robot(r, .left);
    robot.move_robot(r, .backward);
    robot.move_robot(r, .backward);
    robot.turn_robot(r, .right);
    robot.turn_robot(r, .right);
    robot.move_robot(r, .backward);
    robot.move_robot(r, .backward);
    robot.turn_robot(r, .left);
}

pub fn dance_move_7(r: robot.device_t) void {
    robot.turn_robot(r, .right);
    robot.move_robot(r, .backward);
    robot.move_robot(r, .backward);
    robot.turn_robot(r, .left);
    robot.turn_robot(r, .left);
    robot.move_robot(r, .backward);
    robot.move_robot(r, .backward);
    robot.turn_robot(r, .right);
}

pub fn dance_move_8(r: robot.device_t) void {
    robot.move_robot(r, .backward);
    robot.turn_robot(r, .left);
    robot.move_robot(r, .backward);
    robot.turn_robot(r, .left);
    robot.move_robot(r, .backward);
    robot.turn_robot(r, .left);
    robot.move_robot(r, .backward);
    robot.turn_robot(r, .left);
}

pub fn dance_move_9(r: robot.device_t) void {
    robot.move_robot(r, .backward);
    robot.turn_robot(r, .right);
    robot.move_robot(r, .backward);
    robot.turn_robot(r, .right);
    robot.move_robot(r, .backward);
    robot.turn_robot(r, .right);
    robot.move_robot(r, .backward);
    robot.turn_robot(r, .right);
}
