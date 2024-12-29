{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    
    # Kubernetes Pretty CLI - https://k9scli.io/ 
    k9s

    # Kubernetes CLI - https://kubernetes.io/docs/reference/kubectl/
    kubectl

    # Kubernetes Dashboard GUI - https://k8slens.dev/ 
    lens
  ];
}