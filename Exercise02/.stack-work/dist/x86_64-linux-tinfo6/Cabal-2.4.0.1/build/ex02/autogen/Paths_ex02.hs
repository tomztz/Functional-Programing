{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_ex02 (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/mnt/c/Users/tomzt/haskell/Exercise02/.stack-work/install/x86_64-linux-tinfo6/058b4c1e49c34f668421c872274fdc5cf2c325de03320d9ef7be3902eaa39426/8.6.4/bin"
libdir     = "/mnt/c/Users/tomzt/haskell/Exercise02/.stack-work/install/x86_64-linux-tinfo6/058b4c1e49c34f668421c872274fdc5cf2c325de03320d9ef7be3902eaa39426/8.6.4/lib/x86_64-linux-ghc-8.6.4/ex02-0.1.0.0-KdM8rfcDPVy98oWq2qiD1Q-ex02"
dynlibdir  = "/mnt/c/Users/tomzt/haskell/Exercise02/.stack-work/install/x86_64-linux-tinfo6/058b4c1e49c34f668421c872274fdc5cf2c325de03320d9ef7be3902eaa39426/8.6.4/lib/x86_64-linux-ghc-8.6.4"
datadir    = "/mnt/c/Users/tomzt/haskell/Exercise02/.stack-work/install/x86_64-linux-tinfo6/058b4c1e49c34f668421c872274fdc5cf2c325de03320d9ef7be3902eaa39426/8.6.4/share/x86_64-linux-ghc-8.6.4/ex02-0.1.0.0"
libexecdir = "/mnt/c/Users/tomzt/haskell/Exercise02/.stack-work/install/x86_64-linux-tinfo6/058b4c1e49c34f668421c872274fdc5cf2c325de03320d9ef7be3902eaa39426/8.6.4/libexec/x86_64-linux-ghc-8.6.4/ex02-0.1.0.0"
sysconfdir = "/mnt/c/Users/tomzt/haskell/Exercise02/.stack-work/install/x86_64-linux-tinfo6/058b4c1e49c34f668421c872274fdc5cf2c325de03320d9ef7be3902eaa39426/8.6.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "ex02_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "ex02_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "ex02_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "ex02_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "ex02_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "ex02_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
