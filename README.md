spam
====

A Haskell port of Peter Seibel's (http://www.gigamonkeys.com/book/practical-a-spam-filter.html)[Bayesian spam filter], for pedagogic purposes. 

Setting up the project
----------------------

. Clone the project:
    $ git clone git@github.com:jimburton/spam.git
. Build it:
    $ cd spam
    $ cabal install
. Train the filter by downloading some collections of spam/ham and running the program over them. For example, download the tarballs from https://spamassassin.apache.org/publiccorpus/, and extract them in a convenient place. Then, if you have extracted a tarball of ham messages into a folder called HAM_FOLDER,:
    
    $ spam train Ham HAM_FOLDER/
  
  The more you train it, the more reliable it will become.
. Once you have trained the program on several collections of good and bad emails, test its ability to classify messages correctly. There are several messages you can experiment with in etc/mail:
    $ spam classify etc/mail/ham1.email

Ways to improve the program
---------------------------

. Write some tests using Quickcheck or HUnit,
. Refactor to use applicative and monadic styles where it makes the code easier to read,
. Make it more robust by adding error checking around the CLI, reading files etc.,
. Write the score assigned to each email into the X-Spam-Status header of the file and save the modified file,
. Make the program capable of working as a real filter, by enabling it to read the contents of messages from stdin,
. Make the program self-training, so that every time it classifies an email, update the word counts in the database accordingly... 
. Add some documentation and improve on Cabal metadata
