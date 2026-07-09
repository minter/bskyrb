module Bskyrb
  module AppBskyActorDefs
    class ProfileViewBasic
      attr_accessor :did

      attr_accessor :handle

      attr_accessor :displayName

      attr_accessor :pronouns

      attr_accessor :avatar

      attr_accessor :associated

      attr_accessor :viewer

      attr_accessor :labels

      attr_accessor :createdAt

      attr_accessor :verification

      attr_accessor :status

      attr_accessor :debug

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:did=, hash["did"])

        instance.send(:handle=, hash["handle"])

        instance.send(:displayName=, hash["displayName"])

        instance.send(:pronouns=, hash["pronouns"])

        instance.send(:avatar=, hash["avatar"])

        instance.send(:associated=, hash["associated"])

        instance.send(:viewer=, hash["viewer"])

        instance.send(:labels=, hash["labels"])

        instance.send(:createdAt=, hash["createdAt"])

        instance.send(:verification=, hash["verification"])

        instance.send(:status=, hash["status"])

        instance.send(:debug=, hash["debug"])

        instance
      end
    end
  end

  module AppBskyActorDefs
    class ProfileView
      attr_accessor :did

      attr_accessor :handle

      attr_accessor :displayName

      attr_accessor :pronouns

      attr_accessor :description

      attr_accessor :avatar

      attr_accessor :associated

      attr_accessor :indexedAt

      attr_accessor :createdAt

      attr_accessor :viewer

      attr_accessor :labels

      attr_accessor :verification

      attr_accessor :status

      attr_accessor :debug

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:did=, hash["did"])

        instance.send(:handle=, hash["handle"])

        instance.send(:displayName=, hash["displayName"])

        instance.send(:pronouns=, hash["pronouns"])

        instance.send(:description=, hash["description"])

        instance.send(:avatar=, hash["avatar"])

        instance.send(:associated=, hash["associated"])

        instance.send(:indexedAt=, hash["indexedAt"])

        instance.send(:createdAt=, hash["createdAt"])

        instance.send(:viewer=, hash["viewer"])

        instance.send(:labels=, hash["labels"])

        instance.send(:verification=, hash["verification"])

        instance.send(:status=, hash["status"])

        instance.send(:debug=, hash["debug"])

        instance
      end
    end
  end

  module AppBskyActorDefs
    class ProfileViewDetailed
      attr_accessor :did

      attr_accessor :handle

      attr_accessor :displayName

      attr_accessor :description

      attr_accessor :pronouns

      attr_accessor :website

      attr_accessor :avatar

      attr_accessor :banner

      attr_accessor :followersCount

      attr_accessor :followsCount

      attr_accessor :postsCount

      attr_accessor :associated

      attr_accessor :joinedViaStarterPack

      attr_accessor :indexedAt

      attr_accessor :createdAt

      attr_accessor :viewer

      attr_accessor :labels

      attr_accessor :pinnedPost

      attr_accessor :verification

      attr_accessor :status

      attr_accessor :debug

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:did=, hash["did"])

        instance.send(:handle=, hash["handle"])

        instance.send(:displayName=, hash["displayName"])

        instance.send(:description=, hash["description"])

        instance.send(:pronouns=, hash["pronouns"])

        instance.send(:website=, hash["website"])

        instance.send(:avatar=, hash["avatar"])

        instance.send(:banner=, hash["banner"])

        instance.send(:followersCount=, hash["followersCount"])

        instance.send(:followsCount=, hash["followsCount"])

        instance.send(:postsCount=, hash["postsCount"])

        instance.send(:associated=, hash["associated"])

        instance.send(:joinedViaStarterPack=, hash["joinedViaStarterPack"])

        instance.send(:indexedAt=, hash["indexedAt"])

        instance.send(:createdAt=, hash["createdAt"])

        instance.send(:viewer=, hash["viewer"])

        instance.send(:labels=, hash["labels"])

        instance.send(:pinnedPost=, hash["pinnedPost"])

        instance.send(:verification=, hash["verification"])

        instance.send(:status=, hash["status"])

        instance.send(:debug=, hash["debug"])

        instance
      end
    end
  end

  module AppBskyActorDefs
    class ProfileAssociated
      attr_accessor :lists

      attr_accessor :feedgens

      attr_accessor :starterPacks

      attr_accessor :labeler

      attr_accessor :chat

      attr_accessor :activitySubscription

      attr_accessor :germ

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:lists=, hash["lists"])

        instance.send(:feedgens=, hash["feedgens"])

        instance.send(:starterPacks=, hash["starterPacks"])

        instance.send(:labeler=, hash["labeler"])

        instance.send(:chat=, hash["chat"])

        instance.send(:activitySubscription=, hash["activitySubscription"])

        instance.send(:germ=, hash["germ"])

        instance
      end
    end
  end

  module AppBskyActorDefs
    class ProfileAssociatedChat
      attr_accessor :allowIncoming

      attr_accessor :allowGroupInvites

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:allowIncoming=, hash["allowIncoming"])

        instance.send(:allowGroupInvites=, hash["allowGroupInvites"])

        instance
      end
    end
  end

  module AppBskyActorDefs
    class ProfileAssociatedGerm
      attr_accessor :messageMeUrl

      attr_accessor :showButtonTo

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:messageMeUrl=, hash["messageMeUrl"])

        instance.send(:showButtonTo=, hash["showButtonTo"])

        instance
      end
    end
  end

  module AppBskyActorDefs
    class ProfileAssociatedActivitySubscription
      attr_accessor :allowSubscriptions

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:allowSubscriptions=, hash["allowSubscriptions"])

        instance
      end
    end
  end

  module AppBskyActorDefs
    class ViewerState
      attr_accessor :muted

      attr_accessor :mutedByList

      attr_accessor :blockedBy

      attr_accessor :blocking

      attr_accessor :blockingByList

      attr_accessor :following

      attr_accessor :followedBy

      attr_accessor :knownFollowers

      attr_accessor :activitySubscription

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:muted=, hash["muted"])

        instance.send(:mutedByList=, hash["mutedByList"])

        instance.send(:blockedBy=, hash["blockedBy"])

        instance.send(:blocking=, hash["blocking"])

        instance.send(:blockingByList=, hash["blockingByList"])

        instance.send(:following=, hash["following"])

        instance.send(:followedBy=, hash["followedBy"])

        instance.send(:knownFollowers=, hash["knownFollowers"])

        instance.send(:activitySubscription=, hash["activitySubscription"])

        instance
      end
    end
  end

  module AppBskyActorDefs
    class KnownFollowers
      attr_accessor :count

      attr_accessor :followers

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:count=, hash["count"])

        instance.send(:followers=, hash["followers"])

        instance
      end
    end
  end

  module AppBskyActorDefs
    class VerificationState
      attr_accessor :verifications

      attr_accessor :verifiedStatus

      attr_accessor :trustedVerifierStatus

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:verifications=, hash["verifications"])

        instance.send(:verifiedStatus=, hash["verifiedStatus"])

        instance.send(:trustedVerifierStatus=, hash["trustedVerifierStatus"])

        instance
      end
    end
  end

  module AppBskyActorDefs
    class VerificationView
      attr_accessor :issuer

      attr_accessor :issuerDisplayName

      attr_accessor :issuerHandle

      attr_accessor :uri

      attr_accessor :isValid

      attr_accessor :createdAt

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:issuer=, hash["issuer"])

        instance.send(:issuerDisplayName=, hash["issuerDisplayName"])

        instance.send(:issuerHandle=, hash["issuerHandle"])

        instance.send(:uri=, hash["uri"])

        instance.send(:isValid=, hash["isValid"])

        instance.send(:createdAt=, hash["createdAt"])

        instance
      end
    end
  end

  module AppBskyActorDefs
    class Preferences
      attr_accessor :items

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:items=, hash["items"])

        instance
      end
    end
  end

  module AppBskyActorDefs
    class AdultContentPref
      attr_accessor :enabled

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:enabled=, hash["enabled"])

        instance
      end
    end
  end

  module AppBskyActorDefs
    class ContentLabelPref
      attr_accessor :labelerDid

      attr_accessor :label

      attr_accessor :visibility

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:labelerDid=, hash["labelerDid"])

        instance.send(:label=, hash["label"])

        instance.send(:visibility=, hash["visibility"])

        instance
      end
    end
  end

  module AppBskyActorDefs
    class SavedFeed
      attr_accessor :id

      attr_accessor :value

      attr_accessor :pinned

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:id=, hash["id"])

        instance.send(:value=, hash["value"])

        instance.send(:pinned=, hash["pinned"])

        instance
      end
    end
  end

  module AppBskyActorDefs
    class SavedFeedsPrefV2
      attr_accessor :items

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:items=, hash["items"])

        instance
      end
    end
  end

  module AppBskyActorDefs
    class SavedFeedsPref
      attr_accessor :pinned

      attr_accessor :saved

      attr_accessor :timelineIndex

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:pinned=, hash["pinned"])

        instance.send(:saved=, hash["saved"])

        instance.send(:timelineIndex=, hash["timelineIndex"])

        instance
      end
    end
  end

  module AppBskyActorDefs
    class PersonalDetailsPref
      attr_accessor :birthDate

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:birthDate=, hash["birthDate"])

        instance
      end
    end
  end

  module AppBskyActorDefs
    class DeclaredAgePref
      attr_accessor :isOverAge13

      attr_accessor :isOverAge16

      attr_accessor :isOverAge18

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:isOverAge13=, hash["isOverAge13"])

        instance.send(:isOverAge16=, hash["isOverAge16"])

        instance.send(:isOverAge18=, hash["isOverAge18"])

        instance
      end
    end
  end

  module AppBskyActorDefs
    class FeedViewPref
      attr_accessor :feed

      attr_accessor :hideReplies

      attr_accessor :hideRepliesByUnfollowed

      attr_accessor :hideRepliesByLikeCount

      attr_accessor :hideReposts

      attr_accessor :hideQuotePosts

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:feed=, hash["feed"])

        instance.send(:hideReplies=, hash["hideReplies"])

        instance.send(:hideRepliesByUnfollowed=, hash["hideRepliesByUnfollowed"])

        instance.send(:hideRepliesByLikeCount=, hash["hideRepliesByLikeCount"])

        instance.send(:hideReposts=, hash["hideReposts"])

        instance.send(:hideQuotePosts=, hash["hideQuotePosts"])

        instance
      end
    end
  end

  module AppBskyActorDefs
    class ThreadViewPref
      attr_accessor :sort

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:sort=, hash["sort"])

        instance
      end
    end
  end

  module AppBskyActorDefs
    class InterestsPref
      attr_accessor :tags

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:tags=, hash["tags"])

        instance
      end
    end
  end

  module AppBskyActorDefs
    class MutedWordTarget
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module AppBskyActorDefs
    class MutedWord
      attr_accessor :id

      attr_accessor :value

      attr_accessor :targets

      attr_accessor :actorTarget

      attr_accessor :expiresAt

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:id=, hash["id"])

        instance.send(:value=, hash["value"])

        instance.send(:targets=, hash["targets"])

        instance.send(:actorTarget=, hash["actorTarget"])

        instance.send(:expiresAt=, hash["expiresAt"])

        instance
      end
    end
  end

  module AppBskyActorDefs
    class MutedWordsPref
      attr_accessor :items

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:items=, hash["items"])

        instance
      end
    end
  end

  module AppBskyActorDefs
    class HiddenPostsPref
      attr_accessor :items

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:items=, hash["items"])

        instance
      end
    end
  end

  module AppBskyActorDefs
    class LabelersPref
      attr_accessor :labelers

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:labelers=, hash["labelers"])

        instance
      end
    end
  end

  module AppBskyActorDefs
    class LabelerPrefItem
      attr_accessor :did

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:did=, hash["did"])

        instance
      end
    end
  end

  module AppBskyActorDefs
    class BskyAppStatePref
      attr_accessor :activeProgressGuide

      attr_accessor :isBetaUser

      attr_accessor :queuedNudges

      attr_accessor :nuxs

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:activeProgressGuide=, hash["activeProgressGuide"])

        instance.send(:isBetaUser=, hash["isBetaUser"])

        instance.send(:queuedNudges=, hash["queuedNudges"])

        instance.send(:nuxs=, hash["nuxs"])

        instance
      end
    end
  end

  module AppBskyActorDefs
    class BskyAppProgressGuide
      attr_accessor :guide

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:guide=, hash["guide"])

        instance
      end
    end
  end

  module AppBskyActorDefs
    class Nux
      attr_accessor :id

      attr_accessor :completed

      attr_accessor :data

      attr_accessor :expiresAt

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:id=, hash["id"])

        instance.send(:completed=, hash["completed"])

        instance.send(:data=, hash["data"])

        instance.send(:expiresAt=, hash["expiresAt"])

        instance
      end
    end
  end

  module AppBskyActorDefs
    class VerificationPrefs
      attr_accessor :hideBadges

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:hideBadges=, hash["hideBadges"])

        instance
      end
    end
  end

  module AppBskyActorDefs
    class LiveEventPreferences
      attr_accessor :hiddenFeedIds

      attr_accessor :hideAllFeeds

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:hiddenFeedIds=, hash["hiddenFeedIds"])

        instance.send(:hideAllFeeds=, hash["hideAllFeeds"])

        instance
      end
    end
  end

  module AppBskyActorDefs
    class PostInteractionSettingsPref
      attr_accessor :threadgateAllowRules

      attr_accessor :postgateEmbeddingRules

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:threadgateAllowRules=, hash["threadgateAllowRules"])

        instance.send(:postgateEmbeddingRules=, hash["postgateEmbeddingRules"])

        instance
      end
    end
  end

  module AppBskyActorDefs
    class StatusView
      attr_accessor :uri

      attr_accessor :cid

      attr_accessor :status

      attr_accessor :record

      attr_accessor :embed

      attr_accessor :labels

      attr_accessor :expiresAt

      attr_accessor :isActive

      attr_accessor :isDisabled

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:uri=, hash["uri"])

        instance.send(:cid=, hash["cid"])

        instance.send(:status=, hash["status"])

        instance.send(:record=, hash["record"])

        instance.send(:embed=, hash["embed"])

        instance.send(:labels=, hash["labels"])

        instance.send(:expiresAt=, hash["expiresAt"])

        instance.send(:isActive=, hash["isActive"])

        instance.send(:isDisabled=, hash["isDisabled"])

        instance
      end
    end
  end

  module AppBskyActorStatus
    class Live
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module AppBskyAgeassuranceDefs
    class Access
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module AppBskyAgeassuranceDefs
    class Status
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module AppBskyAgeassuranceDefs
    class State
      attr_accessor :lastInitiatedAt

      attr_accessor :status

      attr_accessor :access

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:lastInitiatedAt=, hash["lastInitiatedAt"])

        instance.send(:status=, hash["status"])

        instance.send(:access=, hash["access"])

        instance
      end
    end
  end

  module AppBskyAgeassuranceDefs
    class StateMetadata
      attr_accessor :accountCreatedAt

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:accountCreatedAt=, hash["accountCreatedAt"])

        instance
      end
    end
  end

  module AppBskyAgeassuranceDefs
    class Config
      attr_accessor :regions

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:regions=, hash["regions"])

        instance
      end
    end
  end

  module AppBskyAgeassuranceDefs
    class ConfigRegion
      attr_accessor :countryCode

      attr_accessor :regionCode

      attr_accessor :minAccessAge

      attr_accessor :additionalVerificationMethods

      attr_accessor :rules

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:countryCode=, hash["countryCode"])

        instance.send(:regionCode=, hash["regionCode"])

        instance.send(:minAccessAge=, hash["minAccessAge"])

        instance.send(:additionalVerificationMethods=, hash["additionalVerificationMethods"])

        instance.send(:rules=, hash["rules"])

        instance
      end
    end
  end

  module AppBskyAgeassuranceDefs
    class ConfigRegionRuleDefault
      attr_accessor :access

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:access=, hash["access"])

        instance
      end
    end
  end

  module AppBskyAgeassuranceDefs
    class ConfigRegionRuleIfDeclaredOverAge
      attr_accessor :age

      attr_accessor :access

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:age=, hash["age"])

        instance.send(:access=, hash["access"])

        instance
      end
    end
  end

  module AppBskyAgeassuranceDefs
    class ConfigRegionRuleIfDeclaredUnderAge
      attr_accessor :age

      attr_accessor :access

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:age=, hash["age"])

        instance.send(:access=, hash["access"])

        instance
      end
    end
  end

  module AppBskyAgeassuranceDefs
    class ConfigRegionRuleIfAssuredOverAge
      attr_accessor :age

      attr_accessor :access

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:age=, hash["age"])

        instance.send(:access=, hash["access"])

        instance
      end
    end
  end

  module AppBskyAgeassuranceDefs
    class ConfigRegionRuleIfAssuredUnderAge
      attr_accessor :age

      attr_accessor :access

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:age=, hash["age"])

        instance.send(:access=, hash["access"])

        instance
      end
    end
  end

  module AppBskyAgeassuranceDefs
    class ConfigRegionRuleIfAccountNewerThan
      attr_accessor :date

      attr_accessor :access

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:date=, hash["date"])

        instance.send(:access=, hash["access"])

        instance
      end
    end
  end

  module AppBskyAgeassuranceDefs
    class ConfigRegionRuleIfAccountOlderThan
      attr_accessor :date

      attr_accessor :access

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:date=, hash["date"])

        instance.send(:access=, hash["access"])

        instance
      end
    end
  end

  module AppBskyAgeassuranceDefs
    class Event
      attr_accessor :createdAt

      attr_accessor :attemptId

      attr_accessor :status

      attr_accessor :access

      attr_accessor :countryCode

      attr_accessor :regionCode

      attr_accessor :email

      attr_accessor :initIp

      attr_accessor :initUa

      attr_accessor :completeIp

      attr_accessor :completeUa

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:createdAt=, hash["createdAt"])

        instance.send(:attemptId=, hash["attemptId"])

        instance.send(:status=, hash["status"])

        instance.send(:access=, hash["access"])

        instance.send(:countryCode=, hash["countryCode"])

        instance.send(:regionCode=, hash["regionCode"])

        instance.send(:email=, hash["email"])

        instance.send(:initIp=, hash["initIp"])

        instance.send(:initUa=, hash["initUa"])

        instance.send(:completeIp=, hash["completeIp"])

        instance.send(:completeUa=, hash["completeUa"])

        instance
      end
    end
  end

  module AppBskyBookmarkDefs
    class Bookmark
      attr_accessor :subject

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:subject=, hash["subject"])

        instance
      end
    end
  end

  module AppBskyBookmarkDefs
    class BookmarkView
      attr_accessor :subject

      attr_accessor :createdAt

      attr_accessor :item

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:subject=, hash["subject"])

        instance.send(:createdAt=, hash["createdAt"])

        instance.send(:item=, hash["item"])

        instance
      end
    end
  end

  module AppBskyContactDefs
    class MatchAndContactIndex
      attr_accessor :match

      attr_accessor :contactIndex

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:match=, hash["match"])

        instance.send(:contactIndex=, hash["contactIndex"])

        instance
      end
    end
  end

  module AppBskyContactDefs
    class SyncStatus
      attr_accessor :syncedAt

      attr_accessor :matchesCount

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:syncedAt=, hash["syncedAt"])

        instance.send(:matchesCount=, hash["matchesCount"])

        instance
      end
    end
  end

  module AppBskyContactDefs
    class Notification
      attr_accessor :from

      attr_accessor :to

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:from=, hash["from"])

        instance.send(:to=, hash["to"])

        instance
      end
    end
  end

  module AppBskyDraftDefs
    class DraftWithId
      attr_accessor :id

      attr_accessor :draft

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:id=, hash["id"])

        instance.send(:draft=, hash["draft"])

        instance
      end
    end
  end

  module AppBskyDraftDefs
    class Draft
      attr_accessor :deviceId

      attr_accessor :deviceName

      attr_accessor :posts

      attr_accessor :langs

      attr_accessor :postgateEmbeddingRules

      attr_accessor :threadgateAllow

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:deviceId=, hash["deviceId"])

        instance.send(:deviceName=, hash["deviceName"])

        instance.send(:posts=, hash["posts"])

        instance.send(:langs=, hash["langs"])

        instance.send(:postgateEmbeddingRules=, hash["postgateEmbeddingRules"])

        instance.send(:threadgateAllow=, hash["threadgateAllow"])

        instance
      end
    end
  end

  module AppBskyDraftDefs
    class DraftPost
      attr_accessor :text

      attr_accessor :labels

      attr_accessor :embedImages

      attr_accessor :embedGallery

      attr_accessor :embedVideos

      attr_accessor :embedExternals

      attr_accessor :embedRecords

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:text=, hash["text"])

        instance.send(:labels=, hash["labels"])

        instance.send(:embedImages=, hash["embedImages"])

        instance.send(:embedGallery=, hash["embedGallery"])

        instance.send(:embedVideos=, hash["embedVideos"])

        instance.send(:embedExternals=, hash["embedExternals"])

        instance.send(:embedRecords=, hash["embedRecords"])

        instance
      end
    end
  end

  module AppBskyDraftDefs
    class DraftView
      attr_accessor :id

      attr_accessor :draft

      attr_accessor :createdAt

      attr_accessor :updatedAt

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:id=, hash["id"])

        instance.send(:draft=, hash["draft"])

        instance.send(:createdAt=, hash["createdAt"])

        instance.send(:updatedAt=, hash["updatedAt"])

        instance
      end
    end
  end

  module AppBskyDraftDefs
    class DraftEmbedLocalRef
      attr_accessor :path

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:path=, hash["path"])

        instance
      end
    end
  end

  module AppBskyDraftDefs
    class DraftEmbedCaption
      attr_accessor :lang

      attr_accessor :content

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:lang=, hash["lang"])

        instance.send(:content=, hash["content"])

        instance
      end
    end
  end

  module AppBskyDraftDefs
    class DraftEmbedGallery
      attr_accessor :items

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:items=, hash["items"])

        instance
      end
    end
  end

  module AppBskyDraftDefs
    class DraftEmbedGalleryItems
      attr_accessor :items

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:items=, hash["items"])

        instance
      end
    end
  end

  module AppBskyDraftDefs
    class DraftEmbedImage
      attr_accessor :localRef

      attr_accessor :alt

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:localRef=, hash["localRef"])

        instance.send(:alt=, hash["alt"])

        instance
      end
    end
  end

  module AppBskyDraftDefs
    class DraftEmbedVideo
      attr_accessor :localRef

      attr_accessor :alt

      attr_accessor :captions

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:localRef=, hash["localRef"])

        instance.send(:alt=, hash["alt"])

        instance.send(:captions=, hash["captions"])

        instance
      end
    end
  end

  module AppBskyDraftDefs
    class DraftEmbedExternal
      attr_accessor :uri

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:uri=, hash["uri"])

        instance
      end
    end
  end

  module AppBskyDraftDefs
    class DraftEmbedRecord
      attr_accessor :record

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:record=, hash["record"])

        instance
      end
    end
  end

  module AppBskyEmbedDefs
    class AspectRatio
      attr_accessor :width

      attr_accessor :height

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:width=, hash["width"])

        instance.send(:height=, hash["height"])

        instance
      end
    end
  end

  module AppBskyEmbedExternal
    class External
      attr_accessor :uri

      attr_accessor :title

      attr_accessor :description

      attr_accessor :thumb

      attr_accessor :associatedRefs

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:uri=, hash["uri"])

        instance.send(:title=, hash["title"])

        instance.send(:description=, hash["description"])

        instance.send(:thumb=, hash["thumb"])

        instance.send(:associatedRefs=, hash["associatedRefs"])

        instance
      end
    end
  end

  module AppBskyEmbedExternal
    class View
      attr_accessor :external

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:external=, hash["external"])

        instance
      end
    end
  end

  module AppBskyEmbedExternal
    class ViewExternal
      attr_accessor :uri

      attr_accessor :title

      attr_accessor :description

      attr_accessor :thumb

      attr_accessor :createdAt

      attr_accessor :updatedAt

      attr_accessor :readingTime

      attr_accessor :labels

      attr_accessor :source

      attr_accessor :associatedRefs

      attr_accessor :associatedProfiles

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:uri=, hash["uri"])

        instance.send(:title=, hash["title"])

        instance.send(:description=, hash["description"])

        instance.send(:thumb=, hash["thumb"])

        instance.send(:createdAt=, hash["createdAt"])

        instance.send(:updatedAt=, hash["updatedAt"])

        instance.send(:readingTime=, hash["readingTime"])

        instance.send(:labels=, hash["labels"])

        instance.send(:source=, hash["source"])

        instance.send(:associatedRefs=, hash["associatedRefs"])

        instance.send(:associatedProfiles=, hash["associatedProfiles"])

        instance
      end
    end
  end

  module AppBskyEmbedExternal
    class ViewExternalSource
      attr_accessor :uri

      attr_accessor :icon

      attr_accessor :title

      attr_accessor :description

      attr_accessor :theme

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:uri=, hash["uri"])

        instance.send(:icon=, hash["icon"])

        instance.send(:title=, hash["title"])

        instance.send(:description=, hash["description"])

        instance.send(:theme=, hash["theme"])

        instance
      end
    end
  end

  module AppBskyEmbedExternal
    class ViewExternalSourceTheme
      attr_accessor :backgroundRGB

      attr_accessor :foregroundRGB

      attr_accessor :accentRGB

      attr_accessor :accentForegroundRGB

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:backgroundRGB=, hash["backgroundRGB"])

        instance.send(:foregroundRGB=, hash["foregroundRGB"])

        instance.send(:accentRGB=, hash["accentRGB"])

        instance.send(:accentForegroundRGB=, hash["accentForegroundRGB"])

        instance
      end
    end
  end

  module AppBskyEmbedExternal
    class ColorRGB
      attr_accessor :r

      attr_accessor :g

      attr_accessor :b

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:r=, hash["r"])

        instance.send(:g=, hash["g"])

        instance.send(:b=, hash["b"])

        instance
      end
    end
  end

  module AppBskyEmbedGallery
    class Image
      attr_accessor :image

      attr_accessor :alt

      attr_accessor :aspectRatio

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:image=, hash["image"])

        instance.send(:alt=, hash["alt"])

        instance.send(:aspectRatio=, hash["aspectRatio"])

        instance
      end
    end
  end

  module AppBskyEmbedGallery
    class View
      attr_accessor :items

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:items=, hash["items"])

        instance
      end
    end
  end

  module AppBskyEmbedGallery
    class ViewImage
      attr_accessor :thumbnail

      attr_accessor :fullsize

      attr_accessor :alt

      attr_accessor :aspectRatio

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:thumbnail=, hash["thumbnail"])

        instance.send(:fullsize=, hash["fullsize"])

        instance.send(:alt=, hash["alt"])

        instance.send(:aspectRatio=, hash["aspectRatio"])

        instance
      end
    end
  end

  module AppBskyEmbedImages
    class Image
      attr_accessor :image

      attr_accessor :alt

      attr_accessor :aspectRatio

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:image=, hash["image"])

        instance.send(:alt=, hash["alt"])

        instance.send(:aspectRatio=, hash["aspectRatio"])

        instance
      end
    end
  end

  module AppBskyEmbedImages
    class View
      attr_accessor :images

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:images=, hash["images"])

        instance
      end
    end
  end

  module AppBskyEmbedImages
    class ViewImage
      attr_accessor :thumb

      attr_accessor :fullsize

      attr_accessor :alt

      attr_accessor :aspectRatio

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:thumb=, hash["thumb"])

        instance.send(:fullsize=, hash["fullsize"])

        instance.send(:alt=, hash["alt"])

        instance.send(:aspectRatio=, hash["aspectRatio"])

        instance
      end
    end
  end

  module AppBskyEmbedRecord
    class View
      attr_accessor :record

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:record=, hash["record"])

        instance
      end
    end
  end

  module AppBskyEmbedRecord
    class ViewRecord
      attr_accessor :uri

      attr_accessor :cid

      attr_accessor :author

      attr_accessor :value

      attr_accessor :labels

      attr_accessor :replyCount

      attr_accessor :repostCount

      attr_accessor :likeCount

      attr_accessor :quoteCount

      attr_accessor :embeds

      attr_accessor :indexedAt

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:uri=, hash["uri"])

        instance.send(:cid=, hash["cid"])

        instance.send(:author=, hash["author"])

        instance.send(:value=, hash["value"])

        instance.send(:labels=, hash["labels"])

        instance.send(:replyCount=, hash["replyCount"])

        instance.send(:repostCount=, hash["repostCount"])

        instance.send(:likeCount=, hash["likeCount"])

        instance.send(:quoteCount=, hash["quoteCount"])

        instance.send(:embeds=, hash["embeds"])

        instance.send(:indexedAt=, hash["indexedAt"])

        instance
      end
    end
  end

  module AppBskyEmbedRecord
    class ViewNotFound
      attr_accessor :uri

      attr_accessor :notFound

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:uri=, hash["uri"])

        instance.send(:notFound=, hash["notFound"])

        instance
      end
    end
  end

  module AppBskyEmbedRecord
    class ViewBlocked
      attr_accessor :uri

      attr_accessor :blocked

      attr_accessor :author

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:uri=, hash["uri"])

        instance.send(:blocked=, hash["blocked"])

        instance.send(:author=, hash["author"])

        instance
      end
    end
  end

  module AppBskyEmbedRecord
    class ViewDetached
      attr_accessor :uri

      attr_accessor :detached

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:uri=, hash["uri"])

        instance.send(:detached=, hash["detached"])

        instance
      end
    end
  end

  module AppBskyEmbedRecordwithmedia
    class View
      attr_accessor :record

      attr_accessor :media

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:record=, hash["record"])

        instance.send(:media=, hash["media"])

        instance
      end
    end
  end

  module AppBskyEmbedVideo
    class Caption
      attr_accessor :lang

      attr_accessor :file

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:lang=, hash["lang"])

        instance.send(:file=, hash["file"])

        instance
      end
    end
  end

  module AppBskyEmbedVideo
    class View
      attr_accessor :cid

      attr_accessor :playlist

      attr_accessor :thumbnail

      attr_accessor :alt

      attr_accessor :aspectRatio

      attr_accessor :presentation

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:cid=, hash["cid"])

        instance.send(:playlist=, hash["playlist"])

        instance.send(:thumbnail=, hash["thumbnail"])

        instance.send(:alt=, hash["alt"])

        instance.send(:aspectRatio=, hash["aspectRatio"])

        instance.send(:presentation=, hash["presentation"])

        instance
      end
    end
  end

  module AppBskyFeedDefs
    class PostView
      attr_accessor :uri

      attr_accessor :cid

      attr_accessor :author

      attr_accessor :record

      attr_accessor :embed

      attr_accessor :bookmarkCount

      attr_accessor :replyCount

      attr_accessor :repostCount

      attr_accessor :likeCount

      attr_accessor :quoteCount

      attr_accessor :indexedAt

      attr_accessor :viewer

      attr_accessor :labels

      attr_accessor :threadgate

      attr_accessor :debug

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:uri=, hash["uri"])

        instance.send(:cid=, hash["cid"])

        instance.send(:author=, hash["author"])

        instance.send(:record=, hash["record"])

        instance.send(:embed=, hash["embed"])

        instance.send(:bookmarkCount=, hash["bookmarkCount"])

        instance.send(:replyCount=, hash["replyCount"])

        instance.send(:repostCount=, hash["repostCount"])

        instance.send(:likeCount=, hash["likeCount"])

        instance.send(:quoteCount=, hash["quoteCount"])

        instance.send(:indexedAt=, hash["indexedAt"])

        instance.send(:viewer=, hash["viewer"])

        instance.send(:labels=, hash["labels"])

        instance.send(:threadgate=, hash["threadgate"])

        instance.send(:debug=, hash["debug"])

        instance
      end
    end
  end

  module AppBskyFeedDefs
    class ViewerState
      attr_accessor :repost

      attr_accessor :like

      attr_accessor :bookmarked

      attr_accessor :threadMuted

      attr_accessor :replyDisabled

      attr_accessor :embeddingDisabled

      attr_accessor :pinned

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:repost=, hash["repost"])

        instance.send(:like=, hash["like"])

        instance.send(:bookmarked=, hash["bookmarked"])

        instance.send(:threadMuted=, hash["threadMuted"])

        instance.send(:replyDisabled=, hash["replyDisabled"])

        instance.send(:embeddingDisabled=, hash["embeddingDisabled"])

        instance.send(:pinned=, hash["pinned"])

        instance
      end
    end
  end

  module AppBskyFeedDefs
    class ThreadContext
      attr_accessor :rootAuthorLike

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:rootAuthorLike=, hash["rootAuthorLike"])

        instance
      end
    end
  end

  module AppBskyFeedDefs
    class FeedViewPost
      attr_accessor :post

      attr_accessor :reply

      attr_accessor :reason

      attr_accessor :feedContext

      attr_accessor :reqId

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:post=, hash["post"])

        instance.send(:reply=, hash["reply"])

        instance.send(:reason=, hash["reason"])

        instance.send(:feedContext=, hash["feedContext"])

        instance.send(:reqId=, hash["reqId"])

        instance
      end
    end
  end

  module AppBskyFeedDefs
    class ReplyRef
      attr_accessor :root

      attr_accessor :parent

      attr_accessor :grandparentAuthor

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:root=, hash["root"])

        instance.send(:parent=, hash["parent"])

        instance.send(:grandparentAuthor=, hash["grandparentAuthor"])

        instance
      end
    end
  end

  module AppBskyFeedDefs
    class ReasonRepost
      attr_accessor :by

      attr_accessor :uri

      attr_accessor :cid

      attr_accessor :indexedAt

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:by=, hash["by"])

        instance.send(:uri=, hash["uri"])

        instance.send(:cid=, hash["cid"])

        instance.send(:indexedAt=, hash["indexedAt"])

        instance
      end
    end
  end

  module AppBskyFeedDefs
    class ReasonPin
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module AppBskyFeedDefs
    class ThreadViewPost
      attr_accessor :post

      attr_accessor :parent

      attr_accessor :replies

      attr_accessor :threadContext

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:post=, hash["post"])

        instance.send(:parent=, hash["parent"])

        instance.send(:replies=, hash["replies"])

        instance.send(:threadContext=, hash["threadContext"])

        instance
      end
    end
  end

  module AppBskyFeedDefs
    class NotFoundPost
      attr_accessor :uri

      attr_accessor :notFound

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:uri=, hash["uri"])

        instance.send(:notFound=, hash["notFound"])

        instance
      end
    end
  end

  module AppBskyFeedDefs
    class BlockedPost
      attr_accessor :uri

      attr_accessor :blocked

      attr_accessor :author

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:uri=, hash["uri"])

        instance.send(:blocked=, hash["blocked"])

        instance.send(:author=, hash["author"])

        instance
      end
    end
  end

  module AppBskyFeedDefs
    class BlockedAuthor
      attr_accessor :did

      attr_accessor :viewer

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:did=, hash["did"])

        instance.send(:viewer=, hash["viewer"])

        instance
      end
    end
  end

  module AppBskyFeedDefs
    class GeneratorView
      attr_accessor :uri

      attr_accessor :cid

      attr_accessor :did

      attr_accessor :creator

      attr_accessor :displayName

      attr_accessor :description

      attr_accessor :descriptionFacets

      attr_accessor :avatar

      attr_accessor :likeCount

      attr_accessor :acceptsInteractions

      attr_accessor :labels

      attr_accessor :viewer

      attr_accessor :contentMode

      attr_accessor :indexedAt

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:uri=, hash["uri"])

        instance.send(:cid=, hash["cid"])

        instance.send(:did=, hash["did"])

        instance.send(:creator=, hash["creator"])

        instance.send(:displayName=, hash["displayName"])

        instance.send(:description=, hash["description"])

        instance.send(:descriptionFacets=, hash["descriptionFacets"])

        instance.send(:avatar=, hash["avatar"])

        instance.send(:likeCount=, hash["likeCount"])

        instance.send(:acceptsInteractions=, hash["acceptsInteractions"])

        instance.send(:labels=, hash["labels"])

        instance.send(:viewer=, hash["viewer"])

        instance.send(:contentMode=, hash["contentMode"])

        instance.send(:indexedAt=, hash["indexedAt"])

        instance
      end
    end
  end

  module AppBskyFeedDefs
    class GeneratorViewerState
      attr_accessor :like

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:like=, hash["like"])

        instance
      end
    end
  end

  module AppBskyFeedDefs
    class SkeletonFeedPost
      attr_accessor :post

      attr_accessor :reason

      attr_accessor :feedContext

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:post=, hash["post"])

        instance.send(:reason=, hash["reason"])

        instance.send(:feedContext=, hash["feedContext"])

        instance
      end
    end
  end

  module AppBskyFeedDefs
    class SkeletonReasonRepost
      attr_accessor :repost

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:repost=, hash["repost"])

        instance
      end
    end
  end

  module AppBskyFeedDefs
    class SkeletonReasonPin
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module AppBskyFeedDefs
    class ThreadgateView
      attr_accessor :uri

      attr_accessor :cid

      attr_accessor :record

      attr_accessor :lists

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:uri=, hash["uri"])

        instance.send(:cid=, hash["cid"])

        instance.send(:record=, hash["record"])

        instance.send(:lists=, hash["lists"])

        instance
      end
    end
  end

  module AppBskyFeedDefs
    class Interaction
      attr_accessor :item

      attr_accessor :event

      attr_accessor :feedContext

      attr_accessor :reqId

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:item=, hash["item"])

        instance.send(:event=, hash["event"])

        instance.send(:feedContext=, hash["feedContext"])

        instance.send(:reqId=, hash["reqId"])

        instance
      end
    end
  end

  module AppBskyFeedDefs
    class RequestLess
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module AppBskyFeedDefs
    class RequestMore
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module AppBskyFeedDefs
    class ClickthroughItem
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module AppBskyFeedDefs
    class ClickthroughAuthor
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module AppBskyFeedDefs
    class ClickthroughReposter
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module AppBskyFeedDefs
    class ClickthroughEmbed
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module AppBskyFeedDefs
    class ContentModeUnspecified
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module AppBskyFeedDefs
    class ContentModeVideo
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module AppBskyFeedDefs
    class InteractionSeen
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module AppBskyFeedDefs
    class InteractionLike
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module AppBskyFeedDefs
    class InteractionRepost
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module AppBskyFeedDefs
    class InteractionReply
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module AppBskyFeedDefs
    class InteractionQuote
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module AppBskyFeedDefs
    class InteractionShare
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module AppBskyFeedDescribefeedgenerator
    class Feed
      attr_accessor :uri

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:uri=, hash["uri"])

        instance
      end
    end
  end

  module AppBskyFeedDescribefeedgenerator
    class Links
      attr_accessor :privacyPolicy

      attr_accessor :termsOfService

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:privacyPolicy=, hash["privacyPolicy"])

        instance.send(:termsOfService=, hash["termsOfService"])

        instance
      end
    end
  end

  module AppBskyFeedGetlikes
    class Like
      attr_accessor :indexedAt

      attr_accessor :createdAt

      attr_accessor :actor

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:indexedAt=, hash["indexedAt"])

        instance.send(:createdAt=, hash["createdAt"])

        instance.send(:actor=, hash["actor"])

        instance
      end
    end
  end

  module AppBskyFeedPost
    class ReplyRef
      attr_accessor :root

      attr_accessor :parent

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:root=, hash["root"])

        instance.send(:parent=, hash["parent"])

        instance
      end
    end
  end

  module AppBskyFeedPost
    class Entity
      attr_accessor :index

      attr_accessor :value

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:index=, hash["index"])

        instance.send(:value=, hash["value"])

        instance
      end
    end
  end

  module AppBskyFeedPost
    class TextSlice
      attr_accessor :start

      attr_accessor :end

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:start=, hash["start"])

        instance.send(:end=, hash["end"])

        instance
      end
    end
  end

  module AppBskyFeedPostgate
    class DisableRule
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module AppBskyFeedThreadgate
    class MentionRule
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module AppBskyFeedThreadgate
    class FollowerRule
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module AppBskyFeedThreadgate
    class FollowingRule
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module AppBskyFeedThreadgate
    class ListRule
      attr_accessor :list

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:list=, hash["list"])

        instance
      end
    end
  end

  module AppBskyGraphDefs
    class ListViewBasic
      attr_accessor :uri

      attr_accessor :cid

      attr_accessor :name

      attr_accessor :purpose

      attr_accessor :avatar

      attr_accessor :listItemCount

      attr_accessor :labels

      attr_accessor :viewer

      attr_accessor :indexedAt

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:uri=, hash["uri"])

        instance.send(:cid=, hash["cid"])

        instance.send(:name=, hash["name"])

        instance.send(:purpose=, hash["purpose"])

        instance.send(:avatar=, hash["avatar"])

        instance.send(:listItemCount=, hash["listItemCount"])

        instance.send(:labels=, hash["labels"])

        instance.send(:viewer=, hash["viewer"])

        instance.send(:indexedAt=, hash["indexedAt"])

        instance
      end
    end
  end

  module AppBskyGraphDefs
    class ListView
      attr_accessor :uri

      attr_accessor :cid

      attr_accessor :creator

      attr_accessor :name

      attr_accessor :purpose

      attr_accessor :description

      attr_accessor :descriptionFacets

      attr_accessor :avatar

      attr_accessor :listItemCount

      attr_accessor :labels

      attr_accessor :viewer

      attr_accessor :indexedAt

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:uri=, hash["uri"])

        instance.send(:cid=, hash["cid"])

        instance.send(:creator=, hash["creator"])

        instance.send(:name=, hash["name"])

        instance.send(:purpose=, hash["purpose"])

        instance.send(:description=, hash["description"])

        instance.send(:descriptionFacets=, hash["descriptionFacets"])

        instance.send(:avatar=, hash["avatar"])

        instance.send(:listItemCount=, hash["listItemCount"])

        instance.send(:labels=, hash["labels"])

        instance.send(:viewer=, hash["viewer"])

        instance.send(:indexedAt=, hash["indexedAt"])

        instance
      end
    end
  end

  module AppBskyGraphDefs
    class ListItemView
      attr_accessor :uri

      attr_accessor :subject

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:uri=, hash["uri"])

        instance.send(:subject=, hash["subject"])

        instance
      end
    end
  end

  module AppBskyGraphDefs
    class StarterPackView
      attr_accessor :uri

      attr_accessor :cid

      attr_accessor :record

      attr_accessor :creator

      attr_accessor :list

      attr_accessor :listItemsSample

      attr_accessor :feeds

      attr_accessor :joinedWeekCount

      attr_accessor :joinedAllTimeCount

      attr_accessor :labels

      attr_accessor :indexedAt

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:uri=, hash["uri"])

        instance.send(:cid=, hash["cid"])

        instance.send(:record=, hash["record"])

        instance.send(:creator=, hash["creator"])

        instance.send(:list=, hash["list"])

        instance.send(:listItemsSample=, hash["listItemsSample"])

        instance.send(:feeds=, hash["feeds"])

        instance.send(:joinedWeekCount=, hash["joinedWeekCount"])

        instance.send(:joinedAllTimeCount=, hash["joinedAllTimeCount"])

        instance.send(:labels=, hash["labels"])

        instance.send(:indexedAt=, hash["indexedAt"])

        instance
      end
    end
  end

  module AppBskyGraphDefs
    class StarterPackViewBasic
      attr_accessor :uri

      attr_accessor :cid

      attr_accessor :record

      attr_accessor :creator

      attr_accessor :listItemCount

      attr_accessor :joinedWeekCount

      attr_accessor :joinedAllTimeCount

      attr_accessor :labels

      attr_accessor :indexedAt

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:uri=, hash["uri"])

        instance.send(:cid=, hash["cid"])

        instance.send(:record=, hash["record"])

        instance.send(:creator=, hash["creator"])

        instance.send(:listItemCount=, hash["listItemCount"])

        instance.send(:joinedWeekCount=, hash["joinedWeekCount"])

        instance.send(:joinedAllTimeCount=, hash["joinedAllTimeCount"])

        instance.send(:labels=, hash["labels"])

        instance.send(:indexedAt=, hash["indexedAt"])

        instance
      end
    end
  end

  module AppBskyGraphDefs
    class ListPurpose
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module AppBskyGraphDefs
    class Modlist
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module AppBskyGraphDefs
    class Curatelist
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module AppBskyGraphDefs
    class Referencelist
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module AppBskyGraphDefs
    class ListViewerState
      attr_accessor :muted

      attr_accessor :blocked

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:muted=, hash["muted"])

        instance.send(:blocked=, hash["blocked"])

        instance
      end
    end
  end

  module AppBskyGraphDefs
    class NotFoundActor
      attr_accessor :actor

      attr_accessor :notFound

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:actor=, hash["actor"])

        instance.send(:notFound=, hash["notFound"])

        instance
      end
    end
  end

  module AppBskyGraphDefs
    class Relationship
      attr_accessor :did

      attr_accessor :following

      attr_accessor :followedBy

      attr_accessor :blocking

      attr_accessor :blockedBy

      attr_accessor :blockingByList

      attr_accessor :blockedByList

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:did=, hash["did"])

        instance.send(:following=, hash["following"])

        instance.send(:followedBy=, hash["followedBy"])

        instance.send(:blocking=, hash["blocking"])

        instance.send(:blockedBy=, hash["blockedBy"])

        instance.send(:blockingByList=, hash["blockingByList"])

        instance.send(:blockedByList=, hash["blockedByList"])

        instance
      end
    end
  end

  module AppBskyGraphGetlistswithmembership
    class ListWithMembership
      attr_accessor :list

      attr_accessor :listItem

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:list=, hash["list"])

        instance.send(:listItem=, hash["listItem"])

        instance
      end
    end
  end

  module AppBskyGraphGetstarterpackswithmembership
    class StarterPackWithMembership
      attr_accessor :starterPack

      attr_accessor :listItem

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:starterPack=, hash["starterPack"])

        instance.send(:listItem=, hash["listItem"])

        instance
      end
    end
  end

  module AppBskyGraphStarterpack
    class FeedItem
      attr_accessor :uri

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:uri=, hash["uri"])

        instance
      end
    end
  end

  module AppBskyLabelerDefs
    class LabelerView
      attr_accessor :uri

      attr_accessor :cid

      attr_accessor :creator

      attr_accessor :likeCount

      attr_accessor :viewer

      attr_accessor :indexedAt

      attr_accessor :labels

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:uri=, hash["uri"])

        instance.send(:cid=, hash["cid"])

        instance.send(:creator=, hash["creator"])

        instance.send(:likeCount=, hash["likeCount"])

        instance.send(:viewer=, hash["viewer"])

        instance.send(:indexedAt=, hash["indexedAt"])

        instance.send(:labels=, hash["labels"])

        instance
      end
    end
  end

  module AppBskyLabelerDefs
    class LabelerViewDetailed
      attr_accessor :uri

      attr_accessor :cid

      attr_accessor :creator

      attr_accessor :policies

      attr_accessor :likeCount

      attr_accessor :viewer

      attr_accessor :indexedAt

      attr_accessor :labels

      attr_accessor :reasonTypes

      attr_accessor :subjectTypes

      attr_accessor :subjectCollections

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:uri=, hash["uri"])

        instance.send(:cid=, hash["cid"])

        instance.send(:creator=, hash["creator"])

        instance.send(:policies=, hash["policies"])

        instance.send(:likeCount=, hash["likeCount"])

        instance.send(:viewer=, hash["viewer"])

        instance.send(:indexedAt=, hash["indexedAt"])

        instance.send(:labels=, hash["labels"])

        instance.send(:reasonTypes=, hash["reasonTypes"])

        instance.send(:subjectTypes=, hash["subjectTypes"])

        instance.send(:subjectCollections=, hash["subjectCollections"])

        instance
      end
    end
  end

  module AppBskyLabelerDefs
    class LabelerViewerState
      attr_accessor :like

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:like=, hash["like"])

        instance
      end
    end
  end

  module AppBskyLabelerDefs
    class LabelerPolicies
      attr_accessor :labelValues

      attr_accessor :labelValueDefinitions

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:labelValues=, hash["labelValues"])

        instance.send(:labelValueDefinitions=, hash["labelValueDefinitions"])

        instance
      end
    end
  end

  module AppBskyNotificationDefs
    class RecordDeleted
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module AppBskyNotificationDefs
    class ChatPreference
      attr_accessor :include

      attr_accessor :push

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:include=, hash["include"])

        instance.send(:push=, hash["push"])

        instance
      end
    end
  end

  module AppBskyNotificationDefs
    class FilterablePreference
      attr_accessor :include

      attr_accessor :list

      attr_accessor :push

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:include=, hash["include"])

        instance.send(:list=, hash["list"])

        instance.send(:push=, hash["push"])

        instance
      end
    end
  end

  module AppBskyNotificationDefs
    class Preference
      attr_accessor :list

      attr_accessor :push

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:list=, hash["list"])

        instance.send(:push=, hash["push"])

        instance
      end
    end
  end

  module AppBskyNotificationDefs
    class Preferences
      attr_accessor :chat

      attr_accessor :follow

      attr_accessor :like

      attr_accessor :likeViaRepost

      attr_accessor :mention

      attr_accessor :quote

      attr_accessor :reply

      attr_accessor :repost

      attr_accessor :repostViaRepost

      attr_accessor :starterpackJoined

      attr_accessor :subscribedPost

      attr_accessor :unverified

      attr_accessor :verified

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:chat=, hash["chat"])

        instance.send(:follow=, hash["follow"])

        instance.send(:like=, hash["like"])

        instance.send(:likeViaRepost=, hash["likeViaRepost"])

        instance.send(:mention=, hash["mention"])

        instance.send(:quote=, hash["quote"])

        instance.send(:reply=, hash["reply"])

        instance.send(:repost=, hash["repost"])

        instance.send(:repostViaRepost=, hash["repostViaRepost"])

        instance.send(:starterpackJoined=, hash["starterpackJoined"])

        instance.send(:subscribedPost=, hash["subscribedPost"])

        instance.send(:unverified=, hash["unverified"])

        instance.send(:verified=, hash["verified"])

        instance
      end
    end
  end

  module AppBskyNotificationDefs
    class ActivitySubscription
      attr_accessor :post

      attr_accessor :reply

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:post=, hash["post"])

        instance.send(:reply=, hash["reply"])

        instance
      end
    end
  end

  module AppBskyNotificationDefs
    class SubjectActivitySubscription
      attr_accessor :subject

      attr_accessor :activitySubscription

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:subject=, hash["subject"])

        instance.send(:activitySubscription=, hash["activitySubscription"])

        instance
      end
    end
  end

  module AppBskyNotificationListnotifications
    class Notification
      attr_accessor :uri

      attr_accessor :cid

      attr_accessor :author

      attr_accessor :reason

      attr_accessor :reasonSubject

      attr_accessor :record

      attr_accessor :isRead

      attr_accessor :indexedAt

      attr_accessor :labels

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:uri=, hash["uri"])

        instance.send(:cid=, hash["cid"])

        instance.send(:author=, hash["author"])

        instance.send(:reason=, hash["reason"])

        instance.send(:reasonSubject=, hash["reasonSubject"])

        instance.send(:record=, hash["record"])

        instance.send(:isRead=, hash["isRead"])

        instance.send(:indexedAt=, hash["indexedAt"])

        instance.send(:labels=, hash["labels"])

        instance
      end
    end
  end

  module AppBskyRichtextFacet
    class Mention
      attr_accessor :did

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:did=, hash["did"])

        instance
      end
    end
  end

  module AppBskyRichtextFacet
    class Link
      attr_accessor :uri

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:uri=, hash["uri"])

        instance
      end
    end
  end

  module AppBskyRichtextFacet
    class Tag
      attr_accessor :tag

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:tag=, hash["tag"])

        instance
      end
    end
  end

  module AppBskyRichtextFacet
    class ByteSlice
      attr_accessor :byteStart

      attr_accessor :byteEnd

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:byteStart=, hash["byteStart"])

        instance.send(:byteEnd=, hash["byteEnd"])

        instance
      end
    end
  end

  module AppBskyUnspeccedDefs
    class SkeletonSearchPost
      attr_accessor :uri

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:uri=, hash["uri"])

        instance
      end
    end
  end

  module AppBskyUnspeccedDefs
    class SkeletonSearchActor
      attr_accessor :did

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:did=, hash["did"])

        instance
      end
    end
  end

  module AppBskyUnspeccedDefs
    class SkeletonSearchStarterPack
      attr_accessor :uri

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:uri=, hash["uri"])

        instance
      end
    end
  end

  module AppBskyUnspeccedDefs
    class TrendingTopic
      attr_accessor :topic

      attr_accessor :displayName

      attr_accessor :description

      attr_accessor :link

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:topic=, hash["topic"])

        instance.send(:displayName=, hash["displayName"])

        instance.send(:description=, hash["description"])

        instance.send(:link=, hash["link"])

        instance
      end
    end
  end

  module AppBskyUnspeccedDefs
    class SkeletonTrend
      attr_accessor :topic

      attr_accessor :displayName

      attr_accessor :link

      attr_accessor :startedAt

      attr_accessor :postCount

      attr_accessor :status

      attr_accessor :category

      attr_accessor :dids

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:topic=, hash["topic"])

        instance.send(:displayName=, hash["displayName"])

        instance.send(:link=, hash["link"])

        instance.send(:startedAt=, hash["startedAt"])

        instance.send(:postCount=, hash["postCount"])

        instance.send(:status=, hash["status"])

        instance.send(:category=, hash["category"])

        instance.send(:dids=, hash["dids"])

        instance
      end
    end
  end

  module AppBskyUnspeccedDefs
    class TrendView
      attr_accessor :topic

      attr_accessor :displayName

      attr_accessor :link

      attr_accessor :startedAt

      attr_accessor :postCount

      attr_accessor :status

      attr_accessor :category

      attr_accessor :actors

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:topic=, hash["topic"])

        instance.send(:displayName=, hash["displayName"])

        instance.send(:link=, hash["link"])

        instance.send(:startedAt=, hash["startedAt"])

        instance.send(:postCount=, hash["postCount"])

        instance.send(:status=, hash["status"])

        instance.send(:category=, hash["category"])

        instance.send(:actors=, hash["actors"])

        instance
      end
    end
  end

  module AppBskyUnspeccedDefs
    class ThreadItemPost
      attr_accessor :post

      attr_accessor :moreParents

      attr_accessor :moreReplies

      attr_accessor :opThread

      attr_accessor :hiddenByThreadgate

      attr_accessor :mutedByViewer

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:post=, hash["post"])

        instance.send(:moreParents=, hash["moreParents"])

        instance.send(:moreReplies=, hash["moreReplies"])

        instance.send(:opThread=, hash["opThread"])

        instance.send(:hiddenByThreadgate=, hash["hiddenByThreadgate"])

        instance.send(:mutedByViewer=, hash["mutedByViewer"])

        instance
      end
    end
  end

  module AppBskyUnspeccedDefs
    class ThreadItemNoUnauthenticated
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module AppBskyUnspeccedDefs
    class ThreadItemNotFound
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module AppBskyUnspeccedDefs
    class ThreadItemBlocked
      attr_accessor :author

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:author=, hash["author"])

        instance
      end
    end
  end

  module AppBskyUnspeccedDefs
    class AgeAssuranceState
      attr_accessor :lastInitiatedAt

      attr_accessor :status

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:lastInitiatedAt=, hash["lastInitiatedAt"])

        instance.send(:status=, hash["status"])

        instance
      end
    end
  end

  module AppBskyUnspeccedDefs
    class AgeAssuranceEvent
      attr_accessor :createdAt

      attr_accessor :status

      attr_accessor :attemptId

      attr_accessor :email

      attr_accessor :initIp

      attr_accessor :initUa

      attr_accessor :completeIp

      attr_accessor :completeUa

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:createdAt=, hash["createdAt"])

        instance.send(:status=, hash["status"])

        instance.send(:attemptId=, hash["attemptId"])

        instance.send(:email=, hash["email"])

        instance.send(:initIp=, hash["initIp"])

        instance.send(:initUa=, hash["initUa"])

        instance.send(:completeIp=, hash["completeIp"])

        instance.send(:completeUa=, hash["completeUa"])

        instance
      end
    end
  end

  module AppBskyUnspeccedGetconfig
    class LiveNowConfig
      attr_accessor :did

      attr_accessor :domains

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:did=, hash["did"])

        instance.send(:domains=, hash["domains"])

        instance
      end
    end
  end

  module AppBskyUnspeccedGetpostthreadotherv2
    class ThreadItem
      attr_accessor :uri

      attr_accessor :depth

      attr_accessor :value

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:uri=, hash["uri"])

        instance.send(:depth=, hash["depth"])

        instance.send(:value=, hash["value"])

        instance
      end
    end
  end

  module AppBskyUnspeccedGetpostthreadv2
    class ThreadItem
      attr_accessor :uri

      attr_accessor :depth

      attr_accessor :value

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:uri=, hash["uri"])

        instance.send(:depth=, hash["depth"])

        instance.send(:value=, hash["value"])

        instance
      end
    end
  end

  module AppBskyUnspeccedGettaggedsuggestions
    class Suggestion
      attr_accessor :tag

      attr_accessor :subjectType

      attr_accessor :subject

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:tag=, hash["tag"])

        instance.send(:subjectType=, hash["subjectType"])

        instance.send(:subject=, hash["subject"])

        instance
      end
    end
  end

  module AppBskyVideoDefs
    class JobStatus
      attr_accessor :jobId

      attr_accessor :did

      attr_accessor :state

      attr_accessor :progress

      attr_accessor :blob

      attr_accessor :error

      attr_accessor :message

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:jobId=, hash["jobId"])

        instance.send(:did=, hash["did"])

        instance.send(:state=, hash["state"])

        instance.send(:progress=, hash["progress"])

        instance.send(:blob=, hash["blob"])

        instance.send(:error=, hash["error"])

        instance.send(:message=, hash["message"])

        instance
      end
    end
  end

  module ChatBskyActorDefs
    class MemberRole
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ChatBskyActorDefs
    class ProfileViewBasic
      attr_accessor :did

      attr_accessor :handle

      attr_accessor :displayName

      attr_accessor :avatar

      attr_accessor :associated

      attr_accessor :viewer

      attr_accessor :labels

      attr_accessor :createdAt

      attr_accessor :chatDisabled

      attr_accessor :verification

      attr_accessor :kind

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:did=, hash["did"])

        instance.send(:handle=, hash["handle"])

        instance.send(:displayName=, hash["displayName"])

        instance.send(:avatar=, hash["avatar"])

        instance.send(:associated=, hash["associated"])

        instance.send(:viewer=, hash["viewer"])

        instance.send(:labels=, hash["labels"])

        instance.send(:createdAt=, hash["createdAt"])

        instance.send(:chatDisabled=, hash["chatDisabled"])

        instance.send(:verification=, hash["verification"])

        instance.send(:kind=, hash["kind"])

        instance
      end
    end
  end

  module ChatBskyActorDefs
    class DirectConvoMember
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ChatBskyActorDefs
    class GroupConvoMember
      attr_accessor :addedBy

      attr_accessor :role

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:addedBy=, hash["addedBy"])

        instance.send(:role=, hash["role"])

        instance
      end
    end
  end

  module ChatBskyActorDefs
    class PastGroupConvoMember
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ChatBskyConvoDefs
    class ConvoKind
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ChatBskyConvoDefs
    class ConvoLockStatus
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ChatBskyConvoDefs
    class ConvoStatus
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ChatBskyConvoDefs
    class ConvoRef
      attr_accessor :did

      attr_accessor :convoId

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:did=, hash["did"])

        instance.send(:convoId=, hash["convoId"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class MessageRef
      attr_accessor :did

      attr_accessor :convoId

      attr_accessor :messageId

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:did=, hash["did"])

        instance.send(:convoId=, hash["convoId"])

        instance.send(:messageId=, hash["messageId"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class MessageInput
      attr_accessor :text

      attr_accessor :facets

      attr_accessor :embed

      attr_accessor :replyTo

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:text=, hash["text"])

        instance.send(:facets=, hash["facets"])

        instance.send(:embed=, hash["embed"])

        instance.send(:replyTo=, hash["replyTo"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class ReplyRef
      attr_accessor :messageId

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:messageId=, hash["messageId"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class MessageView
      attr_accessor :id

      attr_accessor :rev

      attr_accessor :text

      attr_accessor :facets

      attr_accessor :embed

      attr_accessor :reactions

      attr_accessor :replyTo

      attr_accessor :sender

      attr_accessor :sentAt

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:id=, hash["id"])

        instance.send(:rev=, hash["rev"])

        instance.send(:text=, hash["text"])

        instance.send(:facets=, hash["facets"])

        instance.send(:embed=, hash["embed"])

        instance.send(:reactions=, hash["reactions"])

        instance.send(:replyTo=, hash["replyTo"])

        instance.send(:sender=, hash["sender"])

        instance.send(:sentAt=, hash["sentAt"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class SystemMessageReferredUser
      attr_accessor :did

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:did=, hash["did"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class SystemMessageView
      attr_accessor :id

      attr_accessor :rev

      attr_accessor :sentAt

      attr_accessor :data

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:id=, hash["id"])

        instance.send(:rev=, hash["rev"])

        instance.send(:sentAt=, hash["sentAt"])

        instance.send(:data=, hash["data"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class SystemMessageDataAddMember
      attr_accessor :member

      attr_accessor :role

      attr_accessor :addedBy

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:member=, hash["member"])

        instance.send(:role=, hash["role"])

        instance.send(:addedBy=, hash["addedBy"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class SystemMessageDataRemoveMember
      attr_accessor :member

      attr_accessor :removedBy

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:member=, hash["member"])

        instance.send(:removedBy=, hash["removedBy"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class SystemMessageDataMemberJoin
      attr_accessor :member

      attr_accessor :role

      attr_accessor :approvedBy

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:member=, hash["member"])

        instance.send(:role=, hash["role"])

        instance.send(:approvedBy=, hash["approvedBy"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class SystemMessageDataMemberLeave
      attr_accessor :member

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:member=, hash["member"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class SystemMessageDataLockConvo
      attr_accessor :lockedBy

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:lockedBy=, hash["lockedBy"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class SystemMessageDataUnlockConvo
      attr_accessor :unlockedBy

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:unlockedBy=, hash["unlockedBy"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class SystemMessageDataLockConvoPermanently
      attr_accessor :lockedBy

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:lockedBy=, hash["lockedBy"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class SystemMessageDataEditGroup
      attr_accessor :oldName

      attr_accessor :newName

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:oldName=, hash["oldName"])

        instance.send(:newName=, hash["newName"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class SystemMessageDataCreateJoinLink
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ChatBskyConvoDefs
    class SystemMessageDataEditJoinLink
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ChatBskyConvoDefs
    class SystemMessageDataEnableJoinLink
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ChatBskyConvoDefs
    class SystemMessageDataDisableJoinLink
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ChatBskyConvoDefs
    class DeletedMessageView
      attr_accessor :id

      attr_accessor :rev

      attr_accessor :sender

      attr_accessor :sentAt

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:id=, hash["id"])

        instance.send(:rev=, hash["rev"])

        instance.send(:sender=, hash["sender"])

        instance.send(:sentAt=, hash["sentAt"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class MessageBeforeUserJoinedGroupView
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ChatBskyConvoDefs
    class MessageViewSender
      attr_accessor :did

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:did=, hash["did"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class ReactionView
      attr_accessor :value

      attr_accessor :sender

      attr_accessor :createdAt

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:value=, hash["value"])

        instance.send(:sender=, hash["sender"])

        instance.send(:createdAt=, hash["createdAt"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class ReactionViewSender
      attr_accessor :did

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:did=, hash["did"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class MessageAndReactionView
      attr_accessor :message

      attr_accessor :reaction

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:message=, hash["message"])

        instance.send(:reaction=, hash["reaction"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class ConvoView
      attr_accessor :id

      attr_accessor :rev

      attr_accessor :members

      attr_accessor :lastMessage

      attr_accessor :lastReaction

      attr_accessor :muted

      attr_accessor :status

      attr_accessor :unreadCount

      attr_accessor :kind

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:id=, hash["id"])

        instance.send(:rev=, hash["rev"])

        instance.send(:members=, hash["members"])

        instance.send(:lastMessage=, hash["lastMessage"])

        instance.send(:lastReaction=, hash["lastReaction"])

        instance.send(:muted=, hash["muted"])

        instance.send(:status=, hash["status"])

        instance.send(:unreadCount=, hash["unreadCount"])

        instance.send(:kind=, hash["kind"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class DirectConvo
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ChatBskyConvoDefs
    class GroupConvo
      attr_accessor :createdAt

      attr_accessor :joinLink

      attr_accessor :joinRequestCount

      attr_accessor :lockStatus

      attr_accessor :lockStatusModerationOverride

      attr_accessor :memberCount

      attr_accessor :memberLimit

      attr_accessor :name

      attr_accessor :unreadJoinRequestCount

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:createdAt=, hash["createdAt"])

        instance.send(:joinLink=, hash["joinLink"])

        instance.send(:joinRequestCount=, hash["joinRequestCount"])

        instance.send(:lockStatus=, hash["lockStatus"])

        instance.send(:lockStatusModerationOverride=, hash["lockStatusModerationOverride"])

        instance.send(:memberCount=, hash["memberCount"])

        instance.send(:memberLimit=, hash["memberLimit"])

        instance.send(:name=, hash["name"])

        instance.send(:unreadJoinRequestCount=, hash["unreadJoinRequestCount"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class LogBeginConvo
      attr_accessor :rev

      attr_accessor :convoId

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:rev=, hash["rev"])

        instance.send(:convoId=, hash["convoId"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class LogAcceptConvo
      attr_accessor :rev

      attr_accessor :convoId

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:rev=, hash["rev"])

        instance.send(:convoId=, hash["convoId"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class LogLeaveConvo
      attr_accessor :rev

      attr_accessor :convoId

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:rev=, hash["rev"])

        instance.send(:convoId=, hash["convoId"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class LogMuteConvo
      attr_accessor :rev

      attr_accessor :convoId

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:rev=, hash["rev"])

        instance.send(:convoId=, hash["convoId"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class LogUnmuteConvo
      attr_accessor :rev

      attr_accessor :convoId

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:rev=, hash["rev"])

        instance.send(:convoId=, hash["convoId"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class LogCreateMessage
      attr_accessor :rev

      attr_accessor :convoId

      attr_accessor :message

      attr_accessor :relatedProfiles

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:rev=, hash["rev"])

        instance.send(:convoId=, hash["convoId"])

        instance.send(:message=, hash["message"])

        instance.send(:relatedProfiles=, hash["relatedProfiles"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class LogDeleteMessage
      attr_accessor :rev

      attr_accessor :convoId

      attr_accessor :message

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:rev=, hash["rev"])

        instance.send(:convoId=, hash["convoId"])

        instance.send(:message=, hash["message"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class LogReadMessage
      attr_accessor :rev

      attr_accessor :convoId

      attr_accessor :message

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:rev=, hash["rev"])

        instance.send(:convoId=, hash["convoId"])

        instance.send(:message=, hash["message"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class LogAddReaction
      attr_accessor :rev

      attr_accessor :convoId

      attr_accessor :message

      attr_accessor :reaction

      attr_accessor :relatedProfiles

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:rev=, hash["rev"])

        instance.send(:convoId=, hash["convoId"])

        instance.send(:message=, hash["message"])

        instance.send(:reaction=, hash["reaction"])

        instance.send(:relatedProfiles=, hash["relatedProfiles"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class LogRemoveReaction
      attr_accessor :rev

      attr_accessor :convoId

      attr_accessor :message

      attr_accessor :reaction

      attr_accessor :relatedProfiles

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:rev=, hash["rev"])

        instance.send(:convoId=, hash["convoId"])

        instance.send(:message=, hash["message"])

        instance.send(:reaction=, hash["reaction"])

        instance.send(:relatedProfiles=, hash["relatedProfiles"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class LogReadConvo
      attr_accessor :rev

      attr_accessor :convoId

      attr_accessor :message

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:rev=, hash["rev"])

        instance.send(:convoId=, hash["convoId"])

        instance.send(:message=, hash["message"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class LogAddMember
      attr_accessor :rev

      attr_accessor :convoId

      attr_accessor :message

      attr_accessor :relatedProfiles

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:rev=, hash["rev"])

        instance.send(:convoId=, hash["convoId"])

        instance.send(:message=, hash["message"])

        instance.send(:relatedProfiles=, hash["relatedProfiles"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class LogRemoveMember
      attr_accessor :rev

      attr_accessor :convoId

      attr_accessor :message

      attr_accessor :relatedProfiles

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:rev=, hash["rev"])

        instance.send(:convoId=, hash["convoId"])

        instance.send(:message=, hash["message"])

        instance.send(:relatedProfiles=, hash["relatedProfiles"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class LogMemberJoin
      attr_accessor :rev

      attr_accessor :convoId

      attr_accessor :message

      attr_accessor :relatedProfiles

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:rev=, hash["rev"])

        instance.send(:convoId=, hash["convoId"])

        instance.send(:message=, hash["message"])

        instance.send(:relatedProfiles=, hash["relatedProfiles"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class LogMemberLeave
      attr_accessor :rev

      attr_accessor :convoId

      attr_accessor :message

      attr_accessor :relatedProfiles

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:rev=, hash["rev"])

        instance.send(:convoId=, hash["convoId"])

        instance.send(:message=, hash["message"])

        instance.send(:relatedProfiles=, hash["relatedProfiles"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class LogLockConvo
      attr_accessor :rev

      attr_accessor :convoId

      attr_accessor :message

      attr_accessor :relatedProfiles

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:rev=, hash["rev"])

        instance.send(:convoId=, hash["convoId"])

        instance.send(:message=, hash["message"])

        instance.send(:relatedProfiles=, hash["relatedProfiles"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class LogUnlockConvo
      attr_accessor :rev

      attr_accessor :convoId

      attr_accessor :message

      attr_accessor :relatedProfiles

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:rev=, hash["rev"])

        instance.send(:convoId=, hash["convoId"])

        instance.send(:message=, hash["message"])

        instance.send(:relatedProfiles=, hash["relatedProfiles"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class LogLockConvoPermanently
      attr_accessor :rev

      attr_accessor :convoId

      attr_accessor :message

      attr_accessor :relatedProfiles

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:rev=, hash["rev"])

        instance.send(:convoId=, hash["convoId"])

        instance.send(:message=, hash["message"])

        instance.send(:relatedProfiles=, hash["relatedProfiles"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class LogEditGroup
      attr_accessor :rev

      attr_accessor :convoId

      attr_accessor :message

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:rev=, hash["rev"])

        instance.send(:convoId=, hash["convoId"])

        instance.send(:message=, hash["message"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class LogCreateJoinLink
      attr_accessor :rev

      attr_accessor :convoId

      attr_accessor :message

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:rev=, hash["rev"])

        instance.send(:convoId=, hash["convoId"])

        instance.send(:message=, hash["message"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class LogEditJoinLink
      attr_accessor :rev

      attr_accessor :convoId

      attr_accessor :message

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:rev=, hash["rev"])

        instance.send(:convoId=, hash["convoId"])

        instance.send(:message=, hash["message"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class LogEnableJoinLink
      attr_accessor :rev

      attr_accessor :convoId

      attr_accessor :message

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:rev=, hash["rev"])

        instance.send(:convoId=, hash["convoId"])

        instance.send(:message=, hash["message"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class LogDisableJoinLink
      attr_accessor :rev

      attr_accessor :convoId

      attr_accessor :message

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:rev=, hash["rev"])

        instance.send(:convoId=, hash["convoId"])

        instance.send(:message=, hash["message"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class LogIncomingJoinRequest
      attr_accessor :rev

      attr_accessor :convoId

      attr_accessor :member

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:rev=, hash["rev"])

        instance.send(:convoId=, hash["convoId"])

        instance.send(:member=, hash["member"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class LogApproveJoinRequest
      attr_accessor :rev

      attr_accessor :convoId

      attr_accessor :member

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:rev=, hash["rev"])

        instance.send(:convoId=, hash["convoId"])

        instance.send(:member=, hash["member"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class LogRejectJoinRequest
      attr_accessor :rev

      attr_accessor :convoId

      attr_accessor :member

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:rev=, hash["rev"])

        instance.send(:convoId=, hash["convoId"])

        instance.send(:member=, hash["member"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class LogOutgoingJoinRequest
      attr_accessor :rev

      attr_accessor :convoId

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:rev=, hash["rev"])

        instance.send(:convoId=, hash["convoId"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class LogWithdrawIncomingJoinRequest
      attr_accessor :rev

      attr_accessor :convoId

      attr_accessor :member

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:rev=, hash["rev"])

        instance.send(:convoId=, hash["convoId"])

        instance.send(:member=, hash["member"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class LogWithdrawOutgoingJoinRequest
      attr_accessor :rev

      attr_accessor :convoId

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:rev=, hash["rev"])

        instance.send(:convoId=, hash["convoId"])

        instance
      end
    end
  end

  module ChatBskyConvoDefs
    class LogReadJoinRequests
      attr_accessor :rev

      attr_accessor :convoId

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:rev=, hash["rev"])

        instance.send(:convoId=, hash["convoId"])

        instance
      end
    end
  end

  module ChatBskyConvoSendmessagebatch
    class BatchItem
      attr_accessor :convoId

      attr_accessor :message

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:convoId=, hash["convoId"])

        instance.send(:message=, hash["message"])

        instance
      end
    end
  end

  module ChatBskyEmbedJoinlink
    class View
      attr_accessor :joinLinkPreview

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:joinLinkPreview=, hash["joinLinkPreview"])

        instance
      end
    end
  end

  module ChatBskyGroupDefs
    class LinkEnabledStatus
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ChatBskyGroupDefs
    class JoinRule
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ChatBskyGroupDefs
    class JoinLinkView
      attr_accessor :code

      attr_accessor :enabledStatus

      attr_accessor :requireApproval

      attr_accessor :joinRule

      attr_accessor :createdAt

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:code=, hash["code"])

        instance.send(:enabledStatus=, hash["enabledStatus"])

        instance.send(:requireApproval=, hash["requireApproval"])

        instance.send(:joinRule=, hash["joinRule"])

        instance.send(:createdAt=, hash["createdAt"])

        instance
      end
    end
  end

  module ChatBskyGroupDefs
    class JoinLinkPreviewView
      attr_accessor :convoId

      attr_accessor :code

      attr_accessor :name

      attr_accessor :owner

      attr_accessor :memberCount

      attr_accessor :memberLimit

      attr_accessor :requireApproval

      attr_accessor :joinRule

      attr_accessor :convo

      attr_accessor :viewer

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:convoId=, hash["convoId"])

        instance.send(:code=, hash["code"])

        instance.send(:name=, hash["name"])

        instance.send(:owner=, hash["owner"])

        instance.send(:memberCount=, hash["memberCount"])

        instance.send(:memberLimit=, hash["memberLimit"])

        instance.send(:requireApproval=, hash["requireApproval"])

        instance.send(:joinRule=, hash["joinRule"])

        instance.send(:convo=, hash["convo"])

        instance.send(:viewer=, hash["viewer"])

        instance
      end
    end
  end

  module ChatBskyGroupDefs
    class DisabledJoinLinkPreviewView
      attr_accessor :code

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:code=, hash["code"])

        instance
      end
    end
  end

  module ChatBskyGroupDefs
    class InvalidJoinLinkPreviewView
      attr_accessor :code

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:code=, hash["code"])

        instance
      end
    end
  end

  module ChatBskyGroupDefs
    class JoinLinkViewerState
      attr_accessor :requestedAt

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:requestedAt=, hash["requestedAt"])

        instance
      end
    end
  end

  module ChatBskyGroupDefs
    class JoinRequestView
      attr_accessor :convoId

      attr_accessor :requestedBy

      attr_accessor :requestedAt

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:convoId=, hash["convoId"])

        instance.send(:requestedBy=, hash["requestedBy"])

        instance.send(:requestedAt=, hash["requestedAt"])

        instance
      end
    end
  end

  module ChatBskyGroupDefs
    class JoinRequestConvoView
      attr_accessor :convoId

      attr_accessor :name

      attr_accessor :owner

      attr_accessor :memberCount

      attr_accessor :memberLimit

      attr_accessor :viewer

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:convoId=, hash["convoId"])

        instance.send(:name=, hash["name"])

        instance.send(:owner=, hash["owner"])

        instance.send(:memberCount=, hash["memberCount"])

        instance.send(:memberLimit=, hash["memberLimit"])

        instance.send(:viewer=, hash["viewer"])

        instance
      end
    end
  end

  module ChatBskyModerationDefs
    class ConvoView
      attr_accessor :id

      attr_accessor :rev

      attr_accessor :kind

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:id=, hash["id"])

        instance.send(:rev=, hash["rev"])

        instance.send(:kind=, hash["kind"])

        instance
      end
    end
  end

  module ChatBskyModerationDefs
    class DirectConvo
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ChatBskyModerationDefs
    class GroupConvo
      attr_accessor :createdAt

      attr_accessor :joinLink

      attr_accessor :joinRequestCount

      attr_accessor :lockStatus

      attr_accessor :memberCount

      attr_accessor :memberLimit

      attr_accessor :name

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:createdAt=, hash["createdAt"])

        instance.send(:joinLink=, hash["joinLink"])

        instance.send(:joinRequestCount=, hash["joinRequestCount"])

        instance.send(:lockStatus=, hash["lockStatus"])

        instance.send(:memberCount=, hash["memberCount"])

        instance.send(:memberLimit=, hash["memberLimit"])

        instance.send(:name=, hash["name"])

        instance
      end
    end
  end

  module ChatBskyModerationGetactormetadata
    class Metadata
      attr_accessor :messagesSent

      attr_accessor :messagesReceived

      attr_accessor :convos

      attr_accessor :convosStarted

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:messagesSent=, hash["messagesSent"])

        instance.send(:messagesReceived=, hash["messagesReceived"])

        instance.send(:convos=, hash["convos"])

        instance.send(:convosStarted=, hash["convosStarted"])

        instance
      end
    end
  end

  module ChatBskyModerationSubscribemodevents
    class EventConvoFirstMessage
      attr_accessor :convoId

      attr_accessor :createdAt

      attr_accessor :messageId

      attr_accessor :recipients

      attr_accessor :rev

      attr_accessor :user

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:convoId=, hash["convoId"])

        instance.send(:createdAt=, hash["createdAt"])

        instance.send(:messageId=, hash["messageId"])

        instance.send(:recipients=, hash["recipients"])

        instance.send(:rev=, hash["rev"])

        instance.send(:user=, hash["user"])

        instance
      end
    end
  end

  module ChatBskyModerationSubscribemodevents
    class EventGroupChatCreated
      attr_accessor :actorDid

      attr_accessor :convoCreatedAt

      attr_accessor :convoId

      attr_accessor :createdAt

      attr_accessor :groupMemberCount

      attr_accessor :groupName

      attr_accessor :initialMemberDids

      attr_accessor :ownerDid

      attr_accessor :rev

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:actorDid=, hash["actorDid"])

        instance.send(:convoCreatedAt=, hash["convoCreatedAt"])

        instance.send(:convoId=, hash["convoId"])

        instance.send(:createdAt=, hash["createdAt"])

        instance.send(:groupMemberCount=, hash["groupMemberCount"])

        instance.send(:groupName=, hash["groupName"])

        instance.send(:initialMemberDids=, hash["initialMemberDids"])

        instance.send(:ownerDid=, hash["ownerDid"])

        instance.send(:rev=, hash["rev"])

        instance
      end
    end
  end

  module ChatBskyModerationSubscribemodevents
    class EventGroupChatMemberAdded
      attr_accessor :actorDid

      attr_accessor :convoCreatedAt

      attr_accessor :convoId

      attr_accessor :createdAt

      attr_accessor :groupMemberCount

      attr_accessor :groupName

      attr_accessor :ownerDid

      attr_accessor :requestMembersCount

      attr_accessor :rev

      attr_accessor :subjectDid

      attr_accessor :subjectFollowsOwner

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:actorDid=, hash["actorDid"])

        instance.send(:convoCreatedAt=, hash["convoCreatedAt"])

        instance.send(:convoId=, hash["convoId"])

        instance.send(:createdAt=, hash["createdAt"])

        instance.send(:groupMemberCount=, hash["groupMemberCount"])

        instance.send(:groupName=, hash["groupName"])

        instance.send(:ownerDid=, hash["ownerDid"])

        instance.send(:requestMembersCount=, hash["requestMembersCount"])

        instance.send(:rev=, hash["rev"])

        instance.send(:subjectDid=, hash["subjectDid"])

        instance.send(:subjectFollowsOwner=, hash["subjectFollowsOwner"])

        instance
      end
    end
  end

  module ChatBskyModerationSubscribemodevents
    class EventGroupChatMemberJoined
      attr_accessor :actorDid

      attr_accessor :convoCreatedAt

      attr_accessor :convoId

      attr_accessor :createdAt

      attr_accessor :groupMemberCount

      attr_accessor :groupName

      attr_accessor :joinLinkCode

      attr_accessor :ownerDid

      attr_accessor :rev

      attr_accessor :subjectFollowsOwner

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:actorDid=, hash["actorDid"])

        instance.send(:convoCreatedAt=, hash["convoCreatedAt"])

        instance.send(:convoId=, hash["convoId"])

        instance.send(:createdAt=, hash["createdAt"])

        instance.send(:groupMemberCount=, hash["groupMemberCount"])

        instance.send(:groupName=, hash["groupName"])

        instance.send(:joinLinkCode=, hash["joinLinkCode"])

        instance.send(:ownerDid=, hash["ownerDid"])

        instance.send(:rev=, hash["rev"])

        instance.send(:subjectFollowsOwner=, hash["subjectFollowsOwner"])

        instance
      end
    end
  end

  module ChatBskyModerationSubscribemodevents
    class EventGroupChatJoinRequest
      attr_accessor :actorDid

      attr_accessor :convoCreatedAt

      attr_accessor :convoId

      attr_accessor :createdAt

      attr_accessor :groupMemberCount

      attr_accessor :groupName

      attr_accessor :joinLinkCode

      attr_accessor :ownerDid

      attr_accessor :rev

      attr_accessor :subjectFollowsOwner

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:actorDid=, hash["actorDid"])

        instance.send(:convoCreatedAt=, hash["convoCreatedAt"])

        instance.send(:convoId=, hash["convoId"])

        instance.send(:createdAt=, hash["createdAt"])

        instance.send(:groupMemberCount=, hash["groupMemberCount"])

        instance.send(:groupName=, hash["groupName"])

        instance.send(:joinLinkCode=, hash["joinLinkCode"])

        instance.send(:ownerDid=, hash["ownerDid"])

        instance.send(:rev=, hash["rev"])

        instance.send(:subjectFollowsOwner=, hash["subjectFollowsOwner"])

        instance
      end
    end
  end

  module ChatBskyModerationSubscribemodevents
    class EventGroupChatJoinRequestApproved
      attr_accessor :actorDid

      attr_accessor :convoCreatedAt

      attr_accessor :convoId

      attr_accessor :createdAt

      attr_accessor :groupMemberCount

      attr_accessor :groupName

      attr_accessor :ownerDid

      attr_accessor :rev

      attr_accessor :subjectDid

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:actorDid=, hash["actorDid"])

        instance.send(:convoCreatedAt=, hash["convoCreatedAt"])

        instance.send(:convoId=, hash["convoId"])

        instance.send(:createdAt=, hash["createdAt"])

        instance.send(:groupMemberCount=, hash["groupMemberCount"])

        instance.send(:groupName=, hash["groupName"])

        instance.send(:ownerDid=, hash["ownerDid"])

        instance.send(:rev=, hash["rev"])

        instance.send(:subjectDid=, hash["subjectDid"])

        instance
      end
    end
  end

  module ChatBskyModerationSubscribemodevents
    class EventGroupChatJoinRequestRejected
      attr_accessor :actorDid

      attr_accessor :convoCreatedAt

      attr_accessor :convoId

      attr_accessor :createdAt

      attr_accessor :groupMemberCount

      attr_accessor :groupName

      attr_accessor :ownerDid

      attr_accessor :rev

      attr_accessor :subjectDid

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:actorDid=, hash["actorDid"])

        instance.send(:convoCreatedAt=, hash["convoCreatedAt"])

        instance.send(:convoId=, hash["convoId"])

        instance.send(:createdAt=, hash["createdAt"])

        instance.send(:groupMemberCount=, hash["groupMemberCount"])

        instance.send(:groupName=, hash["groupName"])

        instance.send(:ownerDid=, hash["ownerDid"])

        instance.send(:rev=, hash["rev"])

        instance.send(:subjectDid=, hash["subjectDid"])

        instance
      end
    end
  end

  module ChatBskyModerationSubscribemodevents
    class EventChatAccepted
      attr_accessor :actorDid

      attr_accessor :convoCreatedAt

      attr_accessor :convoId

      attr_accessor :createdAt

      attr_accessor :groupMemberCount

      attr_accessor :groupName

      attr_accessor :method

      attr_accessor :ownerDid

      attr_accessor :rev

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:actorDid=, hash["actorDid"])

        instance.send(:convoCreatedAt=, hash["convoCreatedAt"])

        instance.send(:convoId=, hash["convoId"])

        instance.send(:createdAt=, hash["createdAt"])

        instance.send(:groupMemberCount=, hash["groupMemberCount"])

        instance.send(:groupName=, hash["groupName"])

        instance.send(:method=, hash["method"])

        instance.send(:ownerDid=, hash["ownerDid"])

        instance.send(:rev=, hash["rev"])

        instance
      end
    end
  end

  module ChatBskyModerationSubscribemodevents
    class EventGroupChatMemberLeft
      attr_accessor :actorDid

      attr_accessor :convoCreatedAt

      attr_accessor :convoId

      attr_accessor :createdAt

      attr_accessor :groupMemberCount

      attr_accessor :groupName

      attr_accessor :leaveMethod

      attr_accessor :ownerDid

      attr_accessor :rev

      attr_accessor :subjectDid

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:actorDid=, hash["actorDid"])

        instance.send(:convoCreatedAt=, hash["convoCreatedAt"])

        instance.send(:convoId=, hash["convoId"])

        instance.send(:createdAt=, hash["createdAt"])

        instance.send(:groupMemberCount=, hash["groupMemberCount"])

        instance.send(:groupName=, hash["groupName"])

        instance.send(:leaveMethod=, hash["leaveMethod"])

        instance.send(:ownerDid=, hash["ownerDid"])

        instance.send(:rev=, hash["rev"])

        instance.send(:subjectDid=, hash["subjectDid"])

        instance
      end
    end
  end

  module ChatBskyModerationSubscribemodevents
    class EventGroupChatUpdated
      attr_accessor :actorDid

      attr_accessor :convoCreatedAt

      attr_accessor :convoId

      attr_accessor :createdAt

      attr_accessor :groupMemberCount

      attr_accessor :groupName

      attr_accessor :joinLinkCode

      attr_accessor :joinLinkFollowersOnly

      attr_accessor :joinLinkRequiresApproval

      attr_accessor :lockReason

      attr_accessor :newName

      attr_accessor :oldName

      attr_accessor :ownerDid

      attr_accessor :rev

      attr_accessor :updateType

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:actorDid=, hash["actorDid"])

        instance.send(:convoCreatedAt=, hash["convoCreatedAt"])

        instance.send(:convoId=, hash["convoId"])

        instance.send(:createdAt=, hash["createdAt"])

        instance.send(:groupMemberCount=, hash["groupMemberCount"])

        instance.send(:groupName=, hash["groupName"])

        instance.send(:joinLinkCode=, hash["joinLinkCode"])

        instance.send(:joinLinkFollowersOnly=, hash["joinLinkFollowersOnly"])

        instance.send(:joinLinkRequiresApproval=, hash["joinLinkRequiresApproval"])

        instance.send(:lockReason=, hash["lockReason"])

        instance.send(:newName=, hash["newName"])

        instance.send(:oldName=, hash["oldName"])

        instance.send(:ownerDid=, hash["ownerDid"])

        instance.send(:rev=, hash["rev"])

        instance.send(:updateType=, hash["updateType"])

        instance
      end
    end
  end

  module ChatBskyModerationSubscribemodevents
    class EventRateLimitExceeded
      attr_accessor :actorDid

      attr_accessor :createdAt

      attr_accessor :endpoint

      attr_accessor :rev

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:actorDid=, hash["actorDid"])

        instance.send(:createdAt=, hash["createdAt"])

        instance.send(:endpoint=, hash["endpoint"])

        instance.send(:rev=, hash["rev"])

        instance
      end
    end
  end

  module ChatBskyNotificationDefs
    class Preferences
      attr_accessor :chat

      attr_accessor :chatRequest

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:chat=, hash["chat"])

        instance.send(:chatRequest=, hash["chatRequest"])

        instance
      end
    end
  end

  module ChatBskyNotificationDefs
    class ChatPreference
      attr_accessor :include

      attr_accessor :push

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:include=, hash["include"])

        instance.send(:push=, hash["push"])

        instance
      end
    end
  end

  module ComAtprotoAdminDefs
    class StatusAttr
      attr_accessor :applied

      attr_accessor :ref

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:applied=, hash["applied"])

        instance.send(:ref=, hash["ref"])

        instance
      end
    end
  end

  module ComAtprotoAdminDefs
    class AccountView
      attr_accessor :did

      attr_accessor :handle

      attr_accessor :email

      attr_accessor :relatedRecords

      attr_accessor :indexedAt

      attr_accessor :invitedBy

      attr_accessor :invites

      attr_accessor :invitesDisabled

      attr_accessor :emailConfirmedAt

      attr_accessor :inviteNote

      attr_accessor :deactivatedAt

      attr_accessor :threatSignatures

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:did=, hash["did"])

        instance.send(:handle=, hash["handle"])

        instance.send(:email=, hash["email"])

        instance.send(:relatedRecords=, hash["relatedRecords"])

        instance.send(:indexedAt=, hash["indexedAt"])

        instance.send(:invitedBy=, hash["invitedBy"])

        instance.send(:invites=, hash["invites"])

        instance.send(:invitesDisabled=, hash["invitesDisabled"])

        instance.send(:emailConfirmedAt=, hash["emailConfirmedAt"])

        instance.send(:inviteNote=, hash["inviteNote"])

        instance.send(:deactivatedAt=, hash["deactivatedAt"])

        instance.send(:threatSignatures=, hash["threatSignatures"])

        instance
      end
    end
  end

  module ComAtprotoAdminDefs
    class RepoRef
      attr_accessor :did

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:did=, hash["did"])

        instance
      end
    end
  end

  module ComAtprotoAdminDefs
    class RepoBlobRef
      attr_accessor :did

      attr_accessor :cid

      attr_accessor :recordUri

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:did=, hash["did"])

        instance.send(:cid=, hash["cid"])

        instance.send(:recordUri=, hash["recordUri"])

        instance
      end
    end
  end

  module ComAtprotoAdminDefs
    class ThreatSignature
      attr_accessor :property

      attr_accessor :value

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:property=, hash["property"])

        instance.send(:value=, hash["value"])

        instance
      end
    end
  end

  module ComAtprotoIdentityDefs
    class IdentityInfo
      attr_accessor :did

      attr_accessor :handle

      attr_accessor :didDoc

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:did=, hash["did"])

        instance.send(:handle=, hash["handle"])

        instance.send(:didDoc=, hash["didDoc"])

        instance
      end
    end
  end

  module ComAtprotoLabelDefs
    class Label
      attr_accessor :ver

      attr_accessor :src

      attr_accessor :uri

      attr_accessor :cid

      attr_accessor :val

      attr_accessor :neg

      attr_accessor :cts

      attr_accessor :exp

      attr_accessor :sig

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:ver=, hash["ver"])

        instance.send(:src=, hash["src"])

        instance.send(:uri=, hash["uri"])

        instance.send(:cid=, hash["cid"])

        instance.send(:val=, hash["val"])

        instance.send(:neg=, hash["neg"])

        instance.send(:cts=, hash["cts"])

        instance.send(:exp=, hash["exp"])

        instance.send(:sig=, hash["sig"])

        instance
      end
    end
  end

  module ComAtprotoLabelDefs
    class SelfLabels
      attr_accessor :values

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:values=, hash["values"])

        instance
      end
    end
  end

  module ComAtprotoLabelDefs
    class SelfLabel
      attr_accessor :val

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:val=, hash["val"])

        instance
      end
    end
  end

  module ComAtprotoLabelDefs
    class LabelValueDefinition
      attr_accessor :identifier

      attr_accessor :severity

      attr_accessor :blurs

      attr_accessor :defaultSetting

      attr_accessor :adultOnly

      attr_accessor :locales

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:identifier=, hash["identifier"])

        instance.send(:severity=, hash["severity"])

        instance.send(:blurs=, hash["blurs"])

        instance.send(:defaultSetting=, hash["defaultSetting"])

        instance.send(:adultOnly=, hash["adultOnly"])

        instance.send(:locales=, hash["locales"])

        instance
      end
    end
  end

  module ComAtprotoLabelDefs
    class LabelValueDefinitionStrings
      attr_accessor :lang

      attr_accessor :name

      attr_accessor :description

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:lang=, hash["lang"])

        instance.send(:name=, hash["name"])

        instance.send(:description=, hash["description"])

        instance
      end
    end
  end

  module ComAtprotoLabelDefs
    class LabelValue
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ComAtprotoLabelSubscribelabels
    class Labels
      attr_accessor :seq

      attr_accessor :labels

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:seq=, hash["seq"])

        instance.send(:labels=, hash["labels"])

        instance
      end
    end
  end

  module ComAtprotoLabelSubscribelabels
    class Info
      attr_accessor :name

      attr_accessor :message

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:name=, hash["name"])

        instance.send(:message=, hash["message"])

        instance
      end
    end
  end

  module ComAtprotoModerationCreatereport
    class ModTool
      attr_accessor :name

      attr_accessor :meta

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:name=, hash["name"])

        instance.send(:meta=, hash["meta"])

        instance
      end
    end
  end

  module ComAtprotoModerationDefs
    class ReasonType
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ComAtprotoModerationDefs
    class ReasonSpam
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ComAtprotoModerationDefs
    class ReasonViolation
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ComAtprotoModerationDefs
    class ReasonMisleading
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ComAtprotoModerationDefs
    class ReasonSexual
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ComAtprotoModerationDefs
    class ReasonRude
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ComAtprotoModerationDefs
    class ReasonOther
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ComAtprotoModerationDefs
    class ReasonAppeal
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ComAtprotoModerationDefs
    class SubjectType
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ComAtprotoRepoApplywrites
    class Create
      attr_accessor :collection

      attr_accessor :rkey

      attr_accessor :value

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:collection=, hash["collection"])

        instance.send(:rkey=, hash["rkey"])

        instance.send(:value=, hash["value"])

        instance
      end
    end
  end

  module ComAtprotoRepoApplywrites
    class Update
      attr_accessor :collection

      attr_accessor :rkey

      attr_accessor :value

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:collection=, hash["collection"])

        instance.send(:rkey=, hash["rkey"])

        instance.send(:value=, hash["value"])

        instance
      end
    end
  end

  module ComAtprotoRepoApplywrites
    class Delete
      attr_accessor :collection

      attr_accessor :rkey

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:collection=, hash["collection"])

        instance.send(:rkey=, hash["rkey"])

        instance
      end
    end
  end

  module ComAtprotoRepoApplywrites
    class CreateResult
      attr_accessor :uri

      attr_accessor :cid

      attr_accessor :validationStatus

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:uri=, hash["uri"])

        instance.send(:cid=, hash["cid"])

        instance.send(:validationStatus=, hash["validationStatus"])

        instance
      end
    end
  end

  module ComAtprotoRepoApplywrites
    class UpdateResult
      attr_accessor :uri

      attr_accessor :cid

      attr_accessor :validationStatus

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:uri=, hash["uri"])

        instance.send(:cid=, hash["cid"])

        instance.send(:validationStatus=, hash["validationStatus"])

        instance
      end
    end
  end

  module ComAtprotoRepoApplywrites
    class DeleteResult
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ComAtprotoRepoDefs
    class CommitMeta
      attr_accessor :cid

      attr_accessor :rev

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:cid=, hash["cid"])

        instance.send(:rev=, hash["rev"])

        instance
      end
    end
  end

  module ComAtprotoRepoListmissingblobs
    class RecordBlob
      attr_accessor :cid

      attr_accessor :recordUri

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:cid=, hash["cid"])

        instance.send(:recordUri=, hash["recordUri"])

        instance
      end
    end
  end

  module ComAtprotoRepoListrecords
    class Record
      attr_accessor :uri

      attr_accessor :cid

      attr_accessor :value

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:uri=, hash["uri"])

        instance.send(:cid=, hash["cid"])

        instance.send(:value=, hash["value"])

        instance
      end
    end
  end

  module ComAtprotoServerCreateapppassword
    class AppPassword
      attr_accessor :name

      attr_accessor :password

      attr_accessor :createdAt

      attr_accessor :privileged

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:name=, hash["name"])

        instance.send(:password=, hash["password"])

        instance.send(:createdAt=, hash["createdAt"])

        instance.send(:privileged=, hash["privileged"])

        instance
      end
    end
  end

  module ComAtprotoServerCreateinvitecodes
    class AccountCodes
      attr_accessor :account

      attr_accessor :codes

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:account=, hash["account"])

        instance.send(:codes=, hash["codes"])

        instance
      end
    end
  end

  module ComAtprotoServerDefs
    class InviteCode
      attr_accessor :code

      attr_accessor :available

      attr_accessor :disabled

      attr_accessor :forAccount

      attr_accessor :createdBy

      attr_accessor :createdAt

      attr_accessor :uses

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:code=, hash["code"])

        instance.send(:available=, hash["available"])

        instance.send(:disabled=, hash["disabled"])

        instance.send(:forAccount=, hash["forAccount"])

        instance.send(:createdBy=, hash["createdBy"])

        instance.send(:createdAt=, hash["createdAt"])

        instance.send(:uses=, hash["uses"])

        instance
      end
    end
  end

  module ComAtprotoServerDefs
    class InviteCodeUse
      attr_accessor :usedBy

      attr_accessor :usedAt

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:usedBy=, hash["usedBy"])

        instance.send(:usedAt=, hash["usedAt"])

        instance
      end
    end
  end

  module ComAtprotoServerDescribeserver
    class Links
      attr_accessor :privacyPolicy

      attr_accessor :termsOfService

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:privacyPolicy=, hash["privacyPolicy"])

        instance.send(:termsOfService=, hash["termsOfService"])

        instance
      end
    end
  end

  module ComAtprotoServerDescribeserver
    class Contact
      attr_accessor :email

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:email=, hash["email"])

        instance
      end
    end
  end

  module ComAtprotoServerListapppasswords
    class AppPassword
      attr_accessor :name

      attr_accessor :createdAt

      attr_accessor :privileged

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:name=, hash["name"])

        instance.send(:createdAt=, hash["createdAt"])

        instance.send(:privileged=, hash["privileged"])

        instance
      end
    end
  end

  module ComAtprotoSyncDefs
    class HostStatus
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ComAtprotoSyncListhosts
    class Host
      attr_accessor :hostname

      attr_accessor :seq

      attr_accessor :accountCount

      attr_accessor :status

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:hostname=, hash["hostname"])

        instance.send(:seq=, hash["seq"])

        instance.send(:accountCount=, hash["accountCount"])

        instance.send(:status=, hash["status"])

        instance
      end
    end
  end

  module ComAtprotoSyncListrepos
    class Repo
      attr_accessor :did

      attr_accessor :head

      attr_accessor :rev

      attr_accessor :active

      attr_accessor :status

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:did=, hash["did"])

        instance.send(:head=, hash["head"])

        instance.send(:rev=, hash["rev"])

        instance.send(:active=, hash["active"])

        instance.send(:status=, hash["status"])

        instance
      end
    end
  end

  module ComAtprotoSyncListreposbycollection
    class Repo
      attr_accessor :did

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:did=, hash["did"])

        instance
      end
    end
  end

  module ComAtprotoSyncSubscriberepos
    class Commit
      attr_accessor :seq

      attr_accessor :rebase

      attr_accessor :tooBig

      attr_accessor :repo

      attr_accessor :commit

      attr_accessor :rev

      attr_accessor :since

      attr_accessor :blocks

      attr_accessor :ops

      attr_accessor :blobs

      attr_accessor :prevData

      attr_accessor :time

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:seq=, hash["seq"])

        instance.send(:rebase=, hash["rebase"])

        instance.send(:tooBig=, hash["tooBig"])

        instance.send(:repo=, hash["repo"])

        instance.send(:commit=, hash["commit"])

        instance.send(:rev=, hash["rev"])

        instance.send(:since=, hash["since"])

        instance.send(:blocks=, hash["blocks"])

        instance.send(:ops=, hash["ops"])

        instance.send(:blobs=, hash["blobs"])

        instance.send(:prevData=, hash["prevData"])

        instance.send(:time=, hash["time"])

        instance
      end
    end
  end

  module ComAtprotoSyncSubscriberepos
    class Sync
      attr_accessor :seq

      attr_accessor :did

      attr_accessor :blocks

      attr_accessor :rev

      attr_accessor :time

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:seq=, hash["seq"])

        instance.send(:did=, hash["did"])

        instance.send(:blocks=, hash["blocks"])

        instance.send(:rev=, hash["rev"])

        instance.send(:time=, hash["time"])

        instance
      end
    end
  end

  module ComAtprotoSyncSubscriberepos
    class Identity
      attr_accessor :seq

      attr_accessor :did

      attr_accessor :time

      attr_accessor :handle

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:seq=, hash["seq"])

        instance.send(:did=, hash["did"])

        instance.send(:time=, hash["time"])

        instance.send(:handle=, hash["handle"])

        instance
      end
    end
  end

  module ComAtprotoSyncSubscriberepos
    class Account
      attr_accessor :seq

      attr_accessor :did

      attr_accessor :time

      attr_accessor :active

      attr_accessor :status

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:seq=, hash["seq"])

        instance.send(:did=, hash["did"])

        instance.send(:time=, hash["time"])

        instance.send(:active=, hash["active"])

        instance.send(:status=, hash["status"])

        instance
      end
    end
  end

  module ComAtprotoSyncSubscriberepos
    class Info
      attr_accessor :name

      attr_accessor :message

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:name=, hash["name"])

        instance.send(:message=, hash["message"])

        instance
      end
    end
  end

  module ComAtprotoSyncSubscriberepos
    class RepoOp
      attr_accessor :action

      attr_accessor :path

      attr_accessor :cid

      attr_accessor :prev

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:action=, hash["action"])

        instance.send(:path=, hash["path"])

        instance.send(:cid=, hash["cid"])

        instance.send(:prev=, hash["prev"])

        instance
      end
    end
  end

  module ComAtprotoTempCheckhandleavailability
    class ResultAvailable
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ComAtprotoTempCheckhandleavailability
    class ResultUnavailable
      attr_accessor :suggestions

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:suggestions=, hash["suggestions"])

        instance
      end
    end
  end

  module ComAtprotoTempCheckhandleavailability
    class Suggestion
      attr_accessor :handle

      attr_accessor :method

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:handle=, hash["handle"])

        instance.send(:method=, hash["method"])

        instance
      end
    end
  end

  module ComGermnetworkDeclaration
    class MessageMe
      attr_accessor :messageMeUrl

      attr_accessor :showButtonTo

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:messageMeUrl=, hash["messageMeUrl"])

        instance.send(:showButtonTo=, hash["showButtonTo"])

        instance
      end
    end
  end

  module SiteStandardDocument
    class Contributor
      attr_accessor :did

      attr_accessor :displayName

      attr_accessor :role

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:did=, hash["did"])

        instance.send(:displayName=, hash["displayName"])

        instance.send(:role=, hash["role"])

        instance
      end
    end
  end

  module SiteStandardPublication
    class Preferences
      attr_accessor :showInDiscover

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:showInDiscover=, hash["showInDiscover"])

        instance
      end
    end
  end

  module SiteStandardThemeColor
    class Rgb
      attr_accessor :b

      attr_accessor :g

      attr_accessor :r

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:b=, hash["b"])

        instance.send(:g=, hash["g"])

        instance.send(:r=, hash["r"])

        instance
      end
    end
  end

  module SiteStandardThemeColor
    class Rgba
      attr_accessor :a

      attr_accessor :b

      attr_accessor :g

      attr_accessor :r

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:a=, hash["a"])

        instance.send(:b=, hash["b"])

        instance.send(:g=, hash["g"])

        instance.send(:r=, hash["r"])

        instance
      end
    end
  end

  module ToolsOzoneCommunicationDefs
    class TemplateView
      attr_accessor :id

      attr_accessor :name

      attr_accessor :subject

      attr_accessor :contentMarkdown

      attr_accessor :disabled

      attr_accessor :lang

      attr_accessor :lastUpdatedBy

      attr_accessor :createdAt

      attr_accessor :updatedAt

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:id=, hash["id"])

        instance.send(:name=, hash["name"])

        instance.send(:subject=, hash["subject"])

        instance.send(:contentMarkdown=, hash["contentMarkdown"])

        instance.send(:disabled=, hash["disabled"])

        instance.send(:lang=, hash["lang"])

        instance.send(:lastUpdatedBy=, hash["lastUpdatedBy"])

        instance.send(:createdAt=, hash["createdAt"])

        instance.send(:updatedAt=, hash["updatedAt"])

        instance
      end
    end
  end

  module ToolsOzoneHostingGetaccounthistory
    class Event
      attr_accessor :details

      attr_accessor :createdBy

      attr_accessor :createdAt

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:details=, hash["details"])

        instance.send(:createdBy=, hash["createdBy"])

        instance.send(:createdAt=, hash["createdAt"])

        instance
      end
    end
  end

  module ToolsOzoneHostingGetaccounthistory
    class AccountCreated
      attr_accessor :email

      attr_accessor :handle

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:email=, hash["email"])

        instance.send(:handle=, hash["handle"])

        instance
      end
    end
  end

  module ToolsOzoneHostingGetaccounthistory
    class EmailUpdated
      attr_accessor :email

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:email=, hash["email"])

        instance
      end
    end
  end

  module ToolsOzoneHostingGetaccounthistory
    class EmailConfirmed
      attr_accessor :email

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:email=, hash["email"])

        instance
      end
    end
  end

  module ToolsOzoneHostingGetaccounthistory
    class PasswordUpdated
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneHostingGetaccounthistory
    class HandleUpdated
      attr_accessor :handle

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:handle=, hash["handle"])

        instance
      end
    end
  end

  module ToolsOzoneModerationCancelscheduledactions
    class CancellationResults
      attr_accessor :succeeded

      attr_accessor :failed

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:succeeded=, hash["succeeded"])

        instance.send(:failed=, hash["failed"])

        instance
      end
    end
  end

  module ToolsOzoneModerationCancelscheduledactions
    class FailedCancellation
      attr_accessor :did

      attr_accessor :error

      attr_accessor :errorCode

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:did=, hash["did"])

        instance.send(:error=, hash["error"])

        instance.send(:errorCode=, hash["errorCode"])

        instance
      end
    end
  end

  module ToolsOzoneModerationDefs
    class ModEventView
      attr_accessor :id

      attr_accessor :event

      attr_accessor :subject

      attr_accessor :subjectBlobCids

      attr_accessor :createdBy

      attr_accessor :createdAt

      attr_accessor :creatorHandle

      attr_accessor :subjectHandle

      attr_accessor :modTool

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:id=, hash["id"])

        instance.send(:event=, hash["event"])

        instance.send(:subject=, hash["subject"])

        instance.send(:subjectBlobCids=, hash["subjectBlobCids"])

        instance.send(:createdBy=, hash["createdBy"])

        instance.send(:createdAt=, hash["createdAt"])

        instance.send(:creatorHandle=, hash["creatorHandle"])

        instance.send(:subjectHandle=, hash["subjectHandle"])

        instance.send(:modTool=, hash["modTool"])

        instance
      end
    end
  end

  module ToolsOzoneModerationDefs
    class ModEventViewDetail
      attr_accessor :id

      attr_accessor :event

      attr_accessor :subject

      attr_accessor :subjectBlobs

      attr_accessor :createdBy

      attr_accessor :createdAt

      attr_accessor :modTool

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:id=, hash["id"])

        instance.send(:event=, hash["event"])

        instance.send(:subject=, hash["subject"])

        instance.send(:subjectBlobs=, hash["subjectBlobs"])

        instance.send(:createdBy=, hash["createdBy"])

        instance.send(:createdAt=, hash["createdAt"])

        instance.send(:modTool=, hash["modTool"])

        instance
      end
    end
  end

  module ToolsOzoneModerationDefs
    class SubjectStatusView
      attr_accessor :id

      attr_accessor :subject

      attr_accessor :hosting

      attr_accessor :subjectBlobCids

      attr_accessor :subjectRepoHandle

      attr_accessor :updatedAt

      attr_accessor :createdAt

      attr_accessor :reviewState

      attr_accessor :comment

      attr_accessor :priorityScore

      attr_accessor :muteUntil

      attr_accessor :muteReportingUntil

      attr_accessor :lastReviewedBy

      attr_accessor :lastReviewedAt

      attr_accessor :lastReportedAt

      attr_accessor :lastAppealedAt

      attr_accessor :takendown

      attr_accessor :appealed

      attr_accessor :suspendUntil

      attr_accessor :tags

      attr_accessor :accountStats

      attr_accessor :recordsStats

      attr_accessor :accountStrike

      attr_accessor :ageAssuranceState

      attr_accessor :ageAssuranceUpdatedBy

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:id=, hash["id"])

        instance.send(:subject=, hash["subject"])

        instance.send(:hosting=, hash["hosting"])

        instance.send(:subjectBlobCids=, hash["subjectBlobCids"])

        instance.send(:subjectRepoHandle=, hash["subjectRepoHandle"])

        instance.send(:updatedAt=, hash["updatedAt"])

        instance.send(:createdAt=, hash["createdAt"])

        instance.send(:reviewState=, hash["reviewState"])

        instance.send(:comment=, hash["comment"])

        instance.send(:priorityScore=, hash["priorityScore"])

        instance.send(:muteUntil=, hash["muteUntil"])

        instance.send(:muteReportingUntil=, hash["muteReportingUntil"])

        instance.send(:lastReviewedBy=, hash["lastReviewedBy"])

        instance.send(:lastReviewedAt=, hash["lastReviewedAt"])

        instance.send(:lastReportedAt=, hash["lastReportedAt"])

        instance.send(:lastAppealedAt=, hash["lastAppealedAt"])

        instance.send(:takendown=, hash["takendown"])

        instance.send(:appealed=, hash["appealed"])

        instance.send(:suspendUntil=, hash["suspendUntil"])

        instance.send(:tags=, hash["tags"])

        instance.send(:accountStats=, hash["accountStats"])

        instance.send(:recordsStats=, hash["recordsStats"])

        instance.send(:accountStrike=, hash["accountStrike"])

        instance.send(:ageAssuranceState=, hash["ageAssuranceState"])

        instance.send(:ageAssuranceUpdatedBy=, hash["ageAssuranceUpdatedBy"])

        instance
      end
    end
  end

  module ToolsOzoneModerationDefs
    class SubjectView
      attr_accessor :subject

      attr_accessor :status

      attr_accessor :repo

      attr_accessor :profile

      attr_accessor :record

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:subject=, hash["subject"])

        instance.send(:status=, hash["status"])

        instance.send(:repo=, hash["repo"])

        instance.send(:profile=, hash["profile"])

        instance.send(:record=, hash["record"])

        instance
      end
    end
  end

  module ToolsOzoneModerationDefs
    class AccountStats
      attr_accessor :reportCount

      attr_accessor :appealCount

      attr_accessor :suspendCount

      attr_accessor :escalateCount

      attr_accessor :takedownCount

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:reportCount=, hash["reportCount"])

        instance.send(:appealCount=, hash["appealCount"])

        instance.send(:suspendCount=, hash["suspendCount"])

        instance.send(:escalateCount=, hash["escalateCount"])

        instance.send(:takedownCount=, hash["takedownCount"])

        instance
      end
    end
  end

  module ToolsOzoneModerationDefs
    class RecordsStats
      attr_accessor :totalReports

      attr_accessor :reportedCount

      attr_accessor :escalatedCount

      attr_accessor :appealedCount

      attr_accessor :subjectCount

      attr_accessor :pendingCount

      attr_accessor :processedCount

      attr_accessor :takendownCount

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:totalReports=, hash["totalReports"])

        instance.send(:reportedCount=, hash["reportedCount"])

        instance.send(:escalatedCount=, hash["escalatedCount"])

        instance.send(:appealedCount=, hash["appealedCount"])

        instance.send(:subjectCount=, hash["subjectCount"])

        instance.send(:pendingCount=, hash["pendingCount"])

        instance.send(:processedCount=, hash["processedCount"])

        instance.send(:takendownCount=, hash["takendownCount"])

        instance
      end
    end
  end

  module ToolsOzoneModerationDefs
    class AccountStrike
      attr_accessor :activeStrikeCount

      attr_accessor :totalStrikeCount

      attr_accessor :firstStrikeAt

      attr_accessor :lastStrikeAt

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:activeStrikeCount=, hash["activeStrikeCount"])

        instance.send(:totalStrikeCount=, hash["totalStrikeCount"])

        instance.send(:firstStrikeAt=, hash["firstStrikeAt"])

        instance.send(:lastStrikeAt=, hash["lastStrikeAt"])

        instance
      end
    end
  end

  module ToolsOzoneModerationDefs
    class SubjectReviewState
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneModerationDefs
    class ReviewOpen
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneModerationDefs
    class ReviewEscalated
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneModerationDefs
    class ReviewClosed
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneModerationDefs
    class ReviewNone
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneModerationDefs
    class ModEventTakedown
      attr_accessor :comment

      attr_accessor :durationInHours

      attr_accessor :acknowledgeAccountSubjects

      attr_accessor :policies

      attr_accessor :severityLevel

      attr_accessor :targetServices

      attr_accessor :strikeCount

      attr_accessor :strikeExpiresAt

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:comment=, hash["comment"])

        instance.send(:durationInHours=, hash["durationInHours"])

        instance.send(:acknowledgeAccountSubjects=, hash["acknowledgeAccountSubjects"])

        instance.send(:policies=, hash["policies"])

        instance.send(:severityLevel=, hash["severityLevel"])

        instance.send(:targetServices=, hash["targetServices"])

        instance.send(:strikeCount=, hash["strikeCount"])

        instance.send(:strikeExpiresAt=, hash["strikeExpiresAt"])

        instance
      end
    end
  end

  module ToolsOzoneModerationDefs
    class ModEventReverseTakedown
      attr_accessor :comment

      attr_accessor :policies

      attr_accessor :severityLevel

      attr_accessor :strikeCount

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:comment=, hash["comment"])

        instance.send(:policies=, hash["policies"])

        instance.send(:severityLevel=, hash["severityLevel"])

        instance.send(:strikeCount=, hash["strikeCount"])

        instance
      end
    end
  end

  module ToolsOzoneModerationDefs
    class ModEventResolveAppeal
      attr_accessor :comment

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:comment=, hash["comment"])

        instance
      end
    end
  end

  module ToolsOzoneModerationDefs
    class ModEventComment
      attr_accessor :comment

      attr_accessor :sticky

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:comment=, hash["comment"])

        instance.send(:sticky=, hash["sticky"])

        instance
      end
    end
  end

  module ToolsOzoneModerationDefs
    class ModEventReport
      attr_accessor :comment

      attr_accessor :isReporterMuted

      attr_accessor :reportType

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:comment=, hash["comment"])

        instance.send(:isReporterMuted=, hash["isReporterMuted"])

        instance.send(:reportType=, hash["reportType"])

        instance
      end
    end
  end

  module ToolsOzoneModerationDefs
    class ModEventLabel
      attr_accessor :comment

      attr_accessor :createLabelVals

      attr_accessor :negateLabelVals

      attr_accessor :durationInHours

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:comment=, hash["comment"])

        instance.send(:createLabelVals=, hash["createLabelVals"])

        instance.send(:negateLabelVals=, hash["negateLabelVals"])

        instance.send(:durationInHours=, hash["durationInHours"])

        instance
      end
    end
  end

  module ToolsOzoneModerationDefs
    class ModEventPriorityScore
      attr_accessor :comment

      attr_accessor :score

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:comment=, hash["comment"])

        instance.send(:score=, hash["score"])

        instance
      end
    end
  end

  module ToolsOzoneModerationDefs
    class AgeAssuranceEvent
      attr_accessor :createdAt

      attr_accessor :attemptId

      attr_accessor :status

      attr_accessor :access

      attr_accessor :countryCode

      attr_accessor :regionCode

      attr_accessor :initIp

      attr_accessor :initUa

      attr_accessor :completeIp

      attr_accessor :completeUa

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:createdAt=, hash["createdAt"])

        instance.send(:attemptId=, hash["attemptId"])

        instance.send(:status=, hash["status"])

        instance.send(:access=, hash["access"])

        instance.send(:countryCode=, hash["countryCode"])

        instance.send(:regionCode=, hash["regionCode"])

        instance.send(:initIp=, hash["initIp"])

        instance.send(:initUa=, hash["initUa"])

        instance.send(:completeIp=, hash["completeIp"])

        instance.send(:completeUa=, hash["completeUa"])

        instance
      end
    end
  end

  module ToolsOzoneModerationDefs
    class AgeAssuranceOverrideEvent
      attr_accessor :status

      attr_accessor :access

      attr_accessor :comment

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:status=, hash["status"])

        instance.send(:access=, hash["access"])

        instance.send(:comment=, hash["comment"])

        instance
      end
    end
  end

  module ToolsOzoneModerationDefs
    class AgeAssurancePurgeEvent
      attr_accessor :comment

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:comment=, hash["comment"])

        instance
      end
    end
  end

  module ToolsOzoneModerationDefs
    class RevokeAccountCredentialsEvent
      attr_accessor :comment

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:comment=, hash["comment"])

        instance
      end
    end
  end

  module ToolsOzoneModerationDefs
    class ModEventAcknowledge
      attr_accessor :comment

      attr_accessor :acknowledgeAccountSubjects

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:comment=, hash["comment"])

        instance.send(:acknowledgeAccountSubjects=, hash["acknowledgeAccountSubjects"])

        instance
      end
    end
  end

  module ToolsOzoneModerationDefs
    class ModEventEscalate
      attr_accessor :comment

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:comment=, hash["comment"])

        instance
      end
    end
  end

  module ToolsOzoneModerationDefs
    class ModEventMute
      attr_accessor :comment

      attr_accessor :durationInHours

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:comment=, hash["comment"])

        instance.send(:durationInHours=, hash["durationInHours"])

        instance
      end
    end
  end

  module ToolsOzoneModerationDefs
    class ModEventUnmute
      attr_accessor :comment

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:comment=, hash["comment"])

        instance
      end
    end
  end

  module ToolsOzoneModerationDefs
    class ModEventMuteReporter
      attr_accessor :comment

      attr_accessor :durationInHours

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:comment=, hash["comment"])

        instance.send(:durationInHours=, hash["durationInHours"])

        instance
      end
    end
  end

  module ToolsOzoneModerationDefs
    class ModEventUnmuteReporter
      attr_accessor :comment

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:comment=, hash["comment"])

        instance
      end
    end
  end

  module ToolsOzoneModerationDefs
    class ModEventEmail
      attr_accessor :subjectLine

      attr_accessor :content

      attr_accessor :comment

      attr_accessor :policies

      attr_accessor :severityLevel

      attr_accessor :strikeCount

      attr_accessor :strikeExpiresAt

      attr_accessor :isDelivered

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:subjectLine=, hash["subjectLine"])

        instance.send(:content=, hash["content"])

        instance.send(:comment=, hash["comment"])

        instance.send(:policies=, hash["policies"])

        instance.send(:severityLevel=, hash["severityLevel"])

        instance.send(:strikeCount=, hash["strikeCount"])

        instance.send(:strikeExpiresAt=, hash["strikeExpiresAt"])

        instance.send(:isDelivered=, hash["isDelivered"])

        instance
      end
    end
  end

  module ToolsOzoneModerationDefs
    class ModEventDivert
      attr_accessor :comment

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:comment=, hash["comment"])

        instance
      end
    end
  end

  module ToolsOzoneModerationDefs
    class ModEventTag
      attr_accessor :add

      attr_accessor :remove

      attr_accessor :comment

      attr_accessor :durationInHours

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:add=, hash["add"])

        instance.send(:remove=, hash["remove"])

        instance.send(:comment=, hash["comment"])

        instance.send(:durationInHours=, hash["durationInHours"])

        instance
      end
    end
  end

  module ToolsOzoneModerationDefs
    class AccountEvent
      attr_accessor :comment

      attr_accessor :active

      attr_accessor :status

      attr_accessor :timestamp

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:comment=, hash["comment"])

        instance.send(:active=, hash["active"])

        instance.send(:status=, hash["status"])

        instance.send(:timestamp=, hash["timestamp"])

        instance
      end
    end
  end

  module ToolsOzoneModerationDefs
    class IdentityEvent
      attr_accessor :comment

      attr_accessor :handle

      attr_accessor :pdsHost

      attr_accessor :tombstone

      attr_accessor :timestamp

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:comment=, hash["comment"])

        instance.send(:handle=, hash["handle"])

        instance.send(:pdsHost=, hash["pdsHost"])

        instance.send(:tombstone=, hash["tombstone"])

        instance.send(:timestamp=, hash["timestamp"])

        instance
      end
    end
  end

  module ToolsOzoneModerationDefs
    class RecordEvent
      attr_accessor :comment

      attr_accessor :op

      attr_accessor :cid

      attr_accessor :timestamp

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:comment=, hash["comment"])

        instance.send(:op=, hash["op"])

        instance.send(:cid=, hash["cid"])

        instance.send(:timestamp=, hash["timestamp"])

        instance
      end
    end
  end

  module ToolsOzoneModerationDefs
    class ScheduleTakedownEvent
      attr_accessor :comment

      attr_accessor :executeAt

      attr_accessor :executeAfter

      attr_accessor :executeUntil

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:comment=, hash["comment"])

        instance.send(:executeAt=, hash["executeAt"])

        instance.send(:executeAfter=, hash["executeAfter"])

        instance.send(:executeUntil=, hash["executeUntil"])

        instance
      end
    end
  end

  module ToolsOzoneModerationDefs
    class CancelScheduledTakedownEvent
      attr_accessor :comment

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:comment=, hash["comment"])

        instance
      end
    end
  end

  module ToolsOzoneModerationDefs
    class RepoView
      attr_accessor :did

      attr_accessor :handle

      attr_accessor :email

      attr_accessor :relatedRecords

      attr_accessor :indexedAt

      attr_accessor :moderation

      attr_accessor :invitedBy

      attr_accessor :invitesDisabled

      attr_accessor :inviteNote

      attr_accessor :deactivatedAt

      attr_accessor :threatSignatures

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:did=, hash["did"])

        instance.send(:handle=, hash["handle"])

        instance.send(:email=, hash["email"])

        instance.send(:relatedRecords=, hash["relatedRecords"])

        instance.send(:indexedAt=, hash["indexedAt"])

        instance.send(:moderation=, hash["moderation"])

        instance.send(:invitedBy=, hash["invitedBy"])

        instance.send(:invitesDisabled=, hash["invitesDisabled"])

        instance.send(:inviteNote=, hash["inviteNote"])

        instance.send(:deactivatedAt=, hash["deactivatedAt"])

        instance.send(:threatSignatures=, hash["threatSignatures"])

        instance
      end
    end
  end

  module ToolsOzoneModerationDefs
    class RepoViewDetail
      attr_accessor :did

      attr_accessor :handle

      attr_accessor :email

      attr_accessor :relatedRecords

      attr_accessor :indexedAt

      attr_accessor :moderation

      attr_accessor :labels

      attr_accessor :invitedBy

      attr_accessor :invites

      attr_accessor :invitesDisabled

      attr_accessor :inviteNote

      attr_accessor :emailConfirmedAt

      attr_accessor :deactivatedAt

      attr_accessor :threatSignatures

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:did=, hash["did"])

        instance.send(:handle=, hash["handle"])

        instance.send(:email=, hash["email"])

        instance.send(:relatedRecords=, hash["relatedRecords"])

        instance.send(:indexedAt=, hash["indexedAt"])

        instance.send(:moderation=, hash["moderation"])

        instance.send(:labels=, hash["labels"])

        instance.send(:invitedBy=, hash["invitedBy"])

        instance.send(:invites=, hash["invites"])

        instance.send(:invitesDisabled=, hash["invitesDisabled"])

        instance.send(:inviteNote=, hash["inviteNote"])

        instance.send(:emailConfirmedAt=, hash["emailConfirmedAt"])

        instance.send(:deactivatedAt=, hash["deactivatedAt"])

        instance.send(:threatSignatures=, hash["threatSignatures"])

        instance
      end
    end
  end

  module ToolsOzoneModerationDefs
    class RepoViewNotFound
      attr_accessor :did

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:did=, hash["did"])

        instance
      end
    end
  end

  module ToolsOzoneModerationDefs
    class RecordView
      attr_accessor :uri

      attr_accessor :cid

      attr_accessor :value

      attr_accessor :blobCids

      attr_accessor :indexedAt

      attr_accessor :moderation

      attr_accessor :repo

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:uri=, hash["uri"])

        instance.send(:cid=, hash["cid"])

        instance.send(:value=, hash["value"])

        instance.send(:blobCids=, hash["blobCids"])

        instance.send(:indexedAt=, hash["indexedAt"])

        instance.send(:moderation=, hash["moderation"])

        instance.send(:repo=, hash["repo"])

        instance
      end
    end
  end

  module ToolsOzoneModerationDefs
    class RecordViewDetail
      attr_accessor :uri

      attr_accessor :cid

      attr_accessor :value

      attr_accessor :blobs

      attr_accessor :labels

      attr_accessor :indexedAt

      attr_accessor :moderation

      attr_accessor :repo

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:uri=, hash["uri"])

        instance.send(:cid=, hash["cid"])

        instance.send(:value=, hash["value"])

        instance.send(:blobs=, hash["blobs"])

        instance.send(:labels=, hash["labels"])

        instance.send(:indexedAt=, hash["indexedAt"])

        instance.send(:moderation=, hash["moderation"])

        instance.send(:repo=, hash["repo"])

        instance
      end
    end
  end

  module ToolsOzoneModerationDefs
    class RecordViewNotFound
      attr_accessor :uri

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:uri=, hash["uri"])

        instance
      end
    end
  end

  module ToolsOzoneModerationDefs
    class ConvoView
      attr_accessor :did

      attr_accessor :convoId

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:did=, hash["did"])

        instance.send(:convoId=, hash["convoId"])

        instance
      end
    end
  end

  module ToolsOzoneModerationDefs
    class Moderation
      attr_accessor :subjectStatus

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:subjectStatus=, hash["subjectStatus"])

        instance
      end
    end
  end

  module ToolsOzoneModerationDefs
    class ModerationDetail
      attr_accessor :subjectStatus

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:subjectStatus=, hash["subjectStatus"])

        instance
      end
    end
  end

  module ToolsOzoneModerationDefs
    class BlobView
      attr_accessor :cid

      attr_accessor :mimeType

      attr_accessor :size

      attr_accessor :createdAt

      attr_accessor :details

      attr_accessor :moderation

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:cid=, hash["cid"])

        instance.send(:mimeType=, hash["mimeType"])

        instance.send(:size=, hash["size"])

        instance.send(:createdAt=, hash["createdAt"])

        instance.send(:details=, hash["details"])

        instance.send(:moderation=, hash["moderation"])

        instance
      end
    end
  end

  module ToolsOzoneModerationDefs
    class ImageDetails
      attr_accessor :width

      attr_accessor :height

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:width=, hash["width"])

        instance.send(:height=, hash["height"])

        instance
      end
    end
  end

  module ToolsOzoneModerationDefs
    class VideoDetails
      attr_accessor :width

      attr_accessor :height

      attr_accessor :length

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:width=, hash["width"])

        instance.send(:height=, hash["height"])

        instance.send(:length=, hash["length"])

        instance
      end
    end
  end

  module ToolsOzoneModerationDefs
    class AccountHosting
      attr_accessor :status

      attr_accessor :updatedAt

      attr_accessor :createdAt

      attr_accessor :deletedAt

      attr_accessor :deactivatedAt

      attr_accessor :reactivatedAt

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:status=, hash["status"])

        instance.send(:updatedAt=, hash["updatedAt"])

        instance.send(:createdAt=, hash["createdAt"])

        instance.send(:deletedAt=, hash["deletedAt"])

        instance.send(:deactivatedAt=, hash["deactivatedAt"])

        instance.send(:reactivatedAt=, hash["reactivatedAt"])

        instance
      end
    end
  end

  module ToolsOzoneModerationDefs
    class RecordHosting
      attr_accessor :status

      attr_accessor :updatedAt

      attr_accessor :createdAt

      attr_accessor :deletedAt

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:status=, hash["status"])

        instance.send(:updatedAt=, hash["updatedAt"])

        instance.send(:createdAt=, hash["createdAt"])

        instance.send(:deletedAt=, hash["deletedAt"])

        instance
      end
    end
  end

  module ToolsOzoneModerationDefs
    class ReporterStats
      attr_accessor :did

      attr_accessor :accountReportCount

      attr_accessor :recordReportCount

      attr_accessor :reportedAccountCount

      attr_accessor :reportedRecordCount

      attr_accessor :takendownAccountCount

      attr_accessor :takendownRecordCount

      attr_accessor :labeledAccountCount

      attr_accessor :labeledRecordCount

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:did=, hash["did"])

        instance.send(:accountReportCount=, hash["accountReportCount"])

        instance.send(:recordReportCount=, hash["recordReportCount"])

        instance.send(:reportedAccountCount=, hash["reportedAccountCount"])

        instance.send(:reportedRecordCount=, hash["reportedRecordCount"])

        instance.send(:takendownAccountCount=, hash["takendownAccountCount"])

        instance.send(:takendownRecordCount=, hash["takendownRecordCount"])

        instance.send(:labeledAccountCount=, hash["labeledAccountCount"])

        instance.send(:labeledRecordCount=, hash["labeledRecordCount"])

        instance
      end
    end
  end

  module ToolsOzoneModerationDefs
    class ModTool
      attr_accessor :name

      attr_accessor :meta

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:name=, hash["name"])

        instance.send(:meta=, hash["meta"])

        instance
      end
    end
  end

  module ToolsOzoneModerationDefs
    class TimelineEventPlcCreate
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneModerationDefs
    class TimelineEventPlcOperation
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneModerationDefs
    class TimelineEventPlcTombstone
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneModerationDefs
    class ScheduledActionView
      attr_accessor :id

      attr_accessor :action

      attr_accessor :eventData

      attr_accessor :did

      attr_accessor :executeAt

      attr_accessor :executeAfter

      attr_accessor :executeUntil

      attr_accessor :randomizeExecution

      attr_accessor :createdBy

      attr_accessor :createdAt

      attr_accessor :updatedAt

      attr_accessor :status

      attr_accessor :lastExecutedAt

      attr_accessor :lastFailureReason

      attr_accessor :executionEventId

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:id=, hash["id"])

        instance.send(:action=, hash["action"])

        instance.send(:eventData=, hash["eventData"])

        instance.send(:did=, hash["did"])

        instance.send(:executeAt=, hash["executeAt"])

        instance.send(:executeAfter=, hash["executeAfter"])

        instance.send(:executeUntil=, hash["executeUntil"])

        instance.send(:randomizeExecution=, hash["randomizeExecution"])

        instance.send(:createdBy=, hash["createdBy"])

        instance.send(:createdAt=, hash["createdAt"])

        instance.send(:updatedAt=, hash["updatedAt"])

        instance.send(:status=, hash["status"])

        instance.send(:lastExecutedAt=, hash["lastExecutedAt"])

        instance.send(:lastFailureReason=, hash["lastFailureReason"])

        instance.send(:executionEventId=, hash["executionEventId"])

        instance
      end
    end
  end

  module ToolsOzoneModerationEmitevent
    class ReportAction
      attr_accessor :ids

      attr_accessor :types

      attr_accessor :all

      attr_accessor :note

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:ids=, hash["ids"])

        instance.send(:types=, hash["types"])

        instance.send(:all=, hash["all"])

        instance.send(:note=, hash["note"])

        instance
      end
    end
  end

  module ToolsOzoneModerationGetaccounttimeline
    class TimelineItem
      attr_accessor :day

      attr_accessor :summary

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:day=, hash["day"])

        instance.send(:summary=, hash["summary"])

        instance
      end
    end
  end

  module ToolsOzoneModerationGetaccounttimeline
    class TimelineItemSummary
      attr_accessor :eventSubjectType

      attr_accessor :eventType

      attr_accessor :count

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:eventSubjectType=, hash["eventSubjectType"])

        instance.send(:eventType=, hash["eventType"])

        instance.send(:count=, hash["count"])

        instance
      end
    end
  end

  module ToolsOzoneModerationScheduleaction
    class Takedown
      attr_accessor :comment

      attr_accessor :durationInHours

      attr_accessor :acknowledgeAccountSubjects

      attr_accessor :policies

      attr_accessor :severityLevel

      attr_accessor :strikeCount

      attr_accessor :strikeExpiresAt

      attr_accessor :emailContent

      attr_accessor :emailSubject

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:comment=, hash["comment"])

        instance.send(:durationInHours=, hash["durationInHours"])

        instance.send(:acknowledgeAccountSubjects=, hash["acknowledgeAccountSubjects"])

        instance.send(:policies=, hash["policies"])

        instance.send(:severityLevel=, hash["severityLevel"])

        instance.send(:strikeCount=, hash["strikeCount"])

        instance.send(:strikeExpiresAt=, hash["strikeExpiresAt"])

        instance.send(:emailContent=, hash["emailContent"])

        instance.send(:emailSubject=, hash["emailSubject"])

        instance
      end
    end
  end

  module ToolsOzoneModerationScheduleaction
    class SchedulingConfig
      attr_accessor :executeAt

      attr_accessor :executeAfter

      attr_accessor :executeUntil

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:executeAt=, hash["executeAt"])

        instance.send(:executeAfter=, hash["executeAfter"])

        instance.send(:executeUntil=, hash["executeUntil"])

        instance
      end
    end
  end

  module ToolsOzoneModerationScheduleaction
    class ScheduledActionResults
      attr_accessor :succeeded

      attr_accessor :failed

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:succeeded=, hash["succeeded"])

        instance.send(:failed=, hash["failed"])

        instance
      end
    end
  end

  module ToolsOzoneModerationScheduleaction
    class FailedScheduling
      attr_accessor :subject

      attr_accessor :error

      attr_accessor :errorCode

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:subject=, hash["subject"])

        instance.send(:error=, hash["error"])

        instance.send(:errorCode=, hash["errorCode"])

        instance
      end
    end
  end

  module ToolsOzoneQueueDefs
    class QueueView
      attr_accessor :id

      attr_accessor :name

      attr_accessor :subjectTypes

      attr_accessor :collection

      attr_accessor :reportTypes

      attr_accessor :description

      attr_accessor :createdBy

      attr_accessor :createdAt

      attr_accessor :updatedAt

      attr_accessor :enabled

      attr_accessor :deletedAt

      attr_accessor :stats

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:id=, hash["id"])

        instance.send(:name=, hash["name"])

        instance.send(:subjectTypes=, hash["subjectTypes"])

        instance.send(:collection=, hash["collection"])

        instance.send(:reportTypes=, hash["reportTypes"])

        instance.send(:description=, hash["description"])

        instance.send(:createdBy=, hash["createdBy"])

        instance.send(:createdAt=, hash["createdAt"])

        instance.send(:updatedAt=, hash["updatedAt"])

        instance.send(:enabled=, hash["enabled"])

        instance.send(:deletedAt=, hash["deletedAt"])

        instance.send(:stats=, hash["stats"])

        instance
      end
    end
  end

  module ToolsOzoneQueueDefs
    class QueueStats
      attr_accessor :pendingCount

      attr_accessor :actionedCount

      attr_accessor :escalatedCount

      attr_accessor :inboundCount

      attr_accessor :actionRate

      attr_accessor :avgHandlingTimeSec

      attr_accessor :lastUpdated

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:pendingCount=, hash["pendingCount"])

        instance.send(:actionedCount=, hash["actionedCount"])

        instance.send(:escalatedCount=, hash["escalatedCount"])

        instance.send(:inboundCount=, hash["inboundCount"])

        instance.send(:actionRate=, hash["actionRate"])

        instance.send(:avgHandlingTimeSec=, hash["avgHandlingTimeSec"])

        instance.send(:lastUpdated=, hash["lastUpdated"])

        instance
      end
    end
  end

  module ToolsOzoneQueueDefs
    class AssignmentView
      attr_accessor :id

      attr_accessor :did

      attr_accessor :moderator

      attr_accessor :queue

      attr_accessor :startAt

      attr_accessor :endAt

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:id=, hash["id"])

        instance.send(:did=, hash["did"])

        instance.send(:moderator=, hash["moderator"])

        instance.send(:queue=, hash["queue"])

        instance.send(:startAt=, hash["startAt"])

        instance.send(:endAt=, hash["endAt"])

        instance
      end
    end
  end

  module ToolsOzoneReportDefs
    class ReasonType
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneReportDefs
    class ReasonAppeal
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneReportDefs
    class ReasonOther
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneReportDefs
    class ReasonViolenceAnimal
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneReportDefs
    class ReasonViolenceThreats
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneReportDefs
    class ReasonViolenceGraphicContent
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneReportDefs
    class ReasonViolenceGlorification
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneReportDefs
    class ReasonViolenceExtremistContent
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneReportDefs
    class ReasonViolenceTrafficking
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneReportDefs
    class ReasonViolenceOther
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneReportDefs
    class ReasonSexualAbuseContent
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneReportDefs
    class ReasonSexualNCII
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneReportDefs
    class ReasonSexualDeepfake
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneReportDefs
    class ReasonSexualAnimal
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneReportDefs
    class ReasonSexualUnlabeled
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneReportDefs
    class ReasonSexualOther
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneReportDefs
    class ReasonChildSafetyCSAM
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneReportDefs
    class ReasonChildSafetyGroom
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneReportDefs
    class ReasonChildSafetyPrivacy
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneReportDefs
    class ReasonChildSafetyHarassment
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneReportDefs
    class ReasonChildSafetyOther
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneReportDefs
    class ReasonHarassmentTroll
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneReportDefs
    class ReasonHarassmentTargeted
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneReportDefs
    class ReasonHarassmentHateSpeech
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneReportDefs
    class ReasonHarassmentDoxxing
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneReportDefs
    class ReasonHarassmentOther
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneReportDefs
    class ReasonMisleadingBot
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneReportDefs
    class ReasonMisleadingImpersonation
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneReportDefs
    class ReasonMisleadingSpam
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneReportDefs
    class ReasonMisleadingScam
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneReportDefs
    class ReasonMisleadingElections
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneReportDefs
    class ReasonMisleadingOther
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneReportDefs
    class ReasonRuleSiteSecurity
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneReportDefs
    class ReasonRuleProhibitedSales
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneReportDefs
    class ReasonRuleBanEvasion
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneReportDefs
    class ReasonRuleOther
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneReportDefs
    class ReasonSelfHarmContent
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneReportDefs
    class ReasonSelfHarmED
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneReportDefs
    class ReasonSelfHarmStunts
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneReportDefs
    class ReasonSelfHarmSubstances
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneReportDefs
    class ReasonSelfHarmOther
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneReportDefs
    class ReportAssignment
      attr_accessor :did

      attr_accessor :moderator

      attr_accessor :assignedAt

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:did=, hash["did"])

        instance.send(:moderator=, hash["moderator"])

        instance.send(:assignedAt=, hash["assignedAt"])

        instance
      end
    end
  end

  module ToolsOzoneReportDefs
    class ReportView
      attr_accessor :id

      attr_accessor :eventId

      attr_accessor :status

      attr_accessor :subject

      attr_accessor :reportType

      attr_accessor :reportedBy

      attr_accessor :reporter

      attr_accessor :comment

      attr_accessor :createdAt

      attr_accessor :updatedAt

      attr_accessor :queuedAt

      attr_accessor :actionEventIds

      attr_accessor :actions

      attr_accessor :actionNote

      attr_accessor :subjectStatus

      attr_accessor :relatedReportCount

      attr_accessor :assignment

      attr_accessor :queue

      attr_accessor :isMuted

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:id=, hash["id"])

        instance.send(:eventId=, hash["eventId"])

        instance.send(:status=, hash["status"])

        instance.send(:subject=, hash["subject"])

        instance.send(:reportType=, hash["reportType"])

        instance.send(:reportedBy=, hash["reportedBy"])

        instance.send(:reporter=, hash["reporter"])

        instance.send(:comment=, hash["comment"])

        instance.send(:createdAt=, hash["createdAt"])

        instance.send(:updatedAt=, hash["updatedAt"])

        instance.send(:queuedAt=, hash["queuedAt"])

        instance.send(:actionEventIds=, hash["actionEventIds"])

        instance.send(:actions=, hash["actions"])

        instance.send(:actionNote=, hash["actionNote"])

        instance.send(:subjectStatus=, hash["subjectStatus"])

        instance.send(:relatedReportCount=, hash["relatedReportCount"])

        instance.send(:assignment=, hash["assignment"])

        instance.send(:queue=, hash["queue"])

        instance.send(:isMuted=, hash["isMuted"])

        instance
      end
    end
  end

  module ToolsOzoneReportDefs
    class QueueActivity
      attr_accessor :previousStatus

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:previousStatus=, hash["previousStatus"])

        instance
      end
    end
  end

  module ToolsOzoneReportDefs
    class AssignmentActivity
      attr_accessor :previousStatus

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:previousStatus=, hash["previousStatus"])

        instance
      end
    end
  end

  module ToolsOzoneReportDefs
    class EscalationActivity
      attr_accessor :previousStatus

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:previousStatus=, hash["previousStatus"])

        instance
      end
    end
  end

  module ToolsOzoneReportDefs
    class CloseActivity
      attr_accessor :previousStatus

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:previousStatus=, hash["previousStatus"])

        instance
      end
    end
  end

  module ToolsOzoneReportDefs
    class ReopenActivity
      attr_accessor :previousStatus

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:previousStatus=, hash["previousStatus"])

        instance
      end
    end
  end

  module ToolsOzoneReportDefs
    class NoteActivity
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneReportDefs
    class ReportActivityView
      attr_accessor :id

      attr_accessor :reportId

      attr_accessor :activity

      attr_accessor :internalNote

      attr_accessor :publicNote

      attr_accessor :meta

      attr_accessor :isAutomated

      attr_accessor :createdBy

      attr_accessor :moderator

      attr_accessor :report

      attr_accessor :createdAt

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:id=, hash["id"])

        instance.send(:reportId=, hash["reportId"])

        instance.send(:activity=, hash["activity"])

        instance.send(:internalNote=, hash["internalNote"])

        instance.send(:publicNote=, hash["publicNote"])

        instance.send(:meta=, hash["meta"])

        instance.send(:isAutomated=, hash["isAutomated"])

        instance.send(:createdBy=, hash["createdBy"])

        instance.send(:moderator=, hash["moderator"])

        instance.send(:report=, hash["report"])

        instance.send(:createdAt=, hash["createdAt"])

        instance
      end
    end
  end

  module ToolsOzoneReportDefs
    class LiveStats
      attr_accessor :pendingCount

      attr_accessor :actionedCount

      attr_accessor :escalatedCount

      attr_accessor :inboundCount

      attr_accessor :actionRate

      attr_accessor :avgHandlingTimeSec

      attr_accessor :lastUpdated

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:pendingCount=, hash["pendingCount"])

        instance.send(:actionedCount=, hash["actionedCount"])

        instance.send(:escalatedCount=, hash["escalatedCount"])

        instance.send(:inboundCount=, hash["inboundCount"])

        instance.send(:actionRate=, hash["actionRate"])

        instance.send(:avgHandlingTimeSec=, hash["avgHandlingTimeSec"])

        instance.send(:lastUpdated=, hash["lastUpdated"])

        instance
      end
    end
  end

  module ToolsOzoneReportDefs
    class HistoricalStats
      attr_accessor :date

      attr_accessor :computedAt

      attr_accessor :pendingCount

      attr_accessor :actionedCount

      attr_accessor :escalatedCount

      attr_accessor :inboundCount

      attr_accessor :actionRate

      attr_accessor :avgHandlingTimeSec

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:date=, hash["date"])

        instance.send(:computedAt=, hash["computedAt"])

        instance.send(:pendingCount=, hash["pendingCount"])

        instance.send(:actionedCount=, hash["actionedCount"])

        instance.send(:escalatedCount=, hash["escalatedCount"])

        instance.send(:inboundCount=, hash["inboundCount"])

        instance.send(:actionRate=, hash["actionRate"])

        instance.send(:avgHandlingTimeSec=, hash["avgHandlingTimeSec"])

        instance
      end
    end
  end

  module ToolsOzoneReportDefs
    class AssignmentView
      attr_accessor :id

      attr_accessor :did

      attr_accessor :moderator

      attr_accessor :queue

      attr_accessor :reportId

      attr_accessor :startAt

      attr_accessor :endAt

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:id=, hash["id"])

        instance.send(:did=, hash["did"])

        instance.send(:moderator=, hash["moderator"])

        instance.send(:queue=, hash["queue"])

        instance.send(:reportId=, hash["reportId"])

        instance.send(:startAt=, hash["startAt"])

        instance.send(:endAt=, hash["endAt"])

        instance
      end
    end
  end

  module ToolsOzoneSafelinkDefs
    class Event
      attr_accessor :id

      attr_accessor :eventType

      attr_accessor :url

      attr_accessor :pattern

      attr_accessor :action

      attr_accessor :reason

      attr_accessor :createdBy

      attr_accessor :createdAt

      attr_accessor :comment

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:id=, hash["id"])

        instance.send(:eventType=, hash["eventType"])

        instance.send(:url=, hash["url"])

        instance.send(:pattern=, hash["pattern"])

        instance.send(:action=, hash["action"])

        instance.send(:reason=, hash["reason"])

        instance.send(:createdBy=, hash["createdBy"])

        instance.send(:createdAt=, hash["createdAt"])

        instance.send(:comment=, hash["comment"])

        instance
      end
    end
  end

  module ToolsOzoneSafelinkDefs
    class EventType
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneSafelinkDefs
    class PatternType
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneSafelinkDefs
    class ActionType
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneSafelinkDefs
    class ReasonType
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneSafelinkDefs
    class UrlRule
      attr_accessor :url

      attr_accessor :pattern

      attr_accessor :action

      attr_accessor :reason

      attr_accessor :comment

      attr_accessor :createdBy

      attr_accessor :createdAt

      attr_accessor :updatedAt

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:url=, hash["url"])

        instance.send(:pattern=, hash["pattern"])

        instance.send(:action=, hash["action"])

        instance.send(:reason=, hash["reason"])

        instance.send(:comment=, hash["comment"])

        instance.send(:createdBy=, hash["createdBy"])

        instance.send(:createdAt=, hash["createdAt"])

        instance.send(:updatedAt=, hash["updatedAt"])

        instance
      end
    end
  end

  module ToolsOzoneServerGetconfig
    class ServiceConfig
      attr_accessor :url

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:url=, hash["url"])

        instance
      end
    end
  end

  module ToolsOzoneServerGetconfig
    class ViewerConfig
      attr_accessor :role

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:role=, hash["role"])

        instance
      end
    end
  end

  module ToolsOzoneSetDefs
    class Set
      attr_accessor :name

      attr_accessor :description

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:name=, hash["name"])

        instance.send(:description=, hash["description"])

        instance
      end
    end
  end

  module ToolsOzoneSetDefs
    class SetView
      attr_accessor :name

      attr_accessor :description

      attr_accessor :setSize

      attr_accessor :createdAt

      attr_accessor :updatedAt

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:name=, hash["name"])

        instance.send(:description=, hash["description"])

        instance.send(:setSize=, hash["setSize"])

        instance.send(:createdAt=, hash["createdAt"])

        instance.send(:updatedAt=, hash["updatedAt"])

        instance
      end
    end
  end

  module ToolsOzoneSettingDefs
    class Option
      attr_accessor :key

      attr_accessor :did

      attr_accessor :value

      attr_accessor :description

      attr_accessor :createdAt

      attr_accessor :updatedAt

      attr_accessor :managerRole

      attr_accessor :scope

      attr_accessor :createdBy

      attr_accessor :lastUpdatedBy

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:key=, hash["key"])

        instance.send(:did=, hash["did"])

        instance.send(:value=, hash["value"])

        instance.send(:description=, hash["description"])

        instance.send(:createdAt=, hash["createdAt"])

        instance.send(:updatedAt=, hash["updatedAt"])

        instance.send(:managerRole=, hash["managerRole"])

        instance.send(:scope=, hash["scope"])

        instance.send(:createdBy=, hash["createdBy"])

        instance.send(:lastUpdatedBy=, hash["lastUpdatedBy"])

        instance
      end
    end
  end

  module ToolsOzoneSignatureDefs
    class SigDetail
      attr_accessor :property

      attr_accessor :value

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:property=, hash["property"])

        instance.send(:value=, hash["value"])

        instance
      end
    end
  end

  module ToolsOzoneSignatureFindrelatedaccounts
    class RelatedAccount
      attr_accessor :account

      attr_accessor :similarities

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:account=, hash["account"])

        instance.send(:similarities=, hash["similarities"])

        instance
      end
    end
  end

  module ToolsOzoneTeamDefs
    class Member
      attr_accessor :did

      attr_accessor :disabled

      attr_accessor :profile

      attr_accessor :createdAt

      attr_accessor :updatedAt

      attr_accessor :lastUpdatedBy

      attr_accessor :role

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:did=, hash["did"])

        instance.send(:disabled=, hash["disabled"])

        instance.send(:profile=, hash["profile"])

        instance.send(:createdAt=, hash["createdAt"])

        instance.send(:updatedAt=, hash["updatedAt"])

        instance.send(:lastUpdatedBy=, hash["lastUpdatedBy"])

        instance.send(:role=, hash["role"])

        instance
      end
    end
  end

  module ToolsOzoneTeamDefs
    class RoleAdmin
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneTeamDefs
    class RoleModerator
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneTeamDefs
    class RoleTriage
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneTeamDefs
    class RoleVerifier
      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        new
      end
    end
  end

  module ToolsOzoneVerificationDefs
    class VerificationView
      attr_accessor :issuer

      attr_accessor :uri

      attr_accessor :subject

      attr_accessor :handle

      attr_accessor :displayName

      attr_accessor :createdAt

      attr_accessor :revokeReason

      attr_accessor :revokedAt

      attr_accessor :revokedBy

      attr_accessor :subjectProfile

      attr_accessor :issuerProfile

      attr_accessor :subjectRepo

      attr_accessor :issuerRepo

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:issuer=, hash["issuer"])

        instance.send(:uri=, hash["uri"])

        instance.send(:subject=, hash["subject"])

        instance.send(:handle=, hash["handle"])

        instance.send(:displayName=, hash["displayName"])

        instance.send(:createdAt=, hash["createdAt"])

        instance.send(:revokeReason=, hash["revokeReason"])

        instance.send(:revokedAt=, hash["revokedAt"])

        instance.send(:revokedBy=, hash["revokedBy"])

        instance.send(:subjectProfile=, hash["subjectProfile"])

        instance.send(:issuerProfile=, hash["issuerProfile"])

        instance.send(:subjectRepo=, hash["subjectRepo"])

        instance.send(:issuerRepo=, hash["issuerRepo"])

        instance
      end
    end
  end

  module ToolsOzoneVerificationGrantverifications
    class VerificationInput
      attr_accessor :subject

      attr_accessor :handle

      attr_accessor :displayName

      attr_accessor :createdAt

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:subject=, hash["subject"])

        instance.send(:handle=, hash["handle"])

        instance.send(:displayName=, hash["displayName"])

        instance.send(:createdAt=, hash["createdAt"])

        instance
      end
    end
  end

  module ToolsOzoneVerificationGrantverifications
    class GrantError
      attr_accessor :error

      attr_accessor :subject

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:error=, hash["error"])

        instance.send(:subject=, hash["subject"])

        instance
      end
    end
  end

  module ToolsOzoneVerificationRevokeverifications
    class RevokeError
      attr_accessor :uri

      attr_accessor :error

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new

        instance.send(:uri=, hash["uri"])

        instance.send(:error=, hash["error"])

        instance
      end
    end
  end

  module AppBskyActorGetpreferences
    module GetPreferences
      class Input
        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          new
        end

        def to_h
          {}
        end
      end

      class Output
        attr_accessor :preferences

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:preferences=, hash["preferences"])

          instance
        end

        def to_h
          {

            "preferences" => instance_variable_get(:@preferences)

          }
        end
      end
    end
  end

  module AppBskyActorGetprofile
    module GetProfile
      class Input
        attr_accessor :actor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:actor=, hash["actor"])

          instance
        end

        def to_h
          {

            "actor" => instance_variable_get(:@actor)

          }
        end
      end

      class Output
        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          new
        end

        def to_h
          {}
        end
      end
    end
  end

  module AppBskyActorGetprofiles
    module GetProfiles
      class Input
        attr_accessor :actors

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:actors=, hash["actors"])

          instance
        end

        def to_h
          {

            "actors" => instance_variable_get(:@actors)

          }
        end
      end

      class Output
        attr_accessor :profiles

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:profiles=, hash["profiles"])

          instance
        end

        def to_h
          {

            "profiles" => instance_variable_get(:@profiles)

          }
        end
      end
    end
  end

  module AppBskyActorGetsuggestions
    module GetSuggestions
      class Input
        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :actors

        attr_accessor :recId

        attr_accessor :recIdStr

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:actors=, hash["actors"])

          instance.send(:recId=, hash["recId"])

          instance.send(:recIdStr=, hash["recIdStr"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "actors" => instance_variable_get(:@actors),

            "recId" => instance_variable_get(:@recId),

            "recIdStr" => instance_variable_get(:@recIdStr)

          }
        end
      end
    end
  end

  module AppBskyActorPutpreferences
    module PutPreferences
      class Input
        attr_accessor :preferences

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:preferences=, hash["preferences"])

          instance
        end

        def to_h
          {

            "preferences" => instance_variable_get(:@preferences)

          }
        end
      end
    end
  end

  module AppBskyActorSearchactors
    module SearchActors
      class Input
        attr_accessor :term

        attr_accessor :q

        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:term=, hash["term"])

          instance.send(:q=, hash["q"])

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "term" => instance_variable_get(:@term),

            "q" => instance_variable_get(:@q),

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :actors

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:actors=, hash["actors"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "actors" => instance_variable_get(:@actors)

          }
        end
      end
    end
  end

  module AppBskyActorSearchactorstypeahead
    module SearchActorsTypeahead
      class Input
        attr_accessor :term

        attr_accessor :q

        attr_accessor :limit

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:term=, hash["term"])

          instance.send(:q=, hash["q"])

          instance.send(:limit=, hash["limit"])

          instance
        end

        def to_h
          {

            "term" => instance_variable_get(:@term),

            "q" => instance_variable_get(:@q),

            "limit" => instance_variable_get(:@limit)

          }
        end
      end

      class Output
        attr_accessor :actors

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:actors=, hash["actors"])

          instance
        end

        def to_h
          {

            "actors" => instance_variable_get(:@actors)

          }
        end
      end
    end
  end

  module AppBskyAgeassuranceBegin
    module Begin
      class Input
        attr_accessor :email

        attr_accessor :language

        attr_accessor :countryCode

        attr_accessor :regionCode

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:email=, hash["email"])

          instance.send(:language=, hash["language"])

          instance.send(:countryCode=, hash["countryCode"])

          instance.send(:regionCode=, hash["regionCode"])

          instance
        end

        def to_h
          {

            "email" => instance_variable_get(:@email),

            "language" => instance_variable_get(:@language),

            "countryCode" => instance_variable_get(:@countryCode),

            "regionCode" => instance_variable_get(:@regionCode)

          }
        end
      end

      class Output
        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          new
        end

        def to_h
          {}
        end
      end
    end
  end

  module AppBskyAgeassuranceGetconfig
    module GetConfig
      class Output
        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          new
        end

        def to_h
          {}
        end
      end
    end
  end

  module AppBskyAgeassuranceGetstate
    module GetState
      class Input
        attr_accessor :countryCode

        attr_accessor :regionCode

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:countryCode=, hash["countryCode"])

          instance.send(:regionCode=, hash["regionCode"])

          instance
        end

        def to_h
          {

            "countryCode" => instance_variable_get(:@countryCode),

            "regionCode" => instance_variable_get(:@regionCode)

          }
        end
      end

      class Output
        attr_accessor :state

        attr_accessor :metadata

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:state=, hash["state"])

          instance.send(:metadata=, hash["metadata"])

          instance
        end

        def to_h
          {

            "state" => instance_variable_get(:@state),

            "metadata" => instance_variable_get(:@metadata)

          }
        end
      end
    end
  end

  module AppBskyBookmarkCreatebookmark
    module CreateBookmark
      class Input
        attr_accessor :uri

        attr_accessor :cid

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:uri=, hash["uri"])

          instance.send(:cid=, hash["cid"])

          instance
        end

        def to_h
          {

            "uri" => instance_variable_get(:@uri),

            "cid" => instance_variable_get(:@cid)

          }
        end
      end
    end
  end

  module AppBskyBookmarkDeletebookmark
    module DeleteBookmark
      class Input
        attr_accessor :uri

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:uri=, hash["uri"])

          instance
        end

        def to_h
          {

            "uri" => instance_variable_get(:@uri)

          }
        end
      end
    end
  end

  module AppBskyBookmarkGetbookmarks
    module GetBookmarks
      class Input
        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :bookmarks

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:bookmarks=, hash["bookmarks"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "bookmarks" => instance_variable_get(:@bookmarks)

          }
        end
      end
    end
  end

  module AppBskyContactDismissmatch
    module DismissMatch
      class Input
        attr_accessor :subject

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:subject=, hash["subject"])

          instance
        end

        def to_h
          {

            "subject" => instance_variable_get(:@subject)

          }
        end
      end

      class Output
        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          new
        end

        def to_h
          {}
        end
      end
    end
  end

  module AppBskyContactGetmatches
    module GetMatches
      class Input
        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :matches

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:matches=, hash["matches"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "matches" => instance_variable_get(:@matches)

          }
        end
      end
    end
  end

  module AppBskyContactGetsyncstatus
    module GetSyncStatus
      class Input
        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          new
        end

        def to_h
          {}
        end
      end

      class Output
        attr_accessor :syncStatus

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:syncStatus=, hash["syncStatus"])

          instance
        end

        def to_h
          {

            "syncStatus" => instance_variable_get(:@syncStatus)

          }
        end
      end
    end
  end

  module AppBskyContactImportcontacts
    module ImportContacts
      class Input
        attr_accessor :token

        attr_accessor :contacts

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:token=, hash["token"])

          instance.send(:contacts=, hash["contacts"])

          instance
        end

        def to_h
          {

            "token" => instance_variable_get(:@token),

            "contacts" => instance_variable_get(:@contacts)

          }
        end
      end

      class Output
        attr_accessor :matchesAndContactIndexes

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:matchesAndContactIndexes=, hash["matchesAndContactIndexes"])

          instance
        end

        def to_h
          {

            "matchesAndContactIndexes" => instance_variable_get(:@matchesAndContactIndexes)

          }
        end
      end
    end
  end

  module AppBskyContactRemovedata
    module RemoveData
      class Input
        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          new
        end

        def to_h
          {}
        end
      end

      class Output
        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          new
        end

        def to_h
          {}
        end
      end
    end
  end

  module AppBskyContactSendnotification
    module SendNotification
      class Input
        attr_accessor :from

        attr_accessor :to

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:from=, hash["from"])

          instance.send(:to=, hash["to"])

          instance
        end

        def to_h
          {

            "from" => instance_variable_get(:@from),

            "to" => instance_variable_get(:@to)

          }
        end
      end

      class Output
        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          new
        end

        def to_h
          {}
        end
      end
    end
  end

  module AppBskyContactStartphoneverification
    module StartPhoneVerification
      class Input
        attr_accessor :phone

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:phone=, hash["phone"])

          instance
        end

        def to_h
          {

            "phone" => instance_variable_get(:@phone)

          }
        end
      end

      class Output
        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          new
        end

        def to_h
          {}
        end
      end
    end
  end

  module AppBskyContactVerifyphone
    module VerifyPhone
      class Input
        attr_accessor :phone

        attr_accessor :code

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:phone=, hash["phone"])

          instance.send(:code=, hash["code"])

          instance
        end

        def to_h
          {

            "phone" => instance_variable_get(:@phone),

            "code" => instance_variable_get(:@code)

          }
        end
      end

      class Output
        attr_accessor :token

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:token=, hash["token"])

          instance
        end

        def to_h
          {

            "token" => instance_variable_get(:@token)

          }
        end
      end
    end
  end

  module AppBskyDraftCreatedraft
    module CreateDraft
      class Input
        attr_accessor :draft

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:draft=, hash["draft"])

          instance
        end

        def to_h
          {

            "draft" => instance_variable_get(:@draft)

          }
        end
      end

      class Output
        attr_accessor :id

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:id=, hash["id"])

          instance
        end

        def to_h
          {

            "id" => instance_variable_get(:@id)

          }
        end
      end
    end
  end

  module AppBskyDraftDeletedraft
    module DeleteDraft
      class Input
        attr_accessor :id

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:id=, hash["id"])

          instance
        end

        def to_h
          {

            "id" => instance_variable_get(:@id)

          }
        end
      end
    end
  end

  module AppBskyDraftGetdrafts
    module GetDrafts
      class Input
        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :drafts

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:drafts=, hash["drafts"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "drafts" => instance_variable_get(:@drafts)

          }
        end
      end
    end
  end

  module AppBskyDraftUpdatedraft
    module UpdateDraft
      class Input
        attr_accessor :draft

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:draft=, hash["draft"])

          instance
        end

        def to_h
          {

            "draft" => instance_variable_get(:@draft)

          }
        end
      end
    end
  end

  module AppBskyEmbedGetembedexternalview
    module GetEmbedExternalView
      class Input
        attr_accessor :url

        attr_accessor :uris

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:url=, hash["url"])

          instance.send(:uris=, hash["uris"])

          instance
        end

        def to_h
          {

            "url" => instance_variable_get(:@url),

            "uris" => instance_variable_get(:@uris)

          }
        end
      end

      class Output
        attr_accessor :view

        attr_accessor :associatedRefs

        attr_accessor :associatedRecords

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:view=, hash["view"])

          instance.send(:associatedRefs=, hash["associatedRefs"])

          instance.send(:associatedRecords=, hash["associatedRecords"])

          instance
        end

        def to_h
          {

            "view" => instance_variable_get(:@view),

            "associatedRefs" => instance_variable_get(:@associatedRefs),

            "associatedRecords" => instance_variable_get(:@associatedRecords)

          }
        end
      end
    end
  end

  module AppBskyFeedDescribefeedgenerator
    module DescribeFeedGenerator
      class Output
        attr_accessor :did

        attr_accessor :feeds

        attr_accessor :links

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:did=, hash["did"])

          instance.send(:feeds=, hash["feeds"])

          instance.send(:links=, hash["links"])

          instance
        end

        def to_h
          {

            "did" => instance_variable_get(:@did),

            "feeds" => instance_variable_get(:@feeds),

            "links" => instance_variable_get(:@links)

          }
        end
      end
    end
  end

  module AppBskyFeedGetactorfeeds
    module GetActorFeeds
      class Input
        attr_accessor :actor

        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:actor=, hash["actor"])

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "actor" => instance_variable_get(:@actor),

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :feeds

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:feeds=, hash["feeds"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "feeds" => instance_variable_get(:@feeds)

          }
        end
      end
    end
  end

  module AppBskyFeedGetactorlikes
    module GetActorLikes
      class Input
        attr_accessor :actor

        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:actor=, hash["actor"])

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "actor" => instance_variable_get(:@actor),

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :feed

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:feed=, hash["feed"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "feed" => instance_variable_get(:@feed)

          }
        end
      end
    end
  end

  module AppBskyFeedGetauthorfeed
    module GetAuthorFeed
      class Input
        attr_accessor :actor

        attr_accessor :limit

        attr_accessor :cursor

        attr_accessor :filter

        attr_accessor :includePins

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:actor=, hash["actor"])

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance.send(:filter=, hash["filter"])

          instance.send(:includePins=, hash["includePins"])

          instance
        end

        def to_h
          {

            "actor" => instance_variable_get(:@actor),

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor),

            "filter" => instance_variable_get(:@filter),

            "includePins" => instance_variable_get(:@includePins)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :feed

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:feed=, hash["feed"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "feed" => instance_variable_get(:@feed)

          }
        end
      end
    end
  end

  module AppBskyFeedGetfeed
    module GetFeed
      class Input
        attr_accessor :feed

        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:feed=, hash["feed"])

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "feed" => instance_variable_get(:@feed),

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :feed

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:feed=, hash["feed"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "feed" => instance_variable_get(:@feed)

          }
        end
      end
    end
  end

  module AppBskyFeedGetfeedgenerator
    module GetFeedGenerator
      class Input
        attr_accessor :feed

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:feed=, hash["feed"])

          instance
        end

        def to_h
          {

            "feed" => instance_variable_get(:@feed)

          }
        end
      end

      class Output
        attr_accessor :view

        attr_accessor :isOnline

        attr_accessor :isValid

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:view=, hash["view"])

          instance.send(:isOnline=, hash["isOnline"])

          instance.send(:isValid=, hash["isValid"])

          instance
        end

        def to_h
          {

            "view" => instance_variable_get(:@view),

            "isOnline" => instance_variable_get(:@isOnline),

            "isValid" => instance_variable_get(:@isValid)

          }
        end
      end
    end
  end

  module AppBskyFeedGetfeedgenerators
    module GetFeedGenerators
      class Input
        attr_accessor :feeds

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:feeds=, hash["feeds"])

          instance
        end

        def to_h
          {

            "feeds" => instance_variable_get(:@feeds)

          }
        end
      end

      class Output
        attr_accessor :feeds

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:feeds=, hash["feeds"])

          instance
        end

        def to_h
          {

            "feeds" => instance_variable_get(:@feeds)

          }
        end
      end
    end
  end

  module AppBskyFeedGetfeedskeleton
    module GetFeedSkeleton
      class Input
        attr_accessor :feed

        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:feed=, hash["feed"])

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "feed" => instance_variable_get(:@feed),

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :feed

        attr_accessor :reqId

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:feed=, hash["feed"])

          instance.send(:reqId=, hash["reqId"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "feed" => instance_variable_get(:@feed),

            "reqId" => instance_variable_get(:@reqId)

          }
        end
      end
    end
  end

  module AppBskyFeedGetlikes
    module GetLikes
      class Input
        attr_accessor :uri

        attr_accessor :cid

        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:uri=, hash["uri"])

          instance.send(:cid=, hash["cid"])

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "uri" => instance_variable_get(:@uri),

            "cid" => instance_variable_get(:@cid),

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :uri

        attr_accessor :cid

        attr_accessor :cursor

        attr_accessor :likes

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:uri=, hash["uri"])

          instance.send(:cid=, hash["cid"])

          instance.send(:cursor=, hash["cursor"])

          instance.send(:likes=, hash["likes"])

          instance
        end

        def to_h
          {

            "uri" => instance_variable_get(:@uri),

            "cid" => instance_variable_get(:@cid),

            "cursor" => instance_variable_get(:@cursor),

            "likes" => instance_variable_get(:@likes)

          }
        end
      end
    end
  end

  module AppBskyFeedGetlistfeed
    module GetListFeed
      class Input
        attr_accessor :list

        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:list=, hash["list"])

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "list" => instance_variable_get(:@list),

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :feed

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:feed=, hash["feed"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "feed" => instance_variable_get(:@feed)

          }
        end
      end
    end
  end

  module AppBskyFeedGetpostthread
    module GetPostThread
      class Input
        attr_accessor :uri

        attr_accessor :depth

        attr_accessor :parentHeight

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:uri=, hash["uri"])

          instance.send(:depth=, hash["depth"])

          instance.send(:parentHeight=, hash["parentHeight"])

          instance
        end

        def to_h
          {

            "uri" => instance_variable_get(:@uri),

            "depth" => instance_variable_get(:@depth),

            "parentHeight" => instance_variable_get(:@parentHeight)

          }
        end
      end

      class Output
        attr_accessor :thread

        attr_accessor :threadgate

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:thread=, hash["thread"])

          instance.send(:threadgate=, hash["threadgate"])

          instance
        end

        def to_h
          {

            "thread" => instance_variable_get(:@thread),

            "threadgate" => instance_variable_get(:@threadgate)

          }
        end
      end
    end
  end

  module AppBskyFeedGetposts
    module GetPosts
      class Input
        attr_accessor :uris

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:uris=, hash["uris"])

          instance
        end

        def to_h
          {

            "uris" => instance_variable_get(:@uris)

          }
        end
      end

      class Output
        attr_accessor :posts

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:posts=, hash["posts"])

          instance
        end

        def to_h
          {

            "posts" => instance_variable_get(:@posts)

          }
        end
      end
    end
  end

  module AppBskyFeedGetquotes
    module GetQuotes
      class Input
        attr_accessor :uri

        attr_accessor :cid

        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:uri=, hash["uri"])

          instance.send(:cid=, hash["cid"])

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "uri" => instance_variable_get(:@uri),

            "cid" => instance_variable_get(:@cid),

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :uri

        attr_accessor :cid

        attr_accessor :cursor

        attr_accessor :posts

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:uri=, hash["uri"])

          instance.send(:cid=, hash["cid"])

          instance.send(:cursor=, hash["cursor"])

          instance.send(:posts=, hash["posts"])

          instance
        end

        def to_h
          {

            "uri" => instance_variable_get(:@uri),

            "cid" => instance_variable_get(:@cid),

            "cursor" => instance_variable_get(:@cursor),

            "posts" => instance_variable_get(:@posts)

          }
        end
      end
    end
  end

  module AppBskyFeedGetrepostedby
    module GetRepostedBy
      class Input
        attr_accessor :uri

        attr_accessor :cid

        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:uri=, hash["uri"])

          instance.send(:cid=, hash["cid"])

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "uri" => instance_variable_get(:@uri),

            "cid" => instance_variable_get(:@cid),

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :uri

        attr_accessor :cid

        attr_accessor :cursor

        attr_accessor :repostedBy

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:uri=, hash["uri"])

          instance.send(:cid=, hash["cid"])

          instance.send(:cursor=, hash["cursor"])

          instance.send(:repostedBy=, hash["repostedBy"])

          instance
        end

        def to_h
          {

            "uri" => instance_variable_get(:@uri),

            "cid" => instance_variable_get(:@cid),

            "cursor" => instance_variable_get(:@cursor),

            "repostedBy" => instance_variable_get(:@repostedBy)

          }
        end
      end
    end
  end

  module AppBskyFeedGetsuggestedfeeds
    module GetSuggestedFeeds
      class Input
        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :feeds

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:feeds=, hash["feeds"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "feeds" => instance_variable_get(:@feeds)

          }
        end
      end
    end
  end

  module AppBskyFeedGettimeline
    module GetTimeline
      class Input
        attr_accessor :algorithm

        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:algorithm=, hash["algorithm"])

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "algorithm" => instance_variable_get(:@algorithm),

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :feed

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:feed=, hash["feed"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "feed" => instance_variable_get(:@feed)

          }
        end
      end
    end
  end

  module AppBskyFeedSearchposts
    module SearchPosts
      class Input
        attr_accessor :q

        attr_accessor :sort

        attr_accessor :since

        attr_accessor :until

        attr_accessor :mentions

        attr_accessor :author

        attr_accessor :lang

        attr_accessor :domain

        attr_accessor :url

        attr_accessor :tag

        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:q=, hash["q"])

          instance.send(:sort=, hash["sort"])

          instance.send(:since=, hash["since"])

          instance.send(:until=, hash["until"])

          instance.send(:mentions=, hash["mentions"])

          instance.send(:author=, hash["author"])

          instance.send(:lang=, hash["lang"])

          instance.send(:domain=, hash["domain"])

          instance.send(:url=, hash["url"])

          instance.send(:tag=, hash["tag"])

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "q" => instance_variable_get(:@q),

            "sort" => instance_variable_get(:@sort),

            "since" => instance_variable_get(:@since),

            "until" => instance_variable_get(:@until),

            "mentions" => instance_variable_get(:@mentions),

            "author" => instance_variable_get(:@author),

            "lang" => instance_variable_get(:@lang),

            "domain" => instance_variable_get(:@domain),

            "url" => instance_variable_get(:@url),

            "tag" => instance_variable_get(:@tag),

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :hitsTotal

        attr_accessor :posts

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:hitsTotal=, hash["hitsTotal"])

          instance.send(:posts=, hash["posts"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "hitsTotal" => instance_variable_get(:@hitsTotal),

            "posts" => instance_variable_get(:@posts)

          }
        end
      end
    end
  end

  module AppBskyFeedSearchpostsv2
    module SearchPostsV2
      class Input
        attr_accessor :cursor

        attr_accessor :limit

        attr_accessor :query

        attr_accessor :sort

        attr_accessor :authors

        attr_accessor :mentions

        attr_accessor :domains

        attr_accessor :urls

        attr_accessor :embeddedAtUris

        attr_accessor :hashtags

        attr_accessor :excludeAuthors

        attr_accessor :excludeMentions

        attr_accessor :excludeDomains

        attr_accessor :excludeUrls

        attr_accessor :excludeEmbeddedAtUris

        attr_accessor :excludeHashtags

        attr_accessor :since

        attr_accessor :until

        attr_accessor :allTime

        attr_accessor :languages

        attr_accessor :excludeLanguages

        attr_accessor :hasMedia

        attr_accessor :hasVideo

        attr_accessor :replyParentUri

        attr_accessor :threadRootUri

        attr_accessor :excludeReplies

        attr_accessor :repliesOnly

        attr_accessor :following

        attr_accessor :queryLanguage

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:limit=, hash["limit"])

          instance.send(:query=, hash["query"])

          instance.send(:sort=, hash["sort"])

          instance.send(:authors=, hash["authors"])

          instance.send(:mentions=, hash["mentions"])

          instance.send(:domains=, hash["domains"])

          instance.send(:urls=, hash["urls"])

          instance.send(:embeddedAtUris=, hash["embeddedAtUris"])

          instance.send(:hashtags=, hash["hashtags"])

          instance.send(:excludeAuthors=, hash["excludeAuthors"])

          instance.send(:excludeMentions=, hash["excludeMentions"])

          instance.send(:excludeDomains=, hash["excludeDomains"])

          instance.send(:excludeUrls=, hash["excludeUrls"])

          instance.send(:excludeEmbeddedAtUris=, hash["excludeEmbeddedAtUris"])

          instance.send(:excludeHashtags=, hash["excludeHashtags"])

          instance.send(:since=, hash["since"])

          instance.send(:until=, hash["until"])

          instance.send(:allTime=, hash["allTime"])

          instance.send(:languages=, hash["languages"])

          instance.send(:excludeLanguages=, hash["excludeLanguages"])

          instance.send(:hasMedia=, hash["hasMedia"])

          instance.send(:hasVideo=, hash["hasVideo"])

          instance.send(:replyParentUri=, hash["replyParentUri"])

          instance.send(:threadRootUri=, hash["threadRootUri"])

          instance.send(:excludeReplies=, hash["excludeReplies"])

          instance.send(:repliesOnly=, hash["repliesOnly"])

          instance.send(:following=, hash["following"])

          instance.send(:queryLanguage=, hash["queryLanguage"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "limit" => instance_variable_get(:@limit),

            "query" => instance_variable_get(:@query),

            "sort" => instance_variable_get(:@sort),

            "authors" => instance_variable_get(:@authors),

            "mentions" => instance_variable_get(:@mentions),

            "domains" => instance_variable_get(:@domains),

            "urls" => instance_variable_get(:@urls),

            "embeddedAtUris" => instance_variable_get(:@embeddedAtUris),

            "hashtags" => instance_variable_get(:@hashtags),

            "excludeAuthors" => instance_variable_get(:@excludeAuthors),

            "excludeMentions" => instance_variable_get(:@excludeMentions),

            "excludeDomains" => instance_variable_get(:@excludeDomains),

            "excludeUrls" => instance_variable_get(:@excludeUrls),

            "excludeEmbeddedAtUris" => instance_variable_get(:@excludeEmbeddedAtUris),

            "excludeHashtags" => instance_variable_get(:@excludeHashtags),

            "since" => instance_variable_get(:@since),

            "until" => instance_variable_get(:@until),

            "allTime" => instance_variable_get(:@allTime),

            "languages" => instance_variable_get(:@languages),

            "excludeLanguages" => instance_variable_get(:@excludeLanguages),

            "hasMedia" => instance_variable_get(:@hasMedia),

            "hasVideo" => instance_variable_get(:@hasVideo),

            "replyParentUri" => instance_variable_get(:@replyParentUri),

            "threadRootUri" => instance_variable_get(:@threadRootUri),

            "excludeReplies" => instance_variable_get(:@excludeReplies),

            "repliesOnly" => instance_variable_get(:@repliesOnly),

            "following" => instance_variable_get(:@following),

            "queryLanguage" => instance_variable_get(:@queryLanguage)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :hitsTotal

        attr_accessor :posts

        attr_accessor :detectedQueryLanguages

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:hitsTotal=, hash["hitsTotal"])

          instance.send(:posts=, hash["posts"])

          instance.send(:detectedQueryLanguages=, hash["detectedQueryLanguages"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "hitsTotal" => instance_variable_get(:@hitsTotal),

            "posts" => instance_variable_get(:@posts),

            "detectedQueryLanguages" => instance_variable_get(:@detectedQueryLanguages)

          }
        end
      end
    end
  end

  module AppBskyFeedSendinteractions
    module SendInteractions
      class Input
        attr_accessor :feed

        attr_accessor :interactions

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:feed=, hash["feed"])

          instance.send(:interactions=, hash["interactions"])

          instance
        end

        def to_h
          {

            "feed" => instance_variable_get(:@feed),

            "interactions" => instance_variable_get(:@interactions)

          }
        end
      end

      class Output
        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          new
        end

        def to_h
          {}
        end
      end
    end
  end

  module AppBskyGraphGetactorstarterpacks
    module GetActorStarterPacks
      class Input
        attr_accessor :actor

        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:actor=, hash["actor"])

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "actor" => instance_variable_get(:@actor),

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :starterPacks

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:starterPacks=, hash["starterPacks"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "starterPacks" => instance_variable_get(:@starterPacks)

          }
        end
      end
    end
  end

  module AppBskyGraphGetblocks
    module GetBlocks
      class Input
        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :blocks

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:blocks=, hash["blocks"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "blocks" => instance_variable_get(:@blocks)

          }
        end
      end
    end
  end

  module AppBskyGraphGetfollowers
    module GetFollowers
      class Input
        attr_accessor :actor

        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:actor=, hash["actor"])

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "actor" => instance_variable_get(:@actor),

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :subject

        attr_accessor :cursor

        attr_accessor :followers

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:subject=, hash["subject"])

          instance.send(:cursor=, hash["cursor"])

          instance.send(:followers=, hash["followers"])

          instance
        end

        def to_h
          {

            "subject" => instance_variable_get(:@subject),

            "cursor" => instance_variable_get(:@cursor),

            "followers" => instance_variable_get(:@followers)

          }
        end
      end
    end
  end

  module AppBskyGraphGetfollows
    module GetFollows
      class Input
        attr_accessor :actor

        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:actor=, hash["actor"])

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "actor" => instance_variable_get(:@actor),

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :subject

        attr_accessor :cursor

        attr_accessor :follows

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:subject=, hash["subject"])

          instance.send(:cursor=, hash["cursor"])

          instance.send(:follows=, hash["follows"])

          instance
        end

        def to_h
          {

            "subject" => instance_variable_get(:@subject),

            "cursor" => instance_variable_get(:@cursor),

            "follows" => instance_variable_get(:@follows)

          }
        end
      end
    end
  end

  module AppBskyGraphGetknownfollowers
    module GetKnownFollowers
      class Input
        attr_accessor :actor

        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:actor=, hash["actor"])

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "actor" => instance_variable_get(:@actor),

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :subject

        attr_accessor :cursor

        attr_accessor :followers

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:subject=, hash["subject"])

          instance.send(:cursor=, hash["cursor"])

          instance.send(:followers=, hash["followers"])

          instance
        end

        def to_h
          {

            "subject" => instance_variable_get(:@subject),

            "cursor" => instance_variable_get(:@cursor),

            "followers" => instance_variable_get(:@followers)

          }
        end
      end
    end
  end

  module AppBskyGraphGetlist
    module GetList
      class Input
        attr_accessor :list

        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:list=, hash["list"])

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "list" => instance_variable_get(:@list),

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :list

        attr_accessor :items

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:list=, hash["list"])

          instance.send(:items=, hash["items"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "list" => instance_variable_get(:@list),

            "items" => instance_variable_get(:@items)

          }
        end
      end
    end
  end

  module AppBskyGraphGetlistblocks
    module GetListBlocks
      class Input
        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :lists

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:lists=, hash["lists"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "lists" => instance_variable_get(:@lists)

          }
        end
      end
    end
  end

  module AppBskyGraphGetlistmutes
    module GetListMutes
      class Input
        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :lists

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:lists=, hash["lists"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "lists" => instance_variable_get(:@lists)

          }
        end
      end
    end
  end

  module AppBskyGraphGetlists
    module GetLists
      class Input
        attr_accessor :actor

        attr_accessor :limit

        attr_accessor :cursor

        attr_accessor :purposes

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:actor=, hash["actor"])

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance.send(:purposes=, hash["purposes"])

          instance
        end

        def to_h
          {

            "actor" => instance_variable_get(:@actor),

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor),

            "purposes" => instance_variable_get(:@purposes)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :lists

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:lists=, hash["lists"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "lists" => instance_variable_get(:@lists)

          }
        end
      end
    end
  end

  module AppBskyGraphGetlistswithmembership
    module GetListsWithMembership
      class Input
        attr_accessor :actor

        attr_accessor :limit

        attr_accessor :cursor

        attr_accessor :purposes

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:actor=, hash["actor"])

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance.send(:purposes=, hash["purposes"])

          instance
        end

        def to_h
          {

            "actor" => instance_variable_get(:@actor),

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor),

            "purposes" => instance_variable_get(:@purposes)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :listsWithMembership

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:listsWithMembership=, hash["listsWithMembership"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "listsWithMembership" => instance_variable_get(:@listsWithMembership)

          }
        end
      end
    end
  end

  module AppBskyGraphGetmutes
    module GetMutes
      class Input
        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :mutes

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:mutes=, hash["mutes"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "mutes" => instance_variable_get(:@mutes)

          }
        end
      end
    end
  end

  module AppBskyGraphGetrelationships
    module GetRelationships
      class Input
        attr_accessor :actor

        attr_accessor :others

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:actor=, hash["actor"])

          instance.send(:others=, hash["others"])

          instance
        end

        def to_h
          {

            "actor" => instance_variable_get(:@actor),

            "others" => instance_variable_get(:@others)

          }
        end
      end

      class Output
        attr_accessor :actor

        attr_accessor :relationships

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:actor=, hash["actor"])

          instance.send(:relationships=, hash["relationships"])

          instance
        end

        def to_h
          {

            "actor" => instance_variable_get(:@actor),

            "relationships" => instance_variable_get(:@relationships)

          }
        end
      end
    end
  end

  module AppBskyGraphGetstarterpack
    module GetStarterPack
      class Input
        attr_accessor :starterPack

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:starterPack=, hash["starterPack"])

          instance
        end

        def to_h
          {

            "starterPack" => instance_variable_get(:@starterPack)

          }
        end
      end

      class Output
        attr_accessor :starterPack

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:starterPack=, hash["starterPack"])

          instance
        end

        def to_h
          {

            "starterPack" => instance_variable_get(:@starterPack)

          }
        end
      end
    end
  end

  module AppBskyGraphGetstarterpacks
    module GetStarterPacks
      class Input
        attr_accessor :uris

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:uris=, hash["uris"])

          instance
        end

        def to_h
          {

            "uris" => instance_variable_get(:@uris)

          }
        end
      end

      class Output
        attr_accessor :starterPacks

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:starterPacks=, hash["starterPacks"])

          instance
        end

        def to_h
          {

            "starterPacks" => instance_variable_get(:@starterPacks)

          }
        end
      end
    end
  end

  module AppBskyGraphGetstarterpackswithmembership
    module GetStarterPacksWithMembership
      class Input
        attr_accessor :actor

        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:actor=, hash["actor"])

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "actor" => instance_variable_get(:@actor),

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :starterPacksWithMembership

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:starterPacksWithMembership=, hash["starterPacksWithMembership"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "starterPacksWithMembership" => instance_variable_get(:@starterPacksWithMembership)

          }
        end
      end
    end
  end

  module AppBskyGraphGetsuggestedfollowsbyactor
    module GetSuggestedFollowsByActor
      class Input
        attr_accessor :actor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:actor=, hash["actor"])

          instance
        end

        def to_h
          {

            "actor" => instance_variable_get(:@actor)

          }
        end
      end

      class Output
        attr_accessor :suggestions

        attr_accessor :recIdStr

        attr_accessor :isFallback

        attr_accessor :recId

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:suggestions=, hash["suggestions"])

          instance.send(:recIdStr=, hash["recIdStr"])

          instance.send(:isFallback=, hash["isFallback"])

          instance.send(:recId=, hash["recId"])

          instance
        end

        def to_h
          {

            "suggestions" => instance_variable_get(:@suggestions),

            "recIdStr" => instance_variable_get(:@recIdStr),

            "isFallback" => instance_variable_get(:@isFallback),

            "recId" => instance_variable_get(:@recId)

          }
        end
      end
    end
  end

  module AppBskyGraphMuteactor
    module MuteActor
      class Input
        attr_accessor :actor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:actor=, hash["actor"])

          instance
        end

        def to_h
          {

            "actor" => instance_variable_get(:@actor)

          }
        end
      end
    end
  end

  module AppBskyGraphMuteactorlist
    module MuteActorList
      class Input
        attr_accessor :list

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:list=, hash["list"])

          instance
        end

        def to_h
          {

            "list" => instance_variable_get(:@list)

          }
        end
      end
    end
  end

  module AppBskyGraphMutethread
    module MuteThread
      class Input
        attr_accessor :root

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:root=, hash["root"])

          instance
        end

        def to_h
          {

            "root" => instance_variable_get(:@root)

          }
        end
      end
    end
  end

  module AppBskyGraphSearchstarterpacks
    module SearchStarterPacks
      class Input
        attr_accessor :q

        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:q=, hash["q"])

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "q" => instance_variable_get(:@q),

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :starterPacks

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:starterPacks=, hash["starterPacks"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "starterPacks" => instance_variable_get(:@starterPacks)

          }
        end
      end
    end
  end

  module AppBskyGraphUnmuteactor
    module UnmuteActor
      class Input
        attr_accessor :actor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:actor=, hash["actor"])

          instance
        end

        def to_h
          {

            "actor" => instance_variable_get(:@actor)

          }
        end
      end
    end
  end

  module AppBskyGraphUnmuteactorlist
    module UnmuteActorList
      class Input
        attr_accessor :list

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:list=, hash["list"])

          instance
        end

        def to_h
          {

            "list" => instance_variable_get(:@list)

          }
        end
      end
    end
  end

  module AppBskyGraphUnmutethread
    module UnmuteThread
      class Input
        attr_accessor :root

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:root=, hash["root"])

          instance
        end

        def to_h
          {

            "root" => instance_variable_get(:@root)

          }
        end
      end
    end
  end

  module AppBskyLabelerGetservices
    module GetServices
      class Input
        attr_accessor :dids

        attr_accessor :detailed

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:dids=, hash["dids"])

          instance.send(:detailed=, hash["detailed"])

          instance
        end

        def to_h
          {

            "dids" => instance_variable_get(:@dids),

            "detailed" => instance_variable_get(:@detailed)

          }
        end
      end

      class Output
        attr_accessor :views

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:views=, hash["views"])

          instance
        end

        def to_h
          {

            "views" => instance_variable_get(:@views)

          }
        end
      end
    end
  end

  module AppBskyNotificationGetpreferences
    module GetPreferences
      class Input
        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          new
        end

        def to_h
          {}
        end
      end

      class Output
        attr_accessor :preferences

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:preferences=, hash["preferences"])

          instance
        end

        def to_h
          {

            "preferences" => instance_variable_get(:@preferences)

          }
        end
      end
    end
  end

  module AppBskyNotificationGetunreadcount
    module GetUnreadCount
      class Input
        attr_accessor :priority

        attr_accessor :seenAt

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:priority=, hash["priority"])

          instance.send(:seenAt=, hash["seenAt"])

          instance
        end

        def to_h
          {

            "priority" => instance_variable_get(:@priority),

            "seenAt" => instance_variable_get(:@seenAt)

          }
        end
      end

      class Output
        attr_accessor :count

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:count=, hash["count"])

          instance
        end

        def to_h
          {

            "count" => instance_variable_get(:@count)

          }
        end
      end
    end
  end

  module AppBskyNotificationListactivitysubscriptions
    module ListActivitySubscriptions
      class Input
        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :subscriptions

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:subscriptions=, hash["subscriptions"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "subscriptions" => instance_variable_get(:@subscriptions)

          }
        end
      end
    end
  end

  module AppBskyNotificationListnotifications
    module ListNotifications
      class Input
        attr_accessor :reasons

        attr_accessor :limit

        attr_accessor :priority

        attr_accessor :cursor

        attr_accessor :seenAt

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:reasons=, hash["reasons"])

          instance.send(:limit=, hash["limit"])

          instance.send(:priority=, hash["priority"])

          instance.send(:cursor=, hash["cursor"])

          instance.send(:seenAt=, hash["seenAt"])

          instance
        end

        def to_h
          {

            "reasons" => instance_variable_get(:@reasons),

            "limit" => instance_variable_get(:@limit),

            "priority" => instance_variable_get(:@priority),

            "cursor" => instance_variable_get(:@cursor),

            "seenAt" => instance_variable_get(:@seenAt)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :notifications

        attr_accessor :priority

        attr_accessor :seenAt

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:notifications=, hash["notifications"])

          instance.send(:priority=, hash["priority"])

          instance.send(:seenAt=, hash["seenAt"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "notifications" => instance_variable_get(:@notifications),

            "priority" => instance_variable_get(:@priority),

            "seenAt" => instance_variable_get(:@seenAt)

          }
        end
      end
    end
  end

  module AppBskyNotificationPutactivitysubscription
    module PutActivitySubscription
      class Input
        attr_accessor :subject

        attr_accessor :activitySubscription

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:subject=, hash["subject"])

          instance.send(:activitySubscription=, hash["activitySubscription"])

          instance
        end

        def to_h
          {

            "subject" => instance_variable_get(:@subject),

            "activitySubscription" => instance_variable_get(:@activitySubscription)

          }
        end
      end

      class Output
        attr_accessor :subject

        attr_accessor :activitySubscription

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:subject=, hash["subject"])

          instance.send(:activitySubscription=, hash["activitySubscription"])

          instance
        end

        def to_h
          {

            "subject" => instance_variable_get(:@subject),

            "activitySubscription" => instance_variable_get(:@activitySubscription)

          }
        end
      end
    end
  end

  module AppBskyNotificationPutpreferences
    module PutPreferences
      class Input
        attr_accessor :priority

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:priority=, hash["priority"])

          instance
        end

        def to_h
          {

            "priority" => instance_variable_get(:@priority)

          }
        end
      end
    end
  end

  module AppBskyNotificationPutpreferencesv2
    module PutPreferencesV2
      class Input
        attr_accessor :chat

        attr_accessor :follow

        attr_accessor :like

        attr_accessor :likeViaRepost

        attr_accessor :mention

        attr_accessor :quote

        attr_accessor :reply

        attr_accessor :repost

        attr_accessor :repostViaRepost

        attr_accessor :starterpackJoined

        attr_accessor :subscribedPost

        attr_accessor :unverified

        attr_accessor :verified

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:chat=, hash["chat"])

          instance.send(:follow=, hash["follow"])

          instance.send(:like=, hash["like"])

          instance.send(:likeViaRepost=, hash["likeViaRepost"])

          instance.send(:mention=, hash["mention"])

          instance.send(:quote=, hash["quote"])

          instance.send(:reply=, hash["reply"])

          instance.send(:repost=, hash["repost"])

          instance.send(:repostViaRepost=, hash["repostViaRepost"])

          instance.send(:starterpackJoined=, hash["starterpackJoined"])

          instance.send(:subscribedPost=, hash["subscribedPost"])

          instance.send(:unverified=, hash["unverified"])

          instance.send(:verified=, hash["verified"])

          instance
        end

        def to_h
          {

            "chat" => instance_variable_get(:@chat),

            "follow" => instance_variable_get(:@follow),

            "like" => instance_variable_get(:@like),

            "likeViaRepost" => instance_variable_get(:@likeViaRepost),

            "mention" => instance_variable_get(:@mention),

            "quote" => instance_variable_get(:@quote),

            "reply" => instance_variable_get(:@reply),

            "repost" => instance_variable_get(:@repost),

            "repostViaRepost" => instance_variable_get(:@repostViaRepost),

            "starterpackJoined" => instance_variable_get(:@starterpackJoined),

            "subscribedPost" => instance_variable_get(:@subscribedPost),

            "unverified" => instance_variable_get(:@unverified),

            "verified" => instance_variable_get(:@verified)

          }
        end
      end

      class Output
        attr_accessor :preferences

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:preferences=, hash["preferences"])

          instance
        end

        def to_h
          {

            "preferences" => instance_variable_get(:@preferences)

          }
        end
      end
    end
  end

  module AppBskyNotificationRegisterpush
    module RegisterPush
      class Input
        attr_accessor :serviceDid

        attr_accessor :token

        attr_accessor :platform

        attr_accessor :appId

        attr_accessor :ageRestricted

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:serviceDid=, hash["serviceDid"])

          instance.send(:token=, hash["token"])

          instance.send(:platform=, hash["platform"])

          instance.send(:appId=, hash["appId"])

          instance.send(:ageRestricted=, hash["ageRestricted"])

          instance
        end

        def to_h
          {

            "serviceDid" => instance_variable_get(:@serviceDid),

            "token" => instance_variable_get(:@token),

            "platform" => instance_variable_get(:@platform),

            "appId" => instance_variable_get(:@appId),

            "ageRestricted" => instance_variable_get(:@ageRestricted)

          }
        end
      end
    end
  end

  module AppBskyNotificationUnregisterpush
    module UnregisterPush
      class Input
        attr_accessor :serviceDid

        attr_accessor :token

        attr_accessor :platform

        attr_accessor :appId

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:serviceDid=, hash["serviceDid"])

          instance.send(:token=, hash["token"])

          instance.send(:platform=, hash["platform"])

          instance.send(:appId=, hash["appId"])

          instance
        end

        def to_h
          {

            "serviceDid" => instance_variable_get(:@serviceDid),

            "token" => instance_variable_get(:@token),

            "platform" => instance_variable_get(:@platform),

            "appId" => instance_variable_get(:@appId)

          }
        end
      end
    end
  end

  module AppBskyNotificationUpdateseen
    module UpdateSeen
      class Input
        attr_accessor :seenAt

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:seenAt=, hash["seenAt"])

          instance
        end

        def to_h
          {

            "seenAt" => instance_variable_get(:@seenAt)

          }
        end
      end
    end
  end

  module AppBskyUnspeccedGetageassurancestate
    module GetAgeAssuranceState
      class Output
        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          new
        end

        def to_h
          {}
        end
      end
    end
  end

  module AppBskyUnspeccedGetconfig
    module GetConfig
      class Output
        attr_accessor :checkEmailConfirmed

        attr_accessor :liveNow

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:checkEmailConfirmed=, hash["checkEmailConfirmed"])

          instance.send(:liveNow=, hash["liveNow"])

          instance
        end

        def to_h
          {

            "checkEmailConfirmed" => instance_variable_get(:@checkEmailConfirmed),

            "liveNow" => instance_variable_get(:@liveNow)

          }
        end
      end
    end
  end

  module AppBskyUnspeccedGetonboardingsuggestedstarterpacks
    module GetOnboardingSuggestedStarterPacks
      class Input
        attr_accessor :limit

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:limit=, hash["limit"])

          instance
        end

        def to_h
          {

            "limit" => instance_variable_get(:@limit)

          }
        end
      end

      class Output
        attr_accessor :starterPacks

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:starterPacks=, hash["starterPacks"])

          instance
        end

        def to_h
          {

            "starterPacks" => instance_variable_get(:@starterPacks)

          }
        end
      end
    end
  end

  module AppBskyUnspeccedGetonboardingsuggestedstarterpacksskeleton
    module GetOnboardingSuggestedStarterPacksSkeleton
      class Input
        attr_accessor :viewer

        attr_accessor :limit

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:viewer=, hash["viewer"])

          instance.send(:limit=, hash["limit"])

          instance
        end

        def to_h
          {

            "viewer" => instance_variable_get(:@viewer),

            "limit" => instance_variable_get(:@limit)

          }
        end
      end

      class Output
        attr_accessor :starterPacks

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:starterPacks=, hash["starterPacks"])

          instance
        end

        def to_h
          {

            "starterPacks" => instance_variable_get(:@starterPacks)

          }
        end
      end
    end
  end

  module AppBskyUnspeccedGetonboardingsuggestedusersskeleton
    module GetOnboardingSuggestedUsersSkeleton
      class Input
        attr_accessor :viewer

        attr_accessor :category

        attr_accessor :limit

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:viewer=, hash["viewer"])

          instance.send(:category=, hash["category"])

          instance.send(:limit=, hash["limit"])

          instance
        end

        def to_h
          {

            "viewer" => instance_variable_get(:@viewer),

            "category" => instance_variable_get(:@category),

            "limit" => instance_variable_get(:@limit)

          }
        end
      end

      class Output
        attr_accessor :dids

        attr_accessor :recId

        attr_accessor :recIdStr

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:dids=, hash["dids"])

          instance.send(:recId=, hash["recId"])

          instance.send(:recIdStr=, hash["recIdStr"])

          instance
        end

        def to_h
          {

            "dids" => instance_variable_get(:@dids),

            "recId" => instance_variable_get(:@recId),

            "recIdStr" => instance_variable_get(:@recIdStr)

          }
        end
      end
    end
  end

  module AppBskyUnspeccedGetpopularfeedgenerators
    module GetPopularFeedGenerators
      class Input
        attr_accessor :limit

        attr_accessor :cursor

        attr_accessor :query

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance.send(:query=, hash["query"])

          instance
        end

        def to_h
          {

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor),

            "query" => instance_variable_get(:@query)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :feeds

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:feeds=, hash["feeds"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "feeds" => instance_variable_get(:@feeds)

          }
        end
      end
    end
  end

  module AppBskyUnspeccedGetpostthreadotherv2
    module GetPostThreadOtherV2
      class Input
        attr_accessor :anchor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:anchor=, hash["anchor"])

          instance
        end

        def to_h
          {

            "anchor" => instance_variable_get(:@anchor)

          }
        end
      end

      class Output
        attr_accessor :thread

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:thread=, hash["thread"])

          instance
        end

        def to_h
          {

            "thread" => instance_variable_get(:@thread)

          }
        end
      end
    end
  end

  module AppBskyUnspeccedGetpostthreadv2
    module GetPostThreadV2
      class Input
        attr_accessor :anchor

        attr_accessor :above

        attr_accessor :below

        attr_accessor :branchingFactor

        attr_accessor :sort

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:anchor=, hash["anchor"])

          instance.send(:above=, hash["above"])

          instance.send(:below=, hash["below"])

          instance.send(:branchingFactor=, hash["branchingFactor"])

          instance.send(:sort=, hash["sort"])

          instance
        end

        def to_h
          {

            "anchor" => instance_variable_get(:@anchor),

            "above" => instance_variable_get(:@above),

            "below" => instance_variable_get(:@below),

            "branchingFactor" => instance_variable_get(:@branchingFactor),

            "sort" => instance_variable_get(:@sort)

          }
        end
      end

      class Output
        attr_accessor :thread

        attr_accessor :threadgate

        attr_accessor :hasOtherReplies

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:thread=, hash["thread"])

          instance.send(:threadgate=, hash["threadgate"])

          instance.send(:hasOtherReplies=, hash["hasOtherReplies"])

          instance
        end

        def to_h
          {

            "thread" => instance_variable_get(:@thread),

            "threadgate" => instance_variable_get(:@threadgate),

            "hasOtherReplies" => instance_variable_get(:@hasOtherReplies)

          }
        end
      end
    end
  end

  module AppBskyUnspeccedGetsuggestedfeeds
    module GetSuggestedFeeds
      class Input
        attr_accessor :limit

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:limit=, hash["limit"])

          instance
        end

        def to_h
          {

            "limit" => instance_variable_get(:@limit)

          }
        end
      end

      class Output
        attr_accessor :feeds

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:feeds=, hash["feeds"])

          instance
        end

        def to_h
          {

            "feeds" => instance_variable_get(:@feeds)

          }
        end
      end
    end
  end

  module AppBskyUnspeccedGetsuggestedfeedsskeleton
    module GetSuggestedFeedsSkeleton
      class Input
        attr_accessor :viewer

        attr_accessor :limit

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:viewer=, hash["viewer"])

          instance.send(:limit=, hash["limit"])

          instance
        end

        def to_h
          {

            "viewer" => instance_variable_get(:@viewer),

            "limit" => instance_variable_get(:@limit)

          }
        end
      end

      class Output
        attr_accessor :feeds

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:feeds=, hash["feeds"])

          instance
        end

        def to_h
          {

            "feeds" => instance_variable_get(:@feeds)

          }
        end
      end
    end
  end

  module AppBskyUnspeccedGetsuggestedonboardingusers
    module GetSuggestedOnboardingUsers
      class Input
        attr_accessor :category

        attr_accessor :limit

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:category=, hash["category"])

          instance.send(:limit=, hash["limit"])

          instance
        end

        def to_h
          {

            "category" => instance_variable_get(:@category),

            "limit" => instance_variable_get(:@limit)

          }
        end
      end

      class Output
        attr_accessor :actors

        attr_accessor :recId

        attr_accessor :recIdStr

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:actors=, hash["actors"])

          instance.send(:recId=, hash["recId"])

          instance.send(:recIdStr=, hash["recIdStr"])

          instance
        end

        def to_h
          {

            "actors" => instance_variable_get(:@actors),

            "recId" => instance_variable_get(:@recId),

            "recIdStr" => instance_variable_get(:@recIdStr)

          }
        end
      end
    end
  end

  module AppBskyUnspeccedGetsuggestedstarterpacks
    module GetSuggestedStarterPacks
      class Input
        attr_accessor :limit

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:limit=, hash["limit"])

          instance
        end

        def to_h
          {

            "limit" => instance_variable_get(:@limit)

          }
        end
      end

      class Output
        attr_accessor :starterPacks

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:starterPacks=, hash["starterPacks"])

          instance
        end

        def to_h
          {

            "starterPacks" => instance_variable_get(:@starterPacks)

          }
        end
      end
    end
  end

  module AppBskyUnspeccedGetsuggestedstarterpacksskeleton
    module GetSuggestedStarterPacksSkeleton
      class Input
        attr_accessor :viewer

        attr_accessor :limit

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:viewer=, hash["viewer"])

          instance.send(:limit=, hash["limit"])

          instance
        end

        def to_h
          {

            "viewer" => instance_variable_get(:@viewer),

            "limit" => instance_variable_get(:@limit)

          }
        end
      end

      class Output
        attr_accessor :starterPacks

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:starterPacks=, hash["starterPacks"])

          instance
        end

        def to_h
          {

            "starterPacks" => instance_variable_get(:@starterPacks)

          }
        end
      end
    end
  end

  module AppBskyUnspeccedGetsuggestedusers
    module GetSuggestedUsers
      class Input
        attr_accessor :category

        attr_accessor :limit

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:category=, hash["category"])

          instance.send(:limit=, hash["limit"])

          instance
        end

        def to_h
          {

            "category" => instance_variable_get(:@category),

            "limit" => instance_variable_get(:@limit)

          }
        end
      end

      class Output
        attr_accessor :actors

        attr_accessor :recId

        attr_accessor :recIdStr

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:actors=, hash["actors"])

          instance.send(:recId=, hash["recId"])

          instance.send(:recIdStr=, hash["recIdStr"])

          instance
        end

        def to_h
          {

            "actors" => instance_variable_get(:@actors),

            "recId" => instance_variable_get(:@recId),

            "recIdStr" => instance_variable_get(:@recIdStr)

          }
        end
      end
    end
  end

  module AppBskyUnspeccedGetsuggestedusersfordiscover
    module GetSuggestedUsersForDiscover
      class Input
        attr_accessor :limit

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:limit=, hash["limit"])

          instance
        end

        def to_h
          {

            "limit" => instance_variable_get(:@limit)

          }
        end
      end

      class Output
        attr_accessor :actors

        attr_accessor :recIdStr

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:actors=, hash["actors"])

          instance.send(:recIdStr=, hash["recIdStr"])

          instance
        end

        def to_h
          {

            "actors" => instance_variable_get(:@actors),

            "recIdStr" => instance_variable_get(:@recIdStr)

          }
        end
      end
    end
  end

  module AppBskyUnspeccedGetsuggestedusersfordiscoverskeleton
    module GetSuggestedUsersForDiscoverSkeleton
      class Input
        attr_accessor :viewer

        attr_accessor :limit

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:viewer=, hash["viewer"])

          instance.send(:limit=, hash["limit"])

          instance
        end

        def to_h
          {

            "viewer" => instance_variable_get(:@viewer),

            "limit" => instance_variable_get(:@limit)

          }
        end
      end

      class Output
        attr_accessor :dids

        attr_accessor :recIdStr

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:dids=, hash["dids"])

          instance.send(:recIdStr=, hash["recIdStr"])

          instance
        end

        def to_h
          {

            "dids" => instance_variable_get(:@dids),

            "recIdStr" => instance_variable_get(:@recIdStr)

          }
        end
      end
    end
  end

  module AppBskyUnspeccedGetsuggestedusersforexplore
    module GetSuggestedUsersForExplore
      class Input
        attr_accessor :category

        attr_accessor :limit

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:category=, hash["category"])

          instance.send(:limit=, hash["limit"])

          instance
        end

        def to_h
          {

            "category" => instance_variable_get(:@category),

            "limit" => instance_variable_get(:@limit)

          }
        end
      end

      class Output
        attr_accessor :actors

        attr_accessor :recIdStr

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:actors=, hash["actors"])

          instance.send(:recIdStr=, hash["recIdStr"])

          instance
        end

        def to_h
          {

            "actors" => instance_variable_get(:@actors),

            "recIdStr" => instance_variable_get(:@recIdStr)

          }
        end
      end
    end
  end

  module AppBskyUnspeccedGetsuggestedusersforexploreskeleton
    module GetSuggestedUsersForExploreSkeleton
      class Input
        attr_accessor :viewer

        attr_accessor :category

        attr_accessor :limit

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:viewer=, hash["viewer"])

          instance.send(:category=, hash["category"])

          instance.send(:limit=, hash["limit"])

          instance
        end

        def to_h
          {

            "viewer" => instance_variable_get(:@viewer),

            "category" => instance_variable_get(:@category),

            "limit" => instance_variable_get(:@limit)

          }
        end
      end

      class Output
        attr_accessor :dids

        attr_accessor :recIdStr

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:dids=, hash["dids"])

          instance.send(:recIdStr=, hash["recIdStr"])

          instance
        end

        def to_h
          {

            "dids" => instance_variable_get(:@dids),

            "recIdStr" => instance_variable_get(:@recIdStr)

          }
        end
      end
    end
  end

  module AppBskyUnspeccedGetsuggestedusersforseemore
    module GetSuggestedUsersForSeeMore
      class Input
        attr_accessor :category

        attr_accessor :limit

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:category=, hash["category"])

          instance.send(:limit=, hash["limit"])

          instance
        end

        def to_h
          {

            "category" => instance_variable_get(:@category),

            "limit" => instance_variable_get(:@limit)

          }
        end
      end

      class Output
        attr_accessor :actors

        attr_accessor :recIdStr

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:actors=, hash["actors"])

          instance.send(:recIdStr=, hash["recIdStr"])

          instance
        end

        def to_h
          {

            "actors" => instance_variable_get(:@actors),

            "recIdStr" => instance_variable_get(:@recIdStr)

          }
        end
      end
    end
  end

  module AppBskyUnspeccedGetsuggestedusersforseemoreskeleton
    module GetSuggestedUsersForSeeMoreSkeleton
      class Input
        attr_accessor :viewer

        attr_accessor :category

        attr_accessor :limit

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:viewer=, hash["viewer"])

          instance.send(:category=, hash["category"])

          instance.send(:limit=, hash["limit"])

          instance
        end

        def to_h
          {

            "viewer" => instance_variable_get(:@viewer),

            "category" => instance_variable_get(:@category),

            "limit" => instance_variable_get(:@limit)

          }
        end
      end

      class Output
        attr_accessor :dids

        attr_accessor :recIdStr

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:dids=, hash["dids"])

          instance.send(:recIdStr=, hash["recIdStr"])

          instance
        end

        def to_h
          {

            "dids" => instance_variable_get(:@dids),

            "recIdStr" => instance_variable_get(:@recIdStr)

          }
        end
      end
    end
  end

  module AppBskyUnspeccedGetsuggestedusersskeleton
    module GetSuggestedUsersSkeleton
      class Input
        attr_accessor :viewer

        attr_accessor :category

        attr_accessor :limit

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:viewer=, hash["viewer"])

          instance.send(:category=, hash["category"])

          instance.send(:limit=, hash["limit"])

          instance
        end

        def to_h
          {

            "viewer" => instance_variable_get(:@viewer),

            "category" => instance_variable_get(:@category),

            "limit" => instance_variable_get(:@limit)

          }
        end
      end

      class Output
        attr_accessor :dids

        attr_accessor :recId

        attr_accessor :recIdStr

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:dids=, hash["dids"])

          instance.send(:recId=, hash["recId"])

          instance.send(:recIdStr=, hash["recIdStr"])

          instance
        end

        def to_h
          {

            "dids" => instance_variable_get(:@dids),

            "recId" => instance_variable_get(:@recId),

            "recIdStr" => instance_variable_get(:@recIdStr)

          }
        end
      end
    end
  end

  module AppBskyUnspeccedGetsuggestionsskeleton
    module GetSuggestionsSkeleton
      class Input
        attr_accessor :viewer

        attr_accessor :limit

        attr_accessor :cursor

        attr_accessor :relativeToDid

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:viewer=, hash["viewer"])

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance.send(:relativeToDid=, hash["relativeToDid"])

          instance
        end

        def to_h
          {

            "viewer" => instance_variable_get(:@viewer),

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor),

            "relativeToDid" => instance_variable_get(:@relativeToDid)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :actors

        attr_accessor :relativeToDid

        attr_accessor :recId

        attr_accessor :recIdStr

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:actors=, hash["actors"])

          instance.send(:relativeToDid=, hash["relativeToDid"])

          instance.send(:recId=, hash["recId"])

          instance.send(:recIdStr=, hash["recIdStr"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "actors" => instance_variable_get(:@actors),

            "relativeToDid" => instance_variable_get(:@relativeToDid),

            "recId" => instance_variable_get(:@recId),

            "recIdStr" => instance_variable_get(:@recIdStr)

          }
        end
      end
    end
  end

  module AppBskyUnspeccedGettaggedsuggestions
    module GetTaggedSuggestions
      class Input
        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          new
        end

        def to_h
          {}
        end
      end

      class Output
        attr_accessor :suggestions

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:suggestions=, hash["suggestions"])

          instance
        end

        def to_h
          {

            "suggestions" => instance_variable_get(:@suggestions)

          }
        end
      end
    end
  end

  module AppBskyUnspeccedGettrendingtopics
    module GetTrendingTopics
      class Input
        attr_accessor :viewer

        attr_accessor :limit

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:viewer=, hash["viewer"])

          instance.send(:limit=, hash["limit"])

          instance
        end

        def to_h
          {

            "viewer" => instance_variable_get(:@viewer),

            "limit" => instance_variable_get(:@limit)

          }
        end
      end

      class Output
        attr_accessor :topics

        attr_accessor :suggested

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:topics=, hash["topics"])

          instance.send(:suggested=, hash["suggested"])

          instance
        end

        def to_h
          {

            "topics" => instance_variable_get(:@topics),

            "suggested" => instance_variable_get(:@suggested)

          }
        end
      end
    end
  end

  module AppBskyUnspeccedGettrends
    module GetTrends
      class Input
        attr_accessor :limit

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:limit=, hash["limit"])

          instance
        end

        def to_h
          {

            "limit" => instance_variable_get(:@limit)

          }
        end
      end

      class Output
        attr_accessor :trends

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:trends=, hash["trends"])

          instance
        end

        def to_h
          {

            "trends" => instance_variable_get(:@trends)

          }
        end
      end
    end
  end

  module AppBskyUnspeccedGettrendsskeleton
    module GetTrendsSkeleton
      class Input
        attr_accessor :viewer

        attr_accessor :limit

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:viewer=, hash["viewer"])

          instance.send(:limit=, hash["limit"])

          instance
        end

        def to_h
          {

            "viewer" => instance_variable_get(:@viewer),

            "limit" => instance_variable_get(:@limit)

          }
        end
      end

      class Output
        attr_accessor :trends

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:trends=, hash["trends"])

          instance
        end

        def to_h
          {

            "trends" => instance_variable_get(:@trends)

          }
        end
      end
    end
  end

  module AppBskyUnspeccedInitageassurance
    module InitAgeAssurance
      class Input
        attr_accessor :email

        attr_accessor :language

        attr_accessor :countryCode

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:email=, hash["email"])

          instance.send(:language=, hash["language"])

          instance.send(:countryCode=, hash["countryCode"])

          instance
        end

        def to_h
          {

            "email" => instance_variable_get(:@email),

            "language" => instance_variable_get(:@language),

            "countryCode" => instance_variable_get(:@countryCode)

          }
        end
      end

      class Output
        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          new
        end

        def to_h
          {}
        end
      end
    end
  end

  module AppBskyUnspeccedSearchactorsskeleton
    module SearchActorsSkeleton
      class Input
        attr_accessor :q

        attr_accessor :viewer

        attr_accessor :typeahead

        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:q=, hash["q"])

          instance.send(:viewer=, hash["viewer"])

          instance.send(:typeahead=, hash["typeahead"])

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "q" => instance_variable_get(:@q),

            "viewer" => instance_variable_get(:@viewer),

            "typeahead" => instance_variable_get(:@typeahead),

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :hitsTotal

        attr_accessor :actors

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:hitsTotal=, hash["hitsTotal"])

          instance.send(:actors=, hash["actors"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "hitsTotal" => instance_variable_get(:@hitsTotal),

            "actors" => instance_variable_get(:@actors)

          }
        end
      end
    end
  end

  module AppBskyUnspeccedSearchpostsskeleton
    module SearchPostsSkeleton
      class Input
        attr_accessor :q

        attr_accessor :sort

        attr_accessor :since

        attr_accessor :until

        attr_accessor :mentions

        attr_accessor :author

        attr_accessor :lang

        attr_accessor :domain

        attr_accessor :url

        attr_accessor :tag

        attr_accessor :viewer

        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:q=, hash["q"])

          instance.send(:sort=, hash["sort"])

          instance.send(:since=, hash["since"])

          instance.send(:until=, hash["until"])

          instance.send(:mentions=, hash["mentions"])

          instance.send(:author=, hash["author"])

          instance.send(:lang=, hash["lang"])

          instance.send(:domain=, hash["domain"])

          instance.send(:url=, hash["url"])

          instance.send(:tag=, hash["tag"])

          instance.send(:viewer=, hash["viewer"])

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "q" => instance_variable_get(:@q),

            "sort" => instance_variable_get(:@sort),

            "since" => instance_variable_get(:@since),

            "until" => instance_variable_get(:@until),

            "mentions" => instance_variable_get(:@mentions),

            "author" => instance_variable_get(:@author),

            "lang" => instance_variable_get(:@lang),

            "domain" => instance_variable_get(:@domain),

            "url" => instance_variable_get(:@url),

            "tag" => instance_variable_get(:@tag),

            "viewer" => instance_variable_get(:@viewer),

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :hitsTotal

        attr_accessor :posts

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:hitsTotal=, hash["hitsTotal"])

          instance.send(:posts=, hash["posts"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "hitsTotal" => instance_variable_get(:@hitsTotal),

            "posts" => instance_variable_get(:@posts)

          }
        end
      end
    end
  end

  module AppBskyUnspeccedSearchstarterpacksskeleton
    module SearchStarterPacksSkeleton
      class Input
        attr_accessor :q

        attr_accessor :viewer

        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:q=, hash["q"])

          instance.send(:viewer=, hash["viewer"])

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "q" => instance_variable_get(:@q),

            "viewer" => instance_variable_get(:@viewer),

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :hitsTotal

        attr_accessor :starterPacks

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:hitsTotal=, hash["hitsTotal"])

          instance.send(:starterPacks=, hash["starterPacks"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "hitsTotal" => instance_variable_get(:@hitsTotal),

            "starterPacks" => instance_variable_get(:@starterPacks)

          }
        end
      end
    end
  end

  module AppBskyVideoGetjobstatus
    module GetJobStatus
      class Input
        attr_accessor :jobId

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:jobId=, hash["jobId"])

          instance
        end

        def to_h
          {

            "jobId" => instance_variable_get(:@jobId)

          }
        end
      end

      class Output
        attr_accessor :jobStatus

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:jobStatus=, hash["jobStatus"])

          instance
        end

        def to_h
          {

            "jobStatus" => instance_variable_get(:@jobStatus)

          }
        end
      end
    end
  end

  module AppBskyVideoGetuploadlimits
    module GetUploadLimits
      class Output
        attr_accessor :canUpload

        attr_accessor :remainingDailyVideos

        attr_accessor :remainingDailyBytes

        attr_accessor :message

        attr_accessor :error

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:canUpload=, hash["canUpload"])

          instance.send(:remainingDailyVideos=, hash["remainingDailyVideos"])

          instance.send(:remainingDailyBytes=, hash["remainingDailyBytes"])

          instance.send(:message=, hash["message"])

          instance.send(:error=, hash["error"])

          instance
        end

        def to_h
          {

            "canUpload" => instance_variable_get(:@canUpload),

            "remainingDailyVideos" => instance_variable_get(:@remainingDailyVideos),

            "remainingDailyBytes" => instance_variable_get(:@remainingDailyBytes),

            "message" => instance_variable_get(:@message),

            "error" => instance_variable_get(:@error)

          }
        end
      end
    end
  end

  module AppBskyVideoUploadvideo
    module UploadVideo
      class Output
        attr_accessor :jobStatus

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:jobStatus=, hash["jobStatus"])

          instance
        end

        def to_h
          {

            "jobStatus" => instance_variable_get(:@jobStatus)

          }
        end
      end
    end
  end

  module ChatBskyActorDeleteaccount
    module DeleteAccount
      class Output
        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          new
        end

        def to_h
          {}
        end
      end
    end
  end

  module ChatBskyActorExportaccountdata
    module ExportAccountData
    end
  end

  module ChatBskyActorGetstatus
    module GetStatus
      class Output
        attr_accessor :chatDisabled

        attr_accessor :canCreateGroups

        attr_accessor :groupMemberLimit

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:chatDisabled=, hash["chatDisabled"])

          instance.send(:canCreateGroups=, hash["canCreateGroups"])

          instance.send(:groupMemberLimit=, hash["groupMemberLimit"])

          instance
        end

        def to_h
          {

            "chatDisabled" => instance_variable_get(:@chatDisabled),

            "canCreateGroups" => instance_variable_get(:@canCreateGroups),

            "groupMemberLimit" => instance_variable_get(:@groupMemberLimit)

          }
        end
      end
    end
  end

  module ChatBskyConvoAcceptconvo
    module AcceptConvo
      class Input
        attr_accessor :convoId

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:convoId=, hash["convoId"])

          instance
        end

        def to_h
          {

            "convoId" => instance_variable_get(:@convoId)

          }
        end
      end

      class Output
        attr_accessor :rev

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:rev=, hash["rev"])

          instance
        end

        def to_h
          {

            "rev" => instance_variable_get(:@rev)

          }
        end
      end
    end
  end

  module ChatBskyConvoAddreaction
    module AddReaction
      class Input
        attr_accessor :convoId

        attr_accessor :messageId

        attr_accessor :value

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:convoId=, hash["convoId"])

          instance.send(:messageId=, hash["messageId"])

          instance.send(:value=, hash["value"])

          instance
        end

        def to_h
          {

            "convoId" => instance_variable_get(:@convoId),

            "messageId" => instance_variable_get(:@messageId),

            "value" => instance_variable_get(:@value)

          }
        end
      end

      class Output
        attr_accessor :message

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:message=, hash["message"])

          instance
        end

        def to_h
          {

            "message" => instance_variable_get(:@message)

          }
        end
      end
    end
  end

  module ChatBskyConvoDeletemessageforself
    module DeleteMessageForSelf
      class Input
        attr_accessor :convoId

        attr_accessor :messageId

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:convoId=, hash["convoId"])

          instance.send(:messageId=, hash["messageId"])

          instance
        end

        def to_h
          {

            "convoId" => instance_variable_get(:@convoId),

            "messageId" => instance_variable_get(:@messageId)

          }
        end
      end

      class Output
        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          new
        end

        def to_h
          {}
        end
      end
    end
  end

  module ChatBskyConvoGetconvo
    module GetConvo
      class Input
        attr_accessor :convoId

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:convoId=, hash["convoId"])

          instance
        end

        def to_h
          {

            "convoId" => instance_variable_get(:@convoId)

          }
        end
      end

      class Output
        attr_accessor :convo

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:convo=, hash["convo"])

          instance
        end

        def to_h
          {

            "convo" => instance_variable_get(:@convo)

          }
        end
      end
    end
  end

  module ChatBskyConvoGetconvoavailability
    module GetConvoAvailability
      class Input
        attr_accessor :members

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:members=, hash["members"])

          instance
        end

        def to_h
          {

            "members" => instance_variable_get(:@members)

          }
        end
      end

      class Output
        attr_accessor :canChat

        attr_accessor :convo

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:canChat=, hash["canChat"])

          instance.send(:convo=, hash["convo"])

          instance
        end

        def to_h
          {

            "canChat" => instance_variable_get(:@canChat),

            "convo" => instance_variable_get(:@convo)

          }
        end
      end
    end
  end

  module ChatBskyConvoGetconvoformembers
    module GetConvoForMembers
      class Input
        attr_accessor :members

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:members=, hash["members"])

          instance
        end

        def to_h
          {

            "members" => instance_variable_get(:@members)

          }
        end
      end

      class Output
        attr_accessor :convo

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:convo=, hash["convo"])

          instance
        end

        def to_h
          {

            "convo" => instance_variable_get(:@convo)

          }
        end
      end
    end
  end

  module ChatBskyConvoGetconvomembers
    module GetConvoMembers
      class Input
        attr_accessor :convoId

        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:convoId=, hash["convoId"])

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "convoId" => instance_variable_get(:@convoId),

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :members

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:members=, hash["members"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "members" => instance_variable_get(:@members)

          }
        end
      end
    end
  end

  module ChatBskyConvoGetlog
    module GetLog
      class Input
        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :logs

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:logs=, hash["logs"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "logs" => instance_variable_get(:@logs)

          }
        end
      end
    end
  end

  module ChatBskyConvoGetmessages
    module GetMessages
      class Input
        attr_accessor :convoId

        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:convoId=, hash["convoId"])

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "convoId" => instance_variable_get(:@convoId),

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :messages

        attr_accessor :relatedProfiles

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:messages=, hash["messages"])

          instance.send(:relatedProfiles=, hash["relatedProfiles"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "messages" => instance_variable_get(:@messages),

            "relatedProfiles" => instance_variable_get(:@relatedProfiles)

          }
        end
      end
    end
  end

  module ChatBskyConvoGetunreadcounts
    module GetUnreadCounts
      class Input
        attr_accessor :includeGroupChats

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:includeGroupChats=, hash["includeGroupChats"])

          instance
        end

        def to_h
          {

            "includeGroupChats" => instance_variable_get(:@includeGroupChats)

          }
        end
      end

      class Output
        attr_accessor :unreadAcceptedConvos

        attr_accessor :unreadRequestConvos

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:unreadAcceptedConvos=, hash["unreadAcceptedConvos"])

          instance.send(:unreadRequestConvos=, hash["unreadRequestConvos"])

          instance
        end

        def to_h
          {

            "unreadAcceptedConvos" => instance_variable_get(:@unreadAcceptedConvos),

            "unreadRequestConvos" => instance_variable_get(:@unreadRequestConvos)

          }
        end
      end
    end
  end

  module ChatBskyConvoLeaveconvo
    module LeaveConvo
      class Input
        attr_accessor :convoId

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:convoId=, hash["convoId"])

          instance
        end

        def to_h
          {

            "convoId" => instance_variable_get(:@convoId)

          }
        end
      end

      class Output
        attr_accessor :convoId

        attr_accessor :rev

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:convoId=, hash["convoId"])

          instance.send(:rev=, hash["rev"])

          instance
        end

        def to_h
          {

            "convoId" => instance_variable_get(:@convoId),

            "rev" => instance_variable_get(:@rev)

          }
        end
      end
    end
  end

  module ChatBskyConvoListconvorequests
    module ListConvoRequests
      class Input
        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :requests

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:requests=, hash["requests"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "requests" => instance_variable_get(:@requests)

          }
        end
      end
    end
  end

  module ChatBskyConvoListconvos
    module ListConvos
      class Input
        attr_accessor :limit

        attr_accessor :cursor

        attr_accessor :readState

        attr_accessor :status

        attr_accessor :kind

        attr_accessor :lockStatus

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance.send(:readState=, hash["readState"])

          instance.send(:status=, hash["status"])

          instance.send(:kind=, hash["kind"])

          instance.send(:lockStatus=, hash["lockStatus"])

          instance
        end

        def to_h
          {

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor),

            "readState" => instance_variable_get(:@readState),

            "status" => instance_variable_get(:@status),

            "kind" => instance_variable_get(:@kind),

            "lockStatus" => instance_variable_get(:@lockStatus)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :convos

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:convos=, hash["convos"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "convos" => instance_variable_get(:@convos)

          }
        end
      end
    end
  end

  module ChatBskyConvoLockconvo
    module LockConvo
      class Input
        attr_accessor :convoId

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:convoId=, hash["convoId"])

          instance
        end

        def to_h
          {

            "convoId" => instance_variable_get(:@convoId)

          }
        end
      end

      class Output
        attr_accessor :convo

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:convo=, hash["convo"])

          instance
        end

        def to_h
          {

            "convo" => instance_variable_get(:@convo)

          }
        end
      end
    end
  end

  module ChatBskyConvoMuteconvo
    module MuteConvo
      class Input
        attr_accessor :convoId

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:convoId=, hash["convoId"])

          instance
        end

        def to_h
          {

            "convoId" => instance_variable_get(:@convoId)

          }
        end
      end

      class Output
        attr_accessor :convo

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:convo=, hash["convo"])

          instance
        end

        def to_h
          {

            "convo" => instance_variable_get(:@convo)

          }
        end
      end
    end
  end

  module ChatBskyConvoRemovereaction
    module RemoveReaction
      class Input
        attr_accessor :convoId

        attr_accessor :messageId

        attr_accessor :value

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:convoId=, hash["convoId"])

          instance.send(:messageId=, hash["messageId"])

          instance.send(:value=, hash["value"])

          instance
        end

        def to_h
          {

            "convoId" => instance_variable_get(:@convoId),

            "messageId" => instance_variable_get(:@messageId),

            "value" => instance_variable_get(:@value)

          }
        end
      end

      class Output
        attr_accessor :message

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:message=, hash["message"])

          instance
        end

        def to_h
          {

            "message" => instance_variable_get(:@message)

          }
        end
      end
    end
  end

  module ChatBskyConvoSendmessage
    module SendMessage
      class Input
        attr_accessor :convoId

        attr_accessor :message

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:convoId=, hash["convoId"])

          instance.send(:message=, hash["message"])

          instance
        end

        def to_h
          {

            "convoId" => instance_variable_get(:@convoId),

            "message" => instance_variable_get(:@message)

          }
        end
      end

      class Output
        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          new
        end

        def to_h
          {}
        end
      end
    end
  end

  module ChatBskyConvoSendmessagebatch
    module SendMessageBatch
      class Input
        attr_accessor :items

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:items=, hash["items"])

          instance
        end

        def to_h
          {

            "items" => instance_variable_get(:@items)

          }
        end
      end

      class Output
        attr_accessor :items

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:items=, hash["items"])

          instance
        end

        def to_h
          {

            "items" => instance_variable_get(:@items)

          }
        end
      end
    end
  end

  module ChatBskyConvoUnlockconvo
    module UnlockConvo
      class Input
        attr_accessor :convoId

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:convoId=, hash["convoId"])

          instance
        end

        def to_h
          {

            "convoId" => instance_variable_get(:@convoId)

          }
        end
      end

      class Output
        attr_accessor :convo

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:convo=, hash["convo"])

          instance
        end

        def to_h
          {

            "convo" => instance_variable_get(:@convo)

          }
        end
      end
    end
  end

  module ChatBskyConvoUnmuteconvo
    module UnmuteConvo
      class Input
        attr_accessor :convoId

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:convoId=, hash["convoId"])

          instance
        end

        def to_h
          {

            "convoId" => instance_variable_get(:@convoId)

          }
        end
      end

      class Output
        attr_accessor :convo

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:convo=, hash["convo"])

          instance
        end

        def to_h
          {

            "convo" => instance_variable_get(:@convo)

          }
        end
      end
    end
  end

  module ChatBskyConvoUpdateallread
    module UpdateAllRead
      class Input
        attr_accessor :status

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:status=, hash["status"])

          instance
        end

        def to_h
          {

            "status" => instance_variable_get(:@status)

          }
        end
      end

      class Output
        attr_accessor :updatedCount

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:updatedCount=, hash["updatedCount"])

          instance
        end

        def to_h
          {

            "updatedCount" => instance_variable_get(:@updatedCount)

          }
        end
      end
    end
  end

  module ChatBskyConvoUpdateread
    module UpdateRead
      class Input
        attr_accessor :convoId

        attr_accessor :messageId

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:convoId=, hash["convoId"])

          instance.send(:messageId=, hash["messageId"])

          instance
        end

        def to_h
          {

            "convoId" => instance_variable_get(:@convoId),

            "messageId" => instance_variable_get(:@messageId)

          }
        end
      end

      class Output
        attr_accessor :convo

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:convo=, hash["convo"])

          instance
        end

        def to_h
          {

            "convo" => instance_variable_get(:@convo)

          }
        end
      end
    end
  end

  module ChatBskyGroupAddmembers
    module AddMembers
      class Input
        attr_accessor :convoId

        attr_accessor :members

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:convoId=, hash["convoId"])

          instance.send(:members=, hash["members"])

          instance
        end

        def to_h
          {

            "convoId" => instance_variable_get(:@convoId),

            "members" => instance_variable_get(:@members)

          }
        end
      end

      class Output
        attr_accessor :convo

        attr_accessor :addedMembers

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:convo=, hash["convo"])

          instance.send(:addedMembers=, hash["addedMembers"])

          instance
        end

        def to_h
          {

            "convo" => instance_variable_get(:@convo),

            "addedMembers" => instance_variable_get(:@addedMembers)

          }
        end
      end
    end
  end

  module ChatBskyGroupApprovejoinrequest
    module ApproveJoinRequest
      class Input
        attr_accessor :convoId

        attr_accessor :member

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:convoId=, hash["convoId"])

          instance.send(:member=, hash["member"])

          instance
        end

        def to_h
          {

            "convoId" => instance_variable_get(:@convoId),

            "member" => instance_variable_get(:@member)

          }
        end
      end

      class Output
        attr_accessor :convo

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:convo=, hash["convo"])

          instance
        end

        def to_h
          {

            "convo" => instance_variable_get(:@convo)

          }
        end
      end
    end
  end

  module ChatBskyGroupCreategroup
    module CreateGroup
      class Input
        attr_accessor :members

        attr_accessor :name

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:members=, hash["members"])

          instance.send(:name=, hash["name"])

          instance
        end

        def to_h
          {

            "members" => instance_variable_get(:@members),

            "name" => instance_variable_get(:@name)

          }
        end
      end

      class Output
        attr_accessor :convo

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:convo=, hash["convo"])

          instance
        end

        def to_h
          {

            "convo" => instance_variable_get(:@convo)

          }
        end
      end
    end
  end

  module ChatBskyGroupCreatejoinlink
    module CreateJoinLink
      class Input
        attr_accessor :convoId

        attr_accessor :requireApproval

        attr_accessor :joinRule

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:convoId=, hash["convoId"])

          instance.send(:requireApproval=, hash["requireApproval"])

          instance.send(:joinRule=, hash["joinRule"])

          instance
        end

        def to_h
          {

            "convoId" => instance_variable_get(:@convoId),

            "requireApproval" => instance_variable_get(:@requireApproval),

            "joinRule" => instance_variable_get(:@joinRule)

          }
        end
      end

      class Output
        attr_accessor :joinLink

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:joinLink=, hash["joinLink"])

          instance
        end

        def to_h
          {

            "joinLink" => instance_variable_get(:@joinLink)

          }
        end
      end
    end
  end

  module ChatBskyGroupDisablejoinlink
    module DisableJoinLink
      class Input
        attr_accessor :convoId

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:convoId=, hash["convoId"])

          instance
        end

        def to_h
          {

            "convoId" => instance_variable_get(:@convoId)

          }
        end
      end

      class Output
        attr_accessor :joinLink

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:joinLink=, hash["joinLink"])

          instance
        end

        def to_h
          {

            "joinLink" => instance_variable_get(:@joinLink)

          }
        end
      end
    end
  end

  module ChatBskyGroupEditgroup
    module EditGroup
      class Input
        attr_accessor :convoId

        attr_accessor :name

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:convoId=, hash["convoId"])

          instance.send(:name=, hash["name"])

          instance
        end

        def to_h
          {

            "convoId" => instance_variable_get(:@convoId),

            "name" => instance_variable_get(:@name)

          }
        end
      end

      class Output
        attr_accessor :convo

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:convo=, hash["convo"])

          instance
        end

        def to_h
          {

            "convo" => instance_variable_get(:@convo)

          }
        end
      end
    end
  end

  module ChatBskyGroupEditjoinlink
    module EditJoinLink
      class Input
        attr_accessor :convoId

        attr_accessor :requireApproval

        attr_accessor :joinRule

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:convoId=, hash["convoId"])

          instance.send(:requireApproval=, hash["requireApproval"])

          instance.send(:joinRule=, hash["joinRule"])

          instance
        end

        def to_h
          {

            "convoId" => instance_variable_get(:@convoId),

            "requireApproval" => instance_variable_get(:@requireApproval),

            "joinRule" => instance_variable_get(:@joinRule)

          }
        end
      end

      class Output
        attr_accessor :joinLink

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:joinLink=, hash["joinLink"])

          instance
        end

        def to_h
          {

            "joinLink" => instance_variable_get(:@joinLink)

          }
        end
      end
    end
  end

  module ChatBskyGroupEnablejoinlink
    module EnableJoinLink
      class Input
        attr_accessor :convoId

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:convoId=, hash["convoId"])

          instance
        end

        def to_h
          {

            "convoId" => instance_variable_get(:@convoId)

          }
        end
      end

      class Output
        attr_accessor :joinLink

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:joinLink=, hash["joinLink"])

          instance
        end

        def to_h
          {

            "joinLink" => instance_variable_get(:@joinLink)

          }
        end
      end
    end
  end

  module ChatBskyGroupGetjoinlinkpreviews
    module GetJoinLinkPreviews
      class Input
        attr_accessor :codes

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:codes=, hash["codes"])

          instance
        end

        def to_h
          {

            "codes" => instance_variable_get(:@codes)

          }
        end
      end

      class Output
        attr_accessor :joinLinkPreviews

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:joinLinkPreviews=, hash["joinLinkPreviews"])

          instance
        end

        def to_h
          {

            "joinLinkPreviews" => instance_variable_get(:@joinLinkPreviews)

          }
        end
      end
    end
  end

  module ChatBskyGroupListjoinrequests
    module ListJoinRequests
      class Input
        attr_accessor :convoId

        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:convoId=, hash["convoId"])

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "convoId" => instance_variable_get(:@convoId),

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :requests

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:requests=, hash["requests"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "requests" => instance_variable_get(:@requests)

          }
        end
      end
    end
  end

  module ChatBskyGroupListmutualgroups
    module ListMutualGroups
      class Input
        attr_accessor :subject

        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:subject=, hash["subject"])

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "subject" => instance_variable_get(:@subject),

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :convos

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:convos=, hash["convos"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "convos" => instance_variable_get(:@convos)

          }
        end
      end
    end
  end

  module ChatBskyGroupRejectjoinrequest
    module RejectJoinRequest
      class Input
        attr_accessor :convoId

        attr_accessor :member

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:convoId=, hash["convoId"])

          instance.send(:member=, hash["member"])

          instance
        end

        def to_h
          {

            "convoId" => instance_variable_get(:@convoId),

            "member" => instance_variable_get(:@member)

          }
        end
      end

      class Output
        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          new
        end

        def to_h
          {}
        end
      end
    end
  end

  module ChatBskyGroupRemovemembers
    module RemoveMembers
      class Input
        attr_accessor :convoId

        attr_accessor :members

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:convoId=, hash["convoId"])

          instance.send(:members=, hash["members"])

          instance
        end

        def to_h
          {

            "convoId" => instance_variable_get(:@convoId),

            "members" => instance_variable_get(:@members)

          }
        end
      end

      class Output
        attr_accessor :convo

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:convo=, hash["convo"])

          instance
        end

        def to_h
          {

            "convo" => instance_variable_get(:@convo)

          }
        end
      end
    end
  end

  module ChatBskyGroupRequestjoin
    module RequestJoin
      class Input
        attr_accessor :code

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:code=, hash["code"])

          instance
        end

        def to_h
          {

            "code" => instance_variable_get(:@code)

          }
        end
      end

      class Output
        attr_accessor :status

        attr_accessor :convo

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:status=, hash["status"])

          instance.send(:convo=, hash["convo"])

          instance
        end

        def to_h
          {

            "status" => instance_variable_get(:@status),

            "convo" => instance_variable_get(:@convo)

          }
        end
      end
    end
  end

  module ChatBskyGroupUpdatejoinrequestsread
    module UpdateJoinRequestsRead
      class Input
        attr_accessor :convoId

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:convoId=, hash["convoId"])

          instance
        end

        def to_h
          {

            "convoId" => instance_variable_get(:@convoId)

          }
        end
      end

      class Output
        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          new
        end

        def to_h
          {}
        end
      end
    end
  end

  module ChatBskyGroupWithdrawjoinrequest
    module WithdrawJoinRequest
      class Input
        attr_accessor :convoId

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:convoId=, hash["convoId"])

          instance
        end

        def to_h
          {

            "convoId" => instance_variable_get(:@convoId)

          }
        end
      end

      class Output
        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          new
        end

        def to_h
          {}
        end
      end
    end
  end

  module ChatBskyModerationGetactormetadata
    module GetActorMetadata
      class Input
        attr_accessor :actor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:actor=, hash["actor"])

          instance
        end

        def to_h
          {

            "actor" => instance_variable_get(:@actor)

          }
        end
      end

      class Output
        attr_accessor :day

        attr_accessor :month

        attr_accessor :all

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:day=, hash["day"])

          instance.send(:month=, hash["month"])

          instance.send(:all=, hash["all"])

          instance
        end

        def to_h
          {

            "day" => instance_variable_get(:@day),

            "month" => instance_variable_get(:@month),

            "all" => instance_variable_get(:@all)

          }
        end
      end
    end
  end

  module ChatBskyModerationGetconvo
    module GetConvo
      class Input
        attr_accessor :convoId

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:convoId=, hash["convoId"])

          instance
        end

        def to_h
          {

            "convoId" => instance_variable_get(:@convoId)

          }
        end
      end

      class Output
        attr_accessor :convo

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:convo=, hash["convo"])

          instance
        end

        def to_h
          {

            "convo" => instance_variable_get(:@convo)

          }
        end
      end
    end
  end

  module ChatBskyModerationGetconvomembers
    module GetConvoMembers
      class Input
        attr_accessor :convoId

        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:convoId=, hash["convoId"])

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "convoId" => instance_variable_get(:@convoId),

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :members

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:members=, hash["members"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "members" => instance_variable_get(:@members)

          }
        end
      end
    end
  end

  module ChatBskyModerationGetconvos
    module GetConvos
      class Input
        attr_accessor :convoIds

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:convoIds=, hash["convoIds"])

          instance
        end

        def to_h
          {

            "convoIds" => instance_variable_get(:@convoIds)

          }
        end
      end

      class Output
        attr_accessor :convos

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:convos=, hash["convos"])

          instance
        end

        def to_h
          {

            "convos" => instance_variable_get(:@convos)

          }
        end
      end
    end
  end

  module ChatBskyModerationGetmessagecontext
    module GetMessageContext
      class Input
        attr_accessor :convoId

        attr_accessor :messageId

        attr_accessor :before

        attr_accessor :after

        attr_accessor :maxInterleavedSystemMessages

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:convoId=, hash["convoId"])

          instance.send(:messageId=, hash["messageId"])

          instance.send(:before=, hash["before"])

          instance.send(:after=, hash["after"])

          instance.send(:maxInterleavedSystemMessages=, hash["maxInterleavedSystemMessages"])

          instance
        end

        def to_h
          {

            "convoId" => instance_variable_get(:@convoId),

            "messageId" => instance_variable_get(:@messageId),

            "before" => instance_variable_get(:@before),

            "after" => instance_variable_get(:@after),

            "maxInterleavedSystemMessages" => instance_variable_get(:@maxInterleavedSystemMessages)

          }
        end
      end

      class Output
        attr_accessor :messages

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:messages=, hash["messages"])

          instance
        end

        def to_h
          {

            "messages" => instance_variable_get(:@messages)

          }
        end
      end
    end
  end

  module ChatBskyModerationUpdateactoraccess
    module UpdateActorAccess
      class Input
        attr_accessor :actor

        attr_accessor :allowAccess

        attr_accessor :ref

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:actor=, hash["actor"])

          instance.send(:allowAccess=, hash["allowAccess"])

          instance.send(:ref=, hash["ref"])

          instance
        end

        def to_h
          {

            "actor" => instance_variable_get(:@actor),

            "allowAccess" => instance_variable_get(:@allowAccess),

            "ref" => instance_variable_get(:@ref)

          }
        end
      end
    end
  end

  module ChatBskyNotificationGetpreferences
    module GetPreferences
      class Output
        attr_accessor :preferences

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:preferences=, hash["preferences"])

          instance
        end

        def to_h
          {

            "preferences" => instance_variable_get(:@preferences)

          }
        end
      end
    end
  end

  module ChatBskyNotificationPutpreferences
    module PutPreferences
      class Input
        attr_accessor :chat

        attr_accessor :chatRequest

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:chat=, hash["chat"])

          instance.send(:chatRequest=, hash["chatRequest"])

          instance
        end

        def to_h
          {

            "chat" => instance_variable_get(:@chat),

            "chatRequest" => instance_variable_get(:@chatRequest)

          }
        end
      end

      class Output
        attr_accessor :preferences

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:preferences=, hash["preferences"])

          instance
        end

        def to_h
          {

            "preferences" => instance_variable_get(:@preferences)

          }
        end
      end
    end
  end

  module ComAtprotoAdminDeleteaccount
    module DeleteAccount
      class Input
        attr_accessor :did

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:did=, hash["did"])

          instance
        end

        def to_h
          {

            "did" => instance_variable_get(:@did)

          }
        end
      end
    end
  end

  module ComAtprotoAdminDisableaccountinvites
    module DisableAccountInvites
      class Input
        attr_accessor :account

        attr_accessor :note

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:account=, hash["account"])

          instance.send(:note=, hash["note"])

          instance
        end

        def to_h
          {

            "account" => instance_variable_get(:@account),

            "note" => instance_variable_get(:@note)

          }
        end
      end
    end
  end

  module ComAtprotoAdminDisableinvitecodes
    module DisableInviteCodes
      class Input
        attr_accessor :codes

        attr_accessor :accounts

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:codes=, hash["codes"])

          instance.send(:accounts=, hash["accounts"])

          instance
        end

        def to_h
          {

            "codes" => instance_variable_get(:@codes),

            "accounts" => instance_variable_get(:@accounts)

          }
        end
      end
    end
  end

  module ComAtprotoAdminEnableaccountinvites
    module EnableAccountInvites
      class Input
        attr_accessor :account

        attr_accessor :note

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:account=, hash["account"])

          instance.send(:note=, hash["note"])

          instance
        end

        def to_h
          {

            "account" => instance_variable_get(:@account),

            "note" => instance_variable_get(:@note)

          }
        end
      end
    end
  end

  module ComAtprotoAdminGetaccountinfo
    module GetAccountInfo
      class Input
        attr_accessor :did

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:did=, hash["did"])

          instance
        end

        def to_h
          {

            "did" => instance_variable_get(:@did)

          }
        end
      end

      class Output
        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          new
        end

        def to_h
          {}
        end
      end
    end
  end

  module ComAtprotoAdminGetaccountinfos
    module GetAccountInfos
      class Input
        attr_accessor :dids

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:dids=, hash["dids"])

          instance
        end

        def to_h
          {

            "dids" => instance_variable_get(:@dids)

          }
        end
      end

      class Output
        attr_accessor :infos

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:infos=, hash["infos"])

          instance
        end

        def to_h
          {

            "infos" => instance_variable_get(:@infos)

          }
        end
      end
    end
  end

  module ComAtprotoAdminGetinvitecodes
    module GetInviteCodes
      class Input
        attr_accessor :sort

        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:sort=, hash["sort"])

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "sort" => instance_variable_get(:@sort),

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :codes

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:codes=, hash["codes"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "codes" => instance_variable_get(:@codes)

          }
        end
      end
    end
  end

  module ComAtprotoAdminGetsubjectstatus
    module GetSubjectStatus
      class Input
        attr_accessor :did

        attr_accessor :uri

        attr_accessor :blob

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:did=, hash["did"])

          instance.send(:uri=, hash["uri"])

          instance.send(:blob=, hash["blob"])

          instance
        end

        def to_h
          {

            "did" => instance_variable_get(:@did),

            "uri" => instance_variable_get(:@uri),

            "blob" => instance_variable_get(:@blob)

          }
        end
      end

      class Output
        attr_accessor :subject

        attr_accessor :takedown

        attr_accessor :deactivated

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:subject=, hash["subject"])

          instance.send(:takedown=, hash["takedown"])

          instance.send(:deactivated=, hash["deactivated"])

          instance
        end

        def to_h
          {

            "subject" => instance_variable_get(:@subject),

            "takedown" => instance_variable_get(:@takedown),

            "deactivated" => instance_variable_get(:@deactivated)

          }
        end
      end
    end
  end

  module ComAtprotoAdminSearchaccounts
    module SearchAccounts
      class Input
        attr_accessor :email

        attr_accessor :cursor

        attr_accessor :limit

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:email=, hash["email"])

          instance.send(:cursor=, hash["cursor"])

          instance.send(:limit=, hash["limit"])

          instance
        end

        def to_h
          {

            "email" => instance_variable_get(:@email),

            "cursor" => instance_variable_get(:@cursor),

            "limit" => instance_variable_get(:@limit)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :accounts

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:accounts=, hash["accounts"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "accounts" => instance_variable_get(:@accounts)

          }
        end
      end
    end
  end

  module ComAtprotoAdminSendemail
    module SendEmail
      class Input
        attr_accessor :recipientDid

        attr_accessor :content

        attr_accessor :subject

        attr_accessor :senderDid

        attr_accessor :comment

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:recipientDid=, hash["recipientDid"])

          instance.send(:content=, hash["content"])

          instance.send(:subject=, hash["subject"])

          instance.send(:senderDid=, hash["senderDid"])

          instance.send(:comment=, hash["comment"])

          instance
        end

        def to_h
          {

            "recipientDid" => instance_variable_get(:@recipientDid),

            "content" => instance_variable_get(:@content),

            "subject" => instance_variable_get(:@subject),

            "senderDid" => instance_variable_get(:@senderDid),

            "comment" => instance_variable_get(:@comment)

          }
        end
      end

      class Output
        attr_accessor :sent

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:sent=, hash["sent"])

          instance
        end

        def to_h
          {

            "sent" => instance_variable_get(:@sent)

          }
        end
      end
    end
  end

  module ComAtprotoAdminUpdateaccountemail
    module UpdateAccountEmail
      class Input
        attr_accessor :account

        attr_accessor :email

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:account=, hash["account"])

          instance.send(:email=, hash["email"])

          instance
        end

        def to_h
          {

            "account" => instance_variable_get(:@account),

            "email" => instance_variable_get(:@email)

          }
        end
      end
    end
  end

  module ComAtprotoAdminUpdateaccounthandle
    module UpdateAccountHandle
      class Input
        attr_accessor :did

        attr_accessor :handle

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:did=, hash["did"])

          instance.send(:handle=, hash["handle"])

          instance
        end

        def to_h
          {

            "did" => instance_variable_get(:@did),

            "handle" => instance_variable_get(:@handle)

          }
        end
      end
    end
  end

  module ComAtprotoAdminUpdateaccountpassword
    module UpdateAccountPassword
      class Input
        attr_accessor :did

        attr_accessor :password

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:did=, hash["did"])

          instance.send(:password=, hash["password"])

          instance
        end

        def to_h
          {

            "did" => instance_variable_get(:@did),

            "password" => instance_variable_get(:@password)

          }
        end
      end
    end
  end

  module ComAtprotoAdminUpdateaccountsigningkey
    module UpdateAccountSigningKey
      class Input
        attr_accessor :did

        attr_accessor :signingKey

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:did=, hash["did"])

          instance.send(:signingKey=, hash["signingKey"])

          instance
        end

        def to_h
          {

            "did" => instance_variable_get(:@did),

            "signingKey" => instance_variable_get(:@signingKey)

          }
        end
      end
    end
  end

  module ComAtprotoAdminUpdatesubjectstatus
    module UpdateSubjectStatus
      class Input
        attr_accessor :subject

        attr_accessor :takedown

        attr_accessor :deactivated

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:subject=, hash["subject"])

          instance.send(:takedown=, hash["takedown"])

          instance.send(:deactivated=, hash["deactivated"])

          instance
        end

        def to_h
          {

            "subject" => instance_variable_get(:@subject),

            "takedown" => instance_variable_get(:@takedown),

            "deactivated" => instance_variable_get(:@deactivated)

          }
        end
      end

      class Output
        attr_accessor :subject

        attr_accessor :takedown

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:subject=, hash["subject"])

          instance.send(:takedown=, hash["takedown"])

          instance
        end

        def to_h
          {

            "subject" => instance_variable_get(:@subject),

            "takedown" => instance_variable_get(:@takedown)

          }
        end
      end
    end
  end

  module ComAtprotoIdentityGetrecommendeddidcredentials
    module GetRecommendedDidCredentials
      class Output
        attr_accessor :rotationKeys

        attr_accessor :alsoKnownAs

        attr_accessor :verificationMethods

        attr_accessor :services

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:rotationKeys=, hash["rotationKeys"])

          instance.send(:alsoKnownAs=, hash["alsoKnownAs"])

          instance.send(:verificationMethods=, hash["verificationMethods"])

          instance.send(:services=, hash["services"])

          instance
        end

        def to_h
          {

            "rotationKeys" => instance_variable_get(:@rotationKeys),

            "alsoKnownAs" => instance_variable_get(:@alsoKnownAs),

            "verificationMethods" => instance_variable_get(:@verificationMethods),

            "services" => instance_variable_get(:@services)

          }
        end
      end
    end
  end

  module ComAtprotoIdentityRefreshidentity
    module RefreshIdentity
      class Input
        attr_accessor :identifier

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:identifier=, hash["identifier"])

          instance
        end

        def to_h
          {

            "identifier" => instance_variable_get(:@identifier)

          }
        end
      end

      class Output
        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          new
        end

        def to_h
          {}
        end
      end
    end
  end

  module ComAtprotoIdentityRequestplcoperationsignature
    module RequestPlcOperationSignature
    end
  end

  module ComAtprotoIdentityResolvedid
    module ResolveDid
      class Input
        attr_accessor :did

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:did=, hash["did"])

          instance
        end

        def to_h
          {

            "did" => instance_variable_get(:@did)

          }
        end
      end

      class Output
        attr_accessor :didDoc

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:didDoc=, hash["didDoc"])

          instance
        end

        def to_h
          {

            "didDoc" => instance_variable_get(:@didDoc)

          }
        end
      end
    end
  end

  module ComAtprotoIdentityResolvehandle
    module ResolveHandle
      class Input
        attr_accessor :handle

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:handle=, hash["handle"])

          instance
        end

        def to_h
          {

            "handle" => instance_variable_get(:@handle)

          }
        end
      end

      class Output
        attr_accessor :did

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:did=, hash["did"])

          instance
        end

        def to_h
          {

            "did" => instance_variable_get(:@did)

          }
        end
      end
    end
  end

  module ComAtprotoIdentityResolveidentity
    module ResolveIdentity
      class Input
        attr_accessor :identifier

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:identifier=, hash["identifier"])

          instance
        end

        def to_h
          {

            "identifier" => instance_variable_get(:@identifier)

          }
        end
      end

      class Output
        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          new
        end

        def to_h
          {}
        end
      end
    end
  end

  module ComAtprotoIdentitySignplcoperation
    module SignPlcOperation
      class Input
        attr_accessor :token

        attr_accessor :rotationKeys

        attr_accessor :alsoKnownAs

        attr_accessor :verificationMethods

        attr_accessor :services

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:token=, hash["token"])

          instance.send(:rotationKeys=, hash["rotationKeys"])

          instance.send(:alsoKnownAs=, hash["alsoKnownAs"])

          instance.send(:verificationMethods=, hash["verificationMethods"])

          instance.send(:services=, hash["services"])

          instance
        end

        def to_h
          {

            "token" => instance_variable_get(:@token),

            "rotationKeys" => instance_variable_get(:@rotationKeys),

            "alsoKnownAs" => instance_variable_get(:@alsoKnownAs),

            "verificationMethods" => instance_variable_get(:@verificationMethods),

            "services" => instance_variable_get(:@services)

          }
        end
      end

      class Output
        attr_accessor :operation

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:operation=, hash["operation"])

          instance
        end

        def to_h
          {

            "operation" => instance_variable_get(:@operation)

          }
        end
      end
    end
  end

  module ComAtprotoIdentitySubmitplcoperation
    module SubmitPlcOperation
      class Input
        attr_accessor :operation

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:operation=, hash["operation"])

          instance
        end

        def to_h
          {

            "operation" => instance_variable_get(:@operation)

          }
        end
      end
    end
  end

  module ComAtprotoIdentityUpdatehandle
    module UpdateHandle
      class Input
        attr_accessor :handle

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:handle=, hash["handle"])

          instance
        end

        def to_h
          {

            "handle" => instance_variable_get(:@handle)

          }
        end
      end
    end
  end

  module ComAtprotoLabelQuerylabels
    module QueryLabels
      class Input
        attr_accessor :uriPatterns

        attr_accessor :sources

        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:uriPatterns=, hash["uriPatterns"])

          instance.send(:sources=, hash["sources"])

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "uriPatterns" => instance_variable_get(:@uriPatterns),

            "sources" => instance_variable_get(:@sources),

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :labels

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:labels=, hash["labels"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "labels" => instance_variable_get(:@labels)

          }
        end
      end
    end
  end

  module ComAtprotoLexiconResolvelexicon
    module ResolveLexicon
      class Input
        attr_accessor :nsid

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:nsid=, hash["nsid"])

          instance
        end

        def to_h
          {

            "nsid" => instance_variable_get(:@nsid)

          }
        end
      end

      class Output
        attr_accessor :cid

        attr_accessor :schema

        attr_accessor :uri

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cid=, hash["cid"])

          instance.send(:schema=, hash["schema"])

          instance.send(:uri=, hash["uri"])

          instance
        end

        def to_h
          {

            "cid" => instance_variable_get(:@cid),

            "schema" => instance_variable_get(:@schema),

            "uri" => instance_variable_get(:@uri)

          }
        end
      end
    end
  end

  module ComAtprotoModerationCreatereport
    module CreateReport
      class Input
        attr_accessor :reasonType

        attr_accessor :reason

        attr_accessor :subject

        attr_accessor :modTool

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:reasonType=, hash["reasonType"])

          instance.send(:reason=, hash["reason"])

          instance.send(:subject=, hash["subject"])

          instance.send(:modTool=, hash["modTool"])

          instance
        end

        def to_h
          {

            "reasonType" => instance_variable_get(:@reasonType),

            "reason" => instance_variable_get(:@reason),

            "subject" => instance_variable_get(:@subject),

            "modTool" => instance_variable_get(:@modTool)

          }
        end
      end

      class Output
        attr_accessor :id

        attr_accessor :reasonType

        attr_accessor :reason

        attr_accessor :subject

        attr_accessor :reportedBy

        attr_accessor :createdAt

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:id=, hash["id"])

          instance.send(:reasonType=, hash["reasonType"])

          instance.send(:reason=, hash["reason"])

          instance.send(:subject=, hash["subject"])

          instance.send(:reportedBy=, hash["reportedBy"])

          instance.send(:createdAt=, hash["createdAt"])

          instance
        end

        def to_h
          {

            "id" => instance_variable_get(:@id),

            "reasonType" => instance_variable_get(:@reasonType),

            "reason" => instance_variable_get(:@reason),

            "subject" => instance_variable_get(:@subject),

            "reportedBy" => instance_variable_get(:@reportedBy),

            "createdAt" => instance_variable_get(:@createdAt)

          }
        end
      end
    end
  end

  module ComAtprotoRepoApplywrites
    module ApplyWrites
      class Input
        attr_accessor :repo

        attr_accessor :validate

        attr_accessor :writes

        attr_accessor :swapCommit

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:repo=, hash["repo"])

          instance.send(:validate=, hash["validate"])

          instance.send(:writes=, hash["writes"])

          instance.send(:swapCommit=, hash["swapCommit"])

          instance
        end

        def to_h
          {

            "repo" => instance_variable_get(:@repo),

            "validate" => instance_variable_get(:@validate),

            "writes" => instance_variable_get(:@writes),

            "swapCommit" => instance_variable_get(:@swapCommit)

          }
        end
      end

      class Output
        attr_accessor :commit

        attr_accessor :results

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:commit=, hash["commit"])

          instance.send(:results=, hash["results"])

          instance
        end

        def to_h
          {

            "commit" => instance_variable_get(:@commit),

            "results" => instance_variable_get(:@results)

          }
        end
      end
    end
  end

  module ComAtprotoRepoCreaterecord
    module CreateRecord
      class Input
        attr_accessor :repo

        attr_accessor :collection

        attr_accessor :rkey

        attr_accessor :validate

        attr_accessor :record

        attr_accessor :swapCommit

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:repo=, hash["repo"])

          instance.send(:collection=, hash["collection"])

          instance.send(:rkey=, hash["rkey"])

          instance.send(:validate=, hash["validate"])

          instance.send(:record=, hash["record"])

          instance.send(:swapCommit=, hash["swapCommit"])

          instance
        end

        def to_h
          {

            "repo" => instance_variable_get(:@repo),

            "collection" => instance_variable_get(:@collection),

            "rkey" => instance_variable_get(:@rkey),

            "validate" => instance_variable_get(:@validate),

            "record" => instance_variable_get(:@record),

            "swapCommit" => instance_variable_get(:@swapCommit)

          }
        end
      end

      class Output
        attr_accessor :uri

        attr_accessor :cid

        attr_accessor :commit

        attr_accessor :validationStatus

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:uri=, hash["uri"])

          instance.send(:cid=, hash["cid"])

          instance.send(:commit=, hash["commit"])

          instance.send(:validationStatus=, hash["validationStatus"])

          instance
        end

        def to_h
          {

            "uri" => instance_variable_get(:@uri),

            "cid" => instance_variable_get(:@cid),

            "commit" => instance_variable_get(:@commit),

            "validationStatus" => instance_variable_get(:@validationStatus)

          }
        end
      end
    end
  end

  module ComAtprotoRepoDeleterecord
    module DeleteRecord
      class Input
        attr_accessor :repo

        attr_accessor :collection

        attr_accessor :rkey

        attr_accessor :swapRecord

        attr_accessor :swapCommit

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:repo=, hash["repo"])

          instance.send(:collection=, hash["collection"])

          instance.send(:rkey=, hash["rkey"])

          instance.send(:swapRecord=, hash["swapRecord"])

          instance.send(:swapCommit=, hash["swapCommit"])

          instance
        end

        def to_h
          {

            "repo" => instance_variable_get(:@repo),

            "collection" => instance_variable_get(:@collection),

            "rkey" => instance_variable_get(:@rkey),

            "swapRecord" => instance_variable_get(:@swapRecord),

            "swapCommit" => instance_variable_get(:@swapCommit)

          }
        end
      end

      class Output
        attr_accessor :commit

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:commit=, hash["commit"])

          instance
        end

        def to_h
          {

            "commit" => instance_variable_get(:@commit)

          }
        end
      end
    end
  end

  module ComAtprotoRepoDescriberepo
    module DescribeRepo
      class Input
        attr_accessor :repo

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:repo=, hash["repo"])

          instance
        end

        def to_h
          {

            "repo" => instance_variable_get(:@repo)

          }
        end
      end

      class Output
        attr_accessor :handle

        attr_accessor :did

        attr_accessor :didDoc

        attr_accessor :collections

        attr_accessor :handleIsCorrect

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:handle=, hash["handle"])

          instance.send(:did=, hash["did"])

          instance.send(:didDoc=, hash["didDoc"])

          instance.send(:collections=, hash["collections"])

          instance.send(:handleIsCorrect=, hash["handleIsCorrect"])

          instance
        end

        def to_h
          {

            "handle" => instance_variable_get(:@handle),

            "did" => instance_variable_get(:@did),

            "didDoc" => instance_variable_get(:@didDoc),

            "collections" => instance_variable_get(:@collections),

            "handleIsCorrect" => instance_variable_get(:@handleIsCorrect)

          }
        end
      end
    end
  end

  module ComAtprotoRepoGetrecord
    module GetRecord
      class Input
        attr_accessor :repo

        attr_accessor :collection

        attr_accessor :rkey

        attr_accessor :cid

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:repo=, hash["repo"])

          instance.send(:collection=, hash["collection"])

          instance.send(:rkey=, hash["rkey"])

          instance.send(:cid=, hash["cid"])

          instance
        end

        def to_h
          {

            "repo" => instance_variable_get(:@repo),

            "collection" => instance_variable_get(:@collection),

            "rkey" => instance_variable_get(:@rkey),

            "cid" => instance_variable_get(:@cid)

          }
        end
      end

      class Output
        attr_accessor :uri

        attr_accessor :cid

        attr_accessor :value

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:uri=, hash["uri"])

          instance.send(:cid=, hash["cid"])

          instance.send(:value=, hash["value"])

          instance
        end

        def to_h
          {

            "uri" => instance_variable_get(:@uri),

            "cid" => instance_variable_get(:@cid),

            "value" => instance_variable_get(:@value)

          }
        end
      end
    end
  end

  module ComAtprotoRepoImportrepo
    module ImportRepo
    end
  end

  module ComAtprotoRepoListmissingblobs
    module ListMissingBlobs
      class Input
        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :blobs

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:blobs=, hash["blobs"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "blobs" => instance_variable_get(:@blobs)

          }
        end
      end
    end
  end

  module ComAtprotoRepoListrecords
    module ListRecords
      class Input
        attr_accessor :repo

        attr_accessor :collection

        attr_accessor :limit

        attr_accessor :cursor

        attr_accessor :reverse

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:repo=, hash["repo"])

          instance.send(:collection=, hash["collection"])

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance.send(:reverse=, hash["reverse"])

          instance
        end

        def to_h
          {

            "repo" => instance_variable_get(:@repo),

            "collection" => instance_variable_get(:@collection),

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor),

            "reverse" => instance_variable_get(:@reverse)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :records

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:records=, hash["records"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "records" => instance_variable_get(:@records)

          }
        end
      end
    end
  end

  module ComAtprotoRepoPutrecord
    module PutRecord
      class Input
        attr_accessor :repo

        attr_accessor :collection

        attr_accessor :rkey

        attr_accessor :validate

        attr_accessor :record

        attr_accessor :swapRecord

        attr_accessor :swapCommit

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:repo=, hash["repo"])

          instance.send(:collection=, hash["collection"])

          instance.send(:rkey=, hash["rkey"])

          instance.send(:validate=, hash["validate"])

          instance.send(:record=, hash["record"])

          instance.send(:swapRecord=, hash["swapRecord"])

          instance.send(:swapCommit=, hash["swapCommit"])

          instance
        end

        def to_h
          {

            "repo" => instance_variable_get(:@repo),

            "collection" => instance_variable_get(:@collection),

            "rkey" => instance_variable_get(:@rkey),

            "validate" => instance_variable_get(:@validate),

            "record" => instance_variable_get(:@record),

            "swapRecord" => instance_variable_get(:@swapRecord),

            "swapCommit" => instance_variable_get(:@swapCommit)

          }
        end
      end

      class Output
        attr_accessor :uri

        attr_accessor :cid

        attr_accessor :commit

        attr_accessor :validationStatus

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:uri=, hash["uri"])

          instance.send(:cid=, hash["cid"])

          instance.send(:commit=, hash["commit"])

          instance.send(:validationStatus=, hash["validationStatus"])

          instance
        end

        def to_h
          {

            "uri" => instance_variable_get(:@uri),

            "cid" => instance_variable_get(:@cid),

            "commit" => instance_variable_get(:@commit),

            "validationStatus" => instance_variable_get(:@validationStatus)

          }
        end
      end
    end
  end

  module ComAtprotoRepoUploadblob
    module UploadBlob
      class Output
        attr_accessor :blob

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:blob=, hash["blob"])

          instance
        end

        def to_h
          {

            "blob" => instance_variable_get(:@blob)

          }
        end
      end
    end
  end

  module ComAtprotoServerActivateaccount
    module ActivateAccount
    end
  end

  module ComAtprotoServerCheckaccountstatus
    module CheckAccountStatus
      class Output
        attr_accessor :activated

        attr_accessor :validDid

        attr_accessor :repoCommit

        attr_accessor :repoRev

        attr_accessor :repoBlocks

        attr_accessor :indexedRecords

        attr_accessor :privateStateValues

        attr_accessor :expectedBlobs

        attr_accessor :importedBlobs

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:activated=, hash["activated"])

          instance.send(:validDid=, hash["validDid"])

          instance.send(:repoCommit=, hash["repoCommit"])

          instance.send(:repoRev=, hash["repoRev"])

          instance.send(:repoBlocks=, hash["repoBlocks"])

          instance.send(:indexedRecords=, hash["indexedRecords"])

          instance.send(:privateStateValues=, hash["privateStateValues"])

          instance.send(:expectedBlobs=, hash["expectedBlobs"])

          instance.send(:importedBlobs=, hash["importedBlobs"])

          instance
        end

        def to_h
          {

            "activated" => instance_variable_get(:@activated),

            "validDid" => instance_variable_get(:@validDid),

            "repoCommit" => instance_variable_get(:@repoCommit),

            "repoRev" => instance_variable_get(:@repoRev),

            "repoBlocks" => instance_variable_get(:@repoBlocks),

            "indexedRecords" => instance_variable_get(:@indexedRecords),

            "privateStateValues" => instance_variable_get(:@privateStateValues),

            "expectedBlobs" => instance_variable_get(:@expectedBlobs),

            "importedBlobs" => instance_variable_get(:@importedBlobs)

          }
        end
      end
    end
  end

  module ComAtprotoServerConfirmemail
    module ConfirmEmail
      class Input
        attr_accessor :email

        attr_accessor :token

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:email=, hash["email"])

          instance.send(:token=, hash["token"])

          instance
        end

        def to_h
          {

            "email" => instance_variable_get(:@email),

            "token" => instance_variable_get(:@token)

          }
        end
      end
    end
  end

  module ComAtprotoServerCreateaccount
    module CreateAccount
      class Input
        attr_accessor :email

        attr_accessor :handle

        attr_accessor :did

        attr_accessor :inviteCode

        attr_accessor :verificationCode

        attr_accessor :verificationPhone

        attr_accessor :password

        attr_accessor :recoveryKey

        attr_accessor :plcOp

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:email=, hash["email"])

          instance.send(:handle=, hash["handle"])

          instance.send(:did=, hash["did"])

          instance.send(:inviteCode=, hash["inviteCode"])

          instance.send(:verificationCode=, hash["verificationCode"])

          instance.send(:verificationPhone=, hash["verificationPhone"])

          instance.send(:password=, hash["password"])

          instance.send(:recoveryKey=, hash["recoveryKey"])

          instance.send(:plcOp=, hash["plcOp"])

          instance
        end

        def to_h
          {

            "email" => instance_variable_get(:@email),

            "handle" => instance_variable_get(:@handle),

            "did" => instance_variable_get(:@did),

            "inviteCode" => instance_variable_get(:@inviteCode),

            "verificationCode" => instance_variable_get(:@verificationCode),

            "verificationPhone" => instance_variable_get(:@verificationPhone),

            "password" => instance_variable_get(:@password),

            "recoveryKey" => instance_variable_get(:@recoveryKey),

            "plcOp" => instance_variable_get(:@plcOp)

          }
        end
      end

      class Output
        attr_accessor :accessJwt

        attr_accessor :refreshJwt

        attr_accessor :handle

        attr_accessor :did

        attr_accessor :didDoc

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:accessJwt=, hash["accessJwt"])

          instance.send(:refreshJwt=, hash["refreshJwt"])

          instance.send(:handle=, hash["handle"])

          instance.send(:did=, hash["did"])

          instance.send(:didDoc=, hash["didDoc"])

          instance
        end

        def to_h
          {

            "accessJwt" => instance_variable_get(:@accessJwt),

            "refreshJwt" => instance_variable_get(:@refreshJwt),

            "handle" => instance_variable_get(:@handle),

            "did" => instance_variable_get(:@did),

            "didDoc" => instance_variable_get(:@didDoc)

          }
        end
      end
    end
  end

  module ComAtprotoServerCreateapppassword
    module CreateAppPassword
      class Input
        attr_accessor :name

        attr_accessor :privileged

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:name=, hash["name"])

          instance.send(:privileged=, hash["privileged"])

          instance
        end

        def to_h
          {

            "name" => instance_variable_get(:@name),

            "privileged" => instance_variable_get(:@privileged)

          }
        end
      end

      class Output
        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          new
        end

        def to_h
          {}
        end
      end
    end
  end

  module ComAtprotoServerCreateinvitecode
    module CreateInviteCode
      class Input
        attr_accessor :useCount

        attr_accessor :forAccount

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:useCount=, hash["useCount"])

          instance.send(:forAccount=, hash["forAccount"])

          instance
        end

        def to_h
          {

            "useCount" => instance_variable_get(:@useCount),

            "forAccount" => instance_variable_get(:@forAccount)

          }
        end
      end

      class Output
        attr_accessor :code

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:code=, hash["code"])

          instance
        end

        def to_h
          {

            "code" => instance_variable_get(:@code)

          }
        end
      end
    end
  end

  module ComAtprotoServerCreateinvitecodes
    module CreateInviteCodes
      class Input
        attr_accessor :codeCount

        attr_accessor :useCount

        attr_accessor :forAccounts

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:codeCount=, hash["codeCount"])

          instance.send(:useCount=, hash["useCount"])

          instance.send(:forAccounts=, hash["forAccounts"])

          instance
        end

        def to_h
          {

            "codeCount" => instance_variable_get(:@codeCount),

            "useCount" => instance_variable_get(:@useCount),

            "forAccounts" => instance_variable_get(:@forAccounts)

          }
        end
      end

      class Output
        attr_accessor :codes

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:codes=, hash["codes"])

          instance
        end

        def to_h
          {

            "codes" => instance_variable_get(:@codes)

          }
        end
      end
    end
  end

  module ComAtprotoServerCreatesession
    module CreateSession
      class Input
        attr_accessor :identifier

        attr_accessor :password

        attr_accessor :authFactorToken

        attr_accessor :allowTakendown

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:identifier=, hash["identifier"])

          instance.send(:password=, hash["password"])

          instance.send(:authFactorToken=, hash["authFactorToken"])

          instance.send(:allowTakendown=, hash["allowTakendown"])

          instance
        end

        def to_h
          {

            "identifier" => instance_variable_get(:@identifier),

            "password" => instance_variable_get(:@password),

            "authFactorToken" => instance_variable_get(:@authFactorToken),

            "allowTakendown" => instance_variable_get(:@allowTakendown)

          }
        end
      end

      class Output
        attr_accessor :accessJwt

        attr_accessor :refreshJwt

        attr_accessor :handle

        attr_accessor :did

        attr_accessor :didDoc

        attr_accessor :email

        attr_accessor :emailConfirmed

        attr_accessor :emailAuthFactor

        attr_accessor :active

        attr_accessor :status

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:accessJwt=, hash["accessJwt"])

          instance.send(:refreshJwt=, hash["refreshJwt"])

          instance.send(:handle=, hash["handle"])

          instance.send(:did=, hash["did"])

          instance.send(:didDoc=, hash["didDoc"])

          instance.send(:email=, hash["email"])

          instance.send(:emailConfirmed=, hash["emailConfirmed"])

          instance.send(:emailAuthFactor=, hash["emailAuthFactor"])

          instance.send(:active=, hash["active"])

          instance.send(:status=, hash["status"])

          instance
        end

        def to_h
          {

            "accessJwt" => instance_variable_get(:@accessJwt),

            "refreshJwt" => instance_variable_get(:@refreshJwt),

            "handle" => instance_variable_get(:@handle),

            "did" => instance_variable_get(:@did),

            "didDoc" => instance_variable_get(:@didDoc),

            "email" => instance_variable_get(:@email),

            "emailConfirmed" => instance_variable_get(:@emailConfirmed),

            "emailAuthFactor" => instance_variable_get(:@emailAuthFactor),

            "active" => instance_variable_get(:@active),

            "status" => instance_variable_get(:@status)

          }
        end
      end
    end
  end

  module ComAtprotoServerDeactivateaccount
    module DeactivateAccount
      class Input
        attr_accessor :deleteAfter

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:deleteAfter=, hash["deleteAfter"])

          instance
        end

        def to_h
          {

            "deleteAfter" => instance_variable_get(:@deleteAfter)

          }
        end
      end
    end
  end

  module ComAtprotoServerDeleteaccount
    module DeleteAccount
      class Input
        attr_accessor :did

        attr_accessor :password

        attr_accessor :token

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:did=, hash["did"])

          instance.send(:password=, hash["password"])

          instance.send(:token=, hash["token"])

          instance
        end

        def to_h
          {

            "did" => instance_variable_get(:@did),

            "password" => instance_variable_get(:@password),

            "token" => instance_variable_get(:@token)

          }
        end
      end
    end
  end

  module ComAtprotoServerDeletesession
    module DeleteSession
    end
  end

  module ComAtprotoServerDescribeserver
    module DescribeServer
      class Output
        attr_accessor :inviteCodeRequired

        attr_accessor :phoneVerificationRequired

        attr_accessor :availableUserDomains

        attr_accessor :links

        attr_accessor :contact

        attr_accessor :did

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:inviteCodeRequired=, hash["inviteCodeRequired"])

          instance.send(:phoneVerificationRequired=, hash["phoneVerificationRequired"])

          instance.send(:availableUserDomains=, hash["availableUserDomains"])

          instance.send(:links=, hash["links"])

          instance.send(:contact=, hash["contact"])

          instance.send(:did=, hash["did"])

          instance
        end

        def to_h
          {

            "inviteCodeRequired" => instance_variable_get(:@inviteCodeRequired),

            "phoneVerificationRequired" => instance_variable_get(:@phoneVerificationRequired),

            "availableUserDomains" => instance_variable_get(:@availableUserDomains),

            "links" => instance_variable_get(:@links),

            "contact" => instance_variable_get(:@contact),

            "did" => instance_variable_get(:@did)

          }
        end
      end
    end
  end

  module ComAtprotoServerGetaccountinvitecodes
    module GetAccountInviteCodes
      class Input
        attr_accessor :includeUsed

        attr_accessor :createAvailable

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:includeUsed=, hash["includeUsed"])

          instance.send(:createAvailable=, hash["createAvailable"])

          instance
        end

        def to_h
          {

            "includeUsed" => instance_variable_get(:@includeUsed),

            "createAvailable" => instance_variable_get(:@createAvailable)

          }
        end
      end

      class Output
        attr_accessor :codes

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:codes=, hash["codes"])

          instance
        end

        def to_h
          {

            "codes" => instance_variable_get(:@codes)

          }
        end
      end
    end
  end

  module ComAtprotoServerGetserviceauth
    module GetServiceAuth
      class Input
        attr_accessor :aud

        attr_accessor :exp

        attr_accessor :lxm

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:aud=, hash["aud"])

          instance.send(:exp=, hash["exp"])

          instance.send(:lxm=, hash["lxm"])

          instance
        end

        def to_h
          {

            "aud" => instance_variable_get(:@aud),

            "exp" => instance_variable_get(:@exp),

            "lxm" => instance_variable_get(:@lxm)

          }
        end
      end

      class Output
        attr_accessor :token

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:token=, hash["token"])

          instance
        end

        def to_h
          {

            "token" => instance_variable_get(:@token)

          }
        end
      end
    end
  end

  module ComAtprotoServerGetsession
    module GetSession
      class Output
        attr_accessor :handle

        attr_accessor :did

        attr_accessor :didDoc

        attr_accessor :email

        attr_accessor :emailConfirmed

        attr_accessor :emailAuthFactor

        attr_accessor :active

        attr_accessor :status

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:handle=, hash["handle"])

          instance.send(:did=, hash["did"])

          instance.send(:didDoc=, hash["didDoc"])

          instance.send(:email=, hash["email"])

          instance.send(:emailConfirmed=, hash["emailConfirmed"])

          instance.send(:emailAuthFactor=, hash["emailAuthFactor"])

          instance.send(:active=, hash["active"])

          instance.send(:status=, hash["status"])

          instance
        end

        def to_h
          {

            "handle" => instance_variable_get(:@handle),

            "did" => instance_variable_get(:@did),

            "didDoc" => instance_variable_get(:@didDoc),

            "email" => instance_variable_get(:@email),

            "emailConfirmed" => instance_variable_get(:@emailConfirmed),

            "emailAuthFactor" => instance_variable_get(:@emailAuthFactor),

            "active" => instance_variable_get(:@active),

            "status" => instance_variable_get(:@status)

          }
        end
      end
    end
  end

  module ComAtprotoServerListapppasswords
    module ListAppPasswords
      class Output
        attr_accessor :passwords

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:passwords=, hash["passwords"])

          instance
        end

        def to_h
          {

            "passwords" => instance_variable_get(:@passwords)

          }
        end
      end
    end
  end

  module ComAtprotoServerRefreshsession
    module RefreshSession
      class Output
        attr_accessor :accessJwt

        attr_accessor :refreshJwt

        attr_accessor :handle

        attr_accessor :did

        attr_accessor :didDoc

        attr_accessor :email

        attr_accessor :emailConfirmed

        attr_accessor :emailAuthFactor

        attr_accessor :active

        attr_accessor :status

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:accessJwt=, hash["accessJwt"])

          instance.send(:refreshJwt=, hash["refreshJwt"])

          instance.send(:handle=, hash["handle"])

          instance.send(:did=, hash["did"])

          instance.send(:didDoc=, hash["didDoc"])

          instance.send(:email=, hash["email"])

          instance.send(:emailConfirmed=, hash["emailConfirmed"])

          instance.send(:emailAuthFactor=, hash["emailAuthFactor"])

          instance.send(:active=, hash["active"])

          instance.send(:status=, hash["status"])

          instance
        end

        def to_h
          {

            "accessJwt" => instance_variable_get(:@accessJwt),

            "refreshJwt" => instance_variable_get(:@refreshJwt),

            "handle" => instance_variable_get(:@handle),

            "did" => instance_variable_get(:@did),

            "didDoc" => instance_variable_get(:@didDoc),

            "email" => instance_variable_get(:@email),

            "emailConfirmed" => instance_variable_get(:@emailConfirmed),

            "emailAuthFactor" => instance_variable_get(:@emailAuthFactor),

            "active" => instance_variable_get(:@active),

            "status" => instance_variable_get(:@status)

          }
        end
      end
    end
  end

  module ComAtprotoServerRequestaccountdelete
    module RequestAccountDelete
    end
  end

  module ComAtprotoServerRequestemailconfirmation
    module RequestEmailConfirmation
    end
  end

  module ComAtprotoServerRequestemailupdate
    module RequestEmailUpdate
      class Output
        attr_accessor :tokenRequired

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:tokenRequired=, hash["tokenRequired"])

          instance
        end

        def to_h
          {

            "tokenRequired" => instance_variable_get(:@tokenRequired)

          }
        end
      end
    end
  end

  module ComAtprotoServerRequestpasswordreset
    module RequestPasswordReset
      class Input
        attr_accessor :email

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:email=, hash["email"])

          instance
        end

        def to_h
          {

            "email" => instance_variable_get(:@email)

          }
        end
      end
    end
  end

  module ComAtprotoServerReservesigningkey
    module ReserveSigningKey
      class Input
        attr_accessor :did

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:did=, hash["did"])

          instance
        end

        def to_h
          {

            "did" => instance_variable_get(:@did)

          }
        end
      end

      class Output
        attr_accessor :signingKey

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:signingKey=, hash["signingKey"])

          instance
        end

        def to_h
          {

            "signingKey" => instance_variable_get(:@signingKey)

          }
        end
      end
    end
  end

  module ComAtprotoServerResetpassword
    module ResetPassword
      class Input
        attr_accessor :token

        attr_accessor :password

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:token=, hash["token"])

          instance.send(:password=, hash["password"])

          instance
        end

        def to_h
          {

            "token" => instance_variable_get(:@token),

            "password" => instance_variable_get(:@password)

          }
        end
      end
    end
  end

  module ComAtprotoServerRevokeapppassword
    module RevokeAppPassword
      class Input
        attr_accessor :name

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:name=, hash["name"])

          instance
        end

        def to_h
          {

            "name" => instance_variable_get(:@name)

          }
        end
      end
    end
  end

  module ComAtprotoServerUpdateemail
    module UpdateEmail
      class Input
        attr_accessor :email

        attr_accessor :emailAuthFactor

        attr_accessor :token

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:email=, hash["email"])

          instance.send(:emailAuthFactor=, hash["emailAuthFactor"])

          instance.send(:token=, hash["token"])

          instance
        end

        def to_h
          {

            "email" => instance_variable_get(:@email),

            "emailAuthFactor" => instance_variable_get(:@emailAuthFactor),

            "token" => instance_variable_get(:@token)

          }
        end
      end
    end
  end

  module ComAtprotoSyncGetblob
    module GetBlob
      class Input
        attr_accessor :did

        attr_accessor :cid

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:did=, hash["did"])

          instance.send(:cid=, hash["cid"])

          instance
        end

        def to_h
          {

            "did" => instance_variable_get(:@did),

            "cid" => instance_variable_get(:@cid)

          }
        end
      end
    end
  end

  module ComAtprotoSyncGetblocks
    module GetBlocks
      class Input
        attr_accessor :did

        attr_accessor :cids

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:did=, hash["did"])

          instance.send(:cids=, hash["cids"])

          instance
        end

        def to_h
          {

            "did" => instance_variable_get(:@did),

            "cids" => instance_variable_get(:@cids)

          }
        end
      end
    end
  end

  module ComAtprotoSyncGetcheckout
    module GetCheckout
      class Input
        attr_accessor :did

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:did=, hash["did"])

          instance
        end

        def to_h
          {

            "did" => instance_variable_get(:@did)

          }
        end
      end
    end
  end

  module ComAtprotoSyncGethead
    module GetHead
      class Input
        attr_accessor :did

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:did=, hash["did"])

          instance
        end

        def to_h
          {

            "did" => instance_variable_get(:@did)

          }
        end
      end

      class Output
        attr_accessor :root

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:root=, hash["root"])

          instance
        end

        def to_h
          {

            "root" => instance_variable_get(:@root)

          }
        end
      end
    end
  end

  module ComAtprotoSyncGethoststatus
    module GetHostStatus
      class Input
        attr_accessor :hostname

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:hostname=, hash["hostname"])

          instance
        end

        def to_h
          {

            "hostname" => instance_variable_get(:@hostname)

          }
        end
      end

      class Output
        attr_accessor :hostname

        attr_accessor :seq

        attr_accessor :accountCount

        attr_accessor :status

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:hostname=, hash["hostname"])

          instance.send(:seq=, hash["seq"])

          instance.send(:accountCount=, hash["accountCount"])

          instance.send(:status=, hash["status"])

          instance
        end

        def to_h
          {

            "hostname" => instance_variable_get(:@hostname),

            "seq" => instance_variable_get(:@seq),

            "accountCount" => instance_variable_get(:@accountCount),

            "status" => instance_variable_get(:@status)

          }
        end
      end
    end
  end

  module ComAtprotoSyncGetlatestcommit
    module GetLatestCommit
      class Input
        attr_accessor :did

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:did=, hash["did"])

          instance
        end

        def to_h
          {

            "did" => instance_variable_get(:@did)

          }
        end
      end

      class Output
        attr_accessor :cid

        attr_accessor :rev

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cid=, hash["cid"])

          instance.send(:rev=, hash["rev"])

          instance
        end

        def to_h
          {

            "cid" => instance_variable_get(:@cid),

            "rev" => instance_variable_get(:@rev)

          }
        end
      end
    end
  end

  module ComAtprotoSyncGetrecord
    module GetRecord
      class Input
        attr_accessor :did

        attr_accessor :collection

        attr_accessor :rkey

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:did=, hash["did"])

          instance.send(:collection=, hash["collection"])

          instance.send(:rkey=, hash["rkey"])

          instance
        end

        def to_h
          {

            "did" => instance_variable_get(:@did),

            "collection" => instance_variable_get(:@collection),

            "rkey" => instance_variable_get(:@rkey)

          }
        end
      end
    end
  end

  module ComAtprotoSyncGetrepo
    module GetRepo
      class Input
        attr_accessor :did

        attr_accessor :since

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:did=, hash["did"])

          instance.send(:since=, hash["since"])

          instance
        end

        def to_h
          {

            "did" => instance_variable_get(:@did),

            "since" => instance_variable_get(:@since)

          }
        end
      end
    end
  end

  module ComAtprotoSyncGetrepostatus
    module GetRepoStatus
      class Input
        attr_accessor :did

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:did=, hash["did"])

          instance
        end

        def to_h
          {

            "did" => instance_variable_get(:@did)

          }
        end
      end

      class Output
        attr_accessor :did

        attr_accessor :active

        attr_accessor :status

        attr_accessor :rev

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:did=, hash["did"])

          instance.send(:active=, hash["active"])

          instance.send(:status=, hash["status"])

          instance.send(:rev=, hash["rev"])

          instance
        end

        def to_h
          {

            "did" => instance_variable_get(:@did),

            "active" => instance_variable_get(:@active),

            "status" => instance_variable_get(:@status),

            "rev" => instance_variable_get(:@rev)

          }
        end
      end
    end
  end

  module ComAtprotoSyncListblobs
    module ListBlobs
      class Input
        attr_accessor :did

        attr_accessor :since

        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:did=, hash["did"])

          instance.send(:since=, hash["since"])

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "did" => instance_variable_get(:@did),

            "since" => instance_variable_get(:@since),

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :cids

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:cids=, hash["cids"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "cids" => instance_variable_get(:@cids)

          }
        end
      end
    end
  end

  module ComAtprotoSyncListhosts
    module ListHosts
      class Input
        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :hosts

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:hosts=, hash["hosts"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "hosts" => instance_variable_get(:@hosts)

          }
        end
      end
    end
  end

  module ComAtprotoSyncListrepos
    module ListRepos
      class Input
        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :repos

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:repos=, hash["repos"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "repos" => instance_variable_get(:@repos)

          }
        end
      end
    end
  end

  module ComAtprotoSyncListreposbycollection
    module ListReposByCollection
      class Input
        attr_accessor :collection

        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:collection=, hash["collection"])

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "collection" => instance_variable_get(:@collection),

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :repos

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:repos=, hash["repos"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "repos" => instance_variable_get(:@repos)

          }
        end
      end
    end
  end

  module ComAtprotoSyncNotifyofupdate
    module NotifyOfUpdate
      class Input
        attr_accessor :hostname

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:hostname=, hash["hostname"])

          instance
        end

        def to_h
          {

            "hostname" => instance_variable_get(:@hostname)

          }
        end
      end
    end
  end

  module ComAtprotoSyncRequestcrawl
    module RequestCrawl
      class Input
        attr_accessor :hostname

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:hostname=, hash["hostname"])

          instance
        end

        def to_h
          {

            "hostname" => instance_variable_get(:@hostname)

          }
        end
      end
    end
  end

  module ComAtprotoTempAddreservedhandle
    module AddReservedHandle
      class Input
        attr_accessor :handle

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:handle=, hash["handle"])

          instance
        end

        def to_h
          {

            "handle" => instance_variable_get(:@handle)

          }
        end
      end

      class Output
        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          new
        end

        def to_h
          {}
        end
      end
    end
  end

  module ComAtprotoTempCheckhandleavailability
    module CheckHandleAvailability
      class Input
        attr_accessor :handle

        attr_accessor :email

        attr_accessor :birthDate

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:handle=, hash["handle"])

          instance.send(:email=, hash["email"])

          instance.send(:birthDate=, hash["birthDate"])

          instance
        end

        def to_h
          {

            "handle" => instance_variable_get(:@handle),

            "email" => instance_variable_get(:@email),

            "birthDate" => instance_variable_get(:@birthDate)

          }
        end
      end

      class Output
        attr_accessor :handle

        attr_accessor :result

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:handle=, hash["handle"])

          instance.send(:result=, hash["result"])

          instance
        end

        def to_h
          {

            "handle" => instance_variable_get(:@handle),

            "result" => instance_variable_get(:@result)

          }
        end
      end
    end
  end

  module ComAtprotoTempChecksignupqueue
    module CheckSignupQueue
      class Output
        attr_accessor :activated

        attr_accessor :placeInQueue

        attr_accessor :estimatedTimeMs

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:activated=, hash["activated"])

          instance.send(:placeInQueue=, hash["placeInQueue"])

          instance.send(:estimatedTimeMs=, hash["estimatedTimeMs"])

          instance
        end

        def to_h
          {

            "activated" => instance_variable_get(:@activated),

            "placeInQueue" => instance_variable_get(:@placeInQueue),

            "estimatedTimeMs" => instance_variable_get(:@estimatedTimeMs)

          }
        end
      end
    end
  end

  module ComAtprotoTempDereferencescope
    module DereferenceScope
      class Input
        attr_accessor :scope

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:scope=, hash["scope"])

          instance
        end

        def to_h
          {

            "scope" => instance_variable_get(:@scope)

          }
        end
      end

      class Output
        attr_accessor :scope

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:scope=, hash["scope"])

          instance
        end

        def to_h
          {

            "scope" => instance_variable_get(:@scope)

          }
        end
      end
    end
  end

  module ComAtprotoTempFetchlabels
    module FetchLabels
      class Input
        attr_accessor :since

        attr_accessor :limit

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:since=, hash["since"])

          instance.send(:limit=, hash["limit"])

          instance
        end

        def to_h
          {

            "since" => instance_variable_get(:@since),

            "limit" => instance_variable_get(:@limit)

          }
        end
      end

      class Output
        attr_accessor :labels

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:labels=, hash["labels"])

          instance
        end

        def to_h
          {

            "labels" => instance_variable_get(:@labels)

          }
        end
      end
    end
  end

  module ComAtprotoTempRequestphoneverification
    module RequestPhoneVerification
      class Input
        attr_accessor :phoneNumber

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:phoneNumber=, hash["phoneNumber"])

          instance
        end

        def to_h
          {

            "phoneNumber" => instance_variable_get(:@phoneNumber)

          }
        end
      end
    end
  end

  module ComAtprotoTempRevokeaccountcredentials
    module RevokeAccountCredentials
      class Input
        attr_accessor :account

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:account=, hash["account"])

          instance
        end

        def to_h
          {

            "account" => instance_variable_get(:@account)

          }
        end
      end
    end
  end

  module InternalBskyActorGetprofiles
    module GetProfiles
      class Input
        attr_accessor :dids

        attr_accessor :viewer

        attr_accessor :socialProof

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:dids=, hash["dids"])

          instance.send(:viewer=, hash["viewer"])

          instance.send(:socialProof=, hash["socialProof"])

          instance
        end

        def to_h
          {

            "dids" => instance_variable_get(:@dids),

            "viewer" => instance_variable_get(:@viewer),

            "socialProof" => instance_variable_get(:@socialProof)

          }
        end
      end

      class Output
        attr_accessor :profiles

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:profiles=, hash["profiles"])

          instance
        end

        def to_h
          {

            "profiles" => instance_variable_get(:@profiles)

          }
        end
      end
    end
  end

  module ToolsOzoneCommunicationCreatetemplate
    module CreateTemplate
      class Input
        attr_accessor :name

        attr_accessor :contentMarkdown

        attr_accessor :subject

        attr_accessor :lang

        attr_accessor :createdBy

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:name=, hash["name"])

          instance.send(:contentMarkdown=, hash["contentMarkdown"])

          instance.send(:subject=, hash["subject"])

          instance.send(:lang=, hash["lang"])

          instance.send(:createdBy=, hash["createdBy"])

          instance
        end

        def to_h
          {

            "name" => instance_variable_get(:@name),

            "contentMarkdown" => instance_variable_get(:@contentMarkdown),

            "subject" => instance_variable_get(:@subject),

            "lang" => instance_variable_get(:@lang),

            "createdBy" => instance_variable_get(:@createdBy)

          }
        end
      end

      class Output
        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          new
        end

        def to_h
          {}
        end
      end
    end
  end

  module ToolsOzoneCommunicationDeletetemplate
    module DeleteTemplate
      class Input
        attr_accessor :id

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:id=, hash["id"])

          instance
        end

        def to_h
          {

            "id" => instance_variable_get(:@id)

          }
        end
      end
    end
  end

  module ToolsOzoneCommunicationListtemplates
    module ListTemplates
      class Output
        attr_accessor :communicationTemplates

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:communicationTemplates=, hash["communicationTemplates"])

          instance
        end

        def to_h
          {

            "communicationTemplates" => instance_variable_get(:@communicationTemplates)

          }
        end
      end
    end
  end

  module ToolsOzoneCommunicationUpdatetemplate
    module UpdateTemplate
      class Input
        attr_accessor :id

        attr_accessor :name

        attr_accessor :lang

        attr_accessor :contentMarkdown

        attr_accessor :subject

        attr_accessor :updatedBy

        attr_accessor :disabled

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:id=, hash["id"])

          instance.send(:name=, hash["name"])

          instance.send(:lang=, hash["lang"])

          instance.send(:contentMarkdown=, hash["contentMarkdown"])

          instance.send(:subject=, hash["subject"])

          instance.send(:updatedBy=, hash["updatedBy"])

          instance.send(:disabled=, hash["disabled"])

          instance
        end

        def to_h
          {

            "id" => instance_variable_get(:@id),

            "name" => instance_variable_get(:@name),

            "lang" => instance_variable_get(:@lang),

            "contentMarkdown" => instance_variable_get(:@contentMarkdown),

            "subject" => instance_variable_get(:@subject),

            "updatedBy" => instance_variable_get(:@updatedBy),

            "disabled" => instance_variable_get(:@disabled)

          }
        end
      end

      class Output
        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          new
        end

        def to_h
          {}
        end
      end
    end
  end

  module ToolsOzoneHostingGetaccounthistory
    module GetAccountHistory
      class Input
        attr_accessor :did

        attr_accessor :events

        attr_accessor :cursor

        attr_accessor :limit

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:did=, hash["did"])

          instance.send(:events=, hash["events"])

          instance.send(:cursor=, hash["cursor"])

          instance.send(:limit=, hash["limit"])

          instance
        end

        def to_h
          {

            "did" => instance_variable_get(:@did),

            "events" => instance_variable_get(:@events),

            "cursor" => instance_variable_get(:@cursor),

            "limit" => instance_variable_get(:@limit)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :events

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:events=, hash["events"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "events" => instance_variable_get(:@events)

          }
        end
      end
    end
  end

  module ToolsOzoneModerationCancelscheduledactions
    module CancelScheduledActions
      class Input
        attr_accessor :subjects

        attr_accessor :comment

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:subjects=, hash["subjects"])

          instance.send(:comment=, hash["comment"])

          instance
        end

        def to_h
          {

            "subjects" => instance_variable_get(:@subjects),

            "comment" => instance_variable_get(:@comment)

          }
        end
      end

      class Output
        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          new
        end

        def to_h
          {}
        end
      end
    end
  end

  module ToolsOzoneModerationEmitevent
    module EmitEvent
      class Input
        attr_accessor :event

        attr_accessor :subject

        attr_accessor :subjectBlobCids

        attr_accessor :createdBy

        attr_accessor :modTool

        attr_accessor :externalId

        attr_accessor :reportAction

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:event=, hash["event"])

          instance.send(:subject=, hash["subject"])

          instance.send(:subjectBlobCids=, hash["subjectBlobCids"])

          instance.send(:createdBy=, hash["createdBy"])

          instance.send(:modTool=, hash["modTool"])

          instance.send(:externalId=, hash["externalId"])

          instance.send(:reportAction=, hash["reportAction"])

          instance
        end

        def to_h
          {

            "event" => instance_variable_get(:@event),

            "subject" => instance_variable_get(:@subject),

            "subjectBlobCids" => instance_variable_get(:@subjectBlobCids),

            "createdBy" => instance_variable_get(:@createdBy),

            "modTool" => instance_variable_get(:@modTool),

            "externalId" => instance_variable_get(:@externalId),

            "reportAction" => instance_variable_get(:@reportAction)

          }
        end
      end

      class Output
        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          new
        end

        def to_h
          {}
        end
      end
    end
  end

  module ToolsOzoneModerationGetaccounttimeline
    module GetAccountTimeline
      class Input
        attr_accessor :did

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:did=, hash["did"])

          instance
        end

        def to_h
          {

            "did" => instance_variable_get(:@did)

          }
        end
      end

      class Output
        attr_accessor :timeline

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:timeline=, hash["timeline"])

          instance
        end

        def to_h
          {

            "timeline" => instance_variable_get(:@timeline)

          }
        end
      end
    end
  end

  module ToolsOzoneModerationGetevent
    module GetEvent
      class Input
        attr_accessor :id

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:id=, hash["id"])

          instance
        end

        def to_h
          {

            "id" => instance_variable_get(:@id)

          }
        end
      end

      class Output
        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          new
        end

        def to_h
          {}
        end
      end
    end
  end

  module ToolsOzoneModerationGetrecord
    module GetRecord
      class Input
        attr_accessor :uri

        attr_accessor :cid

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:uri=, hash["uri"])

          instance.send(:cid=, hash["cid"])

          instance
        end

        def to_h
          {

            "uri" => instance_variable_get(:@uri),

            "cid" => instance_variable_get(:@cid)

          }
        end
      end

      class Output
        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          new
        end

        def to_h
          {}
        end
      end
    end
  end

  module ToolsOzoneModerationGetrecords
    module GetRecords
      class Input
        attr_accessor :uris

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:uris=, hash["uris"])

          instance
        end

        def to_h
          {

            "uris" => instance_variable_get(:@uris)

          }
        end
      end

      class Output
        attr_accessor :records

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:records=, hash["records"])

          instance
        end

        def to_h
          {

            "records" => instance_variable_get(:@records)

          }
        end
      end
    end
  end

  module ToolsOzoneModerationGetrepo
    module GetRepo
      class Input
        attr_accessor :did

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:did=, hash["did"])

          instance
        end

        def to_h
          {

            "did" => instance_variable_get(:@did)

          }
        end
      end

      class Output
        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          new
        end

        def to_h
          {}
        end
      end
    end
  end

  module ToolsOzoneModerationGetreporterstats
    module GetReporterStats
      class Input
        attr_accessor :dids

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:dids=, hash["dids"])

          instance
        end

        def to_h
          {

            "dids" => instance_variable_get(:@dids)

          }
        end
      end

      class Output
        attr_accessor :stats

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:stats=, hash["stats"])

          instance
        end

        def to_h
          {

            "stats" => instance_variable_get(:@stats)

          }
        end
      end
    end
  end

  module ToolsOzoneModerationGetrepos
    module GetRepos
      class Input
        attr_accessor :dids

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:dids=, hash["dids"])

          instance
        end

        def to_h
          {

            "dids" => instance_variable_get(:@dids)

          }
        end
      end

      class Output
        attr_accessor :repos

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:repos=, hash["repos"])

          instance
        end

        def to_h
          {

            "repos" => instance_variable_get(:@repos)

          }
        end
      end
    end
  end

  module ToolsOzoneModerationGetsubjects
    module GetSubjects
      class Input
        attr_accessor :subjects

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:subjects=, hash["subjects"])

          instance
        end

        def to_h
          {

            "subjects" => instance_variable_get(:@subjects)

          }
        end
      end

      class Output
        attr_accessor :subjects

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:subjects=, hash["subjects"])

          instance
        end

        def to_h
          {

            "subjects" => instance_variable_get(:@subjects)

          }
        end
      end
    end
  end

  module ToolsOzoneModerationListscheduledactions
    module ListScheduledActions
      class Input
        attr_accessor :startsAfter

        attr_accessor :endsBefore

        attr_accessor :subjects

        attr_accessor :statuses

        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:startsAfter=, hash["startsAfter"])

          instance.send(:endsBefore=, hash["endsBefore"])

          instance.send(:subjects=, hash["subjects"])

          instance.send(:statuses=, hash["statuses"])

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "startsAfter" => instance_variable_get(:@startsAfter),

            "endsBefore" => instance_variable_get(:@endsBefore),

            "subjects" => instance_variable_get(:@subjects),

            "statuses" => instance_variable_get(:@statuses),

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :actions

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:actions=, hash["actions"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "actions" => instance_variable_get(:@actions),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end
    end
  end

  module ToolsOzoneModerationQueryevents
    module QueryEvents
      class Input
        attr_accessor :types

        attr_accessor :createdBy

        attr_accessor :sortDirection

        attr_accessor :createdAfter

        attr_accessor :createdBefore

        attr_accessor :subject

        attr_accessor :collections

        attr_accessor :subjectType

        attr_accessor :includeAllUserRecords

        attr_accessor :limit

        attr_accessor :hasComment

        attr_accessor :comment

        attr_accessor :addedLabels

        attr_accessor :removedLabels

        attr_accessor :addedTags

        attr_accessor :removedTags

        attr_accessor :reportTypes

        attr_accessor :policies

        attr_accessor :modTool

        attr_accessor :batchId

        attr_accessor :ageAssuranceState

        attr_accessor :withStrike

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:types=, hash["types"])

          instance.send(:createdBy=, hash["createdBy"])

          instance.send(:sortDirection=, hash["sortDirection"])

          instance.send(:createdAfter=, hash["createdAfter"])

          instance.send(:createdBefore=, hash["createdBefore"])

          instance.send(:subject=, hash["subject"])

          instance.send(:collections=, hash["collections"])

          instance.send(:subjectType=, hash["subjectType"])

          instance.send(:includeAllUserRecords=, hash["includeAllUserRecords"])

          instance.send(:limit=, hash["limit"])

          instance.send(:hasComment=, hash["hasComment"])

          instance.send(:comment=, hash["comment"])

          instance.send(:addedLabels=, hash["addedLabels"])

          instance.send(:removedLabels=, hash["removedLabels"])

          instance.send(:addedTags=, hash["addedTags"])

          instance.send(:removedTags=, hash["removedTags"])

          instance.send(:reportTypes=, hash["reportTypes"])

          instance.send(:policies=, hash["policies"])

          instance.send(:modTool=, hash["modTool"])

          instance.send(:batchId=, hash["batchId"])

          instance.send(:ageAssuranceState=, hash["ageAssuranceState"])

          instance.send(:withStrike=, hash["withStrike"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "types" => instance_variable_get(:@types),

            "createdBy" => instance_variable_get(:@createdBy),

            "sortDirection" => instance_variable_get(:@sortDirection),

            "createdAfter" => instance_variable_get(:@createdAfter),

            "createdBefore" => instance_variable_get(:@createdBefore),

            "subject" => instance_variable_get(:@subject),

            "collections" => instance_variable_get(:@collections),

            "subjectType" => instance_variable_get(:@subjectType),

            "includeAllUserRecords" => instance_variable_get(:@includeAllUserRecords),

            "limit" => instance_variable_get(:@limit),

            "hasComment" => instance_variable_get(:@hasComment),

            "comment" => instance_variable_get(:@comment),

            "addedLabels" => instance_variable_get(:@addedLabels),

            "removedLabels" => instance_variable_get(:@removedLabels),

            "addedTags" => instance_variable_get(:@addedTags),

            "removedTags" => instance_variable_get(:@removedTags),

            "reportTypes" => instance_variable_get(:@reportTypes),

            "policies" => instance_variable_get(:@policies),

            "modTool" => instance_variable_get(:@modTool),

            "batchId" => instance_variable_get(:@batchId),

            "ageAssuranceState" => instance_variable_get(:@ageAssuranceState),

            "withStrike" => instance_variable_get(:@withStrike),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :events

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:events=, hash["events"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "events" => instance_variable_get(:@events)

          }
        end
      end
    end
  end

  module ToolsOzoneModerationQuerystatuses
    module QueryStatuses
      class Input
        attr_accessor :queueCount

        attr_accessor :queueIndex

        attr_accessor :queueSeed

        attr_accessor :includeAllUserRecords

        attr_accessor :subject

        attr_accessor :comment

        attr_accessor :reportedAfter

        attr_accessor :reportedBefore

        attr_accessor :reviewedAfter

        attr_accessor :hostingDeletedAfter

        attr_accessor :hostingDeletedBefore

        attr_accessor :hostingUpdatedAfter

        attr_accessor :hostingUpdatedBefore

        attr_accessor :hostingStatuses

        attr_accessor :reviewedBefore

        attr_accessor :includeMuted

        attr_accessor :onlyMuted

        attr_accessor :reviewState

        attr_accessor :ignoreSubjects

        attr_accessor :lastReviewedBy

        attr_accessor :sortField

        attr_accessor :sortDirection

        attr_accessor :takendown

        attr_accessor :appealed

        attr_accessor :limit

        attr_accessor :tags

        attr_accessor :excludeTags

        attr_accessor :cursor

        attr_accessor :collections

        attr_accessor :subjectType

        attr_accessor :minAccountSuspendCount

        attr_accessor :minReportedRecordsCount

        attr_accessor :minTakendownRecordsCount

        attr_accessor :minPriorityScore

        attr_accessor :minStrikeCount

        attr_accessor :ageAssuranceState

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:queueCount=, hash["queueCount"])

          instance.send(:queueIndex=, hash["queueIndex"])

          instance.send(:queueSeed=, hash["queueSeed"])

          instance.send(:includeAllUserRecords=, hash["includeAllUserRecords"])

          instance.send(:subject=, hash["subject"])

          instance.send(:comment=, hash["comment"])

          instance.send(:reportedAfter=, hash["reportedAfter"])

          instance.send(:reportedBefore=, hash["reportedBefore"])

          instance.send(:reviewedAfter=, hash["reviewedAfter"])

          instance.send(:hostingDeletedAfter=, hash["hostingDeletedAfter"])

          instance.send(:hostingDeletedBefore=, hash["hostingDeletedBefore"])

          instance.send(:hostingUpdatedAfter=, hash["hostingUpdatedAfter"])

          instance.send(:hostingUpdatedBefore=, hash["hostingUpdatedBefore"])

          instance.send(:hostingStatuses=, hash["hostingStatuses"])

          instance.send(:reviewedBefore=, hash["reviewedBefore"])

          instance.send(:includeMuted=, hash["includeMuted"])

          instance.send(:onlyMuted=, hash["onlyMuted"])

          instance.send(:reviewState=, hash["reviewState"])

          instance.send(:ignoreSubjects=, hash["ignoreSubjects"])

          instance.send(:lastReviewedBy=, hash["lastReviewedBy"])

          instance.send(:sortField=, hash["sortField"])

          instance.send(:sortDirection=, hash["sortDirection"])

          instance.send(:takendown=, hash["takendown"])

          instance.send(:appealed=, hash["appealed"])

          instance.send(:limit=, hash["limit"])

          instance.send(:tags=, hash["tags"])

          instance.send(:excludeTags=, hash["excludeTags"])

          instance.send(:cursor=, hash["cursor"])

          instance.send(:collections=, hash["collections"])

          instance.send(:subjectType=, hash["subjectType"])

          instance.send(:minAccountSuspendCount=, hash["minAccountSuspendCount"])

          instance.send(:minReportedRecordsCount=, hash["minReportedRecordsCount"])

          instance.send(:minTakendownRecordsCount=, hash["minTakendownRecordsCount"])

          instance.send(:minPriorityScore=, hash["minPriorityScore"])

          instance.send(:minStrikeCount=, hash["minStrikeCount"])

          instance.send(:ageAssuranceState=, hash["ageAssuranceState"])

          instance
        end

        def to_h
          {

            "queueCount" => instance_variable_get(:@queueCount),

            "queueIndex" => instance_variable_get(:@queueIndex),

            "queueSeed" => instance_variable_get(:@queueSeed),

            "includeAllUserRecords" => instance_variable_get(:@includeAllUserRecords),

            "subject" => instance_variable_get(:@subject),

            "comment" => instance_variable_get(:@comment),

            "reportedAfter" => instance_variable_get(:@reportedAfter),

            "reportedBefore" => instance_variable_get(:@reportedBefore),

            "reviewedAfter" => instance_variable_get(:@reviewedAfter),

            "hostingDeletedAfter" => instance_variable_get(:@hostingDeletedAfter),

            "hostingDeletedBefore" => instance_variable_get(:@hostingDeletedBefore),

            "hostingUpdatedAfter" => instance_variable_get(:@hostingUpdatedAfter),

            "hostingUpdatedBefore" => instance_variable_get(:@hostingUpdatedBefore),

            "hostingStatuses" => instance_variable_get(:@hostingStatuses),

            "reviewedBefore" => instance_variable_get(:@reviewedBefore),

            "includeMuted" => instance_variable_get(:@includeMuted),

            "onlyMuted" => instance_variable_get(:@onlyMuted),

            "reviewState" => instance_variable_get(:@reviewState),

            "ignoreSubjects" => instance_variable_get(:@ignoreSubjects),

            "lastReviewedBy" => instance_variable_get(:@lastReviewedBy),

            "sortField" => instance_variable_get(:@sortField),

            "sortDirection" => instance_variable_get(:@sortDirection),

            "takendown" => instance_variable_get(:@takendown),

            "appealed" => instance_variable_get(:@appealed),

            "limit" => instance_variable_get(:@limit),

            "tags" => instance_variable_get(:@tags),

            "excludeTags" => instance_variable_get(:@excludeTags),

            "cursor" => instance_variable_get(:@cursor),

            "collections" => instance_variable_get(:@collections),

            "subjectType" => instance_variable_get(:@subjectType),

            "minAccountSuspendCount" => instance_variable_get(:@minAccountSuspendCount),

            "minReportedRecordsCount" => instance_variable_get(:@minReportedRecordsCount),

            "minTakendownRecordsCount" => instance_variable_get(:@minTakendownRecordsCount),

            "minPriorityScore" => instance_variable_get(:@minPriorityScore),

            "minStrikeCount" => instance_variable_get(:@minStrikeCount),

            "ageAssuranceState" => instance_variable_get(:@ageAssuranceState)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :subjectStatuses

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:subjectStatuses=, hash["subjectStatuses"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "subjectStatuses" => instance_variable_get(:@subjectStatuses)

          }
        end
      end
    end
  end

  module ToolsOzoneModerationScheduleaction
    module ScheduleAction
      class Input
        attr_accessor :action

        attr_accessor :subjects

        attr_accessor :createdBy

        attr_accessor :scheduling

        attr_accessor :modTool

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:action=, hash["action"])

          instance.send(:subjects=, hash["subjects"])

          instance.send(:createdBy=, hash["createdBy"])

          instance.send(:scheduling=, hash["scheduling"])

          instance.send(:modTool=, hash["modTool"])

          instance
        end

        def to_h
          {

            "action" => instance_variable_get(:@action),

            "subjects" => instance_variable_get(:@subjects),

            "createdBy" => instance_variable_get(:@createdBy),

            "scheduling" => instance_variable_get(:@scheduling),

            "modTool" => instance_variable_get(:@modTool)

          }
        end
      end

      class Output
        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          new
        end

        def to_h
          {}
        end
      end
    end
  end

  module ToolsOzoneModerationSearchrepos
    module SearchRepos
      class Input
        attr_accessor :term

        attr_accessor :q

        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:term=, hash["term"])

          instance.send(:q=, hash["q"])

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "term" => instance_variable_get(:@term),

            "q" => instance_variable_get(:@q),

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :repos

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:repos=, hash["repos"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "repos" => instance_variable_get(:@repos)

          }
        end
      end
    end
  end

  module ToolsOzoneQueueAssignmoderator
    module AssignModerator
      class Input
        attr_accessor :queueId

        attr_accessor :did

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:queueId=, hash["queueId"])

          instance.send(:did=, hash["did"])

          instance
        end

        def to_h
          {

            "queueId" => instance_variable_get(:@queueId),

            "did" => instance_variable_get(:@did)

          }
        end
      end

      class Output
        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          new
        end

        def to_h
          {}
        end
      end
    end
  end

  module ToolsOzoneQueueCreatequeue
    module CreateQueue
      class Input
        attr_accessor :name

        attr_accessor :subjectTypes

        attr_accessor :collection

        attr_accessor :reportTypes

        attr_accessor :description

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:name=, hash["name"])

          instance.send(:subjectTypes=, hash["subjectTypes"])

          instance.send(:collection=, hash["collection"])

          instance.send(:reportTypes=, hash["reportTypes"])

          instance.send(:description=, hash["description"])

          instance
        end

        def to_h
          {

            "name" => instance_variable_get(:@name),

            "subjectTypes" => instance_variable_get(:@subjectTypes),

            "collection" => instance_variable_get(:@collection),

            "reportTypes" => instance_variable_get(:@reportTypes),

            "description" => instance_variable_get(:@description)

          }
        end
      end

      class Output
        attr_accessor :queue

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:queue=, hash["queue"])

          instance
        end

        def to_h
          {

            "queue" => instance_variable_get(:@queue)

          }
        end
      end
    end
  end

  module ToolsOzoneQueueDeletequeue
    module DeleteQueue
      class Input
        attr_accessor :queueId

        attr_accessor :migrateToQueueId

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:queueId=, hash["queueId"])

          instance.send(:migrateToQueueId=, hash["migrateToQueueId"])

          instance
        end

        def to_h
          {

            "queueId" => instance_variable_get(:@queueId),

            "migrateToQueueId" => instance_variable_get(:@migrateToQueueId)

          }
        end
      end

      class Output
        attr_accessor :deleted

        attr_accessor :reportsMigrated

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:deleted=, hash["deleted"])

          instance.send(:reportsMigrated=, hash["reportsMigrated"])

          instance
        end

        def to_h
          {

            "deleted" => instance_variable_get(:@deleted),

            "reportsMigrated" => instance_variable_get(:@reportsMigrated)

          }
        end
      end
    end
  end

  module ToolsOzoneQueueGetassignments
    module GetAssignments
      class Input
        attr_accessor :onlyActive

        attr_accessor :queueIds

        attr_accessor :dids

        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:onlyActive=, hash["onlyActive"])

          instance.send(:queueIds=, hash["queueIds"])

          instance.send(:dids=, hash["dids"])

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "onlyActive" => instance_variable_get(:@onlyActive),

            "queueIds" => instance_variable_get(:@queueIds),

            "dids" => instance_variable_get(:@dids),

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :assignments

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:assignments=, hash["assignments"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "assignments" => instance_variable_get(:@assignments)

          }
        end
      end
    end
  end

  module ToolsOzoneQueueListqueues
    module ListQueues
      class Input
        attr_accessor :enabled

        attr_accessor :subjectType

        attr_accessor :collection

        attr_accessor :reportTypes

        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:enabled=, hash["enabled"])

          instance.send(:subjectType=, hash["subjectType"])

          instance.send(:collection=, hash["collection"])

          instance.send(:reportTypes=, hash["reportTypes"])

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "enabled" => instance_variable_get(:@enabled),

            "subjectType" => instance_variable_get(:@subjectType),

            "collection" => instance_variable_get(:@collection),

            "reportTypes" => instance_variable_get(:@reportTypes),

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :queues

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:queues=, hash["queues"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "queues" => instance_variable_get(:@queues)

          }
        end
      end
    end
  end

  module ToolsOzoneQueueRoutereports
    module RouteReports
      class Input
        attr_accessor :startReportId

        attr_accessor :endReportId

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:startReportId=, hash["startReportId"])

          instance.send(:endReportId=, hash["endReportId"])

          instance
        end

        def to_h
          {

            "startReportId" => instance_variable_get(:@startReportId),

            "endReportId" => instance_variable_get(:@endReportId)

          }
        end
      end

      class Output
        attr_accessor :assigned

        attr_accessor :unmatched

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:assigned=, hash["assigned"])

          instance.send(:unmatched=, hash["unmatched"])

          instance
        end

        def to_h
          {

            "assigned" => instance_variable_get(:@assigned),

            "unmatched" => instance_variable_get(:@unmatched)

          }
        end
      end
    end
  end

  module ToolsOzoneQueueUnassignmoderator
    module UnassignModerator
      class Input
        attr_accessor :queueId

        attr_accessor :did

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:queueId=, hash["queueId"])

          instance.send(:did=, hash["did"])

          instance
        end

        def to_h
          {

            "queueId" => instance_variable_get(:@queueId),

            "did" => instance_variable_get(:@did)

          }
        end
      end
    end
  end

  module ToolsOzoneQueueUpdatequeue
    module UpdateQueue
      class Input
        attr_accessor :queueId

        attr_accessor :name

        attr_accessor :enabled

        attr_accessor :description

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:queueId=, hash["queueId"])

          instance.send(:name=, hash["name"])

          instance.send(:enabled=, hash["enabled"])

          instance.send(:description=, hash["description"])

          instance
        end

        def to_h
          {

            "queueId" => instance_variable_get(:@queueId),

            "name" => instance_variable_get(:@name),

            "enabled" => instance_variable_get(:@enabled),

            "description" => instance_variable_get(:@description)

          }
        end
      end

      class Output
        attr_accessor :queue

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:queue=, hash["queue"])

          instance
        end

        def to_h
          {

            "queue" => instance_variable_get(:@queue)

          }
        end
      end
    end
  end

  module ToolsOzoneReportAssignmoderator
    module AssignModerator
      class Input
        attr_accessor :reportId

        attr_accessor :queueId

        attr_accessor :did

        attr_accessor :isPermanent

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:reportId=, hash["reportId"])

          instance.send(:queueId=, hash["queueId"])

          instance.send(:did=, hash["did"])

          instance.send(:isPermanent=, hash["isPermanent"])

          instance
        end

        def to_h
          {

            "reportId" => instance_variable_get(:@reportId),

            "queueId" => instance_variable_get(:@queueId),

            "did" => instance_variable_get(:@did),

            "isPermanent" => instance_variable_get(:@isPermanent)

          }
        end
      end

      class Output
        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          new
        end

        def to_h
          {}
        end
      end
    end
  end

  module ToolsOzoneReportCreateactivity
    module CreateActivity
      class Input
        attr_accessor :reportId

        attr_accessor :activity

        attr_accessor :internalNote

        attr_accessor :publicNote

        attr_accessor :isAutomated

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:reportId=, hash["reportId"])

          instance.send(:activity=, hash["activity"])

          instance.send(:internalNote=, hash["internalNote"])

          instance.send(:publicNote=, hash["publicNote"])

          instance.send(:isAutomated=, hash["isAutomated"])

          instance
        end

        def to_h
          {

            "reportId" => instance_variable_get(:@reportId),

            "activity" => instance_variable_get(:@activity),

            "internalNote" => instance_variable_get(:@internalNote),

            "publicNote" => instance_variable_get(:@publicNote),

            "isAutomated" => instance_variable_get(:@isAutomated)

          }
        end
      end

      class Output
        attr_accessor :activity

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:activity=, hash["activity"])

          instance
        end

        def to_h
          {

            "activity" => instance_variable_get(:@activity)

          }
        end
      end
    end
  end

  module ToolsOzoneReportGetassignments
    module GetAssignments
      class Input
        attr_accessor :onlyActive

        attr_accessor :reportIds

        attr_accessor :dids

        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:onlyActive=, hash["onlyActive"])

          instance.send(:reportIds=, hash["reportIds"])

          instance.send(:dids=, hash["dids"])

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "onlyActive" => instance_variable_get(:@onlyActive),

            "reportIds" => instance_variable_get(:@reportIds),

            "dids" => instance_variable_get(:@dids),

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :assignments

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:assignments=, hash["assignments"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "assignments" => instance_variable_get(:@assignments)

          }
        end
      end
    end
  end

  module ToolsOzoneReportGethistoricalstats
    module GetHistoricalStats
      class Input
        attr_accessor :queueId

        attr_accessor :moderatorDid

        attr_accessor :reportTypes

        attr_accessor :startDate

        attr_accessor :endDate

        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:queueId=, hash["queueId"])

          instance.send(:moderatorDid=, hash["moderatorDid"])

          instance.send(:reportTypes=, hash["reportTypes"])

          instance.send(:startDate=, hash["startDate"])

          instance.send(:endDate=, hash["endDate"])

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "queueId" => instance_variable_get(:@queueId),

            "moderatorDid" => instance_variable_get(:@moderatorDid),

            "reportTypes" => instance_variable_get(:@reportTypes),

            "startDate" => instance_variable_get(:@startDate),

            "endDate" => instance_variable_get(:@endDate),

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :stats

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:stats=, hash["stats"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "stats" => instance_variable_get(:@stats),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end
    end
  end

  module ToolsOzoneReportGetlatestreport
    module GetLatestReport
      class Input
        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          new
        end

        def to_h
          {}
        end
      end

      class Output
        attr_accessor :report

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:report=, hash["report"])

          instance
        end

        def to_h
          {

            "report" => instance_variable_get(:@report)

          }
        end
      end
    end
  end

  module ToolsOzoneReportGetlivestats
    module GetLiveStats
      class Input
        attr_accessor :queueId

        attr_accessor :moderatorDid

        attr_accessor :reportTypes

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:queueId=, hash["queueId"])

          instance.send(:moderatorDid=, hash["moderatorDid"])

          instance.send(:reportTypes=, hash["reportTypes"])

          instance
        end

        def to_h
          {

            "queueId" => instance_variable_get(:@queueId),

            "moderatorDid" => instance_variable_get(:@moderatorDid),

            "reportTypes" => instance_variable_get(:@reportTypes)

          }
        end
      end

      class Output
        attr_accessor :stats

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:stats=, hash["stats"])

          instance
        end

        def to_h
          {

            "stats" => instance_variable_get(:@stats)

          }
        end
      end
    end
  end

  module ToolsOzoneReportGetreport
    module GetReport
      class Input
        attr_accessor :id

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:id=, hash["id"])

          instance
        end

        def to_h
          {

            "id" => instance_variable_get(:@id)

          }
        end
      end

      class Output
        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          new
        end

        def to_h
          {}
        end
      end
    end
  end

  module ToolsOzoneReportListactivities
    module ListActivities
      class Input
        attr_accessor :reportId

        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:reportId=, hash["reportId"])

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "reportId" => instance_variable_get(:@reportId),

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :activities

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:activities=, hash["activities"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "activities" => instance_variable_get(:@activities),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end
    end
  end

  module ToolsOzoneReportQueryactivities
    module QueryActivities
      class Input
        attr_accessor :activityTypes

        attr_accessor :createdAfter

        attr_accessor :createdBefore

        attr_accessor :sortDirection

        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:activityTypes=, hash["activityTypes"])

          instance.send(:createdAfter=, hash["createdAfter"])

          instance.send(:createdBefore=, hash["createdBefore"])

          instance.send(:sortDirection=, hash["sortDirection"])

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "activityTypes" => instance_variable_get(:@activityTypes),

            "createdAfter" => instance_variable_get(:@createdAfter),

            "createdBefore" => instance_variable_get(:@createdBefore),

            "sortDirection" => instance_variable_get(:@sortDirection),

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :activities

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:activities=, hash["activities"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "activities" => instance_variable_get(:@activities),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end
    end
  end

  module ToolsOzoneReportQueryreports
    module QueryReports
      class Input
        attr_accessor :queueId

        attr_accessor :reportTypes

        attr_accessor :status

        attr_accessor :subject

        attr_accessor :did

        attr_accessor :subjectType

        attr_accessor :collections

        attr_accessor :reportedAfter

        attr_accessor :reportedBefore

        attr_accessor :isMuted

        attr_accessor :assignedTo

        attr_accessor :sortField

        attr_accessor :sortDirection

        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:queueId=, hash["queueId"])

          instance.send(:reportTypes=, hash["reportTypes"])

          instance.send(:status=, hash["status"])

          instance.send(:subject=, hash["subject"])

          instance.send(:did=, hash["did"])

          instance.send(:subjectType=, hash["subjectType"])

          instance.send(:collections=, hash["collections"])

          instance.send(:reportedAfter=, hash["reportedAfter"])

          instance.send(:reportedBefore=, hash["reportedBefore"])

          instance.send(:isMuted=, hash["isMuted"])

          instance.send(:assignedTo=, hash["assignedTo"])

          instance.send(:sortField=, hash["sortField"])

          instance.send(:sortDirection=, hash["sortDirection"])

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "queueId" => instance_variable_get(:@queueId),

            "reportTypes" => instance_variable_get(:@reportTypes),

            "status" => instance_variable_get(:@status),

            "subject" => instance_variable_get(:@subject),

            "did" => instance_variable_get(:@did),

            "subjectType" => instance_variable_get(:@subjectType),

            "collections" => instance_variable_get(:@collections),

            "reportedAfter" => instance_variable_get(:@reportedAfter),

            "reportedBefore" => instance_variable_get(:@reportedBefore),

            "isMuted" => instance_variable_get(:@isMuted),

            "assignedTo" => instance_variable_get(:@assignedTo),

            "sortField" => instance_variable_get(:@sortField),

            "sortDirection" => instance_variable_get(:@sortDirection),

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :reports

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:reports=, hash["reports"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "reports" => instance_variable_get(:@reports)

          }
        end
      end
    end
  end

  module ToolsOzoneReportReassignqueue
    module ReassignQueue
      class Input
        attr_accessor :reportId

        attr_accessor :queueId

        attr_accessor :comment

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:reportId=, hash["reportId"])

          instance.send(:queueId=, hash["queueId"])

          instance.send(:comment=, hash["comment"])

          instance
        end

        def to_h
          {

            "reportId" => instance_variable_get(:@reportId),

            "queueId" => instance_variable_get(:@queueId),

            "comment" => instance_variable_get(:@comment)

          }
        end
      end

      class Output
        attr_accessor :report

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:report=, hash["report"])

          instance
        end

        def to_h
          {

            "report" => instance_variable_get(:@report)

          }
        end
      end
    end
  end

  module ToolsOzoneReportRefreshstats
    module RefreshStats
      class Input
        attr_accessor :startDate

        attr_accessor :endDate

        attr_accessor :queueIds

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:startDate=, hash["startDate"])

          instance.send(:endDate=, hash["endDate"])

          instance.send(:queueIds=, hash["queueIds"])

          instance
        end

        def to_h
          {

            "startDate" => instance_variable_get(:@startDate),

            "endDate" => instance_variable_get(:@endDate),

            "queueIds" => instance_variable_get(:@queueIds)

          }
        end
      end

      class Output
        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          new
        end

        def to_h
          {}
        end
      end
    end
  end

  module ToolsOzoneReportUnassignmoderator
    module UnassignModerator
      class Input
        attr_accessor :reportId

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:reportId=, hash["reportId"])

          instance
        end

        def to_h
          {

            "reportId" => instance_variable_get(:@reportId)

          }
        end
      end

      class Output
        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          new
        end

        def to_h
          {}
        end
      end
    end
  end

  module ToolsOzoneSafelinkAddrule
    module AddRule
      class Input
        attr_accessor :url

        attr_accessor :pattern

        attr_accessor :action

        attr_accessor :reason

        attr_accessor :comment

        attr_accessor :createdBy

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:url=, hash["url"])

          instance.send(:pattern=, hash["pattern"])

          instance.send(:action=, hash["action"])

          instance.send(:reason=, hash["reason"])

          instance.send(:comment=, hash["comment"])

          instance.send(:createdBy=, hash["createdBy"])

          instance
        end

        def to_h
          {

            "url" => instance_variable_get(:@url),

            "pattern" => instance_variable_get(:@pattern),

            "action" => instance_variable_get(:@action),

            "reason" => instance_variable_get(:@reason),

            "comment" => instance_variable_get(:@comment),

            "createdBy" => instance_variable_get(:@createdBy)

          }
        end
      end

      class Output
        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          new
        end

        def to_h
          {}
        end
      end
    end
  end

  module ToolsOzoneSafelinkQueryevents
    module QueryEvents
      class Input
        attr_accessor :cursor

        attr_accessor :limit

        attr_accessor :urls

        attr_accessor :patternType

        attr_accessor :sortDirection

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:limit=, hash["limit"])

          instance.send(:urls=, hash["urls"])

          instance.send(:patternType=, hash["patternType"])

          instance.send(:sortDirection=, hash["sortDirection"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "limit" => instance_variable_get(:@limit),

            "urls" => instance_variable_get(:@urls),

            "patternType" => instance_variable_get(:@patternType),

            "sortDirection" => instance_variable_get(:@sortDirection)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :events

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:events=, hash["events"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "events" => instance_variable_get(:@events)

          }
        end
      end
    end
  end

  module ToolsOzoneSafelinkQueryrules
    module QueryRules
      class Input
        attr_accessor :cursor

        attr_accessor :limit

        attr_accessor :urls

        attr_accessor :patternType

        attr_accessor :actions

        attr_accessor :reason

        attr_accessor :createdBy

        attr_accessor :sortDirection

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:limit=, hash["limit"])

          instance.send(:urls=, hash["urls"])

          instance.send(:patternType=, hash["patternType"])

          instance.send(:actions=, hash["actions"])

          instance.send(:reason=, hash["reason"])

          instance.send(:createdBy=, hash["createdBy"])

          instance.send(:sortDirection=, hash["sortDirection"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "limit" => instance_variable_get(:@limit),

            "urls" => instance_variable_get(:@urls),

            "patternType" => instance_variable_get(:@patternType),

            "actions" => instance_variable_get(:@actions),

            "reason" => instance_variable_get(:@reason),

            "createdBy" => instance_variable_get(:@createdBy),

            "sortDirection" => instance_variable_get(:@sortDirection)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :rules

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:rules=, hash["rules"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "rules" => instance_variable_get(:@rules)

          }
        end
      end
    end
  end

  module ToolsOzoneSafelinkRemoverule
    module RemoveRule
      class Input
        attr_accessor :url

        attr_accessor :pattern

        attr_accessor :comment

        attr_accessor :createdBy

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:url=, hash["url"])

          instance.send(:pattern=, hash["pattern"])

          instance.send(:comment=, hash["comment"])

          instance.send(:createdBy=, hash["createdBy"])

          instance
        end

        def to_h
          {

            "url" => instance_variable_get(:@url),

            "pattern" => instance_variable_get(:@pattern),

            "comment" => instance_variable_get(:@comment),

            "createdBy" => instance_variable_get(:@createdBy)

          }
        end
      end

      class Output
        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          new
        end

        def to_h
          {}
        end
      end
    end
  end

  module ToolsOzoneSafelinkUpdaterule
    module UpdateRule
      class Input
        attr_accessor :url

        attr_accessor :pattern

        attr_accessor :action

        attr_accessor :reason

        attr_accessor :comment

        attr_accessor :createdBy

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:url=, hash["url"])

          instance.send(:pattern=, hash["pattern"])

          instance.send(:action=, hash["action"])

          instance.send(:reason=, hash["reason"])

          instance.send(:comment=, hash["comment"])

          instance.send(:createdBy=, hash["createdBy"])

          instance
        end

        def to_h
          {

            "url" => instance_variable_get(:@url),

            "pattern" => instance_variable_get(:@pattern),

            "action" => instance_variable_get(:@action),

            "reason" => instance_variable_get(:@reason),

            "comment" => instance_variable_get(:@comment),

            "createdBy" => instance_variable_get(:@createdBy)

          }
        end
      end

      class Output
        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          new
        end

        def to_h
          {}
        end
      end
    end
  end

  module ToolsOzoneServerGetconfig
    module GetConfig
      class Output
        attr_accessor :appview

        attr_accessor :pds

        attr_accessor :blobDivert

        attr_accessor :chat

        attr_accessor :viewer

        attr_accessor :verifierDid

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:appview=, hash["appview"])

          instance.send(:pds=, hash["pds"])

          instance.send(:blobDivert=, hash["blobDivert"])

          instance.send(:chat=, hash["chat"])

          instance.send(:viewer=, hash["viewer"])

          instance.send(:verifierDid=, hash["verifierDid"])

          instance
        end

        def to_h
          {

            "appview" => instance_variable_get(:@appview),

            "pds" => instance_variable_get(:@pds),

            "blobDivert" => instance_variable_get(:@blobDivert),

            "chat" => instance_variable_get(:@chat),

            "viewer" => instance_variable_get(:@viewer),

            "verifierDid" => instance_variable_get(:@verifierDid)

          }
        end
      end
    end
  end

  module ToolsOzoneSetAddvalues
    module AddValues
      class Input
        attr_accessor :name

        attr_accessor :values

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:name=, hash["name"])

          instance.send(:values=, hash["values"])

          instance
        end

        def to_h
          {

            "name" => instance_variable_get(:@name),

            "values" => instance_variable_get(:@values)

          }
        end
      end
    end
  end

  module ToolsOzoneSetDeleteset
    module DeleteSet
      class Input
        attr_accessor :name

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:name=, hash["name"])

          instance
        end

        def to_h
          {

            "name" => instance_variable_get(:@name)

          }
        end
      end

      class Output
        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          new
        end

        def to_h
          {}
        end
      end
    end
  end

  module ToolsOzoneSetDeletevalues
    module DeleteValues
      class Input
        attr_accessor :name

        attr_accessor :values

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:name=, hash["name"])

          instance.send(:values=, hash["values"])

          instance
        end

        def to_h
          {

            "name" => instance_variable_get(:@name),

            "values" => instance_variable_get(:@values)

          }
        end
      end
    end
  end

  module ToolsOzoneSetGetvalues
    module GetValues
      class Input
        attr_accessor :name

        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:name=, hash["name"])

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "name" => instance_variable_get(:@name),

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :set

        attr_accessor :values

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:set=, hash["set"])

          instance.send(:values=, hash["values"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "set" => instance_variable_get(:@set),

            "values" => instance_variable_get(:@values),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end
    end
  end

  module ToolsOzoneSetQuerysets
    module QuerySets
      class Input
        attr_accessor :limit

        attr_accessor :cursor

        attr_accessor :namePrefix

        attr_accessor :sortBy

        attr_accessor :sortDirection

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance.send(:namePrefix=, hash["namePrefix"])

          instance.send(:sortBy=, hash["sortBy"])

          instance.send(:sortDirection=, hash["sortDirection"])

          instance
        end

        def to_h
          {

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor),

            "namePrefix" => instance_variable_get(:@namePrefix),

            "sortBy" => instance_variable_get(:@sortBy),

            "sortDirection" => instance_variable_get(:@sortDirection)

          }
        end
      end

      class Output
        attr_accessor :sets

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:sets=, hash["sets"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "sets" => instance_variable_get(:@sets),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end
    end
  end

  module ToolsOzoneSetUpsertset
    module UpsertSet
      class Input
        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          new
        end

        def to_h
          {}
        end
      end

      class Output
        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          new
        end

        def to_h
          {}
        end
      end
    end
  end

  module ToolsOzoneSettingListoptions
    module ListOptions
      class Input
        attr_accessor :limit

        attr_accessor :cursor

        attr_accessor :scope

        attr_accessor :prefix

        attr_accessor :keys

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance.send(:scope=, hash["scope"])

          instance.send(:prefix=, hash["prefix"])

          instance.send(:keys=, hash["keys"])

          instance
        end

        def to_h
          {

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor),

            "scope" => instance_variable_get(:@scope),

            "prefix" => instance_variable_get(:@prefix),

            "keys" => instance_variable_get(:@keys)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :options

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:options=, hash["options"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "options" => instance_variable_get(:@options)

          }
        end
      end
    end
  end

  module ToolsOzoneSettingRemoveoptions
    module RemoveOptions
      class Input
        attr_accessor :keys

        attr_accessor :scope

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:keys=, hash["keys"])

          instance.send(:scope=, hash["scope"])

          instance
        end

        def to_h
          {

            "keys" => instance_variable_get(:@keys),

            "scope" => instance_variable_get(:@scope)

          }
        end
      end

      class Output
        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          new
        end

        def to_h
          {}
        end
      end
    end
  end

  module ToolsOzoneSettingUpsertoption
    module UpsertOption
      class Input
        attr_accessor :key

        attr_accessor :scope

        attr_accessor :value

        attr_accessor :description

        attr_accessor :managerRole

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:key=, hash["key"])

          instance.send(:scope=, hash["scope"])

          instance.send(:value=, hash["value"])

          instance.send(:description=, hash["description"])

          instance.send(:managerRole=, hash["managerRole"])

          instance
        end

        def to_h
          {

            "key" => instance_variable_get(:@key),

            "scope" => instance_variable_get(:@scope),

            "value" => instance_variable_get(:@value),

            "description" => instance_variable_get(:@description),

            "managerRole" => instance_variable_get(:@managerRole)

          }
        end
      end

      class Output
        attr_accessor :option

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:option=, hash["option"])

          instance
        end

        def to_h
          {

            "option" => instance_variable_get(:@option)

          }
        end
      end
    end
  end

  module ToolsOzoneSignatureFindcorrelation
    module FindCorrelation
      class Input
        attr_accessor :dids

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:dids=, hash["dids"])

          instance
        end

        def to_h
          {

            "dids" => instance_variable_get(:@dids)

          }
        end
      end

      class Output
        attr_accessor :details

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:details=, hash["details"])

          instance
        end

        def to_h
          {

            "details" => instance_variable_get(:@details)

          }
        end
      end
    end
  end

  module ToolsOzoneSignatureFindrelatedaccounts
    module FindRelatedAccounts
      class Input
        attr_accessor :did

        attr_accessor :cursor

        attr_accessor :limit

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:did=, hash["did"])

          instance.send(:cursor=, hash["cursor"])

          instance.send(:limit=, hash["limit"])

          instance
        end

        def to_h
          {

            "did" => instance_variable_get(:@did),

            "cursor" => instance_variable_get(:@cursor),

            "limit" => instance_variable_get(:@limit)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :accounts

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:accounts=, hash["accounts"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "accounts" => instance_variable_get(:@accounts)

          }
        end
      end
    end
  end

  module ToolsOzoneSignatureSearchaccounts
    module SearchAccounts
      class Input
        attr_accessor :values

        attr_accessor :cursor

        attr_accessor :limit

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:values=, hash["values"])

          instance.send(:cursor=, hash["cursor"])

          instance.send(:limit=, hash["limit"])

          instance
        end

        def to_h
          {

            "values" => instance_variable_get(:@values),

            "cursor" => instance_variable_get(:@cursor),

            "limit" => instance_variable_get(:@limit)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :accounts

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:accounts=, hash["accounts"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "accounts" => instance_variable_get(:@accounts)

          }
        end
      end
    end
  end

  module ToolsOzoneTeamAddmember
    module AddMember
      class Input
        attr_accessor :did

        attr_accessor :role

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:did=, hash["did"])

          instance.send(:role=, hash["role"])

          instance
        end

        def to_h
          {

            "did" => instance_variable_get(:@did),

            "role" => instance_variable_get(:@role)

          }
        end
      end

      class Output
        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          new
        end

        def to_h
          {}
        end
      end
    end
  end

  module ToolsOzoneTeamDeletemember
    module DeleteMember
      class Input
        attr_accessor :did

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:did=, hash["did"])

          instance
        end

        def to_h
          {

            "did" => instance_variable_get(:@did)

          }
        end
      end
    end
  end

  module ToolsOzoneTeamListmembers
    module ListMembers
      class Input
        attr_accessor :q

        attr_accessor :disabled

        attr_accessor :roles

        attr_accessor :limit

        attr_accessor :cursor

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:q=, hash["q"])

          instance.send(:disabled=, hash["disabled"])

          instance.send(:roles=, hash["roles"])

          instance.send(:limit=, hash["limit"])

          instance.send(:cursor=, hash["cursor"])

          instance
        end

        def to_h
          {

            "q" => instance_variable_get(:@q),

            "disabled" => instance_variable_get(:@disabled),

            "roles" => instance_variable_get(:@roles),

            "limit" => instance_variable_get(:@limit),

            "cursor" => instance_variable_get(:@cursor)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :members

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:members=, hash["members"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "members" => instance_variable_get(:@members)

          }
        end
      end
    end
  end

  module ToolsOzoneTeamUpdatemember
    module UpdateMember
      class Input
        attr_accessor :did

        attr_accessor :disabled

        attr_accessor :role

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:did=, hash["did"])

          instance.send(:disabled=, hash["disabled"])

          instance.send(:role=, hash["role"])

          instance
        end

        def to_h
          {

            "did" => instance_variable_get(:@did),

            "disabled" => instance_variable_get(:@disabled),

            "role" => instance_variable_get(:@role)

          }
        end
      end

      class Output
        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          new
        end

        def to_h
          {}
        end
      end
    end
  end

  module ToolsOzoneVerificationGrantverifications
    module GrantVerifications
      class Input
        attr_accessor :verifications

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:verifications=, hash["verifications"])

          instance
        end

        def to_h
          {

            "verifications" => instance_variable_get(:@verifications)

          }
        end
      end

      class Output
        attr_accessor :verifications

        attr_accessor :failedVerifications

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:verifications=, hash["verifications"])

          instance.send(:failedVerifications=, hash["failedVerifications"])

          instance
        end

        def to_h
          {

            "verifications" => instance_variable_get(:@verifications),

            "failedVerifications" => instance_variable_get(:@failedVerifications)

          }
        end
      end
    end
  end

  module ToolsOzoneVerificationListverifications
    module ListVerifications
      class Input
        attr_accessor :cursor

        attr_accessor :limit

        attr_accessor :createdAfter

        attr_accessor :createdBefore

        attr_accessor :issuers

        attr_accessor :subjects

        attr_accessor :sortDirection

        attr_accessor :isRevoked

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:limit=, hash["limit"])

          instance.send(:createdAfter=, hash["createdAfter"])

          instance.send(:createdBefore=, hash["createdBefore"])

          instance.send(:issuers=, hash["issuers"])

          instance.send(:subjects=, hash["subjects"])

          instance.send(:sortDirection=, hash["sortDirection"])

          instance.send(:isRevoked=, hash["isRevoked"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "limit" => instance_variable_get(:@limit),

            "createdAfter" => instance_variable_get(:@createdAfter),

            "createdBefore" => instance_variable_get(:@createdBefore),

            "issuers" => instance_variable_get(:@issuers),

            "subjects" => instance_variable_get(:@subjects),

            "sortDirection" => instance_variable_get(:@sortDirection),

            "isRevoked" => instance_variable_get(:@isRevoked)

          }
        end
      end

      class Output
        attr_accessor :cursor

        attr_accessor :verifications

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:cursor=, hash["cursor"])

          instance.send(:verifications=, hash["verifications"])

          instance
        end

        def to_h
          {

            "cursor" => instance_variable_get(:@cursor),

            "verifications" => instance_variable_get(:@verifications)

          }
        end
      end
    end
  end

  module ToolsOzoneVerificationRevokeverifications
    module RevokeVerifications
      class Input
        attr_accessor :uris

        attr_accessor :revokeReason

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:uris=, hash["uris"])

          instance.send(:revokeReason=, hash["revokeReason"])

          instance
        end

        def to_h
          {

            "uris" => instance_variable_get(:@uris),

            "revokeReason" => instance_variable_get(:@revokeReason)

          }
        end
      end

      class Output
        attr_accessor :revokedVerifications

        attr_accessor :failedRevocations

        def self.from_hash(hash)
          # httparty-returned string-keyed hash
          instance = new

          instance.send(:revokedVerifications=, hash["revokedVerifications"])

          instance.send(:failedRevocations=, hash["failedRevocations"])

          instance
        end

        def to_h
          {

            "revokedVerifications" => instance_variable_get(:@revokedVerifications),

            "failedRevocations" => instance_variable_get(:@failedRevocations)

          }
        end
      end
    end
  end
end
