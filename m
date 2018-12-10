From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: Re: [PATCH] regmap: regmap-irq/gpio-max77620: add level-irq support
Date: Mon, 10 Dec 2018 17:16:28 +0200
Message-ID: <e378d050-01b4-9a6c-1c17-1f1ca04dd16e@mentor.com>
References: <20181210081437.GA32228@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181210081437.GA32228@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, mazziesaccount@gmail.com
Cc: broonie@kernel.org, gregkh@linuxfoundation.org, rafael@kernel.org, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, heikki.haikola@fi.rohmeurope.com, mikko.mutanen@fi.rohmeurope.com
List-Id: linux-gpio@vger.kernel.org

On 12/10/2018 10:14 AM, Matti Vaittinen wrote:
> Add level active IRQ support to regmap-irq irqchip. Change breaks
> existing regmap-irq type setting. Convert the existing drivers which
> use regmap-irq with trigger type setting (gpio-max77620) to work
> with this new approach. So we do not magically support level-active
> IRQs on gpio-max77620 - but add support to the regmap-irq for chips
> which support them =)
> 
> We do not support distinguishing situation where HW supports rising
> and falling edge detection but not both. Separating this would require
> inventing yet another flags for IRQ types.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
> I did both the regmap-irq and max77620 changes in same commit because
> I'd rather not cause spot where max77620 breaks. Besides the changes in
> max77620 driver are trivial. Please let me know if this is not Ok.
> 
> Reason why I submit this patch now - even though my driver which would
> use level active type setting with regmap-irq is not yet ready for
> being submited - is that I'd like to minimize amount of existing drivers
> we need to patch. And if we add level active irq support like this then
> we must patch all existing drivers using type setting with regmap-irq.
> So doing this now when only max77620 uses type setting may be easier
> than postponing this to the future.
> 
> And finally - I don't have max77620 so I have only done _wery_ limited
> testing. So I would really appreciate if someone had time to review this
> thoroughly - and even happier if someone had possibility to try this out
> with the max77620.
> 

[snip]

> diff --git a/include/linux/regmap.h b/include/linux/regmap.h
> index a367d59c301d..91c431ad98c3 100644
> --- a/include/linux/regmap.h
> +++ b/include/linux/regmap.h
> @@ -1098,6 +1098,9 @@ int regmap_fields_update_bits_base(struct regmap_field *field,  unsigned int id,
>   * @type_reg_offset: Offset register for the irq type setting.
>   * @type_rising_mask: Mask bit to configure RISING type irq.
>   * @type_falling_mask: Mask bit to configure FALLING type irq.
> + * @type_level_low_mask: Mask bit to configure LEVEL_LOW type irq.
> + * @type_level_high_mask: Mask bit to configure LEVEL_HIGH type irq.
> + * @types_supported: logical OR of IRQ_TYPE_* flags indicating supported types.

While the existing interface is awful, you don't make it better.

.types_supported value is always derived from non-zero .type_*_mask values, so
it is simply not needed, as well as the whole change to gpio-max77620.c driver.

>   */
>  struct regmap_irq {
>  	unsigned int reg_offset;
> @@ -1105,6 +1108,9 @@ struct regmap_irq {
>  	unsigned int type_reg_offset;
>  	unsigned int type_rising_mask;
>  	unsigned int type_falling_mask;
> +	unsigned int type_level_low_mask;
> +	unsigned int type_level_high_mask;
> +	unsigned int types_supported;
>  };
>  
>  #define REGMAP_IRQ_REG(_irq, _off, _mask)		\
> 

--
Best wishes,
Vladimir
