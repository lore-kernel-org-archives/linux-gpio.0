From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH v2] gpio: convince line to become input in irq helper
Date: Wed, 6 Jul 2016 12:07:20 +0300
Message-ID: <577CCA48.7090003@ti.com>
References: <1466630758-26231-1-git-send-email-linus.walleij@linaro.org>
 <CAMuHMdXVEjyctU88-u=FJcY0AwLKvFxdizkPTTjt_X=xM_H6UQ@mail.gmail.com>
 <CACRpkdZpRSrt4u_h11ROavVFZDh6OYJ49gJ6eD0y4gGuOxzMYg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZpRSrt4u_h11ROavVFZDh6OYJ49gJ6eD0y4gGuOxzMYg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Bj=c3=b6rn_Andersson?= <bjorn.andersson@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

On 07/05/2016 05:52 PM, Linus Walleij wrote:
> I sent a patch for the direction setter to be more careful, but
> it's no silver bullet for strange semantics.
> 
> On Tue, Jul 5, 2016 at 12:07 PM, Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> 
>> [1] gpio_rcar e6052000.gpio: sense irq = 11, type = 8
>>      ravb e6800000.ethernet eth0: Base address at 0xe6800000,
>> 2e:09:0a:00:83:1e, IRQ 131.
>>      ...
>> [2] gpiochip_irq_reqres: gpiochip e6052000.gpio
>> [3] gpio_rcar e6052000.gpio: gpio_rcar_direction_input: 11
>> [4] gpiochip_irq_reqres: desc->flags = 0x0
> (...)
>> This configures the GPIO for plain input mode, cfr. [3] above, basically
>> undoing the configuration from [1]. Hence interrupts no longer come through,
>> and Ethernet fails.
> 
> The driver is a bit fragile in that it relies on a certain call semantic,
> I guess it is not a widespread problem so we should be able to make
> a local fix if necessary.
> 
> The .set_direction() call should
> set the direction. Why is it turning off interrupts as a side effect?
> 
> What happens if you apply this, making the .request() function handle
> the pin setup and .set_direction() really just setting the
> direction?
> 
> diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
> index 681c93fb9e70..68fb0147caf4 100644
> --- a/drivers/gpio/gpio-rcar.c
> +++ b/drivers/gpio/gpio-rcar.c
> @@ -221,7 +221,20 @@ static void
> gpio_rcar_config_general_input_output_mode(struct gpio_chip *chip,
>       struct gpio_rcar_priv *p = gpiochip_get_data(chip);
>       unsigned long flags;
> 
> -    /* follow steps in the GPIO documentation for
> +    spin_lock_irqsave(&p->lock, flags);
> +
> +    /* Select Input Mode or Output Mode in INOUTSEL */
> +    gpio_rcar_modify_bit(p, INOUTSEL, gpio, output);
> +
> +    spin_unlock_irqrestore(&p->lock, flags);
> +}
> +
> +static int gpio_rcar_request(struct gpio_chip *chip, unsigned offset)
> +{
> +    struct gpio_rcar_priv *p = gpiochip_get_data(chip);
> +
> +    /*
> +     * follow steps in the GPIO documentation for
>        * "Setting General Output Mode" and
>        * "Setting General Input Mode"
>        */
> @@ -234,14 +247,8 @@ static void
> gpio_rcar_config_general_input_output_mode(struct gpio_chip *chip,
>       /* Select "General Input/Output Mode" in IOINTSEL */
>       gpio_rcar_modify_bit(p, IOINTSEL, gpio, false);
> 
> -    /* Select Input Mode or Output Mode in INOUTSEL */
> -    gpio_rcar_modify_bit(p, INOUTSEL, gpio, output);
> -
>       spin_unlock_irqrestore(&p->lock, flags);
> -}
> 
> -static int gpio_rcar_request(struct gpio_chip *chip, unsigned offset)
> -{
>       return pinctrl_request_gpio(chip->base + offset);
>   }
> 
> .request() is always called before .set_direction() when issuing
> gpiod_get() anyways, so the order required according to the comment
> will be satisfied when the GPIO is first requested, but if we're just
> using the interrupt, we still will be able to set the direction right.

I'd like to note few issues with this patch (commit
7e7c059cb50c7c72d5a393b2c34fc57de1b01b55 in gpio-next)

And sorry for late comment.

first of all for slow GPIO controllers (like pcf857x) it might be unsafe to call
.direction_input() from .irq_request_resources() callback because it 
will be called in atomic context under raw_spin_lock_irqsave().


__setup_irq
   |- raw_spin_lock_irqsave()
 	|- irq_request_resources()
        |- [ __irq_set_trigger() ]
	|- [ irq_startup() ]
	|- [ __enable_irq() ]
   |- raw_spin_unlock_irqrestore()

[and it can be unsafe for fast GPIO chips also ;( , for example if it's
required to do some kind of PM management actions before accessing HW - most of
drivers expect their GPIOchip callbacks to be called only after gpiochip.request() or 
.irq_startup().]

In  my opinion this change breaks orthogonality of IRQchip vs GPIOchip interfaces
because it adds and (what is more important) hides call of GPIOchip callback
from inside IRQchip interface somewhere in  the depths of gpiolib framework.
As result, GPIO drivers lose possibility to properly handle GPIO vs IRQ interface's
differences like: locking, slow vs fast, hw specific settings, features of frameworks.

I propose to revert it, sry, 

PS. But think that it still can be useful to make gpiochip_irq_reqres()/gpiochip_irq_relres()
public (as helpers) in their current form.


-- 
regards,
-grygorii
