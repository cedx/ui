using module ../StorageArea.psm1

<#
.SYNOPSIS
	A component that activates a tab, based on its index saved in the web storage.
.INPUTS
	The child content.
.OUTPUTS
	The rendered component.
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
		[string] $StorageKey = "ActiveTabIndex"
	)

	process {
		$attributes = @{ storageArea = $StorageArea; storageKey = $StorageKey }
		tag tab-activator -attributes $attributes $Content
	}
}
