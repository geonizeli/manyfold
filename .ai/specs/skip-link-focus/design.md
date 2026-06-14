# Design

Use a visually-hidden focusable CSS pattern for `.skip-link` instead of `display: none` or container overflow clipping.

The hidden state keeps the skip link in the tab order while clipping it to a 1px box. When the skip link or its child anchor has focus, `:focus-within` restores normal dimensions, padding, and clipping so the existing Bootstrap text and spacing classes render visibly.
