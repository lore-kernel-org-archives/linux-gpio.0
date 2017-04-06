From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH] pinctrl: cherryview: Add a quirk to make Acer Chromebook
 keyboard work again
Date: Thu, 6 Apr 2017 11:32:59 +0100
Message-ID: <6bcf8db2-626c-7934-a334-13b11fb7be68@arm.com>
References: <20170329095932.73368-1-mika.westerberg@linux.intel.com>
 <CACRpkdYm_wzJWskrkStgjXPM=F93S3K3HO-c5Tt=qSVJOxkGAw@mail.gmail.com>
 <da0935b8-245a-6920-4749-ade6eb278dba@arm.com>
 <20170330090047.GX2957@lahna.fi.intel.com>
 <20170406095948.GT2957@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:40986 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932662AbdDFKdD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 6 Apr 2017 06:33:03 -0400
In-Reply-To: <20170406095948.GT2957@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Adam S Levy <theadamlevy@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On 06/04/17 10:59, Mika Westerberg wrote:
> On Thu, Mar 30, 2017 at 12:00:47PM +0300, Mika Westerberg wrote:
>>>> Isn't the right solution to translate this back to the offset from the "Linux
>>>> IRQ" and use that offset? This quirk seems pretty violent.
>>>
>>> I'm not sure I understand the quirk here, but my personal approach would
>>> be to provide an inverse mapping oldIRQ->hwirq, and use the usual
>>> irqdomain lookup to get back to the real thing.
>>
>> OK, thanks for tip. Let me try both approaches and see which one works
>> better :)
> 
> I've now looked at the issue again and I'm actually not sure if we can
> use either of the proposals here :/
> 
> Essentially all the Linux IRQ<->hwirq mappings are created when the
> gpiochip is initialized in gpiochip_irqchip_add(). Because of that, I
> don't see how we can change those afterwards when the i8042 keyboard
> driver asks for IRQ 182. Maybe I'm missing something obvious but to me
> the only way to go forward is to do what this patch does and add all the
> GPIOs to the irqdomain (if we don't want to add a custom IRQ domain for
> cherryview).

Something is very fishy here: You say that the i8042 asks for IRQ 182.
But surely that's a hwirq. Or is it directly poking at the ACPI table,
extracting a number and do a request_irq() on it? If that's the case,
this is a bug (or at least a severe limitation) in the i8042 driver.

If the latter, even adding all the GPIOs to the domain do not guarantee
that the allocated interrupts will always be in the range you expect
(depending on the order of things being initialized).

It all feels extremely fragile to me...

	M.
-- 
Jazz is not dead. It just smells funny...
