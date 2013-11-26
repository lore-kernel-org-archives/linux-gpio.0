From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH] gpio: lynxpoint: lock IRQs when starting them
Date: Tue, 26 Nov 2013 15:18:58 +0200
Message-ID: <52949FC2.6010702@ti.com>
References: <1384958549-23722-1-git-send-email-linus.walleij@linaro.org>	<528CFF78.9080703@ti.com> <CACRpkdYLNWgfOFsRYiy5VBpmiJRGZ-3zo2AMBqAdufqRNFpUwA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:37519 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751088Ab3KZNWi (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 26 Nov 2013 08:22:38 -0500
In-Reply-To: <CACRpkdYLNWgfOFsRYiy5VBpmiJRGZ-3zo2AMBqAdufqRNFpUwA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mathias Nyman <mathias.nyman@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Alexandre Courbot <acourbot@nvidia.com>

On 11/26/2013 11:52 AM, Linus Walleij wrote:
> On Wed, Nov 20, 2013 at 7:29 PM, Grygorii Strashko
> <grygorii.strashko@ti.com> wrote:
>> On 11/20/2013 04:42 PM, Linus Walleij wrote:
>>>
>>> This uses the new API for tagging GPIO lines as in use by
>>> IRQs. This enforces a few semantic checks on how the underlying
>>> GPIO line is used.
> (...)
>>> +static unsigned int lp_irq_startup(struct irq_data *d)
>>> +{
>>> +     struct lp_gpio *lg = irq_data_get_irq_chip_data(d);
>>> +
>>> +     if (gpio_lock_as_irq(&lg->chip, irqd_to_hwirq(d)))
>>> +             dev_err(lg->chip.dev,
>>> +                     "unable to lock HW IRQ %lu for IRQ\n",
>>> +                     irqd_to_hwirq(d));
>>> +     return 0;
>>> +}
>>> +
>>> +static void lp_irq_shutdown(struct irq_data *d)
>>> +{
>>> +     struct lp_gpio *lg = irq_data_get_irq_chip_data(d);
>>> +
>>> +     gpio_unlock_as_irq(&lg->chip, irqd_to_hwirq(d));
>>> +}
>>
>> Seems, such changes may be risky, because .irq_startup()
>> and irq_enable()/irq_umask() are mutually exclusive, at least at IRQ request time.
>> request_threaded_irq()->__setup_irq()->irq_startup()
>>
>> More over, IRQ core assumes that IRQ is enabled, unmasked and ready for use after
>> .irq_startup() call. You can check functions irq/chip.c->irq_startup() for more info.
>>
>> So, .irq_enable() functionality need to be duplicated in .irq_startup() at least.
>>
>> if you agree - above comment is valid for most of similar recent patches ;)
>
> Yep. I just showcase what a worthless IRQ core user I am...

Yeah. That's the Gray hole in Linux's universe :)

>
> Now what would be the best way to call this?
>
> Should I just move this into the .enable callback, and if there is no
> such callback, create it and call the .unmask explicitly
> at the end of it? It would seem a bit counter-intuitive to do this
> in the .mask/.unmask callback, as that should only do exactly
> that - mask/unmask.
>
> I'll try this approach...

I'm glad to help. Seems you've made it work.


Regards,
-grygorii
