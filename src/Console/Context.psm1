using namespace System.Text.Json.Serialization

<#
.SYNOPSIS
	Defines contextual modifiers.
#>
[JsonConverter([JsonStringEnumConverter])]
enum Context {
	Danger
	Warning
	Info
	Success
}

<#
.SYNOPSIS
	Gets the CSS class corresponding to the specified context.
.INPUTS
	The context.
.OUTPUTS
	The CSS class corresponding to the specified context.
#>
function Get-ContextCssClass {
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The context.
		[Parameter(Mandatory, Position = 0, ValueFromPipeline)]
		[Context] $Context
	)

	process {
		$Context.ToString().ToLowerInvariant()
	}
}

<#
.SYNOPSIS
	Gets the icon corresponding to the specified context.
.INPUTS
	The context.
.OUTPUTS
	The icon corresponding to the specified context.
#>
function Get-ContextIcon {
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The context.
		[Parameter(Mandatory, Position = 0, ValueFromPipeline)]
		[Context] $Context
	)

	process {
		switch ($Context) {
			([Context]::Danger) { return "error"; break }
			([Context]::Success) { return "check_circle"; break }
			([Context]::Warning) { return "warning"; break }
			default { return "info" }
		}
	}
}
