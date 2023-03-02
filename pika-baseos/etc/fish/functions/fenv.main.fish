function fenv.main
  bash -c "$argv && env -0 >&31" 31>| while read -l -z env_var
    set -l kv (string split -m 1 = $env_var); or continue
    # Skip read-only variables
    contains $kv[1] _ SHLVL PWD; and continue
    # Variable
    # - is not defined
    # - OR variable differs
    # - OR variable is not exported
    if not set -q $kv[1]; or test "$$kv[1]" != $kv[2]; or not set -qx $kv[1]
      set -gx $kv
    end
  end
  return $pipestatus[1]
end
