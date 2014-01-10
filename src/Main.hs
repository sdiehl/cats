import Data.Default
import Data.Pandoc.Tikz
import System.IO
import Text.Pandoc

readDoc :: String -> Pandoc
readDoc = readMarkdown def

writeDoc :: Pandoc -> String
writeDoc = writeMarkdown def

main :: IO ()
main = getContents >>= bottomUpM doTikz . readDoc >>= putStrLn . writeDoc
