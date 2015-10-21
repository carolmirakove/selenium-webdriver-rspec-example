# About

This repository contains example blackbox acceptance tests developed with `ruby`, `rspec`, and `selenium-webdriver` for demo purposes. Points of demonstration include the following tenets of scalable test development:

* [Test Strategy](https://github.com/carolmirakove/selenium-webdriver-rspec-example/blob/master/test-plans/test-cases-example.jpg): Define and assign test development per separation of concerns
* [Page Objects](https://github.com/carolmirakove/selenium-webdriver-rspec-example/tree/master/pages)
* [DRY](https://github.com/carolmirakove/selenium-webdriver-rspec-example/tree/master/spec/helpers)
* [Dynamically generated user variables](https://github.com/carolmirakove/selenium-webdriver-rspec-example/blob/master/spec/home_spec.rb#L38)
* [Input/Output regression testing](#regression-testing)

I developed these tests using poets.org with permission from the Academy of American Poets. Anyone is welcome to fork this repository for reference but please refrain from running the tests at a high volume against poets.org to avoid skewing their product analytics.

# Contents
* [Developing Acceptance Tests](#developing-acceptance-tests)
* [Setup](#setup)
* [Run Tests](#run-tests)

## <a name='developing-acceptance-tests'></a>Developing Acceptance Tests

Tests executed through the UI are comprised of three types of activities: 

* locate an element
* interact with an element
* assert the presence or state of an element

We locate an element by one of its properties, including (from most to least preferred) `id`, `name`, `css`, `link`, and `xpath`.

### Page Objects

Page Objects, developed and popularized by Google, have proven to be a best practice for tests executed through a UI and we are using them in this repository. If you're new to Page Objects, you might read [Google's page on their utility](https://code.google.com/p/selenium/wiki/PageObjects) and [Martin Fowler's related article](http://martinfowler.com/bliki/PageObject.html).

#### Page Objects guidelines in `selenium-webdriver-rspec-example`:

+ UI elements (aka locators) are defined as constants; each element locator should be defined in only one place in the entire repository
+ Method activities are limited to locating and interacting with elements
+ Spec helpers are comprised of multiple page object methods for DRY purposes (e.g., a helper called `log_in_as` could contain the steps to load the home page, click log in, and submit a user's credentials)
+ Page object methods never contain assertions; assertions are always executed in a spec or spec helper

#### Other development guidelines:

+ Value readability over magic
+ Agree on a tagging strategy with your team, e.g.,:
   + `:smoke` = fundamental, most basic happy-path tests
   + `:facebook` = tagging tests that interact with third-party systems is useful in isolating regression tests, especially when a partner service announces a surprise upgrade or architecture change
+ Use the `skip` method underneath your example name with the reason the test is pending
   + Example:
    <pre><code>
      it 'Sign up for an account with an invalid email address' do
        skip 'bug reported in issue #90'
    </pre></code>
+ Avoid adding frameworks and libraries unless they add significant benefits (to note, one's own happiness may count as a significant benefit!)

## <a name='setup'></a>Setup

Setup instructions assume Mac OS X.

Clone the git repo:

    git clone https://github.com/carolmirakove/selenium-webdriver-rspec-example.git

Confirm you have [Homebrew](http://brew.sh/) installed:

    which brew

And [Bundler](http://bundler.io/):

    which bundler

If you get a `not found` response to either, install the missing dependency and try again; you should get returned the system path of your installation.

Next, install [ChromeDriver](https://code.google.com/p/selenium/wiki/ChromeDriver) which you will need to run tests using Chrome as the browser:

    brew install chromedriver

Then, install the gems in our project's `Gemfile`:

    bundle install

Confirm you have [Rake](http://docs.seattlerb.org/rake/) installed:

    which rake

If you get a `not found` response to either, install the missing dependency with `gem install rake` then and try again; you should get returned the system path of your installation.

Finally, add `login_credentials.rb` to your `lib` dir. If this repo were shared by a team, this would be stored in a secure place. For this repo, you can add your SauceLabs credentials if you have them, or you can store BrowserStack credentials and update `spec_helper.rb` and `Rakefile` accordingly.

Let's test!

## <a name='run-tests'></a>Run Tests

We're using `rake` tasks to manage our test-run options. You can see all the defined tasks as per usual:

    rake -T

For example:

    rake desktop:production[chrome]    

You can of course also run tests manually as per usual:

    rspec spec/home_spec.rb:13

To run tests by tag without `rake`, e.g., all tests tagged focus, run:

    rspec spec --tag smoke

When an app instance and a browser are not specified, tests will run against an (non-existent) local env using Chrome.

#### <a name='regression-testing'></a>Regression Test Runs

Cross-browser testing can be run on all or a subset of tests. If a front-end change is made to a small area of the application, you might just tag the appropriate tests with `focus` and run those tests against each supported OS and browser, e.g.,

    rake cloud:focus[local,'Windows 10','internet_explorer','11.0']

For regression testing on input fields, you can find the generously published [big list of naughty strings](https://github.com/minimaxir/big-list-of-naughty-strings) in the [test-data](https://github.com/SesoMedia/teded_qa/tree/master/test-data) directory. This extent of testing is appropriate to new or updated input fields. It is time-consuming and meant to be run in isolation, not as part of a suite. To use it, add the following line at the top of the relevant spec:

    File.foreach('/path/to/your-data-file.txt') do |your_variable|

For example, a spec expecting no search results usually looks like this:

    it 'submit a search term that should return no results' do
      keyword = "#{Faker::Lorem.words(rand(3..5)).join(' ')}"

      page.load ''
      global.submit_search_term(keyword)
      # ...
      expect(search.no_results_displayed?).to be_truthy
    end

If we wanted to iterate through Ruby injection scripts into the search input field from the text file we'd edit the example like this:

    File.foreach(Dir.pwd + '/test-data/blns_ruby-injection.txt') do |keyword|
    it 'submit a search term that returns no results' do

      page.load ''
        global.submit_search_term(keyword)
        # ...
        expect(search.no_results_displayed?).to be_truthy
      end
    end

Happy testing!

