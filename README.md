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
