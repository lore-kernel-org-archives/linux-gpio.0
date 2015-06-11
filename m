From: Amos Jianjun Kong <kongjianjun@gmail.com>
Subject: Re: [PATCH] gpio / ACPI: Return -EPROBE_DEFER if the gpiochip was not found
Date: Thu, 11 Jun 2015 08:29:10 +0800
Message-ID: <CAFeW=pasTrKoSpzwYCJx9mUjeq+9HWC+v5mtHC22par5=shpPA@mail.gmail.com>
References: <1433941505-135180-1-git-send-email-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yh0-f68.google.com ([209.85.213.68]:36460 "EHLO
	mail-yh0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751693AbbFKAm5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Jun 2015 20:42:57 -0400
In-Reply-To: <1433941505-135180-1-git-send-email-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Tobias Diedrich <tobiasdiedrich@gmail.com>, linux-gpio@vger.kernel.org, open list <linux-kernel@vger.kernel.org>

On Wed, Jun 10, 2015 at 9:05 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> If a driver requests a GPIO described in its _CRS but the GPIO host
> controller (gpiochip) driver providing the GPIO has not been loaded yet
> acpi_get_gpiod() returns -ENODEV which causes the calling driver to fail.
>
> If the gpiochip driver is loaded afterwards the driver requesting the GPIO
> will not notice this.
>
> Better approach is to return -EPROBE_DEFER in such case. Then when the
> gpiochip driver appears the driver requesting the GPIO will be probed
> again. This also aligns ACPI GPIO lookup code closer to DT as it does
> pretty much the same when no gpiochip driver was found.
>
> Reported-by: Tobias Diedrich <tobiasdiedrich@gmail.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/gpio/gpiolib-acpi.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
> index 19b99d0c2bf0..b49006c81a7f 100644
> --- a/drivers/gpio/gpiolib-acpi.c
> +++ b/drivers/gpio/gpiolib-acpi.c
> @@ -114,10 +114,11 @@ static inline int acpi_gpiochip_pin_to_gpio_offset(struct gpio_chip *chip,
>   * @path:      ACPI GPIO controller full path name, (e.g. "\\_SB.GPO1")
>   * @pin:       ACPI GPIO pin number (0-based, controller-relative)
>   *
> - * Returns GPIO descriptor to use with Linux generic GPIO API, or ERR_PTR
> - * error value
> + * Return: GPIO descriptor to use with Linux generic GPIO API, or ERR_PTR
> + * error value. Specifically returns %-EPROBE_DEFER if the referenced GPIO
> + * controller does not have gpiochip registered at the moment. This is to
> + * support probe deferral.
>   */
> -

api_get_gpiod() is called in preprobe stage, we still have chance to
probe the device.

Reviewed-by: Amos Kong <kongjianjun@gmail.com>

>  static struct gpio_desc *acpi_get_gpiod(char *path, int pin)
>  {
>         struct gpio_chip *chip;
> @@ -131,7 +132,7 @@ static struct gpio_desc *acpi_get_gpiod(char *path, int pin)
>
>         chip = gpiochip_find(handle, acpi_gpiochip_find);
>         if (!chip)
> -               return ERR_PTR(-ENODEV);
> +               return ERR_PTR(-EPROBE_DEFER);
>
>         offset = acpi_gpiochip_pin_to_gpio_offset(chip, pin);
>         if (offset < 0)
> --
> 2.1.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
