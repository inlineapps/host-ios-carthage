Pod::Spec.new do |s|
  s.name                    = 'Realm'
  version                   = `sh build.sh get-version`
  s.version                 = version
  s.cocoapods_version       = '>= 1.10'
  s.summary                 = 'Realm is a modern data framework & database for iOS, macOS, tvOS & watchOS.'
  s.description             = <<-DESC
                              The Realm Mobile Database, for Objective-C. (If you want to use Realm from Swift, see the “RealmSwift” pod.)

                              The Realm Mobile Database is a fast, easy-to-use replacement for Core Data & SQLite. Use it with the Realm Mobile Platform for realtime, automatic data sync. Works on iOS, macOS, tvOS & watchOS. Learn more and get help at https://realm.io.
                              DESC
  s.homepage                = "https://realm.io"
  s.source                  = { :git => 'https://github.com/realm/realm-cocoa.git', :tag => "v#{s.version}", :submodules => true }
  s.author                  = { 'Realm' => 'help@realm.io' }
  s.library                 = 'c++', 'z'
  s.requires_arc            = true
  s.social_media_url        = 'https://twitter.com/realm'
  s.documentation_url       = "https://docs.mongodb.com/realm-legacy/docs/objc/5.5.0/"
  s.license                 = { :type => 'Apache 2.0', :file => 'LICENSE' }

  public_header_files       = 'include/**/RLMArray.h',
                              'include/**/RLMCollection.h',
                              'include/**/RLMConstants.h',
                              'include/**/RLMListBase.h',
                              'include/**/RLMMigration.h',
                              'include/**/RLMObject.h',
                              'include/**/RLMObjectBase.h',
                              'include/**/RLMObjectSchema.h',
                              'include/**/RLMOptionalBase.h',
                              'include/**/RLMPlatform.h',
                              'include/**/RLMProperty.h',
                              'include/**/RLMRealm.h',
                              'include/**/RLMRealm+Sync.h',
                              'include/**/RLMRealmConfiguration+Sync.h',
                              'include/**/RLMRealmConfiguration.h',
                              'include/**/RLMResults.h',
                              'include/**/RLMSchema.h',
                              'include/**/RLMSyncConfiguration.h',
                              'include/**/RLMSyncCredentials.h',
                              'include/**/RLMSyncManager.h',
                              'include/**/RLMSyncPermission.h',
                              'include/**/RLMSyncSession.h',
                              'include/**/RLMSyncSubscription.h',
                              'include/**/RLMSyncUser.h',
                              'include/**/RLMSyncUtil.h',
                              'include/**/RLMThreadSafeReference.h',
                              'include/**/NSError+RLMSync.h',
                              'include/**/Realm.h',

                              # Realm.Dynamic module
                              'include/**/RLMRealm_Dynamic.h',
                              'include/**/RLMObjectBase_Dynamic.h'

                              # Realm.Private module
  private_header_files      = 'include/**/RLMAccessor.h',
                              'include/**/RLMArray_Private.h',
                              'include/**/RLMCollection_Private.h',
                              'include/**/RLMListBase.h',
                              'include/**/RLMObjectBase_Private.h',
                              'include/**/RLMObjectSchema_Private.h',
                              'include/**/RLMObjectStore.h',
                              'include/**/RLMObject_Private.h',
                              'include/**/RLMOptionalBase.h',
                              'include/**/RLMProperty_Private.h',
                              'include/**/RLMRealmConfiguration_Private.h',
                              'include/**/RLMRealm_Private.h',
                              'include/**/RLMResults_Private.h',
                              'include/**/RLMSchema_Private.h',
                              'include/**/RLMSyncConfiguration_Private.h',
                              'include/**/RLMSyncUtil_Private.h'

  source_files              = 'Realm/*.{m,mm}',
                              'Realm/ObjectStore/src/*.cpp',
                              'Realm/ObjectStore/src/sync/*.cpp',
                              'Realm/ObjectStore/src/sync/impl/*.cpp',
                              'Realm/ObjectStore/src/sync/impl/apple/*.cpp',
                              'Realm/ObjectStore/src/impl/*.cpp',
                              'Realm/ObjectStore/src/impl/apple/*.cpp',
                              'Realm/ObjectStore/src/util/*.cpp',
                              'Realm/ObjectStore/src/util/apple/*.cpp'

  s.frameworks              = 'Security'
  s.module_map              = 'Realm/Realm.modulemap'
  s.compiler_flags          = "-DREALM_HAVE_CONFIG -DREALM_COCOA_VERSION='@\"#{s.version}\"' -D__ASSERTMACROS__ -DREALM_ENABLE_SYNC"
  s.prepare_command         = 'sh build.sh cocoapods-setup'
  s.source_files            = source_files + private_header_files
  s.private_header_files    = private_header_files
  s.header_mappings_dir     = 'include'
  s.pod_target_xcconfig     = { 'APPLICATION_EXTENSION_API_ONLY' => 'YES',
                                'CLANG_CXX_LANGUAGE_STANDARD' => 'c++17',
                                'CLANG_WARN_OBJC_IMPLICIT_RETAIN_SELF' => 'NO',
                                'OTHER_CPLUSPLUSFLAGS' => '-isystem "${PODS_ROOT}/Realm/include/core" -fvisibility-inlines-hidden',
                                'OTHER_CPLUSPLUSFLAGS[arch=armv7]' => '-isystem "${PODS_ROOT}/Realm/include/core" -fvisibility-inlines-hidden -fno-aligned-new',
                                'USER_HEADER_SEARCH_PATHS' => '"${PODS_ROOT}/Realm/include" "${PODS_ROOT}/Realm/include/Realm"',
                              }
  s.preserve_paths          = %w(build.sh include)

  s.ios.deployment_target   = '9.0'
  s.osx.deployment_target   = '10.9'
  s.watchos.deployment_target = '2.0'
  s.tvos.deployment_target = '9.0'

  s.vendored_frameworks  = 'core/realm-sync.xcframework'

  s.subspec 'Headers' do |s|
    s.source_files          = public_header_files
    s.public_header_files   = public_header_files
  end
end
