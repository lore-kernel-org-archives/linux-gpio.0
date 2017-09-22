From: Vladimir Murzin <vladimir.murzin@arm.com>
Subject: Re: [PATCH] gpio: syscon: do not use raw "set" callback in
 syscon_gpio_dir_out
Date: Fri, 22 Sep 2017 15:12:06 +0100
Message-ID: <d7d4970d-2de7-9645-b992-7b992c2ca5d1@arm.com>
References: <1504104641-8369-1-git-send-email-vladimir.murzin@arm.com>
 <CACRpkdayo0Upfx21q7FJbVRRiqWTuHGfF=vYUpZHd+17TDUQbQ@mail.gmail.com>
 <1505994978.366886647@f249.i.mail.ru>
 <7e4a2e92-1186-4bad-986e-e3cb39b9c36c@arm.com>
 <CACRpkdaJVf1BCaXk-BWnc3tjuB7kGbq_7M-5JLzC-dei86NHZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:57894 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752148AbdIVOMJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 22 Sep 2017 10:12:09 -0400
In-Reply-To: <CACRpkdaJVf1BCaXk-BWnc3tjuB7kGbq_7M-5JLzC-dei86NHZA@mail.gmail.com>
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexander Shiyan <shc_work@mail.ru>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Lee Jones <lee.jones@linaro.org>

On 22/09/17 14:47, Linus Walleij wrote:
> On Fri, Sep 22, 2017 at 12:23 PM, Vladimir Murzin
> <vladimir.murzin@arm.com> wrote:
> 
>> I tried to use gpio-syscon to fit into my case which is very
>> similar to those pseudo-GPIOs in drivers/mfd/vexpress-sysreg.c
> 
> I do not like what that driver is doing and it should not be
> taken as inspiration.
> 
> I have several times slammed down on people trying to shoehorn
> things that are not GPIO into the GPIO subsystem just out of
> convenience.
> 

It is why I submitted only this patch, if you think there is no
issue I'm fine :)

> The question to ask is always: is this bit/line/pin really
> "general purpose input/output"?

In my case definitely it is not. These are some bits which 
control simple CLCD panel [1]. The only reason I've looked
into gpio-syscon is that I saw you forced keystone bits in
there with that "it is not general purpose" reason, but
from your response it seems it is not the right place for
such stuff.

> 
> Not "how can I quickly code up something that makes this
> thing work?"
> 
> See for example drivers/leds/leds-syscon.c
> That was my response to someone trying to first use
> syscon-gpio on a register and then gpio-leds on top of
> that, hilarious layers of indirection!
> 
> If the use case is MMC card detect, we need card detection
> using syscon directly in the MMC subsystem, not hacks
> like what the Vexpress MFD driver is doing.

No, it is not MMC card detect.

> 
> I have the Versatile Express in my office and one day I will
> fix up this thing.

Understood.

[1] http://infocenter.arm.com/help/topic/com.arm.doc.dai0399c/index.html#arm_toc19 (FPGAIO->MISC)

Cheers
Vladimir

> 
> Yours,
> Linus Walleij
> 

