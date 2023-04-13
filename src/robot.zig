const coverett = @cImport({
    @cInclude("coverett/coverett.h");
    @cInclude("coverett/devices/robot.h");
});

const std = @import("std");

pub const device_t = coverett.device_t;

const MoveDirection = enum { forward, backward, upward, downward };
const TurnDirection = enum { left, right };

pub fn get_robot() coverett.device_t {
    const bus: coverett.bus_t = coverett.openBus(@ptrCast([*c]u8, @constCast("/dev/hvc0")));
    return coverett.findDev(bus, @ptrCast([*c]u8, @constCast("robot")));
}

pub fn get_robot_energy(robot: coverett.device_t) f64 {
    const result: coverett.result_t = coverett.getEnergyStored(@ptrCast([*c]coverett.device_t, @constCast(&robot)));
    return result.retNumber;
}

pub fn move_robot(robot: coverett.device_t, direction: MoveDirection) void {
    const dirStr = switch (direction) {
        .forward => "f",
        .backward => "b",
        .upward => "u",
        .downward => "d",
    };

    _ = coverett.moveSync(@ptrCast([*c]coverett.device_t, @constCast(&robot)), @ptrCast([*c]u8, @constCast(dirStr)));
}

pub fn turn_robot(robot: coverett.device_t, direction: TurnDirection) void {
    const dirStr = switch (direction) {
        .left => "l",
        .right => "r",
    };

    _ = coverett.turnSync(@ptrCast([*c]coverett.device_t, @constCast(&robot)), @ptrCast([*c]u8, @constCast(dirStr)));
}

pub fn wait_for_last_action_completed(robot: coverett.device_t) void {
    const device = @ptrCast([*c]coverett.device_t, @constCast(&robot));
    const idResult: coverett.result_t = coverett.getLastActionId(device);
    const id: c_int = @floatToInt(c_int, idResult.retNumber);

    std.debug.print("Got action ID: {d}\n", .{id});

    while (true) {
        const statusResult: coverett.result_t = coverett.getActionResult(device, id);
        std.debug.print("Status: {s}\n", .{statusResult.retString});

        if (std.mem.eql(u8, std.mem.span(statusResult.retString), "SUCCESS")) break;
    }
}
