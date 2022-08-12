# zotero-ingest
Automatically create thousands of Zotero (citation manager) citations by feeding in a list of URLs / DOIs into a zotero translator.

#### Step 1: ```zot.ipynb```
We have a list of URLs to publications we want to add to our citation manager. These URLs are from a variety of sources, such as arXiv. Instead of having to manually add each URL, such as with Zotero's browser extension, we instead can use zotero-translator to gather information about every citation and push it into our citation manager.

In our first notebook, we use zotero-translator: https://github.com/zotero/translation-server.
A docker instance is also required, and instructions can be found at "Install translation-server", https://www.mediawiki.org/wiki/Citoid/Creating_Zotero_translators.

Once that is set up, a list of links to process should be passed into links_to_process, and the notebook can be run (may take a few hours to run depending on list size) to generate a csv with citation information named ```zot.csv```.

Some visualizations and statistics are also provided for the URLs at the bottom.

-----

#### Step 2: ```zot2.ipynb``` (Optional)
The translator doesn't handle every link, and so in step 1 we mark the publications that we could not pull information for. Using another script (not provided here), we use DOIs instead of the URLs and run ```zot2.csv```, a very similar notebook to the first step but handling DOIs instead. Then, results are combined with ```zot.csv``` with ```zot2.csv```.

A sidenote: we also attach ShortNames to our publications using another script.

-----

#### Step 3: ```ingest.ipynb```
A Docker instance is not needed for this. We use pyzotero and link our notebook to a Zotero library (user or group with the specified ID). The notebook pushes the citations to the group, and the success rate is about 99.8%. 

Note: the work we did with GES-DISC topic models is a follow up to this repo, and we can automatically tag our citations with topics which can then be ingested into Zotero (in the section 'Tags', where ShortNames are also contained.
