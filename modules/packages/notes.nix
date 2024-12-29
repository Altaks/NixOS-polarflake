{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    obsidian            # Obsidian - https://obsidian.md/
    appflowy            # AppFlowy - https://appflowy.io/
    notion-app-enhanced # Notion   - https://www.notion.so/login
  ];
}