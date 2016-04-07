From: Guenter Roeck <guenter@roeck-us.net>
Subject: Re: Problems with commit a770d946371e ("gpio: pxa: add pin control
 gpio direction and request")
Date: Thu, 7 Apr 2016 07:51:38 -0700
Message-ID: <570673FA.4020200@roeck-us.net>
References: <56F730DF.9080307@roeck-us.net> <87oa9zr7g3.fsf@belgarion.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f176.google.com ([209.85.192.176]:33105 "EHLO
	mail-pf0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756505AbcDGOvu (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Apr 2016 10:51:50 -0400
In-Reply-To: <87oa9zr7g3.fsf@belgarion.home>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On 03/27/2016 01:29 PM, Robert Jarzmik wrote:
> Guenter Roeck <guenter@roeck-us.net> writes:
>
>> Hi,
> Hi Guenter,
>
>> when trying pxa_defconfig with various pxa270 and pxa255 qemu targets, I
>> noticed that the gpio pin direction is no longer set. Bisect points to commit
>> a770d946371e ("gpio: pxa: add pin control gpio direction and request").
> This is a bug, you're perfectly right.
>
>> As it turns out, pxa_defconfig does not configure PINCTRL. As a result,
>> pinctrl stub functions are used.
> Not having PINCTRL for pxa platforms is also right : only pxa device-tree
> platforms will have pinctrl in a first stage, the legacy ones will lives for
> several cycles without pinctrl.
>
>> Those all return 0 if PINCTRL is not configured. This causes the pxa gpio
>> driver to wrongly assume that pinctrl configured the gpio pin direction, and
>> does nothing.
> And as you explain, this is the root case.
>
>> Looking into gpio-mvebu.c, its use of the pinctrl functions is completely
>> different. It aborts on error, not on success, from the pinctrl
>> functions.
>> Given that, I have no idea how to resolve the problem. Having the stub
>> functions return an error might cause the mvebu driver (and maybe others) to
>> fail if there is no pinctrl driver, so that does not seem to be an option.
> You're right, it's the inverted logic in pxa_gpio_direction_output() which is at
> fault, ie. the commit you pointed out.
>
>> If the idea is to mandate pinctrl for PXA architectures, it should probably be
>> enabled for those architectures. Unless I am missing something, PXA
>> architectures to not select PINCTRL, which suggests that the problem may
>> affect a wide range of systems. Please have a look.
> As I said above, selecting PINCTRL is not yet an option. But fixing gpio-pxa is
> a necessity for sure. It is beyond me how this can pass through my
> non-regression Jenkins ... oh wait, I found :
>   - pxa machine files still use the old "mfp" stuff
>   - in this mfp (arch/arm/mach-pxa/mfp-pxa[23]xxx.c", GPDR is directly accessed
>
> But no more poor excuses, would you try the patch at the end of this mail, while
> I'm doing the same on my Jenkins, on both device-tree and legacy platform-data
> builds, to see if we can fix this ?
>
> Cheers.
Any updates ? I still see the problem in mainline.

Guenter

