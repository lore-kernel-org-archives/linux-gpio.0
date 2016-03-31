From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] gpio: Do not accept gpio chip additions before gpiolib
 initialization
Date: Thu, 31 Mar 2016 05:48:14 -0700
Message-ID: <56FD1C8E.60405@roeck-us.net>
References: <1459275638-11717-1-git-send-email-linux@roeck-us.net>
 <CAAVeFuJZuOWAeG7q=WaZj0f6ch9zmOHvBZReYDnqbFQLsP7G5Q@mail.gmail.com>
 <56FB9952.1030503@roeck-us.net>
 <CAAVeFu+Nd=zRFW9PTPBxMSvoxF=i55QWahurOzPoGQ8UPU7+8w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:57585 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752806AbcCaMsN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Mar 2016 08:48:13 -0400
In-Reply-To: <CAAVeFu+Nd=zRFW9PTPBxMSvoxF=i55QWahurOzPoGQ8UPU7+8w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 03/30/2016 10:57 PM, Alexandre Courbot wrote:
> On Wed, Mar 30, 2016 at 6:16 PM, Guenter Roeck <linux@roeck-us.net> wrote:
>> On 03/30/2016 01:37 AM, Alexandre Courbot wrote:
>>>
>>> On Wed, Mar 30, 2016 at 3:20 AM, Guenter Roeck <linux@roeck-us.net> wrote:
>>>>
>>>> Since commit ff2b13592299 ("gpio: make the gpiochip a real device"),
>>>> attempts to add a gpio chip prior to gpiolib initialization cause the
>>>> system to crash. Dump a warning to the console and return an error
>>>> if the situation is encountered.
>>>
>>>
>>> Mmm I see the problem but this could seriously delay the availability
>>> of some GPIOs that are useful for early system boot.
>>>
>>> I have not followed the GPIO device patches as closely as I should
>>> have, but shouldn't you be able to register a GPIO chip without
>>> immediately presenting it to user-space, for internal kernel needs? If
>>> gpiolib is not initialized, then device-related operations would be
>>> skipped, and gpiolib_dev_init() could then parse the list of
>>> registered chips and fix them up when it gets called.
>>>
>>> Again, I'm speaking without real knowledge here, but that pattern
>>> seems more resilent to me.
>>>
>> You are absolutely right, but my knowledge of gpiolib is not good enough
>> to make that change. See this as a band-gap; it is better than just
>> crashing.
>
> Actually, the following may be simpler:
>
> Why not add a check in gpiochip_add_data() that will directly call
> gpiolib_dev_init() if required? Then gpiolib_dev_init() could also
> check whether it has already been called in that context and become a
> no-op for when it is later called from core_initcall. Is there
> anything that would prevents this from being a viable fix?
>
That was my first solution. Unfortunately, it doesn't work. It appears
that the calls made by gpiolib_dev_init() have dependencies themselves.
Though maybe I messed up - feel free to try yourself.

As mentioned in the other thread, I started looking into the solution
you suggested above. It should work, but it will take (me) a while
to implement it. Until then, guess we'll see more breakage.

Guenter

