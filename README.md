# 이미지 검색 앱 (Image Search App)

Pixabay API를 활용한 Flutter 기반 이미지 검색 애플리케이션입니다.

## 📱 주요 기능

- **이미지 검색**: Pixabay API를 통한 고품질 이미지 검색
- **그리드 뷰**: 검색 결과를 2열 그리드 형태로 표시
- **로딩 인디케이터**: 검색 중 로딩 상태 표시
- **에러 처리**: 네트워크 오류 시 스낵바를 통한 사용자 알림

## 🏗️ 프로젝트 구조

### Clean Architecture 패턴 적용
```
lib/
├── data/                   # 데이터 계층
│   ├── data_source/       # API 및 데이터 소스
│   │   ├── pixabay_api.dart
│   │   └── result.dart    # Result 패턴 (성공/실패 처리)
│   └── repository/        # Repository 구현체
│       └── photo_api_repository_impl.dart
│
├── domain/                 # 도메인 계층
│   ├── model/             # 도메인 모델
│   │   └── photo.dart     # Photo 엔티티 (Freezed)
│   ├── repository/        # Repository 인터페이스
│   │   └── photo_api_repository.dart
│   └── use_case/          # 비즈니스 로직
│       └── get_photos_use_case.dart
│
├── presentation/           # 프레젠테이션 계층
│   └── home/
│       ├── component/     # UI 컴포넌트
│       │   └── photo_widget.dart
│       ├── home_screen.dart        # 메인 화면
│       ├── home_view_model.dart    # ViewModel (Provider)
│       ├── home_state.dart         # UI 상태 관리 (Freezed)
│       └── home_ui_event.dart      # UI 이벤트 (Freezed)
│
├── di/                     # 의존성 주입
│   └── provider_setup.dart
│
└── main.dart              # 앱 진입점
```

## 🛠️ 기술 스택

### 핵심 라이브러리
- **Flutter**: 크로스 플랫폼 모바일 앱 개발
- **Provider** (^6.0.5): 상태 관리 및 의존성 주입
- **Freezed**: 불변 데이터 클래스 생성 및 Union 타입 지원
- **HTTP** (^0.13.5): API 통신

### 개발 도구
- **Mockito** (^5.0.16): 단위 테스트를 위한 Mock 객체 생성
- **Build Runner**: 코드 생성 도구
- **Json Serializable**: JSON 직렬화/역직렬화

## 🚀 시작하기

### 필수 요구사항
- Flutter SDK >=2.18.2 <3.0.0
- Dart SDK

### 설치 및 실행

1. 저장소 클론
```bash
git clone https://github.com/yourusername/image_search_app.git
cd image_search_app
```

2. 의존성 설치
```bash
flutter pub get
```

3. 코드 생성 (Freezed 파일 생성)
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

4. 앱 실행
```bash
flutter run
```

## 📋 주요 특징

### 1. Clean Architecture
- **관심사 분리**: 데이터, 도메인, 프레젠테이션 계층 분리
- **의존성 역전**: 인터페이스를 통한 느슨한 결합
- **테스트 용이성**: 각 계층 독립적 테스트 가능

### 2. 상태 관리
- **Provider 패턴**: 효율적인 상태 관리 및 의존성 주입
- **ViewModel**: 비즈니스 로직과 UI 분리
- **Stream 기반 이벤트**: UI 이벤트 처리 (스낵바 등)

### 3. 에러 처리
- **Result 패턴**: 타입 안전한 성공/실패 처리
- **Freezed Union Type**: 명확한 에러 상태 관리

### 4. 코드 생성
- **Freezed**: 보일러플레이트 코드 최소화
- **불변 객체**: 예측 가능한 상태 관리

## 📱 화면 구성

### 홈 화면
- 상단 검색바: 키워드 입력 및 검색
- 이미지 그리드: 2열 그리드 레이아웃
- 로딩 상태: 검색 중 프로그레스 인디케이터 표시
- 에러 알림: 네트워크 오류 시 스낵바 표시

## 🔑 API

이 앱은 [Pixabay API](https://pixabay.com/api/docs/)를 사용합니다.
- 엔드포인트: `https://pixabay.com/api/`
- 인증: API 키 필요

## 🧪 테스트

단위 테스트 실행:
```bash
flutter test
```

## 📝 라이선스

이 프로젝트는 MIT 라이선스 하에 있습니다.

## 🤝 기여하기

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📧 연락처

프로젝트 관련 문의사항이 있으시면 이슈를 등록해주세요.
