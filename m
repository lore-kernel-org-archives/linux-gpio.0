From: "Zhu, Lejun" <lejun.zhu@linux.intel.com>
Subject: Re: [PATCH v2] gpio: Add support for Intel SoC PMIC (Crystal Cove)
Date: Wed, 28 May 2014 08:46:16 +0800
Message-ID: <538531D8.409@linux.intel.com>
References: <1400649756-31353-1-git-send-email-lejun.zhu@linux.intel.com> <CACRpkdYNFpj0VR-N9=9haCT2bAvHoQs-qAhSWOdqhxizsFUbQA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:26052 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751379AbaE1AqT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 27 May 2014 20:46:19 -0400
In-Reply-To: <CACRpkdYNFpj0VR-N9=9haCT2bAvHoQs-qAhSWOdqhxizsFUbQA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, bin.yang@intel.com



On 5/27/2014 5:11 PM, Linus Walleij wrote:
> On Wed, May 21, 2014 at 7:22 AM, Zhu, Lejun <lejun.zhu@linux.intel.com> wrote:
> 
>> Devices based on Intel SoC products such as Baytrail have a Power
>> Management IC. In the PMIC there are subsystems for voltage regulation,
>> A/D conversion, GPIO and PWMs. The PMIC in Baytrail-T platform is called
>> Crystal Cove.
>>
>> This patch adds support for the GPIO function in Crystal Cove.
>>
>> v2:
>> - Use IRQ chip helper to provide irqdomain.
>> - Implement .remove and can now build as a module.
>> - Various fix for unreadable or ugly code pieces.
> 
> This is much improved! I still have comments though.
> 
>> +#define GPIO_TO_CTL(gpio, dir)         \
>> +       ((gpio < 8 ? GPIO0P0CTL ## dir : GPIO1P0CTL ## dir) + (gpio % 8))
> 
> This is unreadble. Use an explicit static inline function instead.
> 
>> +static void crystalcove_update_irq_type(int gpio, int type)
>> +{
>> +       u8 ctli = GPIO_TO_CTL(gpio, I);
>> +
>> +       type &= IRQ_TYPE_EDGE_BOTH;
> 
> You silently ignore all other type configurations?
> 
>> +       intel_soc_pmic_clearb(ctli, CTLI_INTCNT_BE);
>> +
>> +       if (type == IRQ_TYPE_EDGE_BOTH)
>> +               intel_soc_pmic_setb(ctli, CTLI_INTCNT_BE);
>> +       else if (type == IRQ_TYPE_EDGE_RISING)
>> +               intel_soc_pmic_setb(ctli, CTLI_INTCNT_PE);
>> +       else if (type & IRQ_TYPE_EDGE_FALLING)
>> +               intel_soc_pmic_setb(ctli, CTLI_INTCNT_NE);
>> +}
> 
> I would prefer a switch(type) {} construction with a default:
> that warns.
> 
> (...)
>> +static int crystalcove_irq_type(struct irq_data *data, unsigned type)
>> +{
>> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
>> +       struct crystalcove_gpio *cg =
>> +               container_of(gc, struct crystalcove_gpio, chip);
> 
> I would create a static inline at the top of the file instead of
> using container_of() explicitly everywhere:
> 
> static inline struct crystalcove_gpio *to_cg(struct gpio_chip *gc)
> {
>     return container_of(gc, struct crystalcove_gpio, chip);
> }
> 
> Then just use:
> 
> struct crystalcove_gpio *cg = to_cg(gc);
> 
> Everywhere. Or if you only want the cg in some case (like this?)
> 
> struct crystalcove_gpio *cg = to_cg(irq_data_get_irq_chip_data(data));
> 
>> +       cg->trigger_type = type;
>> +       cg->update |= UPDATE_TYPE;
>> +
>> +       return 0;
>> +}
> (...)
> 
>> +       gpiochip_irqchip_add(&cg->chip, &crystalcove_irqchip, 0,
>> +                            handle_simple_irq, IRQ_TYPE_NONE);
> 
> Really nice. Thanks for doing this!
> 
> Yours,
> Linus Walleij
> 

Thank you. I will return -EINVAL for unsupported IRQ types and fix all
the coding style problems you listed here in the next version.

Best Regards
Lejun

