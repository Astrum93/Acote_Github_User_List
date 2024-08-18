# acote_github_user_list_app

[Acote] Flutter Engineer 과제
- Github Api를 활용하여 사용자 목록과 사용자의 레포지토리 목록 가져오는 앱 만들기

<br>

### Getting Started

🪄 build : lib/main.dart

<br>

### State Management

[GetX](https://pub.dev/packages/get)


GetX는 고성능 상태 관리, 스마트한 의존성 주입, 그리고 경로 관리를 결합한 실용적이고 빠른 상태 관리 솔루션이지만 BuildContext를 사용하지 않는 접근 방식은 장단점이 있을 수 있습니다. 특히 대규모 프로젝트의 경우, 상태 및 의존성 관리를 위해 GetX만 사용하는 것은 부족할 수 있다고 생각합니다.

하지만 이번 과제에서는 GitHub API를 사용해 간단한 앱을 만들어야 했기 때문에, 익숙한 GetX를 사용하여 상태 관리를 했습니다.

무한 스크롤를 제공함에 있어 계속해서 변화하는 UI를 빌드하기 위해 Rx변수들을 활용하는것이 문제가 없을거라 판단했고 또한 과거에 GetX를 사용하여 Data Fetch를 해본 경험이 있기에 이번에도 시도해보게 되었습니다.

만약 앱이 복잡하고 규모가 크다면 처음부터 탄탄한 구조를 갖추기 위해 Bloc을 사용하는 것이 더 적합하다고 생각합니다.

<br>

---

### Docs


<img src="https://img.shields.io/badge/Notion-000000?style=flat&logo=notion&logoColor=white" /> [acote_github_user_list_app Docs](https://astrum93.notion.site/acote_github_user_list_app-Docs-e147cd3a58904ca5938410da0e62337a?pvs=4)

---

### Test(/test)
```
FetchApi Test
  - Github User Data Fetch
  - Github User Repos Data Fetch

Widget Test
  - HomeScreen Widget Test
  - AdBanner Widget Test

```

<br>

### Environment(/pubspec.yaml)
```
dependencies:
  # api
  dio: ^5.5.0+1
  # state manage
  get: ^4.6.6
  # widget
  url_launcher: ^6.3.0

dev_dependencies:
  # test
  mockito: ^5.4.4
  build_runner: ^2.4.11
```
