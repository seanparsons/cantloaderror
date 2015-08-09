{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TemplateHaskell #-}

module CantLoadError.Types(
  AppRWS,
  SpockTApp,
  SpockAction,
  UserId(..),
  applicationRWS,
  appRWSType
) where

import CantLoadError.TypesTH
import Data.IORef
import Web.Spock.Safe hiding (SpockAction)
import Data.Monoid
import Data.Text (pack, Text)
import Control.Monad.RWS.Strict hiding (get)

newtype UserId = UserId { getUserIdText :: Text }
  deriving (Eq, Ord, Read, Show)

type AppRWS = $(appRWSType)

type SpockTApp = SpockT $(appRWSType)

type SpockAction a = ActionT $(appRWSType) a

applicationRWS :: IO ReaderEnv -> AppRWS a -> IO a
applicationRWS readerEnv rwst = do
  env <- readerEnv
  (a, s, w) <- runRWST rwst env ()
  return a