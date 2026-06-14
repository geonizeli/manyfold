# Requirements

## Goal

Allow instance operators to choose the application footer style with the `FOOT_TYPE` environment variable.

## Background

The application currently renders `app/views/application/_footer.html.erb` unconditionally from the main layout. This footer includes Manyfold branding, project links, instance links, and administrator-only version information. Some deployments need a smaller footer or no footer while keeping the existing footer as the default behavior.

## Requirements

- The system should read `FOOT_TYPE` from the environment.
- The system should support `default`, `minimalist`, and `none`.
- The system should keep the current footer unchanged when `FOOT_TYPE` is missing or set to `default`.
- The system should render a compact footer when `FOOT_TYPE=minimalist`.
- The system should render no footer when `FOOT_TYPE=none`.
- The system should fall back to `default` for unknown values.

## Non-Goals

- This change does not add a database-backed site setting.
- This change does not alter email footers or card footers inside individual pages.
- This change does not add a settings UI for footer type.

## Acceptance Criteria

- Given no `FOOT_TYPE`, when a page uses the application layout, then the current full footer is rendered.
- Given `FOOT_TYPE=default`, when a page uses the application layout, then the current full footer is rendered.
- Given `FOOT_TYPE=minimalist`, when a page uses the application layout, then a compact footer is rendered with instance links and without the full branding/link columns.
- Given `FOOT_TYPE=none`, when a page uses the application layout, then no `#footer` element is rendered.
- Given an unknown `FOOT_TYPE`, when a page uses the application layout, then the default footer is rendered.
