{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TemplateHaskell #-}

module CantLoadError.TypesTH where

import Control.Monad.RWS.Strict
import Control.Monad.Trans.Class
import Control.Monad.Trans.AWS
import Language.Haskell.TH.Syntax

type ReaderEnv = (Env)

appRWSType :: Q Type
appRWSType = [t|RWST ReaderEnv () () IO|]