





<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
  <link rel="dns-prefetch" href="https://assets-cdn.github.com">
  <link rel="dns-prefetch" href="https://avatars0.githubusercontent.com">
  <link rel="dns-prefetch" href="https://avatars1.githubusercontent.com">
  <link rel="dns-prefetch" href="https://avatars2.githubusercontent.com">
  <link rel="dns-prefetch" href="https://avatars3.githubusercontent.com">
  <link rel="dns-prefetch" href="https://github-cloud.s3.amazonaws.com">
  <link rel="dns-prefetch" href="https://user-images.githubusercontent.com/">



  <link crossorigin="anonymous" media="all" integrity="sha512-lLo2nlsdl+bHLu6PGvC2j3wfP45RnK4wKQLiPnCDcuXfU38AiD+JCdMywnF3WbJC1jaxe3lAI6AM4uJuMFBLEw==" rel="stylesheet" href="https://assets-cdn.github.com/assets/frameworks-08fc49d3bd2694c870ea23d0906f3610.css" />
  <link crossorigin="anonymous" media="all" integrity="sha512-dz0WDQNm8nDPcVvC6oYmnW5zMF/QHR29SwlflwcRl+dey1RzZFuzywiuqiQsHTSoK6poodeafbknyKurqUHr5g==" rel="stylesheet" href="https://assets-cdn.github.com/assets/github-26c07966ebadd54d64df0b04cbc6bf1a.css" />
  
  
  <link crossorigin="anonymous" media="all" integrity="sha512-PcJMPDRp7jbbEAmTk9kaL2kRQqg69QZ26WsZf07xsPyaipKsi3wVG0805PZNYXxotPDAliKKFvNSQPhD8fp1FQ==" rel="stylesheet" href="https://assets-cdn.github.com/assets/site-50c740d9290419d070dd6213a7cd03b5.css" />
  
  

  <meta name="viewport" content="width=device-width">
  
  <title>Documentation/公共REST接口.md at master · bottos-project/Documentation · GitHub</title>
    <meta name="description" content="Documentations for Bottos developers. Contribute to bottos-project/Documentation development by creating an account on GitHub.">
    <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub">
  <link rel="fluid-icon" href="https://github.com/fluidicon.png" title="GitHub">
  <meta property="fb:app_id" content="1401488693436528">

    
    <meta property="og:image" content="https://avatars0.githubusercontent.com/u/31537283?s=400&amp;v=4" /><meta property="og:site_name" content="GitHub" /><meta property="og:type" content="object" /><meta property="og:title" content="bottos-project/Documentation" /><meta property="og:url" content="https://github.com/bottos-project/Documentation" /><meta property="og:description" content="Documentations for Bottos developers. Contribute to bottos-project/Documentation development by creating an account on GitHub." />

  <link rel="assets" href="https://assets-cdn.github.com/">
  
  <meta name="pjax-timeout" content="1000">
  
  <meta name="request-id" content="BDF0:182A:99621D:E78743:5C0E2BFD" data-pjax-transient>


  

  <meta name="selected-link" value="repo_source" data-pjax-transient>

      <meta name="google-site-verification" content="KT5gs8h0wvaagLKAVWq8bbeNwnZZK1r1XQysX3xurLU">
    <meta name="google-site-verification" content="ZzhVyEFwb7w3e0-uOTltm8Jsck2F5StVihD0exw2fsA">
    <meta name="google-site-verification" content="GXs5KoUUkNCoaAZn7wPN-t01Pywp9M3sEjnt_3_ZWPc">

  <meta name="octolytics-host" content="collector.githubapp.com" /><meta name="octolytics-app-id" content="github" /><meta name="octolytics-event-url" content="https://collector.githubapp.com/github-external/browser_event" /><meta name="octolytics-dimension-request_id" content="BDF0:182A:99621D:E78743:5C0E2BFD" /><meta name="octolytics-dimension-region_edge" content="ap-southeast-1" /><meta name="octolytics-dimension-region_render" content="iad" />
<meta name="analytics-location" content="/&lt;user-name&gt;/&lt;repo-name&gt;/blob/show" data-pjax-transient="true" />



    <meta name="google-analytics" content="UA-3769691-2">


<meta class="js-ga-set" name="dimension1" content="Logged Out">



  

      <meta name="hostname" content="github.com">
    <meta name="user-login" content="">

      <meta name="expected-hostname" content="github.com">
    <meta name="js-proxy-site-detection-payload" content="YjgxYjU4ZWU3Y2Q0N2VhMTlhZTYxMzNlZGM2NWQ1YjRhYmU1NjA0YTQzZDliYTI3NDEzNmIyOGZhZGExMTIwMHx7InJlbW90ZV9hZGRyZXNzIjoiMjIyLjY1LjUwLjE3MiIsInJlcXVlc3RfaWQiOiJCREYwOjE4MkE6OTk2MjFEOkU3ODc0Mzo1QzBFMkJGRCIsInRpbWVzdGFtcCI6MTU0NDQzMjYzNywiaG9zdCI6ImdpdGh1Yi5jb20ifQ==">

    <meta name="enabled-features" content="DASHBOARD_V2_LAYOUT_OPT_IN,EXPLORE_DISCOVER_REPOSITORIES,UNIVERSE_BANNER,MARKETPLACE_PLAN_RESTRICTION_EDITOR">

  <meta name="html-safe-nonce" content="5d60b0de051d671f2b4731a45ca9253aacc9355f">

  <meta http-equiv="x-pjax-version" content="f4a7bec60dcd342588e67fa765cd4ee4">
  

      <link href="https://github.com/bottos-project/Documentation/commits/master.atom" rel="alternate" title="Recent Commits to Documentation:master" type="application/atom+xml">

  <meta name="go-import" content="github.com/bottos-project/Documentation git https://github.com/bottos-project/Documentation.git">

  <meta name="octolytics-dimension-user_id" content="31537283" /><meta name="octolytics-dimension-user_login" content="bottos-project" /><meta name="octolytics-dimension-repository_id" content="156365455" /><meta name="octolytics-dimension-repository_nwo" content="bottos-project/Documentation" /><meta name="octolytics-dimension-repository_public" content="true" /><meta name="octolytics-dimension-repository_is_fork" content="false" /><meta name="octolytics-dimension-repository_network_root_id" content="156365455" /><meta name="octolytics-dimension-repository_network_root_nwo" content="bottos-project/Documentation" /><meta name="octolytics-dimension-repository_explore_github_marketplace_ci_cta_shown" content="false" />


    <link rel="canonical" href="https://github.com/bottos-project/Documentation/blob/master/doc_cn/%E6%99%BA%E8%83%BD%E5%90%88%E7%BA%A6/API/%E5%85%AC%E5%85%B1REST%E6%8E%A5%E5%8F%A3.md" data-pjax-transient>


  <meta name="browser-stats-url" content="https://api.github.com/_private/browser/stats">

  <meta name="browser-errors-url" content="https://api.github.com/_private/browser/errors">

  <link rel="mask-icon" href="https://assets-cdn.github.com/pinned-octocat.svg" color="#000000">
  <link rel="icon" type="image/x-icon" class="js-site-favicon" href="https://assets-cdn.github.com/favicon.ico">

<meta name="theme-color" content="#1e2327">



  <link rel="manifest" href="/manifest.json" crossOrigin="use-credentials">

  </head>

  <body class="logged-out env-production page-blob">
    

  <div class="position-relative js-header-wrapper ">
    <a href="#start-of-content" tabindex="1" class="px-2 py-4 bg-blue text-white show-on-focus js-skip-to-content">Skip to content</a>
    <div id="js-pjax-loader-bar" class="pjax-loader-bar"><div class="progress"></div></div>

    
    
    


        
<header class="Header header-logged-out  position-relative f4 py-3" role="banner">
  <div class="container-lg d-flex px-3">
    <div class="d-flex flex-justify-between flex-items-center">
        <a class="mr-4" href="https://github.com/" aria-label="Homepage" data-ga-click="(Logged out) Header, go to homepage, icon:logo-wordmark; experiment:site_header_dropdowns; group:dropdowns">
          <svg height="32" class="octicon octicon-mark-github text-white" viewBox="0 0 16 16" version="1.1" width="32" aria-hidden="true"><path fill-rule="evenodd" d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.013 8.013 0 0 0 16 8c0-4.42-3.58-8-8-8z"/></svg>
        </a>
    </div>

    <div class="HeaderMenu HeaderMenu--logged-out d-flex flex-justify-between flex-items-center flex-auto">
      <div class="d-none">
        <button class="btn-link js-details-target" type="button" aria-label="Toggle navigation" aria-expanded="false">
          <svg height="24" class="octicon octicon-x text-gray" viewBox="0 0 12 16" version="1.1" width="18" aria-hidden="true"><path fill-rule="evenodd" d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48L7.48 8z"/></svg>
        </button>
      </div>

        <nav class="mt-0" aria-label="Global">
          <ul class="d-flex list-style-none">
              <li class=" mr-3 mr-lg-3 edge-item-fix position-relative flex-wrap flex-justify-between d-flex flex-items-center ">
                <details class="HeaderMenu-details details-overlay details-reset width-full">
                  <summary class="HeaderMenu-summary HeaderMenu-link px-0 py-3 border-0 no-wrap  d-inline-block">
                    Why GitHub?
                    <svg x="0px" y="0px" viewBox="0 0 14 8" xml:space="preserve" fill="none" class="icon-chevon-down-mktg position-relative">
                      <path d="M1,1l6.2,6L13,1"></path>
                    </svg>
                  </summary>
                  <div class="dropdown-menu flex-auto rounded-1 bg-white px-0 mt-0  p-4 left-n4 position-absolute">
                    <a href="/features" class="py-2 lh-condensed-ultra d-block link-gray-dark no-underline h5 Bump-link--hover" data-ga-click="(Logged out) Header, go to Features">Features <span class="Bump-link-symbol float-right text-normal text-gray-light">&rarr;</span></a>
                    <ul class="list-style-none f5 pb-3">
                      <li class="edge-item-fix"><a href="/features/code-review/" class="py-2 lh-condensed-ultra d-block link-gray no-underline f5" data-ga-click="(Logged out) Header, go to Code review">Code review</a></li>
                      <li class="edge-item-fix"><a href="/features/project-management/" class="py-2 lh-condensed-ultra d-block link-gray no-underline f5" data-ga-click="(Logged out) Header, go to Project management">Project management</a></li>
                      <li class="edge-item-fix"><a href="/features/integrations" class="py-2 lh-condensed-ultra d-block link-gray no-underline f5" data-ga-click="(Logged out) Header, go to Integrations">Integrations</a></li>
                      <li class="edge-item-fix"><a href="/features#team-management" class="py-2 lh-condensed-ultra d-block link-gray no-underline f5" data-ga-click="(Logged out) Header, go to Team management">Team management</a></li>
                      <li class="edge-item-fix"><a href="/features#social-coding" class="py-2 lh-condensed-ultra d-block link-gray no-underline f5" data-ga-click="(Logged out) Header, go to Social coding">Social coding</a></li>
                      <li class="edge-item-fix"><a href="/features#documentation" class="py-2 lh-condensed-ultra d-block link-gray no-underline f5" data-ga-click="(Logged out) Header, go to Documentation">Documentation</a></li>
                      <li class="edge-item-fix"><a href="/features#code-hosting" class="py-2 lh-condensed-ultra d-block link-gray no-underline f5" data-ga-click="(Logged out) Header, go to Code hosting">Code hosting</a></li>
                    </ul>

                    <ul class="list-style-none mb-0 border-lg-top pt-lg-3">
                      <li class="edge-item-fix"><a href="/case-studies" class="py-2 lh-condensed-ultra d-block no-underline link-gray-dark no-underline h5 Bump-link--hover" data-ga-click="(Logged out) Header, go to Case studies">Case Studies <span class="Bump-link-symbol float-right text-normal text-gray-light">&rarr;</span></a></li>
                      <li class="edge-item-fix"><a href="/security" class="py-2 lh-condensed-ultra d-block no-underline link-gray-dark no-underline h5 Bump-link--hover" data-ga-click="(Logged out) Header, go to Security">Security <span class="Bump-link-symbol float-right text-normal text-gray-light">&rarr;</span></a></li>
                    </ul>
                  </div>
                </details>
              </li>
              <li class=" mr-3 mr-lg-3">
                <a href="/business" class="HeaderMenu-link no-underline py-3 d-block d-lg-inline-block" data-ga-click="(Logged out) Header, go to Business">Business</a>
              </li>

              <li class=" mr-3 mr-lg-3 edge-item-fix position-relative flex-wrap flex-justify-between d-flex flex-items-center ">
                <details class="HeaderMenu-details details-overlay details-reset width-full">
                  <summary class="HeaderMenu-summary HeaderMenu-link px-0 py-3 border-0 no-wrap  d-inline-block">
                    Explore
                    <svg x="0px" y="0px" viewBox="0 0 14 8" xml:space="preserve" fill="none" class="icon-chevon-down-mktg position-relative">
                      <path d="M1,1l6.2,6L13,1"></path>
                    </svg>
                  </summary>

                  <div class="dropdown-menu flex-auto rounded-1 bg-white px-0 pt-2 pb-0 mt-0  p-4 left-n4 position-absolute">
                    <ul class="list-style-none mb-3">
                      <li class="edge-item-fix"><a href="/explore" class="py-2 lh-condensed-ultra d-block link-gray-dark no-underline h5 Bump-link--hover" data-ga-click="(Logged out) Header, go to Features">Explore GitHub <span class="Bump-link-symbol float-right text-normal text-gray-light">&rarr;</span></a></li>
                    </ul>

                    <h4 class="text-gray-light text-normal text-mono f5 mb-2  border-top pt-3">Learn &amp; contribute</h4>
                    <ul class="list-style-none mb-3">
                      <li class="edge-item-fix"><a href="/topics" class="py-2 lh-condensed-ultra d-block link-gray no-underline f5" data-ga-click="(Logged out) Header, go to Topics">Topics</a></li>
                      <li class="edge-item-fix"><a href="/collections" class="py-2 lh-condensed-ultra d-block link-gray no-underline f5" data-ga-click="(Logged out) Header, go to Collections">Collections</a></li>
                      <li class="edge-item-fix"><a href="/trending" class="py-2 lh-condensed-ultra d-block link-gray no-underline f5" data-ga-click="(Logged out) Header, go to Trending">Trending</a></li>
                      <li class="edge-item-fix"><a href="https://lab.github.com/" class="py-2 lh-condensed-ultra d-block link-gray no-underline f5" data-ga-click="(Logged out) Header, go to Learning lab">Learning Lab</a></li>
                      <li class="edge-item-fix"><a href="https://opensource.guide" class="py-2 lh-condensed-ultra d-block link-gray no-underline f5" data-ga-click="(Logged out) Header, go to Open source guides">Open source guides</a></li>
                    </ul>

                    <h4 class="text-gray-light text-normal text-mono f5 mb-2  border-top pt-3">Connect with others</h4>
                    <ul class="list-style-none mb-0">
                      <li class="edge-item-fix"><a href="/events" class="py-2 lh-condensed-ultra d-block link-gray no-underline f5" data-ga-click="(Logged out) Header, go to Events">Events</a></li>
                      <li class="edge-item-fix"><a href="https://github.community" class="py-2 lh-condensed-ultra d-block link-gray no-underline f5" data-ga-click="(Logged out) Header, go to Community forum">Community forum</a></li>
                      <li class="edge-item-fix"><a href="https://education.github.com" class="py-2 pb-0 lh-condensed-ultra d-block link-gray no-underline f5" data-ga-click="(Logged out) Header, go to GitHub Education">GitHub Education</a></li>
                    </ul>
                  </div>
                </details>
              </li>

              <li class=" mr-3 mr-lg-3">
                <a href="/marketplace" class="HeaderMenu-link no-underline py-3 d-block d-lg-inline-block" data-ga-click="(Logged out) Header, go to Marketplace">Marketplace</a>
              </li>

              <li class=" mr-3 mr-lg-3 edge-item-fix position-relative flex-wrap flex-justify-between d-flex flex-items-center ">
                <details class="HeaderMenu-details details-overlay details-reset width-full">
                  <summary class="HeaderMenu-summary HeaderMenu-link px-0 py-3 border-0 no-wrap  d-inline-block">
                    Pricing
                    <svg x="0px" y="0px" viewBox="0 0 14 8" xml:space="preserve" fill="none" class="icon-chevon-down-mktg position-relative">
                       <path d="M1,1l6.2,6L13,1"></path>
                    </svg>
                  </summary>

                  <div class="dropdown-menu flex-auto rounded-1 bg-white px-0 pt-2 pb-4 mt-0  p-4 left-n4 position-absolute">
                    <a href="/pricing" class="pb-2 lh-condensed-ultra d-block link-gray-dark no-underline h5 Bump-link--hover" data-ga-click="(Logged out) Header, go to Pricing">Plans <span class="Bump-link-symbol float-right text-normal text-gray-light">&rarr;</span></a>
                    <ul class="list-style-none mb-3">
                      <li class="edge-item-fix"><a href="/pricing/developer" class="py-2 lh-condensed-ultra d-block link-gray no-underline f5" data-ga-click="(Logged out) Header, go to Developers">Developer</a></li>
                      <li class="edge-item-fix"><a href="/pricing/team" class="py-2 lh-condensed-ultra d-block link-gray no-underline f5" data-ga-click="(Logged out) Header, go to Team">Team</a></li>
                      <li class="edge-item-fix"><a href="/pricing/business-cloud" class="py-2 lh-condensed-ultra d-block link-gray no-underline f5" data-ga-click="(Logged out) Header, go to Business Cloud">Business Cloud</a></li>
                      <li class="edge-item-fix"><a href="/pricing/enterprise" class="py-2 lh-condensed-ultra d-block link-gray no-underline f5" data-ga-click="(Logged out) Header, go to Enterprise">Enterprise</a></li>
                    </ul>

                    <ul class="list-style-none mb-0  border-top pt-3">
                      <li class="edge-item-fix"><a href="/pricing#feature-comparison" class="py-2 lh-condensed-ultra d-block no-underline link-gray-dark no-underline h5 Bump-link--hover" data-ga-click="(Logged out) Header, go to Compare features">Compare plans <span class="Bump-link-symbol float-right text-normal text-gray-light">&rarr;</span></a></li>
                      <li class="edge-item-fix"><a href="/nonprofit" class="py-2 lh-condensed-ultra d-block no-underline link-gray-dark no-underline h5 Bump-link--hover" data-ga-click="(Logged out) Header, go to Nonprofits">Nonprofit <span class="Bump-link-symbol float-right text-normal text-gray-light">&rarr;</span></a></li>
                      <li class="edge-item-fix"><a href="https://education.github.com/discount_requests/new" class="py-2 pb-0 lh-condensed-ultra d-block no-underline link-gray-dark no-underline h5 Bump-link--hover"  data-ga-click="(Logged out) Header, go to Education">Education <span class="Bump-link-symbol float-right text-normal text-gray-light">&rarr;</span></a></li>
                    </ul>
                  </div>
                </details>
              </li>
          </ul>
        </nav>

      <div class="d-flex flex-items-center px-0 text-center text-left">
          <div class="d-lg-flex mr-3">
            <div class="header-search scoped-search site-scoped-search js-site-search position-relative js-jump-to"
  role="combobox"
  aria-owns="jump-to-results"
  aria-label="Search or jump to"
  aria-haspopup="listbox"
  aria-expanded="false"
>
  <div class="position-relative">
    <!-- '"` --><!-- </textarea></xmp> --></option></form><form class="js-site-search-form" data-scope-type="Repository" data-scope-id="156365455" data-scoped-search-url="/bottos-project/Documentation/search" data-unscoped-search-url="/search" action="/bottos-project/Documentation/search" accept-charset="UTF-8" method="get"><input name="utf8" type="hidden" value="&#x2713;" />
      <label class="form-control header-search-wrapper header-search-wrapper-jump-to position-relative d-flex flex-justify-between flex-items-center js-chromeless-input-container">
        <input type="text"
          class="form-control header-search-input jump-to-field js-jump-to-field js-site-search-focus js-site-search-field is-clearable"
          data-hotkey="s,/"
          name="q"
          value=""
          placeholder="Search"
          data-unscoped-placeholder="Search GitHub"
          data-scoped-placeholder="Search"
          autocapitalize="off"
          aria-autocomplete="list"
          aria-controls="jump-to-results"
          aria-label="Search"
          data-jump-to-suggestions-path="/_graphql/GetSuggestedNavigationDestinations#csrf-token=0TI2YHBlxzeptfMo0w0CYGhep7iCxsZGv26RaQiOSnb36cprB2MVyd8/z5JhMmx7VRJR8oBGPdMe+JZgQRpz4w=="
          spellcheck="false"
          autocomplete="off"
          >
          <input type="hidden" class="js-site-search-type-field" name="type" >
            <img src="https://assets-cdn.github.com/images/search-key-slash.svg" alt="" class="mr-2 header-search-key-slash">

            <div class="Box position-absolute overflow-hidden d-none jump-to-suggestions js-jump-to-suggestions-container">
              
<ul class="d-none js-jump-to-suggestions-template-container">
  

<li class="d-flex flex-justify-start flex-items-center p-0 f5 navigation-item js-navigation-item js-jump-to-suggestion" role="option">
  <a tabindex="-1" class="no-underline d-flex flex-auto flex-items-center jump-to-suggestions-path js-jump-to-suggestion-path js-navigation-open p-2" href="">
    <div class="jump-to-octicon js-jump-to-octicon flex-shrink-0 mr-2 text-center d-none">
      <svg height="16" width="16" class="octicon octicon-repo flex-shrink-0 js-jump-to-octicon-repo d-none" title="Repository" aria-label="Repository" viewBox="0 0 12 16" version="1.1" role="img"><path fill-rule="evenodd" d="M4 9H3V8h1v1zm0-3H3v1h1V6zm0-2H3v1h1V4zm0-2H3v1h1V2zm8-1v12c0 .55-.45 1-1 1H6v2l-1.5-1.5L3 16v-2H1c-.55 0-1-.45-1-1V1c0-.55.45-1 1-1h10c.55 0 1 .45 1 1zm-1 10H1v2h2v-1h3v1h5v-2zm0-10H2v9h9V1z"/></svg>
      <svg height="16" width="16" class="octicon octicon-project flex-shrink-0 js-jump-to-octicon-project d-none" title="Project" aria-label="Project" viewBox="0 0 15 16" version="1.1" role="img"><path fill-rule="evenodd" d="M10 12h3V2h-3v10zm-4-2h3V2H6v8zm-4 4h3V2H2v12zm-1 1h13V1H1v14zM14 0H1a1 1 0 0 0-1 1v14a1 1 0 0 0 1 1h13a1 1 0 0 0 1-1V1a1 1 0 0 0-1-1z"/></svg>
      <svg height="16" width="16" class="octicon octicon-search flex-shrink-0 js-jump-to-octicon-search d-none" title="Search" aria-label="Search" viewBox="0 0 16 16" version="1.1" role="img"><path fill-rule="evenodd" d="M15.7 13.3l-3.81-3.83A5.93 5.93 0 0 0 13 6c0-3.31-2.69-6-6-6S1 2.69 1 6s2.69 6 6 6c1.3 0 2.48-.41 3.47-1.11l3.83 3.81c.19.2.45.3.7.3.25 0 .52-.09.7-.3a.996.996 0 0 0 0-1.41v.01zM7 10.7c-2.59 0-4.7-2.11-4.7-4.7 0-2.59 2.11-4.7 4.7-4.7 2.59 0 4.7 2.11 4.7 4.7 0 2.59-2.11 4.7-4.7 4.7z"/></svg>
    </div>

    <img class="avatar mr-2 flex-shrink-0 js-jump-to-suggestion-avatar d-none" alt="" aria-label="Team" src="" width="28" height="28">

    <div class="jump-to-suggestion-name js-jump-to-suggestion-name flex-auto overflow-hidden text-left no-wrap css-truncate css-truncate-target">
    </div>

    <div class="border rounded-1 flex-shrink-0 bg-gray px-1 text-gray-light ml-1 f6 d-none js-jump-to-badge-search">
      <span class="js-jump-to-badge-search-text-default d-none" aria-label="in this repository">
        In this repository
      </span>
      <span class="js-jump-to-badge-search-text-global d-none" aria-label="in all of GitHub">
        All GitHub
      </span>
      <span aria-hidden="true" class="d-inline-block ml-1 v-align-middle">↵</span>
    </div>

    <div aria-hidden="true" class="border rounded-1 flex-shrink-0 bg-gray px-1 text-gray-light ml-1 f6 d-none d-on-nav-focus js-jump-to-badge-jump">
      Jump to
      <span class="d-inline-block ml-1 v-align-middle">↵</span>
    </div>
  </a>
</li>

</ul>

<ul class="d-none js-jump-to-no-results-template-container">
  <li class="d-flex flex-justify-center flex-items-center f5 d-none js-jump-to-suggestion p-2">
    <span class="text-gray">No suggested jump to results</span>
  </li>
</ul>

<ul id="jump-to-results" role="listbox" class="p-0 m-0 js-navigation-container jump-to-suggestions-results-container js-jump-to-suggestions-results-container">
  

<li class="d-flex flex-justify-start flex-items-center p-0 f5 navigation-item js-navigation-item js-jump-to-scoped-search d-none" role="option">
  <a tabindex="-1" class="no-underline d-flex flex-auto flex-items-center jump-to-suggestions-path js-jump-to-suggestion-path js-navigation-open p-2" href="">
    <div class="jump-to-octicon js-jump-to-octicon flex-shrink-0 mr-2 text-center d-none">
      <svg height="16" width="16" class="octicon octicon-repo flex-shrink-0 js-jump-to-octicon-repo d-none" title="Repository" aria-label="Repository" viewBox="0 0 12 16" version="1.1" role="img"><path fill-rule="evenodd" d="M4 9H3V8h1v1zm0-3H3v1h1V6zm0-2H3v1h1V4zm0-2H3v1h1V2zm8-1v12c0 .55-.45 1-1 1H6v2l-1.5-1.5L3 16v-2H1c-.55 0-1-.45-1-1V1c0-.55.45-1 1-1h10c.55 0 1 .45 1 1zm-1 10H1v2h2v-1h3v1h5v-2zm0-10H2v9h9V1z"/></svg>
      <svg height="16" width="16" class="octicon octicon-project flex-shrink-0 js-jump-to-octicon-project d-none" title="Project" aria-label="Project" viewBox="0 0 15 16" version="1.1" role="img"><path fill-rule="evenodd" d="M10 12h3V2h-3v10zm-4-2h3V2H6v8zm-4 4h3V2H2v12zm-1 1h13V1H1v14zM14 0H1a1 1 0 0 0-1 1v14a1 1 0 0 0 1 1h13a1 1 0 0 0 1-1V1a1 1 0 0 0-1-1z"/></svg>
      <svg height="16" width="16" class="octicon octicon-search flex-shrink-0 js-jump-to-octicon-search d-none" title="Search" aria-label="Search" viewBox="0 0 16 16" version="1.1" role="img"><path fill-rule="evenodd" d="M15.7 13.3l-3.81-3.83A5.93 5.93 0 0 0 13 6c0-3.31-2.69-6-6-6S1 2.69 1 6s2.69 6 6 6c1.3 0 2.48-.41 3.47-1.11l3.83 3.81c.19.2.45.3.7.3.25 0 .52-.09.7-.3a.996.996 0 0 0 0-1.41v.01zM7 10.7c-2.59 0-4.7-2.11-4.7-4.7 0-2.59 2.11-4.7 4.7-4.7 2.59 0 4.7 2.11 4.7 4.7 0 2.59-2.11 4.7-4.7 4.7z"/></svg>
    </div>

    <img class="avatar mr-2 flex-shrink-0 js-jump-to-suggestion-avatar d-none" alt="" aria-label="Team" src="" width="28" height="28">

    <div class="jump-to-suggestion-name js-jump-to-suggestion-name flex-auto overflow-hidden text-left no-wrap css-truncate css-truncate-target">
    </div>

    <div class="border rounded-1 flex-shrink-0 bg-gray px-1 text-gray-light ml-1 f6 d-none js-jump-to-badge-search">
      <span class="js-jump-to-badge-search-text-default d-none" aria-label="in this repository">
        In this repository
      </span>
      <span class="js-jump-to-badge-search-text-global d-none" aria-label="in all of GitHub">
        All GitHub
      </span>
      <span aria-hidden="true" class="d-inline-block ml-1 v-align-middle">↵</span>
    </div>

    <div aria-hidden="true" class="border rounded-1 flex-shrink-0 bg-gray px-1 text-gray-light ml-1 f6 d-none d-on-nav-focus js-jump-to-badge-jump">
      Jump to
      <span class="d-inline-block ml-1 v-align-middle">↵</span>
    </div>
  </a>
</li>

  

<li class="d-flex flex-justify-start flex-items-center p-0 f5 navigation-item js-navigation-item js-jump-to-global-search d-none" role="option">
  <a tabindex="-1" class="no-underline d-flex flex-auto flex-items-center jump-to-suggestions-path js-jump-to-suggestion-path js-navigation-open p-2" href="">
    <div class="jump-to-octicon js-jump-to-octicon flex-shrink-0 mr-2 text-center d-none">
      <svg height="16" width="16" class="octicon octicon-repo flex-shrink-0 js-jump-to-octicon-repo d-none" title="Repository" aria-label="Repository" viewBox="0 0 12 16" version="1.1" role="img"><path fill-rule="evenodd" d="M4 9H3V8h1v1zm0-3H3v1h1V6zm0-2H3v1h1V4zm0-2H3v1h1V2zm8-1v12c0 .55-.45 1-1 1H6v2l-1.5-1.5L3 16v-2H1c-.55 0-1-.45-1-1V1c0-.55.45-1 1-1h10c.55 0 1 .45 1 1zm-1 10H1v2h2v-1h3v1h5v-2zm0-10H2v9h9V1z"/></svg>
      <svg height="16" width="16" class="octicon octicon-project flex-shrink-0 js-jump-to-octicon-project d-none" title="Project" aria-label="Project" viewBox="0 0 15 16" version="1.1" role="img"><path fill-rule="evenodd" d="M10 12h3V2h-3v10zm-4-2h3V2H6v8zm-4 4h3V2H2v12zm-1 1h13V1H1v14zM14 0H1a1 1 0 0 0-1 1v14a1 1 0 0 0 1 1h13a1 1 0 0 0 1-1V1a1 1 0 0 0-1-1z"/></svg>
      <svg height="16" width="16" class="octicon octicon-search flex-shrink-0 js-jump-to-octicon-search d-none" title="Search" aria-label="Search" viewBox="0 0 16 16" version="1.1" role="img"><path fill-rule="evenodd" d="M15.7 13.3l-3.81-3.83A5.93 5.93 0 0 0 13 6c0-3.31-2.69-6-6-6S1 2.69 1 6s2.69 6 6 6c1.3 0 2.48-.41 3.47-1.11l3.83 3.81c.19.2.45.3.7.3.25 0 .52-.09.7-.3a.996.996 0 0 0 0-1.41v.01zM7 10.7c-2.59 0-4.7-2.11-4.7-4.7 0-2.59 2.11-4.7 4.7-4.7 2.59 0 4.7 2.11 4.7 4.7 0 2.59-2.11 4.7-4.7 4.7z"/></svg>
    </div>

    <img class="avatar mr-2 flex-shrink-0 js-jump-to-suggestion-avatar d-none" alt="" aria-label="Team" src="" width="28" height="28">

    <div class="jump-to-suggestion-name js-jump-to-suggestion-name flex-auto overflow-hidden text-left no-wrap css-truncate css-truncate-target">
    </div>

    <div class="border rounded-1 flex-shrink-0 bg-gray px-1 text-gray-light ml-1 f6 d-none js-jump-to-badge-search">
      <span class="js-jump-to-badge-search-text-default d-none" aria-label="in this repository">
        In this repository
      </span>
      <span class="js-jump-to-badge-search-text-global d-none" aria-label="in all of GitHub">
        All GitHub
      </span>
      <span aria-hidden="true" class="d-inline-block ml-1 v-align-middle">↵</span>
    </div>

    <div aria-hidden="true" class="border rounded-1 flex-shrink-0 bg-gray px-1 text-gray-light ml-1 f6 d-none d-on-nav-focus js-jump-to-badge-jump">
      Jump to
      <span class="d-inline-block ml-1 v-align-middle">↵</span>
    </div>
  </a>
</li>


</ul>

            </div>
      </label>
</form>  </div>
</div>

          </div>

        <a class="HeaderMenu-link no-underline mr-3" href="/login?return_to=%2Fbottos-project%2FDocumentation%2Fblob%2Fmaster%2Fdoc_cn%2F%25E6%2599%25BA%25E8%2583%25BD%25E5%2590%2588%25E7%25BA%25A6%2FAPI%2F%25E5%2585%25AC%25E5%2585%25B1REST%25E6%258E%25A5%25E5%258F%25A3.md" data-ga-click="(Logged out) Header, clicked Sign in, text:sign-in">Sign&nbsp;in</a>
          <a class="HeaderMenu-link d-inline-block no-underline border border-gray-dark rounded-1 px-2 py-1" href="/join" data-ga-click="(Logged out) Header, clicked Sign up, text:sign-up">Sign&nbsp;up</a>
      </div>
    </div>
  </div>
</header>

  </div>

  <div id="start-of-content" class="show-on-focus"></div>

    <div id="js-flash-container">

</div>



  <div role="main" class="application-main " data-commit-hovercards-enabled>
        <div itemscope itemtype="http://schema.org/SoftwareSourceCode" class="">
    <div id="js-repo-pjax-container" data-pjax-container >
      


  


  



  <div class="pagehead repohead instapaper_ignore readability-menu experiment-repo-nav  ">
    <div class="repohead-details-container clearfix container">

      <ul class="pagehead-actions">
  <li>
      <a href="/login?return_to=%2Fbottos-project%2FDocumentation"
    class="btn btn-sm btn-with-count tooltipped tooltipped-s"
    aria-label="You must be signed in to watch a repository" rel="nofollow">
    <svg class="octicon octicon-eye v-align-text-bottom" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M8.06 2C3 2 0 8 0 8s3 6 8.06 6C13 14 16 8 16 8s-3-6-7.94-6zM8 12c-2.2 0-4-1.78-4-4 0-2.2 1.8-4 4-4 2.22 0 4 1.8 4 4 0 2.22-1.78 4-4 4zm2-4c0 1.11-.89 2-2 2-1.11 0-2-.89-2-2 0-1.11.89-2 2-2 1.11 0 2 .89 2 2z"/></svg>
    Watch
  </a>
  <a class="social-count" href="/bottos-project/Documentation/watchers"
     aria-label="10 users are watching this repository">
    10
  </a>

  </li>

  <li>
      <a href="/login?return_to=%2Fbottos-project%2FDocumentation"
    class="btn btn-sm btn-with-count tooltipped tooltipped-s"
    aria-label="You must be signed in to star a repository" rel="nofollow">
    <svg class="octicon octicon-star v-align-text-bottom" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
    Star
  </a>

    <a class="social-count js-social-count" href="/bottos-project/Documentation/stargazers"
      aria-label="0 users starred this repository">
      0
    </a>

  </li>

  <li>
      <a href="/login?return_to=%2Fbottos-project%2FDocumentation"
        class="btn btn-sm btn-with-count tooltipped tooltipped-s"
        aria-label="You must be signed in to fork a repository" rel="nofollow">
        <svg class="octicon octicon-repo-forked v-align-text-bottom" viewBox="0 0 10 16" version="1.1" width="10" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M8 1a1.993 1.993 0 0 0-1 3.72V6L5 8 3 6V4.72A1.993 1.993 0 0 0 2 1a1.993 1.993 0 0 0-1 3.72V6.5l3 3v1.78A1.993 1.993 0 0 0 5 15a1.993 1.993 0 0 0 1-3.72V9.5l3-3V4.72A1.993 1.993 0 0 0 8 1zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3 10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3-10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"/></svg>
        Fork
      </a>

    <a href="/bottos-project/Documentation/network/members" class="social-count"
       aria-label="0 users forked this repository">
      0
    </a>
  </li>
</ul>

      <h1 class="public ">
  <svg class="octicon octicon-repo" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9H3V8h1v1zm0-3H3v1h1V6zm0-2H3v1h1V4zm0-2H3v1h1V2zm8-1v12c0 .55-.45 1-1 1H6v2l-1.5-1.5L3 16v-2H1c-.55 0-1-.45-1-1V1c0-.55.45-1 1-1h10c.55 0 1 .45 1 1zm-1 10H1v2h2v-1h3v1h5v-2zm0-10H2v9h9V1z"/></svg>
  <span class="author" itemprop="author"><a class="url fn" rel="author" data-hovercard-type="organization" data-hovercard-url="/orgs/bottos-project/hovercard" href="/bottos-project">bottos-project</a></span><!--
--><span class="path-divider">/</span><!--
--><strong itemprop="name"><a data-pjax="#js-repo-pjax-container" href="/bottos-project/Documentation">Documentation</a></strong>

</h1>

    </div>
    
<nav class="reponav js-repo-nav js-sidenav-container-pjax container"
     itemscope
     itemtype="http://schema.org/BreadcrumbList"
    aria-label="Repository"
     data-pjax="#js-repo-pjax-container">

  <span itemscope itemtype="http://schema.org/ListItem" itemprop="itemListElement">
    <a class="js-selected-navigation-item selected reponav-item" itemprop="url" data-hotkey="g c" aria-current="page" data-selected-links="repo_source repo_downloads repo_commits repo_releases repo_tags repo_branches repo_packages /bottos-project/Documentation" href="/bottos-project/Documentation">
      <svg class="octicon octicon-code" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M9.5 3L8 4.5 11.5 8 8 11.5 9.5 13 14 8 9.5 3zm-5 0L0 8l4.5 5L6 11.5 2.5 8 6 4.5 4.5 3z"/></svg>
      <span itemprop="name">Code</span>
      <meta itemprop="position" content="1">
</a>  </span>

    <span itemscope itemtype="http://schema.org/ListItem" itemprop="itemListElement">
      <a itemprop="url" data-hotkey="g i" class="js-selected-navigation-item reponav-item" data-selected-links="repo_issues repo_labels repo_milestones /bottos-project/Documentation/issues" href="/bottos-project/Documentation/issues">
        <svg class="octicon octicon-issue-opened" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7 2.3c3.14 0 5.7 2.56 5.7 5.7s-2.56 5.7-5.7 5.7A5.71 5.71 0 0 1 1.3 8c0-3.14 2.56-5.7 5.7-5.7zM7 1C3.14 1 0 4.14 0 8s3.14 7 7 7 7-3.14 7-7-3.14-7-7-7zm1 3H6v5h2V4zm0 6H6v2h2v-2z"/></svg>
        <span itemprop="name">Issues</span>
        <span class="Counter">0</span>
        <meta itemprop="position" content="2">
</a>    </span>

  <span itemscope itemtype="http://schema.org/ListItem" itemprop="itemListElement">
    <a data-hotkey="g p" itemprop="url" class="js-selected-navigation-item reponav-item" data-selected-links="repo_pulls checks /bottos-project/Documentation/pulls" href="/bottos-project/Documentation/pulls">
      <svg class="octicon octicon-git-pull-request" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M11 11.28V5c-.03-.78-.34-1.47-.94-2.06C9.46 2.35 8.78 2.03 8 2H7V0L4 3l3 3V4h1c.27.02.48.11.69.31.21.2.3.42.31.69v6.28A1.993 1.993 0 0 0 10 15a1.993 1.993 0 0 0 1-3.72zm-1 2.92c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zM4 3c0-1.11-.89-2-2-2a1.993 1.993 0 0 0-1 3.72v6.56A1.993 1.993 0 0 0 2 15a1.993 1.993 0 0 0 1-3.72V4.72c.59-.34 1-.98 1-1.72zm-.8 10c0 .66-.55 1.2-1.2 1.2-.65 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"/></svg>
      <span itemprop="name">Pull requests</span>
      <span class="Counter">0</span>
      <meta itemprop="position" content="3">
</a>  </span>


    <a data-hotkey="g b" class="js-selected-navigation-item reponav-item" data-selected-links="repo_projects new_repo_project repo_project /bottos-project/Documentation/projects" href="/bottos-project/Documentation/projects">
      <svg class="octicon octicon-project" viewBox="0 0 15 16" version="1.1" width="15" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M10 12h3V2h-3v10zm-4-2h3V2H6v8zm-4 4h3V2H2v12zm-1 1h13V1H1v14zM14 0H1a1 1 0 0 0-1 1v14a1 1 0 0 0 1 1h13a1 1 0 0 0 1-1V1a1 1 0 0 0-1-1z"/></svg>
      Projects
      <span class="Counter" >0</span>
</a>


    <a class="js-selected-navigation-item reponav-item" data-selected-links="repo_graphs repo_contributors dependency_graph pulse alerts security /bottos-project/Documentation/pulse" href="/bottos-project/Documentation/pulse">
      <svg class="octicon octicon-graph" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M16 14v1H0V0h1v14h15zM5 13H3V8h2v5zm4 0H7V3h2v10zm4 0h-2V6h2v7z"/></svg>
      Insights
</a>

</nav>


  </div>

<div class="container new-discussion-timeline experiment-repo-nav  ">
  <div class="repository-content ">

    
    

  
    <a class="d-none js-permalink-shortcut" data-hotkey="y" href="/bottos-project/Documentation/blob/de3f9fcf4964f1bb5085db291a1fc5874cbfeb13/doc_cn/%E6%99%BA%E8%83%BD%E5%90%88%E7%BA%A6/API/%E5%85%AC%E5%85%B1REST%E6%8E%A5%E5%8F%A3.md">Permalink</a>

    <!-- blob contrib key: blob_contributors:v21:228dafed6b7cbc12d313231e6846af46 -->

        <div class="signup-prompt-bg rounded-1">
      <div class="signup-prompt p-4 text-center mb-4 rounded-1">
        <div class="position-relative">
          <!-- '"` --><!-- </textarea></xmp> --></option></form><form action="/site/dismiss_signup_prompt" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="&#x2713;" /><input type="hidden" name="authenticity_token" value="frj3kGHViyDWshRwlCttoPsy7YGfXdYgFWPebT8PGl8kfwJJ6XXNNzT9ur43sV5PBkvmYUO3E4hScb7vd8ZHpA==" />
            <button type="submit" class="position-absolute top-0 right-0 btn-link link-gray" data-ga-click="(Logged out) Sign up prompt, clicked Dismiss, text:dismiss">
              Dismiss
            </button>
</form>          <h3 class="pt-2">Join GitHub today</h3>
          <p class="col-6 mx-auto">GitHub is home to over 28 million developers working together to host and review code, manage projects, and build software together.</p>
          <a class="btn btn-primary" href="/join?source=prompt-blob-show" data-ga-click="(Logged out) Sign up prompt, clicked Sign up, text:sign-up">Sign up</a>
        </div>
      </div>
    </div>


    <div class="file-navigation">
      
<div class="select-menu branch-select-menu js-menu-container js-select-menu float-left">
  <button class=" btn btn-sm select-menu-button js-menu-target css-truncate" data-hotkey="w"
    
    type="button" aria-label="Switch branches or tags" aria-expanded="false" aria-haspopup="true">
      <i>Branch:</i>
      <span class="js-select-button css-truncate-target">master</span>
  </button>

  <div class="select-menu-modal-holder js-menu-content js-navigation-container" data-pjax>

    <div class="select-menu-modal">
      <div class="select-menu-header">
        <svg class="octicon octicon-x js-menu-close" role="img" aria-label="Close" viewBox="0 0 12 16" version="1.1" width="12" height="16"><path fill-rule="evenodd" d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48L7.48 8z"/></svg>
        <span class="select-menu-title">Switch branches/tags</span>
      </div>

      <tab-container>
      <div class="select-menu-filters">
        <div class="select-menu-text-filter">
          <input type="text" aria-label="Filter branches/tags" id="context-commitish-filter-field" class="form-control js-filterable-field js-navigation-enable" placeholder="Filter branches/tags">
        </div>
        <div class="select-menu-tabs" role="tablist">
          <ul>
            <li class="select-menu-tab">
              <button type="button" class="select-menu-tab-nav" data-filter-placeholder="Filter branches/tags" role="tab" aria-selected="true">Branches</button>
            </li>
            <li class="select-menu-tab">
              <button type="button" class="select-menu-tab-nav" data-filter-placeholder="Find a tag…" role="tab">Tags</button>
            </li>
          </ul>
        </div>
      </div>

      <div class="select-menu-list" role="tabpanel">
        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


            <a class="select-menu-item js-navigation-item js-navigation-open selected"
               href="/bottos-project/Documentation/blob/master/doc_cn/%E6%99%BA%E8%83%BD%E5%90%88%E7%BA%A6/API/%E5%85%AC%E5%85%B1REST%E6%8E%A5%E5%8F%A3.md"
               data-name="master"
               data-skip-pjax="true"
               rel="nofollow">
              <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                master
              </span>
            </a>
        </div>

          <div class="select-menu-no-results">Nothing to show</div>
      </div>

      <div class="select-menu-list" role="tabpanel" hidden>
        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


        </div>

        <div class="select-menu-no-results">Nothing to show</div>
      </div>
      </tab-container>
    </div>
  </div>
</div>

      <div class="BtnGroup float-right">
        <a href="/bottos-project/Documentation/find/master"
              class="js-pjax-capture-input btn btn-sm BtnGroup-item"
              data-pjax
              data-hotkey="t">
          Find file
        </a>
        <clipboard-copy for="blob-path" class="btn btn-sm BtnGroup-item">
          Copy path
        </clipboard-copy>
      </div>
      <div id="blob-path" class="breadcrumb">
        <span class="repo-root js-repo-root"><span class="js-path-segment"><a data-pjax="true" href="/bottos-project/Documentation"><span>Documentation</span></a></span></span><span class="separator">/</span><span class="js-path-segment"><a data-pjax="true" href="/bottos-project/Documentation/tree/master/doc_cn"><span>doc_cn</span></a></span><span class="separator">/</span><span class="js-path-segment"><a data-pjax="true" href="/bottos-project/Documentation/tree/master/doc_cn/%E6%99%BA%E8%83%BD%E5%90%88%E7%BA%A6"><span>智能合约</span></a></span><span class="separator">/</span><span class="js-path-segment"><a data-pjax="true" href="/bottos-project/Documentation/tree/master/doc_cn/%E6%99%BA%E8%83%BD%E5%90%88%E7%BA%A6/API"><span>API</span></a></span><span class="separator">/</span><strong class="final-path">公共REST接口.md</strong>
      </div>
    </div>


    
  <div class="commit-tease">
      <span class="float-right">
        <a class="commit-tease-sha" href="/bottos-project/Documentation/commit/de3f9fcf4964f1bb5085db291a1fc5874cbfeb13" data-pjax>
          de3f9fc
        </a>
        <relative-time datetime="2018-12-10T07:59:31Z">Dec 10, 2018</relative-time>
      </span>
      <div>
        <a rel="contributor" data-skip-pjax="true" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=29770254" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/huaapp"><img class="avatar" src="https://avatars1.githubusercontent.com/u/29770254?s=40&amp;v=4" width="20" height="20" alt="@huaapp" /></a>
        <a class="user-mention" rel="contributor" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=29770254" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/huaapp">huaapp</a>
          <a data-pjax="true" title="update get block header response" class="message" href="/bottos-project/Documentation/commit/de3f9fcf4964f1bb5085db291a1fc5874cbfeb13">update get block header response</a>
      </div>

    <div class="commit-tease-contributors">
      
<details class="details-reset details-overlay details-overlay-dark lh-default text-gray-dark float-left mr-2" id="blob_contributors_box">
  <summary class="btn-link" aria-haspopup="dialog"  >
    
    <span><strong>2</strong> contributors</span>
  </summary>
  <details-dialog class="Box Box--overlay d-flex flex-column anim-fade-in fast " aria-label="Users who have contributed to this file">
    <div class="Box-header">
      <button class="Box-btn-octicon btn-octicon float-right" type="button" aria-label="Close dialog" data-close-dialog>
        <svg class="octicon octicon-x" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48L7.48 8z"/></svg>
      </button>
      <h3 class="Box-title">Users who have contributed to this file</h3>
    </div>
    
        <ul class="list-style-none overflow-auto">
            <li class="Box-row">
              <a class="link-gray-dark no-underline" href="/huaapp">
                <img class="avatar mr-2" alt="" src="https://avatars1.githubusercontent.com/u/29770254?s=40&amp;v=4" width="20" height="20" />
                huaapp
</a>            </li>
            <li class="Box-row">
              <a class="link-gray-dark no-underline" href="/btosys">
                <img class="avatar mr-2" alt="" src="https://avatars0.githubusercontent.com/u/31538711?s=40&amp;v=4" width="20" height="20" />
                btosys
</a>            </li>
        </ul>

  </details-dialog>
</details>
          <a class="avatar-link" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=29770254" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/bottos-project/Documentation/commits/master/doc_cn/%E6%99%BA%E8%83%BD%E5%90%88%E7%BA%A6/API/%E5%85%AC%E5%85%B1REST%E6%8E%A5%E5%8F%A3.md?author=huaapp">
      <img class="avatar" src="https://avatars1.githubusercontent.com/u/29770254?s=40&amp;v=4" width="20" height="20" alt="@huaapp" /> 
</a>    <a class="avatar-link" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=31538711" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/bottos-project/Documentation/commits/master/doc_cn/%E6%99%BA%E8%83%BD%E5%90%88%E7%BA%A6/API/%E5%85%AC%E5%85%B1REST%E6%8E%A5%E5%8F%A3.md?author=btosys">
      <img class="avatar" src="https://avatars0.githubusercontent.com/u/31538711?s=40&amp;v=4" width="20" height="20" alt="@btosys" /> 
</a>

    </div>
  </div>



    <div class="file ">
      <div class="file-header">
  <div class="file-actions">


    <div class="BtnGroup">
      <a id="raw-url" class="btn btn-sm BtnGroup-item" href="/bottos-project/Documentation/raw/master/doc_cn/%E6%99%BA%E8%83%BD%E5%90%88%E7%BA%A6/API/%E5%85%AC%E5%85%B1REST%E6%8E%A5%E5%8F%A3.md">Raw</a>
        <a class="btn btn-sm js-update-url-with-hash BtnGroup-item" data-hotkey="b" href="/bottos-project/Documentation/blame/master/doc_cn/%E6%99%BA%E8%83%BD%E5%90%88%E7%BA%A6/API/%E5%85%AC%E5%85%B1REST%E6%8E%A5%E5%8F%A3.md">Blame</a>
      <a rel="nofollow" class="btn btn-sm BtnGroup-item" href="/bottos-project/Documentation/commits/master/doc_cn/%E6%99%BA%E8%83%BD%E5%90%88%E7%BA%A6/API/%E5%85%AC%E5%85%B1REST%E6%8E%A5%E5%8F%A3.md">History</a>
    </div>


        <button type="button" class="btn-octicon disabled tooltipped tooltipped-nw"
          aria-label="You must be signed in to make or propose changes">
          <svg class="octicon octicon-pencil" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M0 12v3h3l8-8-3-3-8 8zm3 2H1v-2h1v1h1v1zm10.3-9.3L12 6 9 3l1.3-1.3a.996.996 0 0 1 1.41 0l1.59 1.59c.39.39.39 1.02 0 1.41z"/></svg>
        </button>
        <button type="button" class="btn-octicon btn-octicon-danger disabled tooltipped tooltipped-nw"
          aria-label="You must be signed in to make or propose changes">
          <svg class="octicon octicon-trashcan" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M11 2H9c0-.55-.45-1-1-1H5c-.55 0-1 .45-1 1H2c-.55 0-1 .45-1 1v1c0 .55.45 1 1 1v9c0 .55.45 1 1 1h7c.55 0 1-.45 1-1V5c.55 0 1-.45 1-1V3c0-.55-.45-1-1-1zm-1 12H3V5h1v8h1V5h1v8h1V5h1v8h1V5h1v9zm1-10H2V3h9v1z"/></svg>
        </button>
  </div>

  <div class="file-info">
      <span class="file-mode" title="File mode">executable file</span>
      <span class="file-info-divider"></span>
      1054 lines (856 sloc)
      <span class="file-info-divider"></span>
    32.6 KB
  </div>
</div>

      
  <div id="readme" class="readme blob instapaper_body">
    <article class="markdown-body entry-content" itemprop="text"><h1><a id="user-content-公共rest接口" class="anchor" aria-hidden="true" href="#公共rest接口"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>公共REST接口</h1>
<h2><a id="user-content-获取区块信息" class="anchor" aria-hidden="true" href="#获取区块信息"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>获取区块信息</h2>
<p><strong>接口功能</strong></p>
<blockquote>
<p>接口说明： 获取区块信息</p>
<p><strong>接口地址</strong></p>
</blockquote>
<blockquote>
<p>URL:  /v1/block/detail</p>
<p><strong>返回格式</strong></p>
<p>JSON</p>
<p><strong>请求方式</strong></p>
<p>POST</p>
<p><strong>请求参数：</strong></p>
<table>
<thead>
<tr>
<th>参数</th>
<th>必选</th>
<th>类型</th>
<th>默认值</th>
<th>说明</th>
</tr>
</thead>
<tbody>
<tr>
<td>block_num</td>
<td>FALSE</td>
<td>uint64</td>
<td>空</td>
<td>块号</td>
</tr>
<tr>
<td>block_hash</td>
<td>FALSE</td>
<td>string</td>
<td>空</td>
<td>块哈希值</td>
</tr>
</tbody>
</table>
</blockquote>
<p>备注：block_num、block_hash 必须二选一，若都缺省，默认查询到的是 0 号块的信息。</p>
<p><strong>响应字段：</strong></p>
<table>
<thead>
<tr>
<th>参数</th>
<th>类型</th>
<th>说明</th>
</tr>
</thead>
<tbody>
<tr>
<td>errcode</td>
<td>uint32</td>
<td>错误码，0-相应成功，其他见错误码章节</td>
</tr>
<tr>
<td>msg</td>
<td>string</td>
<td>响应描述</td>
</tr>
<tr>
<td>result</td>
<td>jsonObject</td>
<td>响应结果</td>
</tr>
<tr>
<td>block_num</td>
<td>uint64</td>
<td>块号</td>
</tr>
<tr>
<td>prev_block_hash</td>
<td>string</td>
<td>前一块哈希值</td>
</tr>
<tr>
<td>block_hash</td>
<td>string</td>
<td>当前块哈希值</td>
</tr>
<tr>
<td>cursor_block_label</td>
<td>uint32</td>
<td>当前块标识</td>
</tr>
<tr>
<td>block_time</td>
<td>uint64</td>
<td>块生成时间</td>
</tr>
<tr>
<td>trx_merkle_root</td>
<td>string</td>
<td>默克尔根值，该块打包的所有交易的根哈希值</td>
</tr>
<tr>
<td>delegate</td>
<td>string</td>
<td>生产者名称</td>
</tr>
<tr>
<td>delegate_sign</td>
<td>string</td>
<td>生产者签名</td>
</tr>
<tr>
<td>trxs</td>
<td>jsonArray</td>
<td>当前区块所打包的交易列表，具体见“查询交易信息”章节的响应字段</td>
</tr>
</tbody>
</table>
<p><strong>字段变化</strong></p>
<ul>
<li>
<p>无</p>
<p><strong>接口示例</strong></p>
</li>
</ul>
<blockquote>
<p>地址：<a href="http://127.0.0.1:8689/v1/block/detail" rel="nofollow">http://127.0.0.1:8689/v1/block/detail</a></p>
</blockquote>
<ul>
<li>
<p>请求：</p>
<pre><code>{
	"block_num": 32,
	"block_hash": "405a6fb8b91a055a7a4cf007451ce0b31ea6626cb2d56ec050b126701fbf093d"
}
</code></pre>
</li>
<li>
<p>响应：</p>
<pre><code>HTTP/1.1 200 OK

{
    "errcode": 0,
    "msg": "success",
    "result": {
        "prev_block_hash": "1b345401d8f859c05e37b5ccacd39ff5b4a21615b63f9b96edb59352a3e54e82",
        "block_num": 32,
        "block_hash": "405a6fb8b91a055a7a4cf007451ce0b31ea6626cb2d56ec050b126701fbf093d",
        "cursor_block_label": 532613437,
        "block_time": 1537259127,
        "trx_merkle_root": "85f9d2fbe1d3c0a217e10932899b6f73b24fafe59a006406ed65d7e4a39a7416",
        "delegate": "bottos",
        "delegate_sign": "41c25998e7d432527f07ae5c10c5c30a4873e9519c29cb02e7f46e3a8e238baf47748efe3f24db3ff3630305441b1d24c5d0ba796b3332a8b8fd3fca4efc4cfb",
        "trxs": [
            {
                "version": 1,
                "cursor_num": 31,
                "cursor_label": 2749714050,
                "lifetime": 1537259224,
                "sender": "bottos",
                "contract": "bottos",
                "method": "newaccount",
                "param": {
                    "name": "testtest",
                    "pubkey": "0454f1c2223d553aa6ee53ea1ccea8b7bf78b8ca99f3ff622a3bb3e62dedc712089033d6091d77296547bc071022ca2838c9e86dec29667cf740e5c9e654b6127f"
                },
                "sig_alg": 1,
                "signature": "c85fd25af493cbb6a79870ce0fc602acc892664ca17e2c646aff0332ca6db7787beeb7e5d8553de8e4b83bdf7b227762fedf9e3674888893f18bf31f0b05d622"
            }
        ]
    }
}
</code></pre>
</li>
</ul>
<h2><a id="user-content-获取区块高度信息" class="anchor" aria-hidden="true" href="#获取区块高度信息"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>获取区块高度信息</h2>
<p><strong>接口功能</strong></p>
<blockquote>
<p>接口说明： 获取区块高度信息</p>
<p><strong>接口地址</strong></p>
<p>URL:  /v1/block/height</p>
<p><strong>返回格式</strong></p>
<p>JSON</p>
<p><strong>请求方式</strong></p>
<p>GET</p>
<p><strong>请求参数：</strong></p>
<table>
<thead>
<tr>
<th>参数</th>
<th>必选</th>
<th>类型</th>
<th>默认值</th>
<th>说明</th>
</tr>
</thead>
<tbody>
<tr>
<td>无</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
</tbody>
</table>
</blockquote>
<p><strong>响应字段：</strong></p>
<table>
<thead>
<tr>
<th>参数</th>
<th>类型</th>
<th>说明</th>
</tr>
</thead>
<tbody>
<tr>
<td>errcode</td>
<td>uint32</td>
<td>错误码，0-相应成功，其他见错误码章节</td>
</tr>
<tr>
<td>msg</td>
<td>string</td>
<td>响应描述</td>
</tr>
<tr>
<td>result</td>
<td>jsonObject</td>
<td>响应结果</td>
</tr>
<tr>
<td>head_block_num</td>
<td>uint64</td>
<td>块号</td>
</tr>
<tr>
<td>head_block_hash</td>
<td>string</td>
<td>前一块哈希值</td>
</tr>
<tr>
<td>head_block_time</td>
<td>uint64</td>
<td>块生成时间</td>
</tr>
<tr>
<td>head_block_delegate</td>
<td>string</td>
<td>块生产者</td>
</tr>
<tr>
<td>cursor_label</td>
<td>uint32</td>
<td>块标识</td>
</tr>
<tr>
<td>last_consensus_block_num</td>
<td>uint64</td>
<td>不可逆块号</td>
</tr>
<tr>
<td>chain_id</td>
<td>string</td>
<td>链ID，同一链的所有节点的Chain_id必须相同</td>
</tr>
</tbody>
</table>
<p><strong>字段变化</strong></p>
<ul>
<li>
<p>无</p>
<p><strong>接口示例</strong></p>
</li>
</ul>
<blockquote>
<p>地址：<a href="http://127.0.0.1:8689/v1/block/height" rel="nofollow">http://127.0.0.1:8689/v1/block/height</a></p>
</blockquote>
<ul>
<li>
<p>请求：</p>
<pre><code>无
</code></pre>
</li>
<li>
<p>响应：</p>
<pre><code>HTTP/1.1 200 OK
{
    "errcode": 0,
    "msg": "",
    "result": {
        "head_block_num": 87,
        "head_block_hash": "b34806eefc77b88743ab447f43658bf229fd4e5cd9452340e21f3995a5d2054b",
        "head_block_time": 1534213225,
        "head_block_delegate": "alsephina",
        "cursor_label": 2782004555,
        "last_consensus_block_num": 64,
        "chain_id": "4b97b92d2c78bcffe95ebd3067565c73a2931b39d5eb7234b11816dcec54761a"
    }
}
</code></pre>
</li>
</ul>
<h2><a id="user-content-发送交易信息" class="anchor" aria-hidden="true" href="#发送交易信息"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>发送交易信息</h2>
<p><strong>接口功能</strong></p>
<blockquote>
<p>接口说明： 发送交易信息</p>
<p><strong>接口地址</strong></p>
<p>URL:  /v1/transaction/send</p>
<p><strong>返回格式</strong></p>
<p>JSON</p>
<p><strong>请求方式</strong></p>
<p>POST</p>
</blockquote>
<p><strong>请求参数：</strong></p>
<table>
<thead>
<tr>
<th>参数</th>
<th>必选</th>
<th>类型</th>
<th>默认值</th>
<th>说明</th>
</tr>
</thead>
<tbody>
<tr>
<td>version</td>
<td>TRUE</td>
<td>uint32</td>
<td>1</td>
<td>链版本号</td>
</tr>
<tr>
<td>cursor_num</td>
<td>TRUE</td>
<td>uint64</td>
<td>无</td>
<td>最新区块号，调用获取区块头获得</td>
</tr>
<tr>
<td>cursor_label</td>
<td>TRUE</td>
<td>uint32</td>
<td>无</td>
<td>最新区块标识，调用获取区块头获得</td>
</tr>
<tr>
<td>lifetime</td>
<td>TRUE</td>
<td>uint64</td>
<td>无</td>
<td>交易过期时间，调用获取区块头，加一定的延时，推荐延时100秒</td>
</tr>
<tr>
<td>sender</td>
<td>TRUE</td>
<td>string</td>
<td>无</td>
<td>发送者</td>
</tr>
<tr>
<td>contract</td>
<td>TRUE</td>
<td>string</td>
<td>无</td>
<td>合约名称</td>
</tr>
<tr>
<td>method</td>
<td>TRUE</td>
<td>string</td>
<td>无</td>
<td>合约方法</td>
</tr>
<tr>
<td>param</td>
<td>TRUE</td>
<td>string</td>
<td>无</td>
<td>业务参数，十六进制字符串</td>
</tr>
<tr>
<td>sig_alg</td>
<td>TRUE</td>
<td>uint32</td>
<td>1</td>
<td>签名算法</td>
</tr>
<tr>
<td>signature</td>
<td>TRUE</td>
<td>string</td>
<td>无</td>
<td>签名值</td>
</tr>
</tbody>
</table>
<p><strong>响应字段：</strong></p>
<table>
<thead>
<tr>
<th>参数</th>
<th>类型</th>
<th>说明</th>
</tr>
</thead>
<tbody>
<tr>
<td>errcode</td>
<td>uint32</td>
<td>错误码，0-相应成功，其他见错误码章节</td>
</tr>
<tr>
<td>msg</td>
<td>string</td>
<td>响应描述</td>
</tr>
<tr>
<td>result</td>
<td>jsonObject</td>
<td>响应结果</td>
</tr>
<tr>
<td>trx_hash</td>
<td>string</td>
<td>交易哈希值</td>
</tr>
<tr>
<td>trx</td>
<td>jsonObject</td>
<td>交易详情</td>
</tr>
<tr>
<td>version</td>
<td>uint32</td>
<td>链版本号</td>
</tr>
<tr>
<td>cursor_num</td>
<td>uint64</td>
<td>最新区块号，调用获取区块头获得</td>
</tr>
<tr>
<td>cursor_label</td>
<td>uint32</td>
<td>最新区块标签，调用获取区块头获得</td>
</tr>
<tr>
<td>lifetime</td>
<td>uint64</td>
<td>交易过期时间，调用获取区块头，加一定的延时</td>
</tr>
<tr>
<td>sender</td>
<td>string</td>
<td>发送者</td>
</tr>
<tr>
<td>contract</td>
<td>string</td>
<td>合约名称</td>
</tr>
<tr>
<td>method</td>
<td>string</td>
<td>合约方法</td>
</tr>
<tr>
<td>param</td>
<td>string</td>
<td>业务参数，十六进制字符串</td>
</tr>
<tr>
<td>sig_alg</td>
<td>uint32</td>
<td>签名算法</td>
</tr>
<tr>
<td>signature</td>
<td>string</td>
<td>签名值</td>
</tr>
</tbody>
</table>
<p><strong>字段变化</strong></p>
<ul>
<li>
<p>无</p>
<p><strong>接口示例</strong></p>
</li>
</ul>
<blockquote>
<p>地址：<a href="http://127.0.0.1:8689/v1/transaction/send" rel="nofollow">http://127.0.0.1:8689/v1/transaction/send</a></p>
</blockquote>
<ul>
<li>
<p>请求：</p>
<pre><code>{
	"version": 1,
	"cursor_num": 719,
	"cursor_label": 2997806499,
	"lifetime": 1534143531,
	"sender": "bottos",
	"contract": "bottos",
	"method": "newaccount",
	"param": "dc0002da0009757365727465737431da008230346430373538383030353634383861393864613365643234623766613265633061623864383464343764623534366333663138316137363462613366613165383237396637363434303963343164653031623030383065623161616565623935303966373932333535323061373565333432343432393134346234336331303462",
	"sig_alg": 1,
	"signature": "f0069bc363a55dc22207c75d15cc75524bf4950159130c6bf385f6f1ca877177362ad5ab51108e7f396043e3aee7058f1ca6a40fd6c79a8483e439d2e2bccf2c"
}
</code></pre>
</li>
<li>
<p>响应：</p>
<pre><code>HTTP/1.1 200 OK
{
    "errcode": 0,
    "msg": "trx receive succ",
    "result": {
        "trx": {
            "version": 1,
            "cursor_num": 719,
            "cursor_label": 2997806499,
            "lifetime": 1534143531,
            "sender": "delta",
            "contract": "bottos",
            "method": "newaccount",
            "param": "dc0002da0009757365727465737431da008230346430373538383030353634383861393864613365643234623766613265633061623864383464343764623534366333663138316137363462613366613165383237396637363434303963343164653031623030383065623161616565623935303966373932333535323061373565333432343432393134346234336331303462",
            "sig_alg": 1,
            "signature": "f0069bc363a55dc22207c75d15cc75524bf4950159130c6bf385f6f1ca877177362ad5ab51108e7f396043e3aee7058f1ca6a40fd6c79a8483e439d2e2bccf2c"
        },
        "trx_hash": "1815f4d4dfb52b88fb445efc255a5be6275fc3ad694f802c01c40644f09b651f"
    }
}
</code></pre>
</li>
</ul>
<h2><a id="user-content-查询交易信息" class="anchor" aria-hidden="true" href="#查询交易信息"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>查询交易信息</h2>
<p><strong>接口功能</strong></p>
<blockquote>
<p>接口说明： 查询交易信息</p>
<p><strong>接口地址</strong></p>
<p>URL:  /v1/transaction/get</p>
<p><strong>返回格式</strong></p>
<p>JSON</p>
<p><strong>请求方式</strong></p>
<p>POST</p>
</blockquote>
<p><strong>请求参数：</strong></p>
<table>
<thead>
<tr>
<th>参数</th>
<th>必选</th>
<th>类型</th>
<th>默认值</th>
<th>说明</th>
</tr>
</thead>
<tbody>
<tr>
<td>trx_hash</td>
<td>TRUE</td>
<td>string</td>
<td>无</td>
<td>交易哈希值</td>
</tr>
</tbody>
</table>
<p><strong>响应字段：</strong></p>
<table>
<thead>
<tr>
<th>参数</th>
<th>类型</th>
<th>说明</th>
</tr>
</thead>
<tbody>
<tr>
<td>errcode</td>
<td>uint32</td>
<td>错误码，0-相应成功，其他见错误码章节</td>
</tr>
<tr>
<td>msg</td>
<td>string</td>
<td>响应描述</td>
</tr>
<tr>
<td>result</td>
<td>jsonObject</td>
<td>响应结果</td>
</tr>
<tr>
<td>version</td>
<td>uint32</td>
<td>链版本号</td>
</tr>
<tr>
<td>cursor_num</td>
<td>uint64</td>
<td>最新区块号，调用获取区块头获得</td>
</tr>
<tr>
<td>cursor_lab</td>
<td>uint32</td>
<td>最新区块标签，调用获取区块头获得</td>
</tr>
<tr>
<td>lifetime</td>
<td>uint64</td>
<td>交易过期时间，调用获取区块头，加一定的延时</td>
</tr>
<tr>
<td>sender</td>
<td>string</td>
<td>发送者</td>
</tr>
<tr>
<td>contract</td>
<td>string</td>
<td>合约名称</td>
</tr>
<tr>
<td>method</td>
<td>string</td>
<td>合约方法</td>
</tr>
<tr>
<td>param</td>
<td>jsonObject</td>
<td>业务参数</td>
</tr>
<tr>
<td>sig_alg</td>
<td>uint32</td>
<td>签名算法</td>
</tr>
<tr>
<td>signature</td>
<td>string</td>
<td>签名值</td>
</tr>
</tbody>
</table>
<p><strong>字段变化</strong></p>
<ul>
<li>
<p>无</p>
<p><strong>接口示例</strong></p>
</li>
</ul>
<blockquote>
<p>地址：<a href="http://127.0.0.1:8689/v1/transaction/get" rel="nofollow">http://127.0.0.1:8689/v1/transaction/get</a></p>
</blockquote>
<ul>
<li>
<p>请求：</p>
<pre><code>{
	"trx_hash": "85f9d2fbe1d3c0a217e10932899b6f73b24fafe59a006406ed65d7e4a39a7416"
}
</code></pre>
</li>
<li>
<p>响应：</p>
<pre><code> HTTP/1.1 200 OK
{
    "errcode": 0,
    "msg": "success",
    "result": {
        "version": 1,
        "cursor_num": 31,
        "cursor_label": 2749714050,
        "lifetime": 1537259224,
        "sender": "bottos",
        "contract": "bottos",
        "method": "newaccount",
        "param": {
            "name": "testtest",
            "pubkey": "0454f1c2223d553aa6ee53ea1ccea8b7bf78b8ca99f3ff622a3bb3e62dedc712089033d6091d77296547bc071022ca2838c9e86dec29667cf740e5c9e654b6127f"
        },
        "sig_alg": 1,
        "signature": "c85fd25af493cbb6a79870ce0fc602acc892664ca17e2c646aff0332ca6db7787beeb7e5d8553de8e4b83bdf7b227762fedf9e3674888893f18bf31f0b05d622"
    }
}
</code></pre>
</li>
</ul>
<h2><a id="user-content-根据关键字查询数据" class="anchor" aria-hidden="true" href="#根据关键字查询数据"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>根据关键字查询数据</h2>
<p><strong>接口功能</strong></p>
<blockquote>
<p>接口说明： 根据关键字查询数据</p>
<p><strong>接口地址</strong></p>
<p>URL:  /v1/common/query</p>
<p><strong>返回格式</strong></p>
<p>JSON</p>
<p><strong>请求方式</strong></p>
<p>POST</p>
</blockquote>
<p><strong>请求参数：</strong></p>
<table>
<thead>
<tr>
<th>参数</th>
<th>必选</th>
<th>类型</th>
<th>默认值</th>
<th>说明</th>
</tr>
</thead>
<tbody>
<tr>
<td>contract</td>
<td>TRUE</td>
<td>string</td>
<td>无</td>
<td>合约名称</td>
</tr>
<tr>
<td>object</td>
<td>TRUE</td>
<td>string</td>
<td>无</td>
<td>合约表名</td>
</tr>
<tr>
<td>key</td>
<td>TRUE</td>
<td>string</td>
<td>无</td>
<td>查询关键字</td>
</tr>
</tbody>
</table>
<p><strong>响应字段：</strong></p>
<table>
<thead>
<tr>
<th>参数</th>
<th>类型</th>
<th>说明</th>
</tr>
</thead>
<tbody>
<tr>
<td>errcode</td>
<td>uint32</td>
<td>错误码，0-相应成功，其他见错误码章节</td>
</tr>
<tr>
<td>msg</td>
<td>string</td>
<td>响应描述</td>
</tr>
<tr>
<td>result</td>
<td>jsonObject</td>
<td>响应结果</td>
</tr>
<tr>
<td>contract</td>
<td>string</td>
<td>合约名称</td>
</tr>
<tr>
<td>object</td>
<td>string</td>
<td>合约表名</td>
</tr>
<tr>
<td>key</td>
<td>string</td>
<td>查询关键字</td>
</tr>
<tr>
<td>value</td>
<td>uint32</td>
<td>查询到的值</td>
</tr>
</tbody>
</table>
<p><strong>字段变化</strong></p>
<ul>
<li>
<p>无</p>
<p><strong>接口示例</strong></p>
</li>
</ul>
<blockquote>
<p>地址：<a href="http://127.0.0.1:8689/v1/common/query" rel="nofollow">http://127.0.0.1:8689/v1/common/query</a></p>
</blockquote>
<ul>
<li>
<p>请求：</p>
<pre><code>{
	"contract":"bottostoken",
	"object":"DTO",
	"key":"aaa"
}
</code></pre>
</li>
<li>
<p>响应：</p>
<pre><code> HTTP/1.1 200 OK
{
  "errcode": 0,
  "msg": "",
  "result": {
        "contract": "bottostoken",
        "object": "DTO",
        "key": "aaa",
        "value": "dc0001cf000000ba43b74000"
  }
}

</code></pre>
</li>
</ul>
<h2><a id="user-content-序列化业务数据" class="anchor" aria-hidden="true" href="#序列化业务数据"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>序列化业务数据</h2>
<p><strong>接口功能</strong></p>
<blockquote>
<p>接口说明： 序列化业务数据，json 转为 十六进制字符串，作为“发送交易信息”请求中的parm 字段值。</p>
<p><strong>接口地址</strong></p>
<p>URL:  /v1/common/jsontobin</p>
<p><strong>返回格式</strong></p>
<p>JSON</p>
<p><strong>请求方式</strong></p>
<p>POST</p>
</blockquote>
<p><strong>请求参数：</strong></p>
<table>
<thead>
<tr>
<th>参数</th>
<th>必选</th>
<th>类型</th>
<th>默认值</th>
<th>说明</th>
</tr>
</thead>
<tbody>
<tr>
<td>contract</td>
<td>TRUE</td>
<td>string</td>
<td>无</td>
<td>合约名称</td>
</tr>
<tr>
<td>object</td>
<td>TRUE</td>
<td>string</td>
<td>无</td>
<td>合约表名</td>
</tr>
<tr>
<td>key</td>
<td>TRUE</td>
<td>string</td>
<td>无</td>
<td>查询关键字</td>
</tr>
</tbody>
</table>
<p><strong>响应字段：</strong></p>
<table>
<thead>
<tr>
<th>参数</th>
<th>类型</th>
<th>说明</th>
</tr>
</thead>
<tbody>
<tr>
<td>errcode</td>
<td>uint32</td>
<td>错误码，0-相应成功，其他见错误码章节</td>
</tr>
<tr>
<td>msg</td>
<td>string</td>
<td>响应描述</td>
</tr>
<tr>
<td>result</td>
<td>jsonObject</td>
<td>响应结果</td>
</tr>
<tr>
<td>contract</td>
<td>string</td>
<td>合约名称</td>
</tr>
<tr>
<td>object</td>
<td>string</td>
<td>合约表名</td>
</tr>
<tr>
<td>key</td>
<td>string</td>
<td>查询关键字</td>
</tr>
<tr>
<td>value</td>
<td>uint32</td>
<td>查询到的值</td>
</tr>
</tbody>
</table>
<p><strong>字段变化</strong></p>
<ul>
<li>
<p>无</p>
<p><strong>接口示例</strong></p>
</li>
</ul>
<blockquote>
<p>地址：&lt;<a href="http://127.0.0.1:8689/v1/common/jsontobin" rel="nofollow">http://127.0.0.1:8689/v1/common/jsontobin</a></p>
</blockquote>
<ul>
<li>
<p>请求：</p>
<pre><code>{
	"account_name": "testtest",
	"public_key": "0454f1c2223d553aa6ee53ea1ccea8b7bf78b8ca99f3ff622a3bb3e62dedc712089033d6091d77296547bc071022ca2838c9e86dec29667cf740e5c9e654b6127f"
}
</code></pre>
</li>
<li>
<p>响应：</p>
<pre><code> HTTP/1.1 200 OK
{
  "errcode": 0,
  "msg": "",
  "result": {
        "contract": "bottostoken",
        "object": "DTO",
        "key": "aaa",
        "value": "dc0001cf000000ba43b74000"
  }
}

</code></pre>
</li>
</ul>
<h2><a id="user-content-查询账户信息" class="anchor" aria-hidden="true" href="#查询账户信息"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>查询账户信息**</h2>
<p><strong>接口功能</strong></p>
<blockquote>
<p>接口说明： 查询账户信息</p>
<p><strong>接口地址</strong></p>
<p>URL:  /v1/account/info</p>
<p><strong>返回格式</strong></p>
<p>JSON</p>
<p><strong>请求方式</strong></p>
<p>POST</p>
</blockquote>
<p><strong>请求参数：</strong></p>
<table>
<thead>
<tr>
<th>参数</th>
<th>必选</th>
<th>类型</th>
<th>默认值</th>
<th>说明</th>
</tr>
</thead>
<tbody>
<tr>
<td>account_name</td>
<td>TRUE</td>
<td>string</td>
<td>无</td>
<td>账户名称</td>
</tr>
</tbody>
</table>
<p><strong>响应字段：</strong></p>
<table>
<thead>
<tr>
<th>参数</th>
<th>类型</th>
<th>说明</th>
</tr>
</thead>
<tbody>
<tr>
<td>errcode</td>
<td>uint32</td>
<td>错误码，0-相应成功，其他见错误码章节</td>
</tr>
<tr>
<td>msg</td>
<td>string</td>
<td>响应描述</td>
</tr>
<tr>
<td>result</td>
<td>jsonObject</td>
<td>响应结果</td>
</tr>
<tr>
<td>account_name</td>
<td>string</td>
<td>账号名称</td>
</tr>
<tr>
<td>pubkey</td>
<td>string</td>
<td>公钥</td>
</tr>
<tr>
<td>balance</td>
<td>string</td>
<td>账号可支配的BTO数量</td>
</tr>
<tr>
<td>staked_balance</td>
<td>string</td>
<td>质押投票的BTO数量</td>
</tr>
<tr>
<td>staked_space_balance</td>
<td>string</td>
<td>质押SPACE的BTO数量（交易需消耗SPACE）</td>
</tr>
<tr>
<td>staked_time_balance</td>
<td>string</td>
<td>质押TIME的BTO数量（交易需消耗TIME）</td>
</tr>
<tr>
<td>unStaking_balance</td>
<td>string</td>
<td>正解质押的BTO数量</td>
</tr>
<tr>
<td>unStaking_time</td>
<td>uint64</td>
<td>解质押的时间（ Unix时间戳 ）</td>
</tr>
<tr>
<td>vote</td>
<td>jsonObject</td>
<td>投票信息</td>
</tr>
<tr>
<td>delegate</td>
<td>string</td>
<td>被投票生产者</td>
</tr>
<tr>
<td>votes</td>
<td>string</td>
<td>投票数量</td>
</tr>
<tr>
<td>available_space_balance</td>
<td>uint64</td>
<td>可使用的SPACE数量</td>
</tr>
<tr>
<td>used_space_balance</td>
<td>uint64</td>
<td>已用的SPACE数量</td>
</tr>
<tr>
<td>available_time_balance</td>
<td>uint64</td>
<td>可使用的TIME数量</td>
</tr>
<tr>
<td>used_time_balance</td>
<td>uint64</td>
<td>已使用的SPACE数量</td>
</tr>
</tbody>
</table>
<p>备注：balance、staked_balance、staked_space_balance、staked_time_balance、unStaking_balance 三者之和为改账户总的Token值 。</p>
<p><strong>字段变化</strong></p>
<ul>
<li>
<p>无</p>
<p><strong>接口示例</strong></p>
</li>
</ul>
<blockquote>
<p>地址：<a href="http://127.0.0.1:8689/v1/account/info" rel="nofollow">http://127.0.0.1:8689/v1/account/info</a></p>
</blockquote>
<ul>
<li>
<p>请求：</p>
<pre><code>{
	"account_name":"bottostest"
}
</code></pre>
</li>
<li>
<p>响应：</p>
<pre><code> HTTP/1.1 200 OK
{
    "errcode": 0,
    "msg": "success",
    "result": {
      "account_name": "bottostest",
      "pubkey": "045f9402135fd2a8d43e9dd27ef6cd3b9569559c970de161e117e4cb34f99f31485e441e263acc2424fa4e2bf3681bfeee14145590f822a82ffb9f0db82d1939b7",
      "balance": "9999990000000000",
      "staked_balance": "10000000000",
      "staked_space_balance": "0",
      "staked_time_balance": "0",
        "unStaking_balance": "0",
      "unStaking_time": 0,
      "vote": {
          "delegate": "bottostest1",
          "votes": "10000000000"
      },
      "available_space_balance": 199644,
      "used_space_balance": 356,
      "available_time_balance": 2000000,
      "used_time_balance": 0
    }
}
</code></pre>
</li>
</ul>
<h2><a id="user-content-查询合约abi" class="anchor" aria-hidden="true" href="#查询合约abi"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>查询合约ABI</h2>
<p><strong>接口功能</strong></p>
<blockquote>
<p>接口说明： 查询合约ABI</p>
<p><strong>接口地址</strong></p>
<p>URL:  /v1/contract/abi</p>
<p><strong>返回格式</strong></p>
<p>JSON</p>
<p><strong>请求方式</strong></p>
<p>POST</p>
</blockquote>
<p><strong>请求参数：</strong></p>
<table>
<thead>
<tr>
<th>参数</th>
<th>必选</th>
<th>类型</th>
<th>默认值</th>
<th>说明</th>
</tr>
</thead>
<tbody>
<tr>
<td>contract</td>
<td>TRUE</td>
<td>string</td>
<td>无</td>
<td>合约名称</td>
</tr>
</tbody>
</table>
<p><strong>响应字段：</strong></p>
<table>
<thead>
<tr>
<th>参数</th>
<th>类型</th>
<th>说明</th>
</tr>
</thead>
<tbody>
<tr>
<td>errcode</td>
<td>uint32</td>
<td>错误码，0-相应成功，其他见错误码章节</td>
</tr>
<tr>
<td>msg</td>
<td>string</td>
<td>响应描述</td>
</tr>
<tr>
<td>result</td>
<td>jsonObject</td>
<td>响应结果</td>
</tr>
<tr>
<td>types</td>
<td>jsonObject</td>
<td>预留字段</td>
</tr>
<tr>
<td>structs</td>
<td>jsonArray</td>
<td>合约所包含的方法结构列表</td>
</tr>
<tr>
<td>name</td>
<td>string</td>
<td>结构体名，一般为自定义的合约方法名别名</td>
</tr>
<tr>
<td>base</td>
<td>string</td>
<td>父方法，通常为空</td>
</tr>
<tr>
<td>fields</td>
<td>jsonObject</td>
<td>方法入参结构体</td>
</tr>
<tr>
<td>name</td>
<td>string</td>
<td>参数-1，以注册账号为例：账号名称</td>
</tr>
<tr>
<td>pubkey</td>
<td>string</td>
<td>参数-2，以注册账号为例：公钥</td>
</tr>
<tr>
<td>actions</td>
<td>jsonArray</td>
<td>合约所包含的方法</td>
</tr>
<tr>
<td>action_name</td>
<td>string</td>
<td>合约方法名称，对应“发送交易信息”请求参数的method值</td>
</tr>
<tr>
<td>type</td>
<td>string</td>
<td>同name，结构体名，一般为自定义的合约方法名别名</td>
</tr>
<tr>
<td>tables</td>
<td>jsonArray</td>
<td>该合约数据的存储方式，定义表名，类型，Key值，类型，Value 类型。内置合约该字段为空。</td>
</tr>
<tr>
<td>table_name</td>
<td>string</td>
<td>合约存储的表名</td>
</tr>
<tr>
<td>index_type</td>
<td>string</td>
<td>索引类型，默认为string。</td>
</tr>
<tr>
<td>key_names</td>
<td>jsonArray</td>
<td>合约数据存储的Key值</td>
</tr>
<tr>
<td>key_types</td>
<td>jsonArray</td>
<td>key值的类型，默认为string</td>
</tr>
<tr>
<td>type</td>
<td>string</td>
<td>合约数据key对应的value值，通常为 结构体</td>
</tr>
</tbody>
</table>
<p><strong>字段变化</strong></p>
<ul>
<li>
<p>无</p>
<p><strong>接口示例</strong></p>
</li>
</ul>
<blockquote>
<p>地址：&lt;<a href="http://127.0.0.1:8689/v1/contract/abi" rel="nofollow">http://127.0.0.1:8689/v1/contract/abi</a> &gt;</p>
</blockquote>
<ul>
<li>
<p>请求：</p>
<pre><code>{
	"contract":"bottos"
}
</code></pre>
</li>
<li>
<p>响应：</p>
<pre><code> HTTP/1.1 200 OK
{
    "errcode": 0,
    "msg": "success",
    "result": {
        "actions": [
            {
                "action_name": "newaccount",
                "type": "NewAccount"
            },
            {
                "action_name": "transfer",
                "type": "Transfer"
            },
            {
                "action_name": "grantcredit",
                "type": "GrantCredit"
            },
            {
                "action_name": "cancelcredit",
                "type": "CancelCredit"
            },
            {
                "action_name": "transferfrom",
                "type": "TransferFrom"
            },
            {
                "action_name": "deploycode",
                "type": "DeployCode"
            },
            {
                "action_name": "deployabi",
                "type": "DeployABI"
            },
            {
                "action_name": "regdelegate",
                "type": "RegDelegate"
            },
            {
                "action_name": "unregdelegate",
                "type": "UnregDelegate"
            },
            {
                "action_name": "votedelegate",
                "type": "VoteDelegate"
            },
            {
                "action_name": "stake",
                "type": "Stake"
            },
            {
                "action_name": "unstake",
                "type": "Unstake"
            },
            {
                "action_name": "claim",
                "type": "Claim"
            },
            {
                "action_name": "setdelegate",
                "type": "SetDelegate"
            },
            {
                "action_name": "blkprodtrans",
                "type": "BlkProdTrans"
            }
        ],
        "structs": [
            {
                "base": "",
                "fields": {
                    "name": "string",
                    "pubkey": "string"
                },
                "name": "NewAccount"
            },
            {
                "base": "",
                "fields": {
                    "from": "string",
                    "to": "string",
                    "value": "uint256"
                },
                "name": "Transfer"
            },
            {
                "base": "",
                "fields": {
                    "description": "string",
                    "location": "string",
                    "name": "string",
                    "pubkey": "string"
                },
                "name": "SetDelegate"
            },
            {
                "base": "",
                "fields": {
                    "limit": "uint256",
                    "name": "string",
                    "spender": "string"
                },
                "name": "GrantCredit"
            },
            {
                "base": "",
                "fields": {
                    "name": "string",
                    "spender": "string"
                },
                "name": "CancelCredit"
            },
            {
                "base": "",
                "fields": {
                    "from": "string",
                    "to": "string",
                    "value": "uint256"
                },
                "name": "TransferFrom"
            },
            {
                "base": "",
                "fields": {
                    "contract": "string",
                    "contract_code": "bytes",
                    "vm_type": "uint8",
                    "vm_version": "uint8"
                },
                "name": "DeployCode"
            },
            {
                "base": "",
                "fields": {
                    "contract": "string",
                    "contract_abi": "bytes"
                },
                "name": "DeployABI"
            },
            {
                "base": "",
                "fields": {
                    "description": "string",
                    "location": "string",
                    "name": "string",
                    "pubkey": "string"
                },
                "name": "RegDelegate"
            },
            {
                "base": "",
                "fields": {
                    "name": "string"
                },
                "name": "UnregDelegate"
            },
            {
                "base": "",
                "fields": {
                    "delegate": "string",
                    "voteop": "uint8",
                    "voter": "string"
                },
                "name": "VoteDelegate"
            },
            {
                "base": "",
                "fields": {
                    "amount": "uint256"
                },
                "name": "Stake"
            },
            {
                "base": "",
                "fields": {
                    "amount": "uint256"
                },
                "name": "Unstake"
            },
            {
                "base": "",
                "fields": {
                    "amount": "uint256"
                },
                "name": "Claim"
            },
            {
                "base": "",
                "fields": {
                    "actblknum": "uint64"
                },
                "name": "BlkProdTrans"
            }
        ],
        "tables": null,
        "types": null
    }
}
</code></pre>
</li>
</ul>
<h2><a id="user-content-查询合约代码" class="anchor" aria-hidden="true" href="#查询合约代码"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>查询合约代码</h2>
<p><strong>接口功能</strong></p>
<blockquote>
<p>接口说明： 查询合约代码</p>
<p><strong>接口地址</strong></p>
<p>URL:  /v1/contract/code</p>
<p><strong>返回格式</strong></p>
<p>JSON</p>
<p><strong>请求方式</strong></p>
<p>POST</p>
</blockquote>
<p><strong>请求参数：</strong></p>
<table>
<thead>
<tr>
<th>参数</th>
<th>必选</th>
<th>类型</th>
<th>默认值</th>
<th>说明</th>
</tr>
</thead>
<tbody>
<tr>
<td>contract</td>
<td>TRUE</td>
<td>string</td>
<td>无</td>
<td>合约名称</td>
</tr>
</tbody>
</table>
<p><strong>响应字段：</strong></p>
<table>
<thead>
<tr>
<th>参数</th>
<th>类型</th>
<th>说明</th>
</tr>
</thead>
<tbody>
<tr>
<td>errcode</td>
<td>uint32</td>
<td>错误码，0-相应成功，其他见错误码章节</td>
</tr>
<tr>
<td>msg</td>
<td>string</td>
<td>响应描述</td>
</tr>
<tr>
<td>result</td>
<td>jsonObject</td>
<td>响应结果</td>
</tr>
</tbody>
</table>
<p><strong>字段变化</strong></p>
<ul>
<li>
<p>无</p>
<p><strong>接口示例</strong></p>
</li>
</ul>
<blockquote>
<p>地址：&lt;<a href="http://127.0.0.1:8689/v1/contract/code" rel="nofollow">http://127.0.0.1:8689/v1/contract/code</a> &gt;</p>
</blockquote>
<ul>
<li>
<p>请求：</p>
<pre><code>{
	"contract":"usermng"
}
</code></pre>
</li>
<li>
<p>响应：</p>
<pre><code> HTTP/1.1 200 OK
{
    "errcode": 0,
    "msg": "",
    "result": "7b0a2020227479706573223a205b5d2c0a20202273747275637473223a205b7b0a202020202020226e616d65223a202255736572496e666f222c0a2020202020202262617365223a2022222c0a202020202020226669656c6473223a207b0a20202020202020202020226469646964223a2022737472696e67222c0a2020202020202020202022696e666f223a2022737472696e67220a20202020202020207d0a202020207d2c7b0a202020202020226e616d65223a2022557365724c6f67696e222c0a2020202020202262617365223a2022222c0a202020202020226669656c6473223a207b0a2020202020202020202022757365724e616d65223a2022737472696e67222c0a202020202020202020202272616e646f6d4e756d223a202275696e743332220a20202020202020207d0a202020207d2c7b0a202020202020226e616d65223a20225573657242617365496e666f222c0a2020202020202262617365223a2022222c0a202020202020226669656c6473223a207b0a2020202020202020202022696e666f223a2022737472696e67220a20202020202020207d0a202020207d0a20205d2c0a202022616374696f6e73223a205b7b0a20202020202022616374696f6e5f6e616d65223a202272656775736572222c0a2020202020202274797065223a202255736572496e666f220a202020207d2c7b0a20202020202022616374696f6e5f6e616d65223a2022757365726c6f67696e222c0a2020202020202274797065223a2022557365724c6f67696e220a202020207d0a20205d2c0a2020227461626c6573223a205b7b0a202020202020227461626c655f6e616d65223a202275736572726567696e666f222c0a20202020202022696e6465785f74797065223a2022737472696e67222c0a202020202020226b65795f6e616d6573223a205b0a2020202020202020226469646964220a2020202020205d2c0a202020202020226b65795f7479706573223a205b0a202020202020202022737472696e67220a2020202020205d2c0a2020202020202274797065223a20225573657242617365496e666f220a202020207d0a20205d0a7d0a"
}
</code></pre>
</li>
</ul>
<h2><a id="user-content-查询所有生产者" class="anchor" aria-hidden="true" href="#查询所有生产者"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>查询所有生产者</h2>
<p><strong>接口功能</strong></p>
<blockquote>
<p>接口说明： 查询所有生产者</p>
<p><strong>接口地址</strong></p>
<p>URL:  /v1/delegate/getall</p>
<p><strong>返回格式</strong></p>
<p>JSON</p>
<p><strong>请求方式</strong></p>
<p>POST</p>
</blockquote>
<p><strong>请求参数：</strong></p>
<table>
<thead>
<tr>
<th>参数</th>
<th>必选</th>
<th>类型</th>
<th>默认值</th>
<th>说明</th>
</tr>
</thead>
<tbody>
<tr>
<td>limit</td>
<td>TRUE</td>
<td>uint32</td>
<td>无</td>
<td>查询条数</td>
</tr>
<tr>
<td>start</td>
<td>TRUE</td>
<td>uint32</td>
<td>0</td>
<td>查询起始下标</td>
</tr>
</tbody>
</table>
<p><strong>响应字段：</strong></p>
<table>
<thead>
<tr>
<th>参数</th>
<th>类型</th>
<th>说明</th>
</tr>
</thead>
<tbody>
<tr>
<td>errcode</td>
<td>uint32</td>
<td>错误码，0-相应成功，其他见错误码章节</td>
</tr>
<tr>
<td>msg</td>
<td>string</td>
<td>响应描述</td>
</tr>
<tr>
<td>result</td>
<td>jsonArray</td>
<td>响应结果</td>
</tr>
<tr>
<td>account_name</td>
<td>string</td>
<td>账号名称</td>
</tr>
<tr>
<td>public_key</td>
<td>string</td>
<td>公钥</td>
</tr>
<tr>
<td>location</td>
<td>string</td>
<td>节点地理位置信息，如"shanghai,china"</td>
</tr>
<tr>
<td>desc</td>
<td>string</td>
<td>节点描述信息</td>
</tr>
</tbody>
</table>
<p><strong>字段变化</strong></p>
<ul>
<li>
<p>无</p>
<p><strong>接口示例</strong></p>
</li>
</ul>
<blockquote>
<p>地址：&lt;<a href="http://127.0.0.1:8689/v1/delegate/getall" rel="nofollow">http://127.0.0.1:8689/v1/delegate/getall</a> &gt;</p>
</blockquote>
<ul>
<li>
<p>请求：</p>
<pre><code>{
    "limit": 10,
    "start": 0
}
</code></pre>
</li>
<li>
<p>响应：</p>
<pre><code> HTTP/1.1 200 OK
{
    "errcode": 0,
    "msg": "success",
    "result":  [
        {
            "account_name": "adhil",
            "report_key": "0454f1c2223d553aa6ee53ea1ccea8b7bf78b8ca99f3ff622a3bb3e62dedc712089033d6091d77296547bc071022ca2838c9e86dec29667cf740e5c9e654b6127f",
            "location": "shanghai,china",
            "desc": "",
            "last_slot": 1029945,
            "total_missed": 0,
            "last_confirmed_block_num": 32,
            "active": true
        },
        {
            "account_name": "albireo",
            "report_key": "0454f1c2223d553aa6ee53ea1ccea8b7bf78b8ca99f3ff622a3bb3e62dedc712089033d6091d77296547bc071022ca2838c9e86dec29667cf740e5c9e654b6127f",
            "location": "",
            "desc": "",
            "last_slot": 1026356,
            "total_missed": 123,
            "last_confirmed_block_num": 10,
            "active": false
        }
    ]
}
</code></pre>
</li>
</ul>
</article>
  </div>

    </div>

  

  <details class="details-reset details-overlay details-overlay-dark">
    <summary data-hotkey="l" aria-label="Jump to line"></summary>
    <details-dialog class="Box Box--overlay d-flex flex-column anim-fade-in fast linejump" aria-label="Jump to line">
      <!-- '"` --><!-- </textarea></xmp> --></option></form><form class="js-jump-to-line-form Box-body d-flex" action="" accept-charset="UTF-8" method="get"><input name="utf8" type="hidden" value="&#x2713;" />
        <input class="form-control flex-auto mr-3 linejump-input js-jump-to-line-field" type="text" placeholder="Jump to line&hellip;" aria-label="Jump to line" autofocus>
        <button type="submit" class="btn" data-close-dialog>Go</button>
</form>    </details-dialog>
  </details>



  </div>
  <div class="modal-backdrop js-touch-events"></div>
</div>

    </div>
  </div>

  </div>

        
<div class="footer container-lg px-3" role="contentinfo">
  <div class="position-relative d-flex flex-justify-between pt-6 pb-2 mt-6 f6 text-gray border-top border-gray-light ">
    <ul class="list-style-none d-flex flex-wrap ">
      <li class="mr-3">&copy; 2018 <span title="0.25572s from unicorn-565b8d9c88-cwwfn">GitHub</span>, Inc.</li>
        <li class="mr-3"><a data-ga-click="Footer, go to terms, text:terms" href="https://github.com/site/terms">Terms</a></li>
        <li class="mr-3"><a data-ga-click="Footer, go to privacy, text:privacy" href="https://github.com/site/privacy">Privacy</a></li>
        <li class="mr-3"><a href="/security" data-ga-click="Footer, go to security, text:security">Security</a></li>
        <li class="mr-3"><a href="https://status.github.com/" data-ga-click="Footer, go to status, text:status">Status</a></li>
        <li><a data-ga-click="Footer, go to help, text:help" href="https://help.github.com">Help</a></li>
    </ul>

    <a aria-label="Homepage" title="GitHub" class="footer-octicon mr-lg-4" href="https://github.com">
      <svg height="24" class="octicon octicon-mark-github" viewBox="0 0 16 16" version="1.1" width="24" aria-hidden="true"><path fill-rule="evenodd" d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.013 8.013 0 0 0 16 8c0-4.42-3.58-8-8-8z"/></svg>
</a>
   <ul class="list-style-none d-flex flex-wrap ">
        <li class="mr-3"><a data-ga-click="Footer, go to contact, text:contact" href="https://github.com/contact">Contact GitHub</a></li>
        <li class="mr-3"><a href="https://github.com/pricing" data-ga-click="Footer, go to Pricing, text:Pricing">Pricing</a></li>
      <li class="mr-3"><a href="https://developer.github.com" data-ga-click="Footer, go to api, text:api">API</a></li>
      <li class="mr-3"><a href="https://training.github.com" data-ga-click="Footer, go to training, text:training">Training</a></li>
        <li class="mr-3"><a href="https://blog.github.com" data-ga-click="Footer, go to blog, text:blog">Blog</a></li>
        <li><a data-ga-click="Footer, go to about, text:about" href="https://github.com/about">About</a></li>

    </ul>
  </div>
  <div class="d-flex flex-justify-center pb-6">
    <span class="f6 text-gray-light"></span>
  </div>
</div>



  <div id="ajax-error-message" class="ajax-error-message flash flash-error">
    <svg class="octicon octicon-alert" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M8.893 1.5c-.183-.31-.52-.5-.887-.5s-.703.19-.886.5L.138 13.499a.98.98 0 0 0 0 1.001c.193.31.53.501.886.501h13.964c.367 0 .704-.19.877-.5a1.03 1.03 0 0 0 .01-1.002L8.893 1.5zm.133 11.497H6.987v-2.003h2.039v2.003zm0-3.004H6.987V5.987h2.039v4.006z"/></svg>
    <button type="button" class="flash-close js-ajax-error-dismiss" aria-label="Dismiss error">
      <svg class="octicon octicon-x" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48L7.48 8z"/></svg>
    </button>
    You can’t perform that action at this time.
  </div>


    <script crossorigin="anonymous" integrity="sha512-WnyO4VoIUwWWQOmFLjYf4UGg/c1z9VlaLN8IMuiI3uMhhl6rejyThRdLPDyePeUPW6N+38OoBMs6AkqcvWALtA==" type="application/javascript" src="https://assets-cdn.github.com/assets/compat-b66b5d97b4442a01f057c74b091c4368.js"></script>
    <script crossorigin="anonymous" integrity="sha512-092+yG9tBLtacCexwGKGjTtkuRfZo0YUa8VrsiKW+Zh/nyA2j7MvftFLeoIor9CGQ9uDFYNIcbFDbbTPw7tV3Q==" type="application/javascript" src="https://assets-cdn.github.com/assets/frameworks-176ef037f2b2ddbb94c6810c7bce4ec9.js"></script>
    
    <script crossorigin="anonymous" async="async" integrity="sha512-nuAANK6JsvdGuFrZwvqThFwCvt39GHBZZk5bfsLn0maUD+cCQAEp8PibBdEZG9tCzfT5os+9RwWMcvgOeiRNYg==" type="application/javascript" src="https://assets-cdn.github.com/assets/github-fb816cca313de10851ed6da34e3119f5.js"></script>
    
    
    
  <div class="js-stale-session-flash stale-session-flash flash flash-warn flash-banner d-none">
    <svg class="octicon octicon-alert" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M8.893 1.5c-.183-.31-.52-.5-.887-.5s-.703.19-.886.5L.138 13.499a.98.98 0 0 0 0 1.001c.193.31.53.501.886.501h13.964c.367 0 .704-.19.877-.5a1.03 1.03 0 0 0 .01-1.002L8.893 1.5zm.133 11.497H6.987v-2.003h2.039v2.003zm0-3.004H6.987V5.987h2.039v4.006z"/></svg>
    <span class="signed-in-tab-flash">You signed in with another tab or window. <a href="">Reload</a> to refresh your session.</span>
    <span class="signed-out-tab-flash">You signed out in another tab or window. <a href="">Reload</a> to refresh your session.</span>
  </div>
  <div class="facebox" id="facebox" style="display:none;">
  <div class="facebox-popup">
    <div class="facebox-content" role="dialog" aria-labelledby="facebox-header" aria-describedby="facebox-description">
    </div>
    <button type="button" class="facebox-close js-facebox-close" aria-label="Close modal">
      <svg class="octicon octicon-x" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48L7.48 8z"/></svg>
    </button>
  </div>
</div>

  <template id="site-details-dialog">
  <details class="details-reset details-overlay details-overlay-dark lh-default text-gray-dark" open>
    <summary aria-haspopup="dialog" aria-label="Close dialog"></summary>
    <details-dialog class="Box Box--overlay d-flex flex-column anim-fade-in fast">
      <button class="Box-btn-octicon m-0 btn-octicon position-absolute right-0 top-0" type="button" aria-label="Close dialog" data-close-dialog>
        <svg class="octicon octicon-x" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48L7.48 8z"/></svg>
      </button>
      <div class="octocat-spinner my-6 js-details-dialog-spinner"></div>
    </details-dialog>
  </details>
</template>

  <div class="Popover js-hovercard-content position-absolute" style="display: none; outline: none;" tabindex="0">
  <div class="Popover-message Popover-message--bottom-left Popover-message--large Box box-shadow-large" style="width:360px;">
  </div>
</div>

<div id="hovercard-aria-description" class="sr-only">
  Press h to open a hovercard with more details.
</div>


  </body>
</html>

