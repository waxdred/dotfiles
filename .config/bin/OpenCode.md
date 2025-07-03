# OpenCode Guidelines

## Commands
- Build: `npm run build` or `make build`
- Lint: `npm run lint` or `eslint .`
- Test (all): `npm test` or `jest`
- Test (single): `npm test -- -t "test name"` or `jest path/to/test.js`

## Code Style
- Formatting: Use consistent indentation (2 spaces) and line endings
- Imports: Group imports by type (built-in, external, internal)
- Naming: camelCase for variables/functions, PascalCase for classes/components
- Types: Use strong typing where available (TypeScript, type hints)
- Error handling: Always catch and properly handle exceptions
- Comments: Document complex logic and public APIs
- Functions: Keep functions small and focused on a single responsibility
- Testing: Write tests for all new functionality

## Project Structure
- Organize files by feature or domain rather than by type
- Keep related files close to each other