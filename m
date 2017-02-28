From: Marc Pignat <marc@pignat.org>
Subject: [PATCH,v2 0/1] gpio: add NCT5104D gpio driver
Date: Tue, 28 Feb 2017 09:14:24 +0100
Message-ID: <b1834c0a-52bb-56a4-5c52-dbf7a5a02dec@pignat.org>
References: <77f71974-541e-7e06-d37d-c52b9623ed25@pignat.org>
 <CACRpkdbfOFCWQsytnf0f2ZvBsvHqQ85nk-aKK-zXpr8F=uJ3UQ@mail.gmail.com>
 <20170222210420.GA15290@sophia>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:52502 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751666AbdB1IOb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Feb 2017 03:14:31 -0500
In-Reply-To: <20170222210420.GA15290@sophia>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi all,

Here is a v2, with fixes or at least responses to your comments.

On 02/22/2017 10:04 PM, William Breathitt Gray wrote:
> On Wed, Feb 22, 2017 at 03:52:05PM +0100, Linus Walleij wrote:
>> On Thu, Feb 9, 2017 at 11:54 AM, Marc Pignat <marc@pignat.org> wrote:
>>
...
>> Please look a bit at drivers/gpio/gpio-it87.c, and gpio-f7188x.c it seems to me
>> that this is a simlar or identical chip to one of these. In that case,
>> you should

gpio-f7188x is really similar, but I failed to add nct5104d into it, the
registers are not at the same addresses, input/output is inverted and open
drain management is different.

So I restarted the gpio-nct5104d.c driver using gpio-f7188x.c.

...
...

>>
>> This enum and name array seems a bit overkill? Are you already planning
>> to add support for a bunch of other chips?

No, removed.

>>
>>> +/*
>>> + * GPIO chip.
>>> + */
>>> +
>>> +static int nct5104d_gpio_direction_in(struct gpio_chip *chip,
>>> +                                     unsigned int offset);
>>> +static int nct5104d_gpio_get(struct gpio_chip *chip, unsigned int offset);
>>> +static int nct5104d_gpio_direction_out(struct gpio_chip *chip,
>>> +                                      unsigned int offset, int value);
>>> +static void nct5104d_gpio_set(struct gpio_chip *chip, unsigned int offset,
>>> +                             int value);
>>
>> Do you really have to forward-declare all this?

No, but was like that in gpio-f7188x.c, fixed.

>>
>> I strongly prefer if you move code around so as to avoid it.
>>
>>> +#define NCT5104D_GPIO_BANK(_base, _ngpio, _regbase)                    \
>>> +       {                                                               \
>>> +               .chip = {                                               \
>>> +                       .label            = DRVNAME,                    \
>>> +                       .owner            = THIS_MODULE,                \
>>> +                       .direction_input  = nct5104d_gpio_direction_in, \
>>> +                       .get              = nct5104d_gpio_get,          \
>>> +                       .direction_output = nct5104d_gpio_direction_out,\
>>> +                       .set              = nct5104d_gpio_set,          \
>>> +                       .base             = _base,                      \
>>> +                       .ngpio            = _ngpio,                     \
>>> +                       .can_sleep        = true,                       \
>>> +               },                                                      \
>>> +               .regbase = _regbase,                                    \
>>> +       }
>>
>> Please also implement .get_direction(), it is very helpful to have.

done

>>
>>> +static int nct5104d_gpio_direction_in(struct gpio_chip *chip,
>>> +                                     unsigned int offset)
>>> +{
>>> +       int err;
>>> +       struct nct5104d_gpio_bank *bank =
>>> +               container_of(chip, struct nct5104d_gpio_bank, chip);
>>> +       struct nct5104d_sio *sio = bank->data->sio;
>>> +       u8 dir;
>>> +
>>> +       err = superio_enter(sio->addr);
>>> +       if (err)
>>> +               return err;
>>> +       superio_select(sio->addr, SIO_LD_GPIO);
>>> +
>>> +       dir = superio_inb(sio->addr, gpio_dir(bank->regbase));
>>> +       dir |= (1 << offset);
>>
>> Please use:
>> #include <linux/bitops.h>
>>
>> dir |= BIT(offset);
>>
>> This applies to all sites using this pattern.

done

>>
>>> +               err = gpiochip_add(&bank->chip);
>>
>> Can you use devm_gpiochip_add_data() (you can pass NULL as data)
>> so you do not need the .remove() call below at all?


done

>>
>>> +err_gpiochip:
>>> +       for (i = i - 1; i >= 0; i--) {
>>> +               struct nct5104d_gpio_bank *bank = &data->bank[i];
>>> +
>>> +               gpiochip_remove(&bank->chip);
>>
>> Then conversely this needs devm_gpiochip_remove().
>>
>>> +static int nct5104d_gpio_remove(struct platform_device *pdev)
>>
>> And this could go away.

done

...

>>
> 
> Marc,
> 
> I recommend utilizing the isa_driver since you are interfacing a super
> I/O chip. This should simplify your __init and __exit code by removing
> the need for all those platform_driver setup calls you make; instead you
> would simply call isa_register_driver.
> 
> Check out the respective __init, __exit, probe, and remove code in
> drivers/watchdog/ebc-c384_wdt.c file a simple example of how to use the
> isa_driver calls. If you need more specific help, let me know and I'll
> go into more detail.
> 
>> I'm not thrilled by this "plug-and-play" that seems very far from autodetection.

Sure ISA driver seems a little more clean, but it seems recent kernel are
not compiled with CONFIG_ISA_BUS_API. 

Best regards


Marc
