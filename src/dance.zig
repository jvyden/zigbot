const robot = @import("./robot.zig");
const std = @import("std");

pub fn main() !void {
    const r = robot.get_robot();
    dance_loop(r);
}

pub fn dance_loop(r: robot.device_t) void {
    var prng = std.rand.DefaultPrng.init(69);

    while (true) {
        const rand = @mod(prng.random().int(u8), 8);
        std.debug.print("rand: {d}\n", .{rand});
        switch (rand) {
            0 => dance_move_1(r),
            1 => dance_move_2(r),
            2 => dance_move_3(r),
            3 => dance_move_4(r),
            4 => dance_move_5(r),
            5 => dance_move_6(r),
            6 => dance_move_7(r),
            7 => dance_move_8(r),
            8 => dance_move_9(r),
            else => @panic("Rand out of bounds\n"),
        }

        robot.wait_for_last_action_completed(r, true);
    }
}

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
