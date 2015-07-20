From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: bgpio: Teach gpio-generic about the pinctrl subsystem
Date: Mon, 20 Jul 2015 10:46:51 +0200
Message-ID: <CACRpkda0Tk9SaO6dySBC3ONpH1nQb8imYkgYGA7dTO8em=Dr=g@mail.gmail.com>
References: <1434718697-31335-1-git-send-email-michael@smart-africa.com>
	<1434718697-31335-2-git-send-email-michael@smart-africa.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:33509 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756387AbbGTIqv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jul 2015 04:46:51 -0400
Received: by obdeg2 with SMTP id eg2so1777070obd.0
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2015 01:46:51 -0700 (PDT)
In-Reply-To: <1434718697-31335-2-git-send-email-michael@smart-africa.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Michael van der Westhuizen <michael@smart-africa.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Jonas Jensen <jonas.jensen@gmail.com>, Kamlakant Patel <kamlakant.patel@linaro.org>

On Fri, Jun 19, 2015 at 2:58 PM, Michael van der Westhuizen
<michael@smart-africa.com> wrote:

> The basic MMIO gpio driver is unaware of the pinctrl subsystem,
> and this lack of pinctrl awareness extends to drivers using bgpio
> unless the drivers handle pinctrl interaction by overriding the
> request and free methods of gpiochip.
>
> Since pinctrl consumer interfaces are stubbed when pinctrl is not
> enabled this implementation is very simple, and there is no
> behaviour change when pinctrl is not enabled.
>
> Tested on picoXcell pc3x3 using gpio-dwapb.
>
> Signed-off-by: Michael van der Westhuizen <michael@smart-africa.com>

>  static int bgpio_request(struct gpio_chip *chip, unsigned gpio_pin)
>  {
>         if (gpio_pin < chip->ngpio)
> -               return 0;
> +               return pinctrl_request_gpio(chip->base + gpio_pin);
>
>         return -EINVAL;
>  }
>
> +static void bgpio_free(struct gpio_chip *chip, unsigned gpio_pin)
> +{
> +       if (gpio_pin < chip->ngpio)
> +               pinctrl_free_gpio(chip->base + gpio_pin);
> +}

I found a problem with this patch unfortunately.

If you have several MMIO controllers on the same system, some
that use a backing pin controller and some that doesn't, this
will not work, because all instances will call
pinctrl_[request|free]_gpio() regardless if there is a pin
controller behind it or not.

Can you please augment the driver to handle this... I don't
know the best way for boardfiles, but I guess (see
drivers/gpio/gpio-pl061.c for exampe):

- In struct bgpio_chip, introduce bool uses_pinctrl

- Assume no backing pin controller so this will be false
  by default (propbably no code needed)

- Only call pinctrl_[request|free]_gpio if uses_pinctrl
  is true

- Explicitly set it to true for drivers that have backing pin
  control (like Jonas' system) or pass that flag from
  platform data.

- A quirk like this for DT enabled systems:
          if (of_property_read_bool(dev->of_node, "gpio-ranges"))
                chip->uses_pinctrl = true;

I need to move the BGPIO header to include/linux/gpio too...

Yours,
Linus Walleij
