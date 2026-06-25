# Zync Desktop Client (Lua)

This is the native cross-platform Desktop client for Zync, built using **Lua** and the **LÖVE (Love2D)** framework.

## Architecture

The codebase is designed for fast, lightweight performance with an offline-first capability:

- **UI Rendering**: Lightweight 2D canvas drawing wrapper with custom flexible grid components.
- **HTTP Layer**: Lightweight network client connecting directly to Render production API endpoints.
- **Offline Storage**: Flat-file JSON caching using local file IO, enabling instant offline project loads.
- **State Management**: Reactive data stores that keep the local view in sync with network updates.

## Theme & Styling

The app adopts the brand guidelines of Zync: Deep Slate background (`#060B14`), card layouts (`#0D1421`), and cyan/brand blue highlights (`#1A8FD1`).

## Testing Strategy

We implement a custom, decoupled unit testing framework integrated directly into the LÖVE lifecycle.

### Phased Testing Structure

1. **Persistence Phase**: Validates that filesystem utility methods correctly write and load structured JSON cache files.
   - *Test file*: [test_file_manager.lua](file:///C:/Users/Chitkul%20Lakshya/.gemini/antigravity/brain/3be101ac-c6b9-4c2f-bf9e-330790a2d575/scratch/temp-lua-work/src/tests/test_file_manager.lua)
2. **API Mocking Phase**: Employs decoupling mocks ([mocks.lua](file:///C:/Users/Chitkul%20Lakshya/.gemini/antigravity/brain/3be101ac-c6b9-4c2f-bf9e-330790a2d575/scratch/temp-lua-work/src/tests/mocks.lua)) to inject a mock HTTP client, validating url endpoint binding, API parameters, and response caching.
   - *Test file*: [test_project_manager.lua](file:///C:/Users/Chitkul%20Lakshya/.gemini/antigravity/brain/3be101ac-c6b9-4c2f-bf9e-330790a2d575/scratch/temp-lua-work/src/tests/test_project_manager.lua)
3. **Session Store Phase**: Validates authentication managers load and dump active token credentials cleanly.
   - *Test file*: [test_auth_manager.lua](file:///C:/Users/Chitkul%20Lakshya/.gemini/antigravity/brain/3be101ac-c6b9-4c2f-bf9e-330790a2d575/scratch/temp-lua-work/src/tests/test_auth_manager.lua)
4. **Connectivity Check Phase**: Validates socket verification routing and exception handling.
   - *Test file*: [test_connectivity_check.lua](file:///C:/Users/Chitkul%20Lakshya/.gemini/antigravity/brain/3be101ac-c6b9-4c2f-bf9e-330790a2d575/scratch/temp-lua-work/src/tests/test_connectivity_check.lua)

### Running Tests

To run the phased unit testing suite using the LÖVE CLI runner, pass the `--test` flag:
```bash
love src/ --test
```
All tests are managed by [runner.lua](file:///C:/Users/Chitkul%20Lakshya/.gemini/antigravity/brain/3be101ac-c6b9-4c2f-bf9e-330790a2d575/scratch/temp-lua-work/src/tests/runner.lua) which reports test run status and exit codes.

