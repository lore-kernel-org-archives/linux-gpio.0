From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH] pinctrl: cherryview: Add a quirk to make Acer Chromebook
 keyboard work again
Date: Wed, 29 Mar 2017 17:43:49 +0100
Message-ID: <da0935b8-245a-6920-4749-ade6eb278dba@arm.com>
References: <20170329095932.73368-1-mika.westerberg@linux.intel.com>
 <CACRpkdYm_wzJWskrkStgjXPM=F93S3K3HO-c5Tt=qSVJOxkGAw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:36320 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752733AbdC2Qnx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 29 Mar 2017 12:43:53 -0400
In-Reply-To: <CACRpkdYm_wzJWskrkStgjXPM=F93S3K3HO-c5Tt=qSVJOxkGAw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Grant Likely <grant.likely@linaro.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Adam S Levy <theadamlevy@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On 29/03/17 13:58, Linus Walleij wrote:
> On Wed, Mar 29, 2017 at 11:59 AM, Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> 
>> However, it seems some CYAN Chromebooks, including Acer Chromebook
>> hardcodes these Linux IRQ numbers in the ACPI tables of the machine.
>> Since the numbering is different now, the IRQ meant for keyboard does
>> not match the Linux virtual IRQ number anymore making the keyboard
>> non-functional.
> 
> Well ain't that great. They made the totally unstable Linux IRQ number
> space into an ABI.

I'm puzzled as to how this could have ever worked. Is that because we
used to have irq == hwirq, and that assertion doesn't hold true anymore?

> 
> I wonder what the irqchip people think about that. I think Grant warned us
> that this could happen.
> 
>> Work this around by adding special quirk just for these machines where
>> we add back all GPIOs to the irqdomain. Rest of the Cherryview/Braswell
>> based machines will not be affected by the change.
> 
> Quirking seems right. But:
> 
>> +/*
>> + * Certain machines seem to hardcode Linux IRQ numbers in their ACPI
>> + * tables. Since we leave GPIOs that are not capable of generating
>> + * interrupts out of the irqdomain the numbering will be different and
>> + * cause devices using the hardcoded IRQ numbers fail. In order not to
>> + * break such machines we will only mask pins from irqdomain if the machine
>> + * is not listed below.
>> + */
>> +static const struct dmi_system_id chv_no_valid_mask[] = {
>> +       {
>> +               /* See https://bugzilla.kernel.org/show_bug.cgi?id=194945 */
>> +               .ident = "Acer Chromebook (CYAN)",
>> +               .matches = {
>> +                       DMI_MATCH(DMI_SYS_VENDOR, "GOOGLE"),
>> +                       DMI_MATCH(DMI_PRODUCT_NAME, "Edgar"),
>> +               },
>> +       }
>> +};
> 
> We match but...
> 
>>         const struct chv_gpio_pinrange *range;
>>         struct gpio_chip *chip = &pctrl->chip;
>> +       bool need_valid_mask = !dmi_check_system(chv_no_valid_mask);
>>         int ret, i, offset;
>>
>>         *chip = chv_gpio_chip;
>> @@ -1536,7 +1557,7 @@ static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
>>         chip->label = dev_name(pctrl->dev);
>>         chip->parent = pctrl->dev;
>>         chip->base = -1;
>> -       chip->irq_need_valid_mask = true;
>> +       chip->irq_need_valid_mask = need_valid_mask;
> 
> Isn't the right solution to translate this back to the offset from the "Linux
> IRQ" and use that offset? This quirk seems pretty violent.

I'm not sure I understand the quirk here, but my personal approach would
be to provide an inverse mapping oldIRQ->hwirq, and use the usual
irqdomain lookup to get back to the real thing.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
