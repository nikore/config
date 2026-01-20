{ config, pkgs, ... }: {
  programs.vscode = {
    enable = true;
    package = (config.lib.nixGL.wrap pkgs.vscode);
    profiles.default = {
      userSettings = {
        enableUpdateCheck = false;
        enableExtensionUpdateCheck = false;
        breadcrumbs.enabled = true;
        editor = {
          fontFamily = "'JetBrainsMono Nerd Font', 'monospace', monospace";
          fontLigatures = true;
          inlineSuggest.enabled = true;
          bracketPairColorization.enabled = true;
          minimap.enabled = false;
          formatOnSave = true;
          renderWhitespace = "all";
          rulers = [ 120 ];
          tabSize = 2;
        };
        files = {
          autoSave = "afterDelay";
          autoSaveDelay = 200;
          trimTrailingWhitespace = true;
          associations = {
            "*.hcl" = "terraform";
            "*.tf" = "terraform";
          };
          exclude = {
            "**/.git" = true;
            "**/.svn" = true;
            "**/.hg" = true;
            "**/CVS" = true;
            "**/.DS_Store" = true;
            "**/Thumbs.db" = true;
            "**/*.olean" = true;
          };
        };
        git.openRepositoryInParentFolders = "always";
        rust-analyzer = {
          check.command = "clippy";
          hover.actions.references.enable = true;
          inlayHints.lifetimeElisionHints.enable = "always";
          lens.references = {
            adt.enable = true;
            enumVariant.enable = true;
            method.enable = true;
            trait.enable = true;
          };
          workspace.symbol.search.kind = "all_symbols";
        };
        vim = { useSystemClipboard = true; };
        extensions.ignoreRecommendations = true;
        vs-kubernetes.crd-code-completion = "enabled";
      };
      keybindings = [
        {
          key = "ctrl-h";
          command = "workbench.action.navigateLeft";
        }
        {
          key = "ctrl-l";
          command = "workbench.action.navigateRight";
        }
        {
          key = "ctrl-k";
          command = "workbench.action.navigateUp";
        }
        {
          key = "ctrl-j";
          command = "workbench.action.navigateDown";
        }
        {
          key = "space ,";
          command = "workbench.action.showAllEditors";
          when =
            "vim.mode == 'Normal' && (editorTextFocus || !inputFocus) && !sideBarFocus";
        }
        {
          key = "space e";
          command = "runCommands";
          args = {
            commands = [
              "workbench.action.toggleSidebarVisibility"
              "workbench.files.action.focusFilesExplorer"
            ];
          };
          when =
            "vim.mode == 'Normal' && (editorTextFocus || !inputFocus) && !sideBarFocus";
        }
        {
          key = "space e";
          command = "runCommands";
          args = {
            commands = [
              "workbench.action.toggleSidebarVisibility"
              "workbench.action.focusActiveEditorGroup"
            ];
          };
          when = "sideBarFocus && !inputFocus && !sideBarFocus";
        }
        {
          key = "space e";
          when =
            "vim.mode == 'Normal' && editorTextFocus && foldersViewVisible && !sideBarFocus";
          command = "workbench.action.toggleSidebarVisibility";
        }
        {
          key = "s h";
          command = "workbench.action.splitEditor";
          when =
            "vim.mode == 'Normal' && (editorTextFocus || !inputFocus) && !sideBarFocus";
        }
        {
          key = "s v";
          command = "workbench.action.splitEditorDown";
          when =
            "vim.mode == 'Normal' && (editorTextFocus || !inputFocus) && !sideBarFocus";
        }
        {
          key = "space c a";
          command = "editor.action.codeAction";
          when = "vim.mode == 'Normal' && editorTextFocus && !sideBarFocus";
        }
        {
          key = "shift-k";
          command = "editor.action.moveLinesUpAction";
          when = "vim.mode == 'VisualLine' && editorTextFocus && !sideBarFocus";
        }
        {
          key = "shift-j";
          command = "editor.action.moveLinesDownAction";
          when = "vim.mode == 'VisualLine' && editorTextFocus && !sideBarFocus";
        }
        {
          key = "shift-k";
          command = "editor.action.showHover";
          when = "vim.mode == 'Normal' && editorTextFocus && !sideBarFocus";
        }
        {
          key = "space c r";
          command = "editor.action.rename";
          when = "vim.mode == 'Normal' && editorTextFocus && !sideBarFocus";
        }
        {
          key = "space c s";
          command = "workbench.action.gotoSymbol";
          when = "vim.mode == 'Normal' && editorTextFocus && !sideBarFocus";
        }
        {
          key = "space b d";
          command = "workbench.action.closeActiveEditor";
          when =
            "(vim.mode == 'Normal' && editorTextFocus) || !inputFocus && !sideBarFocus";
        }
        {
          key = "space b o";
          command = "workbench.action.closeOtherEditors";
          when =
            "(vim.mode == 'Normal' && editorTextFocus) || !inputFocus && !sideBarFocus";
        }
        {
          key = "space space";
          command = "workbench.action.quickOpen";
          when =
            "vim.mode == 'Normal' && (editorTextFocus || !inputFocus) && !sideBarFocus";
        }
        {
          key = "space g d";
          command = "editor.action.revealDefinition";
          when = "vim.mode == 'Normal' && editorTextFocus && !sideBarFocus";
        }
        {
          key = "space g r";
          command = "editor.action.goToReferences";
          when = "vim.mode == 'Normal' && editorTextFocus && !sideBarFocus";
        }
        {
          key = "space g i";
          command = "editor.action.goToImplementation";
          when = "vim.mode == 'Normal' && editorTextFocus && !sideBarFocus";
        }
        {
          key = "space s g";
          command = "workbench.action.findInFiles";
          when =
            "vim.mode == 'Normal' && (editorTextFocus || !inputFocus) && !sideBarFocus";
        }
        {
          key = "space g g";
          command = "runCommands";
          when =
            "vim.mode == 'Normal' && (editorTextFocus || !inputFocus) && !sideBarFocus";
          args = { commands = [ "workbench.view.scm" "workbench.scm.focus" ]; };
        }
        {
          key = "ctrl-n";
          command = "editor.action.addSelectionToNextFindMatch";
          when =
            "(vim.mode == 'Normal' || vim.mode == 'Visual') && (editorTextFocus || !inputFocus) && !sideBarFocus";
        }
        {
          key = "r";
          command = "renameFile";
          when =
            "filesExplorerFocus && foldersViewVisible && !explorerResourceIsRoot && !explorerResourceReadonly && !inputFocus && !sideBarFocus";
        }
        {
          key = "c";
          command = "filesExplorer.copy";
          when =
            "filesExplorerFocus && foldersViewVisible && !explorerResourceIsRoot && !explorerResourceReadonly && !inputFocus && !sideBarFocus";
        }
        {
          key = "p";
          command = "filesExplorer.paste";
          when =
            "filesExplorerFocus && foldersViewVisible && !explorerResourceIsRoot && !explorerResourceReadonly && !inputFocus && !sideBarFocus";
        }
        {
          key = "x";
          command = "filesExplorer.cut";
          when =
            "filesExplorerFocus && foldersViewVisible && !explorerResourceIsRoot && !explorerResourceReadonly && !inputFocus && !sideBarFocus";
        }
        {
          key = "d";
          command = "deleteFile";
          when =
            "filesExplorerFocus && foldersViewVisible && !explorerResourceIsRoot && !explorerResourceReadonly && !inputFocus && !sideBarFocus";
        }
        {
          key = "a";
          command = "explorer.newFile";
          when =
            "filesExplorerFocus && foldersViewVisible && !explorerResourceIsRoot && !explorerResourceReadonly && !inputFocus && !sideBarFocus";
        }
        {
          key = "s";
          command = "explorer.openToSide";
          when =
            "filesExplorerFocus && foldersViewVisible && !explorerResourceIsRoot && !explorerResourceReadonly && !inputFocus && !sideBarFocus";
        }
        {
          key = "shift-s";
          command = "runCommands";
          when =
            "filesExplorerFocus && foldersViewVisible && !explorerResourceIsRoot && !explorerResourceReadonly && !inputFocus && !sideBarFocus";
          args = {
            commands = [
              "workbench.action.splitEditorDown"
              "explorer.openAndPassFocus"
              "workbench.action.closeOtherEditors"
            ];
          };
        }
        {
          key = "enter";
          command = "explorer.openAndPassFocus";
          when =
            "filesExplorerFocus && foldersViewVisible && !explorerResourceIsRoot && !explorerResourceIsFolder && !inputFocus && !sideBarFocus";
        }
        {
          key = "enter";
          command = "list.toggleExpand";
          when =
            "filesExplorerFocus && foldersViewVisible && !explorerResourceIsRoot && explorerResourceIsFolder && !inputFocus && !sideBarFocus";
        }
        {
          key = "space d a";
          command = "workbench.action.debug.selectandstart";
          when =
            "vim.mode == 'Normal' && (editorTextFocus || !inputFocus) && debuggersAvailable && !sideBarFocus";
        }
        {
          key = "space d t";
          command = "workbench.action.debug.stop";
          when =
            "vim.mode == 'Normal' && editorTextFocus && inDebugMode && !focusedSessionIsAttached && !sideBarFocus";
        }
        {
          key = "space d o";
          command = "workbench.action.debug.stepOver";
          when =
            "vim.mode == 'Normal' && (editorTextFocus || !inputFocus) && inDebugMode && debugState == 'stopped' && !sideBarFocus";
        }
        {
          key = "space d b";
          command = "editor.debug.action.toggleBreakpoint";
          when = "vim.mode == 'Normal' && editorTextFocus && !sideBarFocus";
        }
        {
          key = "space d e";
          command = "editor.debug.action.showDebugHover";
          when =
            "vim.mode == 'Normal' && editorTextFocus && inDebugMode && debugState == 'stopped' && !sideBarFocus";
        }
        {
          key = "space d c";
          command = "workbench.action.debug.continue";
          when =
            "vim.mode == 'Normal' && (editorTextFocus || !inputFocus) && inDebugMode && debugState == 'stopped' && !sideBarFocus";
        }
      ];
      extensions = with pkgs.vscode-extensions; [
        ms-dotnettools.csharp
        golang.go
        ziglang.vscode-zig
        xaver.clang-format
        ms-python.python
        ms-vscode.cpptools-extension-pack
        esbenp.prettier-vscode
        vscodevim.vim
        editorconfig.editorconfig
        ms-azuretools.vscode-docker
        ms-vscode-remote.remote-ssh
        rust-lang.rust-analyzer
        jnoortheen.nix-ide
        ms-kubernetes-tools.vscode-kubernetes-tools
        ms-vscode-remote.vscode-remote-extensionpack
        tamasfe.even-better-toml
        njpwerner.autodocstring
        bazelbuild.vscode-bazel
        fill-labs.dependi
        jnoortheen.nix-ide
        yzhang.markdown-all-in-one
        christian-kohler.path-intellisense
        donjayamanne.githistory
      ];
    };
  };
}
