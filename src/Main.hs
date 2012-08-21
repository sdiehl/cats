import System.IO
import Text.Pandoc
import Data.Pandoc.Tikz

readDoc :: String -> Pandoc
readDoc = readMarkdown defaultParserState

writeDoc :: Pandoc -> String
writeDoc = writeMarkdown defaultWriterOptions

main :: IO ()
main = getContents >>= bottomUpM doTikz . readDoc >>= putStrLn . writeDoc
