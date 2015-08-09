{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DataKinds #-}

module Main where

import Control.Monad.Trans.AWS
import Data.IORef
import Data.Monoid
import Data.Text (pack, Text)
import Control.Monad.RWS.Strict hiding (get)
import Control.Monad.Trans.Class
import CantLoadError.Types

main :: IO ()
main = do
  _ <- newEnv Ireland Discover
  return ()