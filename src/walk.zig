const robot = @import("./robot.zig");
const std = @import("std");

pub fn main() void {
    const r = robot.get_robot();
    manual_walk_loop(r);
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

            'q' => robot.move_robot(r, .upward),
            'e' => robot.move_robot(r, .downward),
            else => {},
        }
    }
}
