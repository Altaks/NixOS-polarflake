{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    # Swift compiler - https://www.swift.org/
    swift
  ];
}