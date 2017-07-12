From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: Should irq_enable/disable be flagging/unflagging gpio lines used
 as irq?
Date: Wed, 12 Jul 2017 13:33:10 -0500
Message-ID: <4b132f31-4ea7-42a6-7bea-8e466e13e83d@ti.com>
References: <20170711195518.34aa849888e9d67a0736a990@videhug.ch>
 <CACRpkdaqJT5SLSCDtHtfXXpF4j+ig5CQeDhLFJw47Lcgmc6rCQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from lelnx194.ext.ti.com ([198.47.27.80]:10111 "EHLO
        lelnx194.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752354AbdGLSdf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jul 2017 14:33:35 -0400
In-Reply-To: <CACRpkdaqJT5SLSCDtHtfXXpF4j+ig5CQeDhLFJw47Lcgmc6rCQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Davide Hug <d@videhug.ch>, Thomas Gleixner <tglx@linutronix.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Marc Zyngier <marc.zyngier@arm.com>



On 07/12/2017 06:35 AM, Linus Walleij wrote:
> On Tue, Jul 11, 2017 at 7:55 PM, Davide Hug <d@videhug.ch> wrote:
> 
>> I'm looking at a driver (hwmon/sht15) that does not load with message:
>>
>>          gpio-48 (SHT15 data): _gpiod_direction_output_raw: tried to set a GPIO tied to an IRQ as output
>>
>> This happens because the driver uses a GPIO line alternately (and not at the
>> same time) as IRQ and output. To do this irq_enable/disable are used to
>> prevent setting a GPIO with enabled IRQ as output. This seems the right
>> approach to me since in the patch "gpio: add API to be strict about GPIO IRQ
>> usage"[1] I read:
>>
>>          The API is symmetric so that lines can also be flagged from
>>          .irq_enable() and unflagged from IRQ by .irq_disable().
>>
>> But I didn't find any GPIO driver implementing this API in irq_enable/disable.
>>
>> Since my platform uses omap_gpio which does not implement
>> irq_enable/disable at all, I added a default irq_enable/disable
>> implementation in gpio/gpiolib.c (in the patch below).
>>
>> Is it the right approach to call gpiochip_lock_as_irq/gpiochip_unlock_as_irq

It might solve your problem, but this is not the way to move forward :(
Looks like, hwmon/sht15 is very specific driver ;)
and, honestly, I think it better to use polling instead of IRQs.


> 
> We already call this in gpiochip_irq_reqres() and gpiochip_irq_relres().
> from the .irq_request_resources()/.irq_release_resources() callbacks.
> 
> Your patch makes us call the functions twice I think.
> 
> Why isn't gpiochip_irq_relres() called before you reuse the line
> for something else than IRQ?
> 
> If there is a legitimate reason why .irq_disable() and .irq_enable()
> are called but not .irq_request_resources() and .irq_release_resources()
> I want to know why that is so.
> 
> TGLX implemented these functions in the first place exactly to
> be used for gpiochip_lock_as_irq()/gpiochip_unlock_as_irq(), see:
> commit c1bacbae8192dd2a9ebadd22d793b68054f6c6e5
> "genirq: Provide irq_request/release_resources chip callbacks"
> 
> Then we switch in
> commit 57ef04288abd27a717287a652d324f95cb77c3c6
> "gpio: switch drivers to use new callback"
> 
> At the time we were calling this from .irq_startup() and .irq_shutdown()
> and I am afraid that .irq_enable() and .irq_disable() will just recreate
> the same problem we had in 2014.
> 

And they are always called from atomic context

-- 
regards,
-grygorii
