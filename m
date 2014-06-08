From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 2/2] gpio: gpiolib: set gpiochip_remove retval to void
Date: Sun, 8 Jun 2014 21:12:39 +0900
Message-ID: <CAAVeFu+ZWy1He1CxTh+GmHtwow0P=vX_9u0P67-p_ntpqDQGtg@mail.gmail.com>
References: <CAAVeFuLMLfa-1RhcdSrKDUz7=eLqZurBSFSsN7N0x-0S+_btJA@mail.gmail.com>
 <1401906155-10543-1-git-send-email-berthe.ab@gmail.com> <1401906155-10543-3-git-send-email-berthe.ab@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1401906155-10543-3-git-send-email-berthe.ab@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: abdoulaye berthe <berthe.ab@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, m@bues.ch, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jun 5, 2014 at 3:22 AM, abdoulaye berthe <berthe.ab@gmail.com> wrote:
> This avoids handling gpiochip remove error in device
> remove handler.
>
> Signed-off-by: abdoulaye berthe <berthe.ab@gmail.com>
> ---
>  drivers/gpio/gpiolib.c      | 24 +++++++-----------------
>  include/linux/gpio/driver.h |  2 +-
>  2 files changed, 8 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index f48817d..022543f 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1263,10 +1263,9 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip);
>   *
>   * A gpio_chip with any GPIOs still requested may not be removed.
>   */
> -int gpiochip_remove(struct gpio_chip *chip)
> +void gpiochip_remove(struct gpio_chip *chip)
>  {
>         unsigned long   flags;
> -       int             status = 0;
>         unsigned        id;
>
>         acpi_gpiochip_remove(chip);
> @@ -1278,24 +1277,15 @@ int gpiochip_remove(struct gpio_chip *chip)
>         of_gpiochip_remove(chip);
>
>         for (id = 0; id < chip->ngpio; id++) {
> -               if (test_bit(FLAG_REQUESTED, &chip->desc[id].flags)) {
> -                       status = -EBUSY;
> -                       break;
> -               }
> -       }
> -       if (status == 0) {
> -               for (id = 0; id < chip->ngpio; id++)
> -                       chip->desc[id].chip = NULL;
> -
> -               list_del(&chip->list);
> +               if (test_bit(FLAG_REQUESTED, &chip->desc[id].flags))
> +                       panic("gpio: removing gpiochip with gpios still requested\n");

Really, really I don't think we should panic here. Apparently if you
don't do this things are going to crash later on some platforms. Could
you detail what the problem is exactly so we can try and come with a
solution?

Event if we crash later with a more obscure reason, using pr_err()
here to provide some information should be helpful enough.

Alex.
