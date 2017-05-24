From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 3/3] pinctrl: bcm: clean up modular vs. non-modular
 distinctions
Date: Tue, 23 May 2017 17:42:39 -0700
Message-ID: <290c657d-5c40-882a-5a74-b5844709ada5@gmail.com>
References: <20170522205648.23545-1-paul.gortmaker@windriver.com>
 <20170522205648.23545-4-paul.gortmaker@windriver.com>
 <804d9519-5e1b-d9b1-4591-010dcafa2ff1@broadcom.com>
 <20170524001230.GJ11504@windriver.com>
 <f653cf1f-87d9-7549-6e3b-aa0ca388579c@gmail.com>
 <89839690-ab46-c091-dff6-30b50aea499b@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:36117 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752571AbdEXAmr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 May 2017 20:42:47 -0400
In-Reply-To: <89839690-ab46-c091-dff6-30b50aea499b@broadcom.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Scott Branden <scott.branden@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-kernel@vger.kernel.org, Eric Anholt <eric@anholt.net>, Jon Mason <jonmason@broadcom.com>, Linus Walleij <linus.walleij@linaro.org>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Stefan Wahren <stefan.wahren@i2se.com>, Sherman Yin <syin@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org

On 05/23/2017 05:37 PM, Scott Branden wrote:
> 
> 
> On 17-05-23 05:25 PM, Florian Fainelli wrote:
>> On 05/23/2017 05:12 PM, Paul Gortmaker wrote:
>>> [Re: [PATCH 3/3] pinctrl: bcm: clean up modular vs. non-modular
>>> distinctions] On 23/05/2017 (Tue 15:15) Scott Branden wrote:
>>>
>>>> Hi Paul,
>>>>
>>>> Some comments - leave our file headers intact.  If you want to add a
>>>> new
>>>> comment do so after the existing file header in another comment. 
>>>> But, I
>>>> don't think any of that information is needed by us.
>>> OK, no problem, if that is what is desired for your driver.  I just
>>> normally move the author information from the bottom of the file to the
>>> top of the file.  As a lot of the linux driver work was (is?) done for
>>> kudos and not for career, I can't just delete author information.  That
>>> would not be fair to most of those contributors.
>>>
>>> It hasn't been a problem before in all of the other similar commits I've
>>> made, but I can imagine a tool that does a check on the comment block on
>>> the top of a file and complains if it changes, or similar.
>>>
>>> Would you prefer something like this instead?  It leaves your header
>>> completely untouched, and still gives credit to the original author,
>>> and those lines are also untouched.
>> This looks horrible, sorry. Scott, what's the matter with moving the
>> authors listed in MODULE_AUTHOR() into the header?
> We have tools for scanning headers.  Mucking with the headers
> is not desirable as tools may need to change.  Just place additional
> comments in new comments blocks.

That's a pretty moot explanation. These tools will have to deal with
random changes being done to the kernel as the project keeps seeing more
changes.

Plus, you may get Paul to do what you him to do here and not put
anything in the header, but there is no guarantee someone else won't be
doing it, and even if you are CC'd on the patches, what if you are not,
and what if you can't defend this "breaks our tools" position, does not
scale to me.

If it's an internal tool, it can certainly be fixed, if it's coming from
an external vendor, I'd be seriously concerned if their scanning/logic
started to break in 4.13 because Paul's patches got included...

At any rate, I'd just drop the MODULE_AUTHOR() altogether, we can use
the SCM to tell us who did what exactly in a much more powerful way
(like line by line).
-- 
Florian
