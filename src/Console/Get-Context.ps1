using module ./Context.psm1

<#
.SYNOPSIS
	Gets the CSS class corresponding to the specified context.
.INPUTS
	The context.
.OUTPUTS
	The CSS class corresponding to the specified context.
#>
function Get-UIContextCssClass {
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
function Get-UIContextIcon {
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
