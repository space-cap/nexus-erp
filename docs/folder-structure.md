# 📁 Nexus ERP — 델파이 프로젝트 추천 폴더 구조

> 이 문서는 Delphi(RAD Studio) 기반 ERP 프로젝트의 유지보수성과 확장성을 높이기 위한  
> 권장 폴더 구조 가이드입니다.

---

## 📐 전체 디렉토리 트리

```
nexus-erp/
│
├── src/                          # ✅ 모든 소스 코드의 루트
│   │
│   ├── core/                     # 핵심 공통 기반 레이어
│   │   ├── UCoreTypes.pas        # 전역 타입, 상수, 열거형 정의
│   │   ├── UCoreUtils.pas        # 전역 유틸리티 함수
│   │   ├── UCoreConsts.pas       # 전역 상수 (DB 컬럼명, 코드 등)
│   │   └── UCoreSession.pas      # 로그인 세션 / 현재 사용자 정보
│   │
│   ├── db/                       # 데이터베이스 접근 레이어 (DAL)
│   │   ├── UDBConnection.pas     # DB 연결 관리 (FireDAC/ADO)
│   │   ├── UDBBase.pas           # 기본 CRUD 추상 클래스
│   │   └── UDBQueryBuilder.pas   # 동적 SQL 빌더 (선택)
│   │
│   ├── models/                   # 비즈니스 모델 (도메인 레이어)
│   │   ├── UModelEmployee.pas    # 사원 모델 & 레코드 정의
│   │   ├── UModelDept.pas        # 부서 모델
│   │   ├── UModelInventory.pas   # 재고 모델
│   │   └── UModelOrder.pas       # 발주/수주 모델
│   │
│   ├── services/                 # 비즈니스 로직 레이어
│   │   ├── USvcEmployee.pas      # 사원 관련 비즈니스 로직
│   │   ├── USvcAuth.pas          # 인증 / 권한 처리
│   │   ├── USvcInventory.pas     # 재고 처리 서비스
│   │   └── USvcReport.pas        # 보고서 생성 서비스
│   │
│   ├── frames/                   # 재사용 가능한 UI 프레임 (TFrame)
│   │   ├── hr/                   # 인사(HR) 관련 프레임
│   │   │   ├── UFrameUserMgr.pas / .dfm    # 사원 관리
│   │   │   └── UFrameDeptMgr.pas / .dfm    # 부서 관리
│   │   │
│   │   ├── inventory/            # 재고 관련 프레임
│   │   │   ├── UFrameItemList.pas / .dfm
│   │   │   └── UFrameStockIn.pas / .dfm
│   │   │
│   │   ├── sales/                # 영업/수주 관련 프레임
│   │   │   └── UFrameOrderMgr.pas / .dfm
│   │   │
│   │   └── common/               # 공통 UI 컴포넌트 프레임
│   │       ├── UFrameSearchBar.pas / .dfm  # 공통 검색바
│   │       └── UFrameStatusBar.pas / .dfm  # 공통 상태바
│   │
│   ├── forms/                    # 독립 창 폼 (TForm)
│   │   ├── UMain.pas / .dfm      # 메인 폼 (Ribbon + 탭 컨테이너)
│   │   ├── ULogin.pas / .dfm     # 로그인 폼
│   │   └── UAbout.pas / .dfm     # 정보(About) 폼
│   │
│   └── reports/                  # 보고서 관련 (FastReport / ReportBuilder 등)
│       ├── URptEmployee.pas
│       └── URptInventory.pas
│
├── res/                          # 리소스 파일
│   ├── images/                   # 아이콘, 버튼 이미지
│   ├── fonts/                    # 폰트 파일 (필요 시)
│   └── lang/                     # 다국어 지원 파일 (선택)
│       ├── ko.ini
│       └── en.ini
│
├── reports/                      # 보고서 양식 파일 (.fr3, .rpt 등)
│   ├── EmployeeList.fr3
│   └── InventoryReport.fr3
│
├── sql/                          # SQL 스크립트 모음
│   ├── schema/                   # 테이블 정의 DDL
│   │   ├── 001_create_employees.sql
│   │   └── 002_create_inventory.sql
│   └── seed/                     # 초기 데이터 DML
│       └── 001_seed_dept.sql
│
├── tests/                        # 단위 테스트 (DUnit / TestInsight)
│   ├── TTestEmployee.pas
│   └── TTestInventory.pas
│
├── docs/                         # 📄 프로젝트 문서
│   ├── folder-structure.md       # (이 파일) 폴더 구조 가이드
│   ├── architecture.md           # 전체 아키텍처 설명
│   ├── db-schema.md              # DB 스키마 문서
│   └── erp.png                   # UI 레퍼런스 이미지
│
├── NexusERP.dpr                  # 프로젝트 메인 파일
├── NexusERP.dproj                # RAD Studio 프로젝트 파일
├── NexusERP.res                  # 컴파일된 리소스
├── .gitignore                    # Git 제외 파일 목록
└── README.md                     # 프로젝트 소개 문서
```

---

## 📌 레이어별 역할 요약

| 레이어 | 폴더 | 역할 | 의존 방향 |
|--------|------|------|-----------|
| **UI** | `forms/`, `frames/` | 화면 표시 및 사용자 입력 처리 | → Services |
| **Service** | `services/` | 비즈니스 규칙, 유효성 검사 | → Models, DB |
| **Model** | `models/` | 데이터 구조 정의 (Record, Class) | → Core |
| **DAL** | `db/` | DB 쿼리 실행, 연결 관리 | → Core |
| **Core** | `core/` | 공통 타입, 세션, 유틸리티 | (최하위) |

> ✅ **의존 규칙**: UI는 Service를 호출하고, Service는 Model과 DB를 사용합니다.  
> UI가 직접 DB를 호출하지 않도록 유지하면 유지보수가 쉬워집니다.

---

## 🏷️ 파일 네이밍 컨벤션

### Unit 파일 (`*.pas`)

| 접두사 | 대상 | 예시 |
|--------|------|------|
| `U` | 일반 Unit | `UCoreUtils.pas` |
| `UFrame` | TFrame 기반 프레임 | `UFrameUserMgr.pas` |
| `UForm` or `U` | TForm 기반 폼 | `UMain.pas`, `ULogin.pas` |
| `UModel` | 데이터 모델 | `UModelEmployee.pas` |
| `USvc` | 서비스(비즈니스 로직) | `USvcAuth.pas` |
| `UDB` | DB 접근 | `UDBConnection.pas` |
| `URpt` | 보고서 | `URptEmployee.pas` |
| `TTest` | 단위 테스트 | `TTestEmployee.pas` |

---

## 🔧 현재 → 권장 마이그레이션 가이드

현재 Nexus ERP 프로젝트 파일들의 이동 권장 경로입니다.

| 현재 위치 | 권장 이동 위치 |
|-----------|----------------|
| `UMain.pas`, `UMain.dfm` | `src/forms/` |
| `UFrameUserMgr.pas`, `.dfm` | `src/frames/hr/` |
| _(향후 추가될 서비스 로직)_ | `src/services/` |
| _(향후 추가될 모델 정의)_ | `src/models/` |

> 💡 **팁**: 파일 이동 후 반드시 `.dproj` 파일에서 경로를 업데이트하거나,  
> RAD Studio에서 "프로젝트 매니저 > 파일 추가"로 재등록해주세요.

---

## 💡 추가 권장 사항

1. **`core/UCoreSession.pas`** — 로그인한 사용자 정보(사번, 이름, 권한)를 전역 싱글톤으로 관리하면 각 프레임에서 편리하게 접근할 수 있습니다.
2. **`db/UDBBase.pas`** — 공통 `GetList`, `GetByID`, `Save`, `Delete` 메서드를 추상 클래스로 만들면 각 모듈 DAL 구현이 일관성 있게 유지됩니다.
3. **`sql/`** — 스키마 변경 이력을 SQL 파일로 번호 순으로 관리하면 팀 간 DB 동기화가 용이합니다.
4. **`tests/`** — DUnit 또는 TestInsight를 활용해 서비스 레이어부터 단위 테스트를 도입하면 리그레션을 방지할 수 있습니다.

---

*최종 수정: 2026-05-08 | 작성: Antigravity (AI Assistant)*
