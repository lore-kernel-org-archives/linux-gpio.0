From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] gpio: add a userspace chardev ABI for GPIOs
Date: Thu, 31 Mar 2016 05:44:12 -0700
Message-ID: <56FD1B9C.3020303@roeck-us.net>
References: <56FB30A3.40405@uclinux.org>
 <CAAVeFu+o9izwAyjORBisLg+G=PChzFvzF4SjmB1G=S+Tt--Qag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:56371 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756222AbcCaMoP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Mar 2016 08:44:15 -0400
In-Reply-To: <CAAVeFu+o9izwAyjORBisLg+G=PChzFvzF4SjmB1G=S+Tt--Qag@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>, Greg Ungerer <gerg@uclinux.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, lkml@vger.kernel.org, linux-m68k <linux-m68k@lists.linux-m68k.org>

On 03/30/2016 10:59 PM, Alexandre Courbot wrote:
> On Wed, Mar 30, 2016 at 10:49 AM, Greg Ungerer <gerg@uclinux.org> wrote:
>> Hi Linus,
>>
>> Commit 3c702e99 ("gpio: add a userspace chardev ABI for GPIOs")
>> breaks booting on all my m68k/ColdFire platforms (with MMU and
>> without). They all hang during the boot up, the last console
>> trace is:
>>
>>    ...
>>    NR_IRQS:256
>>     clocksource: pit: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1467848399018 ns
>>     Calibrating delay loop... 1042.02 BogoMIPS (lpj=5210112)
>>     pid_max: default: 32768 minimum: 301
>>     Mount-cache hash table entries: 2048 (order: 0, 8192 bytes)
>>     Mountpoint-cache hash table entries: 2048 (order: 0, 8192 bytes)
>>
>> I traced this back to gpiochip_add_data() when it does the
>> device_add() call. On my platforms this is being called
>> before gpiolib_dev_init(), and this seems to be the issue.
>> So gpio_bus_type has not been registered as a bus yet.
>>
>> The lowest level ColdFire gpio code (arch/m68k/coldfire/gpio.c)
>> calls its setup from core_initcall() - and this will call
>> gpiochip_add_data(). This is being called first, before
>> the core_initcall() for gpiolib_dev_init().
>
> We got a similar report with an alternative workaround:
>
> https://lkml.org/lkml/2016/3/29/714
>
>> I can fix by changing the core_initcall() in coldfire/gpio.c
>> to something like postcore_initcall() and that fixes the boot
>> problem.
>>
>> What do you think?
>> Would you expect that all callers of gpiochip_add_data()
>> should be after core_initcall()?
>
> As you can see on the discussion thread above, there are several
> candidate fixes - I have been away from GPIO for too long to make a
> good decision, but I'm sure Linus can make the call.
>
I've started looking into a clean solution, as you had suggested
in the other thread. It will take a while, though. For the time being,
and/or unless someone else steps in who knows gpio much better than
I do, I think some workarund like my proposed hack should get
committed into the branch.

Guenter

