From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [RFC] gpio: add set_active_low() function to gpio_chip
Date: Thu, 19 Mar 2015 09:33:12 -0600
Message-ID: <550AEC38.8080709@wwwdotorg.org>
References: <1426709782-2763-1-git-send-email-david.a.cohen@linux.intel.com> <CAAVeFuKT1OPhM8LMQ5z9WejZEeYgqSzwcmCOw6V7E7Y0c=8btA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:40639 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750861AbbCSPdQ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Mar 2015 11:33:16 -0400
In-Reply-To: <CAAVeFuKT1OPhM8LMQ5z9WejZEeYgqSzwcmCOw6V7E7Y0c=8btA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>, David Cohen <david.a.cohen@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 03/18/2015 08:07 PM, Alexandre Courbot wrote:
> On Thu, Mar 19, 2015 at 5:16 AM, David Cohen
> <david.a.cohen@linux.intel.com> wrote:
>> Some gpio controllers are capable of programming its pins' active-low
>> state. Let's add this new gpio_chip function for such cases and use it
>> in gpiolib.
>>
>> When set_active_low() is implemented, we no longer need to do soft flips
>> on values from non-raw get functions.
>>
>> Signed-off-by: David Cohen <david.a.cohen@linux.intel.com>
>> ---
>>
>> Hi,
>>
>> This is a RFC, not meant for integration (yet).
>>
>> We have a GPIO controller that is capable of inverting the GPIO logical value
>> on hardware using a register (and GPIO voltage level if configured for output):
>> - If GPIO pin is configured for input, only the logical value is affected: the
>>    GPIO level stays the same but the read values are inverted (it affects even
>>    interrupt event triggers).
>> - If GPIO pin is configured for output, the GPIO level is also inverted.
>>
>> Is it acceptable to expose this functionality via new gpio chip operation
>> set_active_low()?
>
> At first I thought "why not", but then I couldn't help but ask "why?"
>
> Handling the active low state in software is basically free and
> requires no extra support. What is the benefit of handling it in
> hardware that would counterbalance the complexity this adds to the
> GPIO framework?
>
> Also, wouldn't that require us to reverse this active-low logic in the
> *_raw functions for them to work as expected?

What happens when some generic driver starts to make use of this new API 
because it's convenient? Then that API has to work everywhere, including 
on chips that don't support this feature in HW. Then, we're back to 
emulating it in SW on those platforms. Given how trivial it is to 
emulate, shouldn't we emulate it everywhere, so that the code paths are 
identical everywhere?
