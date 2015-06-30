From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 7/7] pinctrl: sh-pfc: Confine legacy function GPIOs to SH
Date: Tue, 30 Jun 2015 11:48:23 +0200
Message-ID: <CAMuHMdX9xK7SWvEacOx4+7QAXJ=oRREAvCBQ5X8cjv+4XeeRrg@mail.gmail.com>
References: <1435650327-2542-1-git-send-email-geert+renesas@glider.be>
	<1435650327-2542-8-git-send-email-geert+renesas@glider.be>
	<10481403.sNoQCGtpkA@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:35772 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750966AbbF3JsX (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jun 2015 05:48:23 -0400
In-Reply-To: <10481403.sNoQCGtpkA@avalon>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Benoit Parrot <bparrot@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hi Laurent,

On Tue, Jun 30, 2015 at 11:38 AM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>> --- a/drivers/pinctrl/sh-pfc/gpio.c
>> +++ b/drivers/pinctrl/sh-pfc/gpio.c
>> @@ -290,6 +290,7 @@ static int gpio_pin_setup(struct sh_pfc_chip *chip)
>>   * Function GPIOs
>>   */
>>
>> +#ifdef CONFIG_SUPERH
>>  static int gpio_function_request(struct gpio_chip *gc, unsigned offset)
>>  {
>>       static bool __print_once;
>> @@ -330,6 +331,31 @@ static int gpio_function_setup(struct sh_pfc_chip
>> *chip) return 0;
>>  }
>>
>> +static int sh_pfc_add_function_gpios(struct sh_pfc *pfc)
>> +{
>> +     struct sh_pfc_chip *chip;
>> +
>> +     if (!pfc->info->nr_func_gpios)
>> +             return 0;
>> +
>> +     chip = sh_pfc_add_gpiochip(pfc, gpio_function_setup, NULL);
>> +     if (IS_ERR(chip))
>> +             return PTR_ERR(chip);
>> +
>> +     pfc->func = chip;
>> +
>> +     return 0;
>> +}
>> +
>> +static void sh_pfc_remove_function_gpios(struct sh_pfc *pfc)
>> +{
>> +     gpiochip_remove(&pfc->func->gpio_chip);
>> +}
>> +#else
>> +static inline int sh_pfc_add_function_gpios(struct sh_pfc *pfc) { return 0;
>> }
>> +static inline int sh_pfc_remove_function_gpios(struct sh_pfc *pfc) {
>> return 0; }
>
> Given that those functions are only called from a single location, would it
> make sense to just compile the calls conditionally instead ? I would find that
> slightly more readable as it would be more explicit.

If that's acceptable for you, that would be fine for me, too. One (or two) more
visual cues for future removal of legacy code.

And then I can drop "[PATCH 6/7] pinctrl: sh-pfc: Move sh_pfc_add_gpiochip()
up".

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
