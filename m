From: Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH 0/2] pinctrl: sx150x: set multiple pins at once
Date: Wed, 23 Nov 2016 10:39:21 +0100
Message-ID: <859c1aa4-32bd-4d60-dfbf-4c8dfacd3dd6@axentia.se>
References: <1479830762-1839-1-git-send-email-peda@axentia.se>
 <96d50f53-7497-932f-57e2-37fe6cfbafa5@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <96d50f53-7497-932f-57e2-37fe6cfbafa5@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Andrey Smirnov <andrew.smirnov@gmail.com>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On 2016-11-23 10:20, Neil Armstrong wrote:
> On 11/22/2016 05:06 PM, Peter Rosin wrote:
>> Hi!
>>
>> I have only tested this on an 8-bit sx1502, so I'm uncertain if
>> the there needs to be locking for this to work as intended for
>> the bigger chips with an oscio pin? Probably.
>>
>> So, I didn't add (or rather, removed) these lines at the end of
>> sx150x_gpio_set_multiple() and made the op optional instead.
>>
>> 	if (*mask & pctl->oscio_mask)
>> 		sx150x_gpio_oscio_set(pctl, *bits & pctl->oscio_mask);
>>
>> I mean, what happens if there are two users writing multiple pins
>> where one of the pins is the oscio pin, and this happens concurrently?
>> I get the feeling that there is nothing stopping interleaving in that
>> case, and you could end up with the desired values from user 1 for the
>> normal pins, and the desired value for the oscio pin from user 2.
>>
>> But for the easy case (no oscio) where the existing regmap locking
>> holds, this is a nice speedup and desired behaviour without a lot
>> of individual pin changes.
>>
>> Cheers,
>> Peter
>>
>> Peter Rosin (2):
>>   pinctrl: sx150x: various spelling fixes and some white-space cleanup
>>   pinctrl: sx150x: support setting multiple pins at once
>>
>>  drivers/pinctrl/pinctrl-sx150x.c | 50 ++++++++++++++++++++++++++++------------
>>  1 file changed, 35 insertions(+), 15 deletions(-)
>>
> 
> Hi Peter,
> 
> Thanks for the patch, yes the oscio has a clearly separate register part of the clock management,
> but it could be handled by the set_multiple by masking the oscio bit and managing it separately.

That would require locking. If process one wants pin 0 as 1 and oscio
as 1, and process two wants pin 0 as 0 and oscio as 0, and both
processes issue these commands simultaneously. The gpio chip is, to
my understanding, required to make sure that both pin 0 and oscio are
both 0 or both 1 at the end of this. Without locking, that would not
hold:

 process 1                               process 2
   regmap update to data reg.
                                           regmap update to data reg.
                                           regmap update to oscio reg.
   regmap update to oscio reg.

Broken end result: pin 0 is 1 and oscio is 0.

Each regmap access is locked, but individually. In this case we need
locking to span two regmap accesses, which brings us to resurrect all
the locking that Andrey removed, because we then need to lock *all*
regmap accesses with an external lock to prevent other stuff from
sneaking in between the above regmap access pairs. I did not want
to add back all that locking, and had no need for it, so I left the
exercise for someone else to complete.

> Using a simple integer to store the oscio pin number (or -1 for 456 devices) would simplify the process.

I'll send an update...

Cheers,
Peter
