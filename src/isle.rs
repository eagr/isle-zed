use zed_extension_api::{self as zed, LanguageServerId, Result, Worktree};

struct IsleExtension {}

impl zed::Extension for IsleExtension {
    fn new() -> Self {
        Self {}
    }

    fn language_server_command(
        &mut self,
        _server_id: &LanguageServerId,
        worktree: &Worktree,
    ) -> Result<zed::Command> {
        Ok(zed::Command {
            command: worktree
                .which("lsp-isle")
                .ok_or("lsp-isle not found in PATH".to_string())?,
            args: vec![],
            env: Default::default(),
        })
    }

    fn language_server_workspace_configuration(
        &mut self,
        server_id: &LanguageServerId,
        worktree: &Worktree,
    ) -> Result<Option<zed::serde_json::Value>> {
        let settings = zed::settings::LspSettings::for_worktree(server_id.as_ref(), worktree)
            .ok()
            .and_then(|lsp_settings| lsp_settings.settings.clone())
            .unwrap_or_default();
        Ok(Some(settings))
    }
}

zed::register_extension!(IsleExtension);
