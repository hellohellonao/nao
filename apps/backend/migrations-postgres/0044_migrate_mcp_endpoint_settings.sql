UPDATE "project"
SET "mcp_endpoint_settings" = (
	CASE
		WHEN "mcp_endpoint_settings" ? 'agentModeEnabled'
			THEN "mcp_endpoint_settings" || jsonb_build_object('subAgentModeEnabled', "mcp_endpoint_settings"->'agentModeEnabled')
		ELSE "mcp_endpoint_settings"
	END
	|| CASE
		WHEN "mcp_endpoint_settings" ? 'toolsModeEnabled'
			THEN jsonb_build_object('contextLayerModeEnabled', "mcp_endpoint_settings"->'toolsModeEnabled')
		ELSE '{}'::jsonb
	END
) - 'agentModeEnabled' - 'toolsModeEnabled' - 'objectsModeEnabled'
WHERE "mcp_endpoint_settings" ?| array['agentModeEnabled', 'toolsModeEnabled', 'objectsModeEnabled'];
