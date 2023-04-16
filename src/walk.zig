const robot = @import("./robot.zig");
const std = @import("std");

pub fn main() !void {
    const old_termios = try std.os.tcgetattr(std.os.STDIN_FILENO);
    var new_termios = old_termios;
    new_termios.lflag &= ~std.os.linux.ICANON; // No line buffering
    new_termios.lflag &= ~std.os.linux.ECHO; // No echoing stuff
    try std.os.tcsetattr(std.os.STDIN_FILENO, .NOW, new_termios);

    const r = robot.get_robot();
    manual_walk_loop(r);

    var c: [1]u8 = undefined;
    std.debug.assert(try std.io.getStdIn().read(&c) == 1);
    try std.os.tcsetattr(std.os.STDIN_FILENO, .NOW, old_termios);
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

        // robot.wait_for_last_action_completed(r, false);
    }
}
