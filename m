From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: dwapb: enable for ARC
Date: Thu, 9 Apr 2015 10:29:59 +0200
Message-ID: <CACRpkdZCb+5AP7n8LuG2p6XMd9ctKVH8nRu8gavBV4EA5LcqBQ@mail.gmail.com>
References: <1427790607-24842-1-git-send-email-abrodkin@synopsys.com>
	<CACRpkdYTpLKXRdeCVMkCnXmBg84HEsc0qzfPai5dFOnQ1G+ZVg@mail.gmail.com>
	<1428565685.2536.4.camel@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f175.google.com ([209.85.223.175]:35951 "EHLO
	mail-ie0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751773AbbDII37 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Apr 2015 04:29:59 -0400
Received: by iebrs15 with SMTP id rs15so95013917ieb.3
        for <linux-gpio@vger.kernel.org>; Thu, 09 Apr 2015 01:29:59 -0700 (PDT)
In-Reply-To: <1428565685.2536.4.camel@synopsys.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Steven Miao <realmz6@gmail.com>, Arnd Bergmann <arnd@arndb.de>, adi-buildroot-devel@lists.sourceforge.net, Sonic Zhang <sonic.zhang@analog.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Vineet.Gupta1@synopsys.com" <Vineet.Gupta1@synopsys.com>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Better ask Steven, Arnd et al...

On Thu, Apr 9, 2015 at 9:48 AM, Alexey Brodkin
<Alexey.Brodkin@synopsys.com> wrote:
> On Wed, 2015-04-08 at 17:03 +0200, Linus Walleij wrote:
>> On Tue, Mar 31, 2015 at 10:30 AM, Alexey Brodkin
>> <Alexey.Brodkin@synopsys.com> wrote:
>>
>> > From: Vineet Gupta <vgupta@synopsys.com>
>> >
>> > Synopsys SDP platform uses DW GPIO controller in design with
>> > ARC cores. So adding ARC to architectures that may select this
>> > GPIO controller.
>> >
>> > Even though support for Synopsys SDP is yet to be submitted we'll need
>> > this tiny option enabled at least for properly working interrupts (DW
>> > GPIO controller is used as interrupt controller).
>> >
>> > Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
>> > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
>> > Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> > Cc: Linus Walleij <linus.walleij@linaro.org>
>>
>> Patch applied.
>>
>> But ...
>>
>> > -       depends on ((ARM || ARM64) && OF_GPIO) || X86_INTEL_QUARK
>> > +       depends on ((ARC || ARM || ARM64) && OF_GPIO) || X86_INTEL_QUARK
>>
>> This is getting a bit silly. What stops us from actually just enabling
>> it for any architecture?
>
> Agree. That looks like nonsense now.
> Origin of arch-limitation is
> http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/drivers/gpio/Kconfig?id=1972c97db5b0c125918f662cd084c7d5370674c0
>
> --->8---
> gpio: dwapb: fix compile errors
> Whereas the DWAPB driver does not really depend on the ARM
> architecture, it uses [readl|writel]_relaxed() not found on
> arch such as Blackfin, so restrict this to ARM until there is
> another architecture that can make use of it.
>
> It is also using the of_node of the gpiochip, so fix this
> too by requiring OF_GPIO.
>
> All error/warnings:
>
> make.cross ARCH=blackfin
> drivers/gpio/gpio-dwapb.c: In function 'dwapb_irq_handler':
> drivers/gpio/gpio-dwapb.c:91:2: error: implicit declaration of function
> 'readl_relaxed' [-Werror=implicit-function-declaration]
> drivers/gpio/gpio-dwapb.c: In function 'dwapb_configure_irqs':
> drivers/gpio/gpio-dwapb.c:212:32: error: 'struct gpio_chip' has no
> member named 'of_node'
> drivers/gpio/gpio-dwapb.c:221:16: error: 'struct gpio_chip' has no
> member named 'of_node'
> drivers/gpio/gpio-dwapb.c: In function 'dwapb_gpio_add_port':
> drivers/gpio/gpio-dwapb.c:331:14: error: 'struct gpio_chip' has no
> member named 'of_node'
> cc1: some warnings being treated as errors
> --->8---
>
> Probably better fix is to make dwgpio depend on !BLACKFIN because we
> know it won't be built for it. If there're other arches that don't
> define [readl|writel]_relaxed() we may add them as well.

This restrictions should be gone after commit
9439eb3ab9d1ece6e4ad7baaa4a7f534f9b9dab0
"asm-generic: io: implement relaxed accessor macros as conditional wrappers"

I will make a patch removing the dependencies and see what happens.

Yours,
Linus Walleij
