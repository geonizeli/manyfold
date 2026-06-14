# Tasks

## Implementation

- [x] Update the spec with confirmed scope.
- [x] Implement the environment-backed footer type helpers.
- [x] Update the application layout and footer partial.
- [x] Add or update tests.

## Verification

- [ ] Run focused automated tests.
- [x] Run any relevant manual checks.
- [x] Record skipped verification and reasons.

## Notes

- `FOOT_TYPE` supports `default`, `minimalist`, and `none`.
- Missing or invalid `FOOT_TYPE` should resolve to `default`.
- Focused RSpec command attempted: `mise exec ruby@3.4.9 -- bundle exec rspec spec/models/site_settings_spec.rb spec/requests/layout_footer_spec.rb`.
- RSpec could not boot locally because `assimp-ffi` could not find the system `assimp` / `libassimp.so` shared library.
- Syntax checks passed for `app/models/site_settings.rb`, `spec/models/site_settings_spec.rb`, `spec/requests/layout_footer_spec.rb`, and `app/views/application/_footer.html.erb`.
