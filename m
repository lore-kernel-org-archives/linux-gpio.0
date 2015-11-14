From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpiolib: improve overlap check of range of gpio
Date: Sat, 14 Nov 2015 12:01:55 +0100
Message-ID: <CACRpkdbnua=3Wsu9TLkh3naKH=DjWixEuTSUZfz4mxk+mprudQ@mail.gmail.com>
References: <1447490336-10209-1-git-send-email-bamvor.zhangjian@linaro.org>
	<1447490336-10209-2-git-send-email-bamvor.zhangjian@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:36178 "EHLO
	mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751237AbbKNLB4 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 14 Nov 2015 06:01:56 -0500
Received: by oiww189 with SMTP id w189so62603860oiw.3
        for <linux-gpio@vger.kernel.org>; Sat, 14 Nov 2015 03:01:55 -0800 (PST)
In-Reply-To: <1447490336-10209-2-git-send-email-bamvor.zhangjian@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mark Brown <broonie@kernel.org>

On Sat, Nov 14, 2015 at 9:38 AM, Bamvor Jian Zhang
<bamvor.zhangjian@linaro.org> wrote:

> There are limitations for the current checker:
> 1.  Could not check the overlap if the new gpiochip is the secondly
>     gpiochip.
> 2.  Could not check the overlap if the new gpiochip is overlap
>     with the left of gpiochip. E.g. if we insert [c, d] between
>     [a,b] and [e, f], and e >= c + d, it will successful even if
>     c < a + b.
> 3.  Allow overlap of base of different gpiochip.
>
> This patch fix these issues by checking the overlap of both right and
> left gpiochip in the same loop statement.
>
> Signed-off-by: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>

Very interesting patch!

> +++ b/drivers/gpio/gpiolib.c
> @@ -191,29 +191,48 @@ static int gpiochip_add_to_list(struct gpio_chip *chip)
>  {
>         struct list_head *pos;
>         struct gpio_chip *_chip;
> +       struct gpio_chip *_chip_prev = NULL;

Syntactic comment: we have too many things named "chip" (something).
I also hate _underscore in variable names.

Please take this opportunity to rename:

"_chip" to "iterator"
"_chip_prev" to "previous"

That they are both gpio_chip pointers is obvious from context.

This renaming makes the code more readable.

>         int err = 0;
>
> -       /* find where to insert our chip */
> -       list_for_each(pos, &gpio_chips) {
> -               _chip = list_entry(pos, struct gpio_chip, list);
> -               /* shall we insert before _chip? */
> -               if (_chip->base >= chip->base + chip->ngpio)
> -                       break;
> +       if (list_empty(&gpio_chips)) {
> +               pos = gpio_chips.next;
> +               goto found;
>         }
>
> -       /* are we stepping on the chip right before? */
> -       if (pos != &gpio_chips && pos->prev != &gpio_chips) {
> -               _chip = list_entry(pos->prev, struct gpio_chip, list);
> -               if (_chip->base + _chip->ngpio > chip->base) {
> +       list_for_each(pos, &gpio_chips) {
> +               _chip = list_entry(pos, struct gpio_chip, list);
> +               if (_chip->base == chip->base) {
>                         dev_err(chip->dev,
> -                              "GPIO integer space overlap, cannot add chip\n");
> +                              "GPIO base overlap<%d>, cannot add chip\n",
> +                              chip->base);
>                         err = -EBUSY;
> +                       goto err;

OK that is the obvious case...

>                 }
> +               if (_chip->base >= chip->base + chip->ngpio) {

So if the iterator is above this chip.

> +                       /* we are the before the first existence gpio*/
> +                       if (pos->prev == &gpio_chips) {
> +                               goto found;

This comment needs proper english. It should say:
"iterator is at the first GPIO chip so there is no previous one"

Can't you just check if _chip_prev == NULL?

> +                       } else {
> +                               if (_chip_prev->base + _chip_prev->ngpio
> +                                               <= chip->base)
> +                                       goto found;

Here we are also below the previous chip, so above the current
iterator and below the previous one so we found a "hole".
Insert a comment that "we found a hole in the GPIO chip bases".

> +                       }
> +               }
> +               _chip_prev = _chip;
>         }
> +       if (_chip->base + _chip->ngpio <= chip->base)
> +               goto found;

And here we are above the last chip in the list.
Insert a comment about that too.
"We are beyond the last chip in the list".

Yours,
Linus Walleij
