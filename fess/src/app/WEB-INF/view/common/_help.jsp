<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<h2>Query Syntax</h2>
<dl>
	<dt>Field</dt>
	<dd>
		To search within a specific documents field, the query format is 
		<code class="highlighter-rouge">&lt;field&gt;:&lt;search_term&gt;</code>. 
		To find the documents with "Fess" in the title, enter: 
		<code class="highlighter-rouge">title:Fess</code>.
		Available fields are; 
		<code class="highlighter-rouge">url</code>, 
		<code class="highlighter-rouge">host</code>, 
		<code class="highlighter-rouge">site</code>, 
		<code class="highlighter-rouge">title</code>, 
		<code class="highlighter-rouge">content</code>,
		<code class="highlighter-rouge">content_length</code>, 
		<code class="highlighter-rouge">last_modified</code> and 
		<code class="highlighter-rouge">mimetype</code>, and they are customizable.
	</dd>
	<dt>Sort</dt>
	<dd>
		To specify the sort order of results the query format is
		<code class="highlighter-rouge">sort:&lt;field&gt;.&lt;order&gt;</code>, 
		where &lt;order&gt; can be either asc (ascending) or desc (descending). 
		If you want to find documents containing the term "Fess" and sort 
		the results in descending order of size, enter:
		<code class="highlighter-rouge">Fess sort:content_length.desc</code>
		The available sort field are; 
		<code class="highlighter-rouge">created</code>, 
		<code class="highlighter-rouge">content_length</code> and
		<code class="highlighter-rouge">last_modified</code>, and they are customizable.
	</dd>
	<dt>AND</dt>
	<dd>
		The AND operator matches documents where both terms exist anywhere in the 
		text of a single document. The AND operator is the default conjunction 
		operator so it can be omitted from the search query.
		e.g. <code class="highlighter-rouge">Fess AND Solr</code>.
	</dd>
	</dd>
	<dt>OR</dt>
	<dd>
		The OR operator matches documents where any terms exist anywhere in the
		text of a single document.
		e.g. <code class="highlighter-rouge">Fess OR Solr</code>.
	</dd>
	<dt>Wildcard</dt>
	<dd>
		Supported wildcards, (within individual search terms), are "*", which 
		matches any character sequence 
		e.g.<code class="highlighter-rouge">F*s</code>,
		and "?", which matches any single character 
		e.g. <code class="highlighter-rouge">Fe?s</code>.
	</dd>
	<dt>Range</dt>
	<dd>
		Range queries are used to match documents whose field values are between 
		lower and upper bounds (i.e. limits). To find documents with content_length 
		between 1000-10000, inclusive, enter:
		<code class="highlighter-rouge">content_length:[1000 TO 10000]</code>.
		To perform an exclusive range query to find documents with content_length 
		outside 0-999 (i.e. more than 999 or less than 0), enter:
		<code class="highlighter-rouge">content_length:{0 TO 999}</code>.
	</dd>
	<dt>Boost</dt>
	<dd>
		To boost, (i.e increase the weight or significance of), a search term the   
		query format is 
		<code class="highlighter-rouge">&lt;search_term&gt;^&lt;boost&gt;</code>.
		e.g. <code class="highlighter-rouge">Fess^100</code>.
	</dd>
	<dt>Fuzzy</dt>
	<dd>
		To perform a fuzzy search against a single word term, the query format is:
		<code class="highlighter-rouge">&lt;search_term&gt;~&lt;fuzziness&gt;</code>,
		To search for a term similar in spelling to "Fess" enter:
		<code class="highlighter-rouge">Fess~0.5</code>.
	</dd>
</dl>
