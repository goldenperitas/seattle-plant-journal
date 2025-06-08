# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Commands

### Running the Application
- `bin/rails server` - Start the Rails development server
- `bin/rails console` - Start Rails console for interactive debugging

### Database Operations
- `bin/rails db:migrate` - Run pending migrations
- `bin/rails db:rollback` - Rollback the last migration
- `bin/rails db:seed` - Load seed data
- `bin/rails db:reset` - Drop, create, migrate, and seed the database

### Testing
- `bin/rails test` - Run all tests
- `bin/rails test test/models/creature_test.rb` - Run a specific test file
- `bin/rails test test/system` - Run system tests only

### Code Quality
- `bundle exec rubocop` - Run RuboCop linter (follows rubocop-rails-omakase)
- `bundle exec rubocop -a` - Auto-correct RuboCop violations
- `bundle exec brakeman` - Run security analysis

### Dependencies
- `bundle install` - Install Ruby gems
- `bundle update` - Update gems

## Application Architecture

### Core Domain Models
The application is a plant journal focused on Seattle-area flora with four main entities:

1. **Creature** (app/models/creature.rb) - Represents plants/species
   - Has english_name, scientific_name, twulshootseed (indigenous name)
   - Supports toxic_status enum (non_toxic, use_caution, toxic)
   - Uses Active Storage for featured_image and additional_images with variants
   - Has many creature_resources (educational materials)
   - Includes slug-based URLs for SEO-friendly routing

2. **CreatureResource** (app/models/creature_resource.rb) - Educational materials linked to creatures
   - Belongs to creature, has many tags through creature_resource_tags
   - Uses resource_type enum (website, video, audio, book, paper, event, location, art, other)
   - Has ordering system via :order column

3. **Tag** (app/models/tag.rb) - Categorization system for resources
   - Simple name/color attributes for organizing creature resources

4. **User** (app/models/user.rb) - Authentication and authorization
   - Uses Devise for authentication (database_authenticatable, registerable, recoverable, rememberable, validatable)
   - Has admin boolean field (default: false) for role-based access control
   - Admin users can create/edit all content, regular users have view-only access

### Key Controllers
- **CreaturesController** - Main entity CRUD, includes social sharing URLs in show action, public index/show, admin-only create/edit/destroy
- **CreatureResourcesController** - Manages educational resources, includes shift_order action for reordering, admin-only except show action
- **TagsController** - Basic CRUD for tags, admin-only access
- **Admin::PagesController** - Admin dashboard, requires admin authentication

### Database
- PostgreSQL with Active Storage for file attachments
- Image variants are configured: :square (800x800), :thumb (150x150), :square for additional_images (200x200)
- Uses ActiveRecord::Schema[8.0] format
- Includes Devise users table with admin boolean field

### Frontend Stack
- Rails 8.0.2 with Hotwire (Turbo + Stimulus)
- SCSS with Bootstrap enhancements (using dartsass-rails)
- PWA support with manifest and service worker
- Mobile-responsive design with bottom navigation
- Devise views for authentication (login, registration, password reset)

### Authentication & Access Control
- **Public Access**: Site is fully accessible to anonymous users for viewing content
- **User Registration**: Optional user accounts for future features (e.g., commenting)
- **Admin Access**: Admin users (admin: true) can:
  - Access /admin namespace for management dashboard
  - Create, edit, and delete all creatures, resources, and tags
  - View admin-only UI elements (styled with d-admin CSS class)
- **Regular Users**: View-only access, no CRUD permissions
- **Protection**: Controller actions protected with authenticate_user! and admin_required_for_modification

### Deployment
- Dockerized application with Dockerfile
- Configured for Fly.io deployment (fly.toml)
- Uses AWS S3 for production file storage

## Testing Approach
- Uses Rails minitest framework
- Fixtures in test/fixtures/ for sample data
- System tests for integration testing
- Parallel test execution enabled