const std = @import("std");
const robot = @import("./robot.zig");
const dance = @import("./dance.zig");

pub fn main() !void {
    const r = robot.get_robot();
    dance_loop(r);
}

pub fn manual_walk_loop(r: robot.device_t) void {
    const stdin = std.io.getStdIn().reader();
    while (true) {
        const byteArr = stdin.readBytesNoEof(1) catch |err| {
            std.debug.print("error reading byte: {!}\n", .{err});
            continue;
        };

        const byte = byteArr[0];

        switch (byte) {
            'w' => robot.move_robot(r, .forward),
            'a' => robot.turn_robot(r, .left),
            's' => robot.move_robot(r, .backward),
            'd' => robot.turn_robot(r, .right),
            else => {},
        }
    }
}

pub fn dance_loop(r: robot.device_t) void {
    var prng = std.rand.DefaultPrng.init(69);

    while (true) {
        const rand = @mod(prng.random().int(u8), 8);
        std.debug.print("rand: {d}\n", .{rand});
        switch (rand) {
            0 => dance.dance_move_1(r),
            1 => dance.dance_move_2(r),
            2 => dance.dance_move_3(r),
            3 => dance.dance_move_4(r),
            4 => dance.dance_move_5(r),
            5 => dance.dance_move_6(r),
            6 => dance.dance_move_7(r),
            7 => dance.dance_move_8(r),
            8 => dance.dance_move_9(r),
            else => @panic("Rand out of bounds\n"),
        }

        robot.wait_for_last_action_completed(r);
    }
}
