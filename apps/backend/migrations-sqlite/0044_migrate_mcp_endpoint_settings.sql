UPDATE `project`
SET `mcp_endpoint_settings` = json_remove(
	json_patch(
		`mcp_endpoint_settings`,
		json_object(
			'subAgentModeEnabled', `mcp_endpoint_settings` -> 'agentModeEnabled',
			'contextLayerModeEnabled', `mcp_endpoint_settings` -> 'toolsModeEnabled'
		)
	),
	'$.agentModeEnabled', '$.toolsModeEnabled', '$.objectsModeEnabled'
)
WHERE json_type(`mcp_endpoint_settings`, '$.agentModeEnabled') IS NOT NULL;
