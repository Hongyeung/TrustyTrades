#Trusty Trades

Trusty Trades is a Ruby on Rails application that gives small to medium sized construction company the ability to create a user-friendly website for customers/home-owners to see.  I will be referring to customers as home-owners going forward but they do not necessarily have to be a home-owner to use this website. The home-owner can then review the companies accordingly which is showcased on the company's dashboard for all to see.  Furthermore, the home-owner can also post a job where the companies associated to the job through work-tags can bid on the job.  Note, the construction companies can only see their own bids otherwise they would undercut each other there-by not benefitting them.

##Getting Started
- clone it
- bin/rake db:create db:migrate db:seed
- bin/rails server
- make sure you make a profile both as a contractor and as a home-owner to see all functions.

#Key Features
##Construction Company
- Upload images to dashboard.
- Search jobs related to their field of work in all jobs.
- Bid on jobs.
- Message the job's owner if they have bidded on the job to negotiate price.

##Homeowner
- Can search by field of work (eg. "roofing") or by company name.
- Can post multiple jobs.
- Can speak to companies that have bidded on his/her job.
- Can review construction companies.

##Business Objective
###Construction Company
- To help small to medium sized construction companies find work so they don't have to be contracted out by larger companies thereby increasing profits.
- Gives reputable companies a way to spread word quickly that they can be trusted.

###Homeowner
- To give homeowners a more transparent way of choosing smaller construction companies.  By increasing transparency, the homeowner can trust smaller companies and pay less because they can now trust a smaller company that charges less rather than going with the big company just because of its reputation.
- Gives the homeowner the best price because he/she is able to post a job and have the companies bid on it.

##Business Logic
###Construction Company:
- Cannot review own company.
- Can only review another company once.
- Can only see own bid on specific job (No undercutting).

###Homeowner:
- Can only review a company once.
- Can see multiple bids on his/her job.
