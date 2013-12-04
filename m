From: Alex Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH 1/4] gpiolib: unify pr_* messages format
Date: Wed, 4 Dec 2013 15:20:08 +0900
Message-ID: <529EC998.6000405@nvidia.com>
References: <1386097406-24585-1-git-send-email-andriy.shevchenko@linux.intel.com> <1386097406-24585-2-git-send-email-andriy.shevchenko@linux.intel.com> <529EC899.8030603@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate14.nvidia.com ([216.228.121.143]:13529 "EHLO
	hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751400Ab3LDGUL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2013 01:20:11 -0500
In-Reply-To: <529EC899.8030603@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>

On 12/04/2013 03:15 PM, Alex Courbot wrote:
> On 12/04/2013 04:03 AM, Andy Shevchenko wrote:
>> This patch includes following amendments:
>>   1) use "?" as a label when last is not defined in gpiod_*;
>
> "when last is not defined" -> "when none is defined" ?
>
>>   2) whenever it's possilbe gpiod_* are used;
>
> s/possilbe/possible
>
>>   3) print a function name, if it's already used in other messages.
>>
>> Additionally it fixes an indentation in few places.
>>
>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> Acked-by: Alexandre Courbot <acourbot@nvidia.com>
>
> Nice cleanup. I wonder if we should not make the GPIO label mandatory in
> some future patch and always use it in error messages (and also build it
> from dev_name(dev) and con_id in gpiod_get()).
>
> One thing I wonder though: are you *absolutely* sure that none of the
> gpiod_*() log functions you are using can be called with a NULL desc? If
> you are not, it might be worth to make them more robust to this case
> that would otherwise make the kernel crash.

Looking twice, all the call sites you replaced already used 
desc_to_gpio() or have a valid descriptor around, so please ignore that 
comment.

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

