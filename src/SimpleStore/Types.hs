{-# LANGUAGE NoImplicitPrelude #-}
module SimpleStore.Types where

import           Control.Concurrent.STM.TMVar
import           Control.Concurrent.STM.TVar
import           Data.Maybe (Maybe)
import           System.IO (Handle)
import Prelude hiding (FilePath)
import Filesystem.Path


data SimpleStore st = SimpleStore {
    storeFP                :: TVar FilePath
  , storeState             :: TVar st
  , storeLock              :: TMVar StoreLock
  , storeHandle            :: TMVar Handle
  , storeCheckpointVersion :: TVar Int
}

data StoreLock = StoreLock

data StoreError = StoreAlreadyOpen | StoreClosed | StoreLocked | StoreFolderNotFound | StoreCheckpointNotFound | StoreIOError String deriving (Show, Eq)