#  CONTRIBUTING GUIDE

This guide keeps everything consistent so we don’t get messy structure or painful merge conflicts.

---

#  Project Structure

We follow **Clean Architecture + Feature-Based Structure**.

---

#  Feature Structure (Generic)

Every feature MUST follow this structure:

```
feature_name/
├── api/
│   ├── api_client/
│   │   └── feature_api_client.dart
│   │
│   ├── datasources/
│   │   ├── feature_remote_data_source_impl.dart
│   │   └── feature_local_data_source_impl.dart
│   │
│   └── models/
│       └── feature_request_body.dart
│
├── data/
│   ├── datasources/
│   │   ├── feature_remote_data_source_contract.dart
│   │   └── feature_local_data_source_contract.dart
│   │
│   ├── models/
│   │   └── feature_model.dart
│   │
│   ├── repositories/
│   │   └── feature_repo_impl.dart
│   │
│   └── response/
│       └── feature_response_model.dart
│
├── domain/
│   ├── entities/
│   │   └── feature_entity.dart
│   │
│   ├── repositories/
│   │   └── feature_repo.dart
│   │
│   └── usecases/
│       └── feature_use_case.dart
│
└── presentation/
    ├── cubit/ or bloc/
    │   ├── feature_cubit.dart
    │   ├── feature_event.dart
    │   └── feature_state.dart
    │
    ├── pages/
    │   └── feature_page.dart
    │
    └── widgets/
        └── feature_widget.dart
```

---

# 🧠 Naming Conventions

- Files → `snake_case`
- Classes → `PascalCase`
- Variables → `camelCase`
- Folders → `snake_case`

### Example

```
product_details_page.dart
```
