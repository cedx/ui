using module ../../../UI.psd1

<#
.SYNOPSIS
	Tests the features of the `New-Alert` cmdlet.
#>
Describe "New-Alert" {
	It 'should handle the "Class" parameter' {
		New-UIAlert -Class mb-0, rounded-0 | Should -BeLikeExactly "*mb-0 rounded-0*"
	}

	It 'should handle the "Context" parameter' {
		$alert = New-UIAlert -context danger
		$alert | Should -BeLikeExactly "*alert-danger*"
		$alert | Should -BeLikeExactly "*<i*>error</i>*"
	}

	It 'should handle the "Dismissible" parameter' {
		$alert = New-UIAlert -dismissible
		$alert | Should -BeLikeExactly "*alert-dismissible*"
		$alert | Should -BeLikeExactly '*data-bs-dismiss="alert"*'
	}

	It 'should handle the "Fade" parameter' {
		New-UIAlert -fade | Should -BeLikeExactly "*fade show*"
	}

	It 'should handle the "Icon" parameter' {
		New-UIAlert -icon heart | Should -BeLikeExactly "*<i*>heart</i>*"
	}

	It "should handle the inner content" {
		New-UIAlert { input -Type text } | Should -BeLikeExactly '*<input type="text">*'
	}
}
