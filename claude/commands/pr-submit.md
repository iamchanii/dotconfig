---
description: 변경 사항을 커밋하고 PR을 생성하거나 수정합니다.
allowed-tools: Bash(git add:*), Bash(git status:*), Bash(git commit:*), Bash(gh pr:*)
---

현재 브랜치의 작업 내용을 커밋하고 PR을 생성하세요.

다음 단계를 따르세요:
1. git status 및 git diff 를 사용하여 변경 내용을 확인합니다.
2. 커밋 메세지 작성합니다.
  - 커밋 메세지는 컨벤셔널 커밋 규칙을 따라서 작성합니다. (예시: feat: blabla, fix: blabla, refactor: blabla)
  - 커밋 메세지는 한국어로 작성해주세요.
3. 기존 PR이 있는지 확인하고, 있다면 기존 PR을 수정하세요. 없다면 PR을 생성합니다. PR 본문에는 아래 내용이 포함되어야 합니다:
  ```markdown
  ## 요약
  ...

  ## 코드 변경 사항
  ...

  ## 구현 상세
  ...

  ## 확인 방법
  ...
  ```

모든 GitHub 관련 작업에는 GitHub CLI `gh`를 사용하는 것을 기억하세요.
