UPDATE "project"
SET "mcp_endpoint_settings" = (
	"mcp_endpoint_settings"
	|| jsonb_build_object('subAgentModeEnabled', "mcp_endpoint_settings"->'agentModeEnabled')
	|| jsonb_build_object('contextLayerModeEnabled', "mcp_endpoint_settings"->'toolsModeEnabled')
) - 'agentModeEnabled' - 'toolsModeEnabled' - 'objectsModeEnabled'
WHERE "mcp_endpoint_settings" ? 'agentModeEnabled';
