# Ad Captcha Demo

A Rails application demonstrating captcha functionality with modern drag-and-drop features.

## Requirements

* Ruby 3.3.4
* Rails 7.1.x
* SQLite 3
* Node.js (for asset compilation)
* Yarn (for package management)

## Key Features

* User authentication (via Devise)
* Modern drag-and-drop interface
* Bootstrap 5.3 UI
* Turbo and Stimulus for enhanced interactivity

## Setup

1. Clone the repository:
```bash
git clone <repository-url>
cd ad_captcha
```

2. Install Ruby dependencies:
```bash
bundle install
```

3. Install JavaScript dependencies:
```bash
yarn install
```

4. Setup the database:
```bash
rails db:create
rails db:migrate
```

5. Start the Rails server:
```bash
rails server
```

The application will be available at `http://localhost:3000`

## Development

* Run tests: `rails test`
* Run the development server: `rails server`
* Access the console: `rails console`

## Asset Compilation

This project uses:
* `importmap-rails` for JavaScript modules
* `cssbundling-rails` for CSS
* `jsbundling-rails` for JavaScript bundling
* SASS for stylesheets

To compile assets:
```bash
rails assets:precompile
```

For development with automatic recompilation:
```bash
./bin/dev
```

## Contributing

1. Fork the project
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License.