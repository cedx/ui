using module ../KeyboardModifiers.psm1

<#
.SYNOPSIS
	Renders a keyboard accelerator.
.INPUTS
	The child content.
.OUTPUTS
	The rendered keyboard accelerator.
#>
function New-KeyboardAccelerator {
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The child content.
		[Parameter(Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
		[object] $Content,

		# Identifies the key for the keyboard accelerator.
		[Parameter(Mandatory, ValueFromPipelineByPropertyName)]
		[string] $Key,

		# Identifies the modifiers for the keyboard accelerator.
		[Parameter(ValueFromPipelineByPropertyName)]
		[KeyboardModifiers] $Modifiers = [KeyboardModifiers]::None
	)

	process {
		$attributes = @{ key = $Key; modifiers = $Modifiers }
		tag keyboard-accelerator -attributes $attributes $Content
	}
}
