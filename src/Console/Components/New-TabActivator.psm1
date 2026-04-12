using module ../StorageArea.psm1

<#
.SYNOPSIS
	Renders a tab activator.
.INPUTS
	The child content.
.OUTPUTS
	The rendered tab activator.
#>
function New-TabActivator {
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The child content.
		[Parameter(Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
		[object] $Content,

		# The storage area to use.
		[Parameter(ValueFromPipelineByPropertyName)]
		[StorageArea] $StorageArea = [StorageArea]::Session,

		# The key of the storage entry providing the active tab index.
		[Parameter(ValueFromPipelineByPropertyName)]
		[ValidateNotNullOrWhiteSpace()]
		[switch] $StorageKey = "ActiveTabIndex"
	)

	process {
		$attributes = @{ storageArea = $StorageArea; storageKey = $StorageKey }
		tag tab-activator -attributes $attributes -class $cssClass $Content
	}
}
