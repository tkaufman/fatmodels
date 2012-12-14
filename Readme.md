# Lean and Mean Domain Objects in Active Record

Rails apps that have been extensively enhanced and maintained over the last few years are starting to fall apart under their own weight.
Developers have struggled trying to find the most appropriate area to place logic within the system. Initially the ease of writing views
in ERB led many developers to stow code at the front of the application. Then we began finding the views too difficult to maintain so we
moved the logic into controllers or helpers. Eventually this also became difficult to maintain so "best practices" espoused
skinny controllers and fat models. Active Record domain models naturally became the dumping ground of logic within the system but sooner
or later this also leads to brittle, unmaintainable, bug filled systems.

Coupling persistence, validation, advanced querying, and business logic all into the same class inevitably leads to extremely fat models
with any system of significance. Skinny controllers are definitely worth striving for, but shoveling all of the business logic into a
class that is already overburdened with with three other concerns is a recipe for disaster. When you find yourself using
factories, fixtures, or mocks to construct 8 different class dependencies, it's time to admit that fat models are not a solution worth
aspiring to.

This talk will cover some different approaches for segregating the multiple concerns of fat Active Record models into loosely coupled,
cohesive classes with single responsibilities. We'll dive into both the process for refactoring these plump classes along with
some better patterns to helo avoid AR bloat.
