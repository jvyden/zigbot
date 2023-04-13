const std = @import("std");

fn root() []const u8 {
    return std.fs.path.dirname(@src().file) orelse ".";
}

const root_path = root() ++ "/";

pub fn addZigbotExecutable(b: *std.Build, target: std.zig.CrossTarget, optimize: std.builtin.Mode, comptime name: []const u8) void {
    const exe = b.addExecutable(.{
        .name = name,
        .root_source_file = .{ .path = "src/" ++ name ++ ".zig" },
        .target = target,
        .optimize = optimize,
    });

    exe.linkLibC();
    exe.addIncludePath("libs");

    exe.addLibraryPath(root_path);
    exe.linkSystemLibrary("coverett");
    exe.install();
}

pub fn build(b: *std.Build) void {
    const target: std.zig.CrossTarget = b.standardTargetOptions(.{});
    const optimize: std.builtin.Mode = b.standardOptimizeOption(.{});

    addZigbotExecutable(b, target, optimize, "walk");
    addZigbotExecutable(b, target, optimize, "dance");
}
