import Data.Default
import Data.Pandoc.Tikz
import System.IO
import Text.Pandoc
import Options.Applicative

data Options = Options
  { input :: String }
  deriving Show

readDoc :: String -> Pandoc
readDoc = readMarkdown def

writeDoc :: Pandoc -> String
writeDoc = writeMarkdown def

options :: Parser Options
options = Options
     <$> strOption ( long "input" <> metavar "INPUT" <> help "Input file" )

opts :: ParserInfo Options
opts = info (options <**> helper)
  ( fullDesc
 <> progDesc "commutative diagrams with tikz"
 <> header "cats" )

fromStdin :: IO ()
fromStdin = do
  input  <- getContents
  output <- bottomUpM doTikz . readDoc $ input
  putStrLn . writeDoc $ output

handle :: Options -> IO ()
handle (Options {input = "-"}) = fromStdin
handle _ = return ()

main :: IO ()
main = execParser opts >>= handle
