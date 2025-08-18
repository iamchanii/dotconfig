---
description: 변경 사항을 커밋하고 PR을 생성합니다.
---

현재 브랜치의 작업 내용을 커밋하고 PR을 생성하세요.

다음 단계를 따르세요:
1. git diff origin/main.. 을 실행하여 변경 사항 파악
2. 커밋 메세지 작성. 커밋 메세지는 컨벤셔널 커밋 규칙을 따름. (예시: feat: blabla, fix: blabla, refactor: blabla)
3. 푸시 후 PR 생성. PR 본문에는 아래 내용이 포함되어야 함:
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
