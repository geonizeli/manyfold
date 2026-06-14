# Design

## Overview

Add a small environment-backed footer type helper to `SiteSettings`, then use it from the application layout and footer partial. The layout will skip rendering the footer for `none`; the footer partial will preserve the current markup for `default` and render a compact variant for `minimalist`.

## Affected Areas

- Models: `SiteSettings` gains allowed footer types and validation/fallback helpers.
- Controllers: None.
- Views/components: `app/views/layouts/application.html.erb` and `app/views/application/_footer.html.erb`.
- Jobs/services: None.
- Tests: `SiteSettings` model specs and a focused request spec for layout output.
- Documentation: `env.example` documents the new environment variable.

## Data and API Changes

None. This is an environment-only display option.

## Alternatives Considered

- Option: Add a Rails settings field.
- Reason not chosen: The request specifically asks for an environment variable, and footer type is deployment-level presentation configuration.

- Option: Create separate footer partials.
- Reason not chosen: The current footer is small enough that a single partial with an explicit branch keeps the behavior easy to compare.

## Risks

- Risk: Invalid environment values could hide or alter the footer unexpectedly.
- Mitigation: Unknown values fall back to `default`.

- Risk: Minimal footer could remove useful instance links.
- Mitigation: Keep the instance/about/support/API links in the minimalist footer.
