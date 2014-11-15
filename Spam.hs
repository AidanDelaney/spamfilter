{-# LANGUAGE OverloadedStrings #-}
module Main where

import Control.Applicative
import Database.SQLite.Simple
import Database.SQLite.Simple.FromRow
import qualified Data.Map as M

import DBHelper

data MsgType = Ham | Unclear | Spam deriving (Show, Eq)

main :: IO ()
main = do
  conn <- open "spam.db"
  r <- selectWords conn
  let wMap = foldl (\ht (WordRow i w s) -> M.insert w (s, Just i) ht) 
             M.empty r 
      wMap' = let m = M.lookup "Bananas" wMap in
              case m of 
                Nothing -> M.insert "Bananas" (0.7, Nothing) wMap
                Just (s, mi) -> M.insert "Bananas" (s+0.01, mi) wMap
  print wMap'
  mapM_ print r
  writeWords conn wMap' 
  q <- selectWords conn
  mapM_ print q
  close conn