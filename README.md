# Task Tracker
_A lightweight **Task Tracker** where users can create projects and tasks, change status, and comment on tasks; with minimal but functional HTML views and a JSON API for tasks._

### Prerequisites
- Ruby 3.2
- Rails 8.x
- Docker

### Installation & Quick Start

1. Clone the repository:
```bash
git clone git@github.com:gabrielemartire/task_tracker.git
cd task_tracker
```

2. Install dependencies:
```bash
bundle install
```

3. Set up the database using Docker Compose:
```bash
docker-compose up -d
```

> The database configuration uses Docker Compose for easy setup and consistent development environments across team members.

4. Create and migrate the database:
```bash
bundle exec rails db:create
bundle exec rails db:migrate
```

```bash
bundle exec rails server
```

The application will be available at `http://localhost:3000`.

### Testing

Run the test suite with:

```bash
bundle exec rspec spec
```

Current test status: **19 examples, 0 failures** 

### Seeding Data

To populate the database with initial data:

```bash
bundle exec rails db:seed
```

### Restart Project Database
```bash
bundle exec rails db:reset
```

> [!NOTE]
> This command will run also db:seed

> [!IMPORTANT]
> Remember to stop server instance before running this command

## Scenario

### Database structure
- **Project**: `name` (required), `description` (optional)
- **Task**: belongs to Project; fields: `title` (required), `status` (enum: `todo`, `in_progress`, `done`, default `todo`), `due_date` (optional), `priority` (integer 1–5, default 3, validate range)
- **Comment**: belongs to Task; fields: `body` (required), `author_name` (required, free text)

> [can find pr here](https://github.com/gabrielemartire/task_tracker/pull/2)

### Manage Projects
- A user can create a project with a name and optional description;
- A user can navigate in project detail page with tasks's project table.

### Manage Tasks
- A user can add tasks to a project with title, status, due date, priority.
- A user can filter tasks on a project page by `status` _and_ `priority`.
- A user can change a task’s status from the project page.

> [can find pr here](https://github.com/gabrielemartire/task_tracker/pull/6)

### Comment on Tasks
- A user can add comments to a task, with a body and author name.

> [can find pr here](https://github.com/gabrielemartire/task_tracker/pull/7)

### JSON API (Tasks)
- A read/write JSON API for tasks.

**Acceptance criteria**
- Endpoints:
  - `GET /api/tasks` with optional filters: `status`, `project_id`, `due_before` (YYYY-MM-DD)
  - `POST /api/tasks` to create a task
  - `PATCH /api/tasks/:id` to update `status`, `title`, `due_date`, `priority`
- JSON error responses for validation failures
- Request specs covering at least the happy paths and one validation failure

### Testing Requirements
- Model specs: validations and one simple scope or class method (e.g., `Task.due_before(date)`)
- Request specs: for the API endpoints above (at least index + create + one update path)

> [can find pr here](https://github.com/gabrielemartire/task_tracker/pull/3)

> [can find pr here](https://github.com/gabrielemartire/task_tracker/pull/12)

### What I’d do next with more time

- **filters**: improve better filter form
- **scope**: use scope
- **better error management**. rescue / ActiveRecord::RecordNotFound
- **exec rspec**: fix warning during exec test
- **CI**: fix github CI warning
- **JSON API (Tasks)**: complete _"a read/write JSON API for tasks."_

> [!IMPORTANT]
> No Authentication/authorization

> [!IMPORTANT]
> No overkill Styling/polish

> [!IMPORTANT]
> No Background jobs, uploads, complex front‑end
