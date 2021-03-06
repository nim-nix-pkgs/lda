{
  description = ''Latent Dirichlet Allocation'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."lda-master".dir   = "master";
  inputs."lda-master".owner = "nim-nix-pkgs";
  inputs."lda-master".ref   = "master";
  inputs."lda-master".repo  = "lda";
  inputs."lda-master".type  = "github";
  inputs."lda-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."lda-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib"];
  in lib.mkProjectOutput {
    inherit self nixpkgs;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
    refs = builtins.removeAttrs inputs args;
  };
}