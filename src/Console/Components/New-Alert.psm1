using namespace System.Collections.Generic
using module ../Context.psm1

<#
.SYNOPSIS
	Renders an alert.
.INPUTS
	The child content.
.OUTPUTS
	The rendered alert.
#>
function New-Alert {
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The child content.
		[Parameter(Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
		[object] $Content,

		# The CSS class names to apply to the underlying element.
		[Parameter(ValueFromPipelineByPropertyName)]
		[ValidateNotNull()]
		[string[]] $Class = @(),

		# A contextual modifier.
		[Parameter(ValueFromPipelineByPropertyName)]
		[Context] $Context = [Context]::Info,

		# Value indicating whether this alert can be dismissed.
		[Parameter(ValueFromPipelineByPropertyName)]
		[switch] $Dismissible,

		# Value indicating whether to apply a transition.
		[Parameter(ValueFromPipelineByPropertyName)]
		[switch] $Fade,

		# The icon displayed next to the alert message.
		[Parameter(ValueFromPipelineByPropertyName)]
		[string] $Icon = ""
	)

	process {
		$cssClass = [List[string]] "alert", "alert-$(Get-ContextCssClass $Context)"
		if ($Dismissible) { $cssClass.Add("alert-dismissible") }
		if ($Fade) { $cssClass.Add("fade"); $cssClass.Add("show") }
		$cssClass.AddRange($Class)

		div -class $cssClass {
			div -class d-flex, align-items-center {
				i -class icon, flex-shrink-0, me-2 ($Icon ? $Icon : (Get-ContextIcon $Context))
				div $Content
			}

			if ($Dismissible) {
				button -class btn-close -dataset @{ BsDismiss = "alert" } -type button
			}
		}
	}
}
