From: Martyn Welch <martyn@welchs.me.uk>
Subject: Re: [PATCH 172/182] staging: vme: use gpiochip data pointer
Date: Fri, 11 Dec 2015 06:58:13 +0000
Message-ID: <566A7405.9080302@welchs.me.uk>
References: <1449669005-6835-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f46.google.com ([74.125.82.46]:37108 "EHLO
	mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753231AbbLKG6R (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2015 01:58:17 -0500
Received: by wmnn186 with SMTP id n186so17973869wmn.0
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2015 22:58:15 -0800 (PST)
In-Reply-To: <1449669005-6835-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Manohar Vanga <manohar.vanga@gmail.com>, devel@driverdev.osuosl.org



On 09/12/15 13:50, Linus Walleij wrote:
> This makes the driver use the data pointer added to the gpio_chip
> to store a pointer to the state container instead of relying on
> container_of().
>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Martyn Welch <martyn@welchs.me.uk>
> Cc: Manohar Vanga <manohar.vanga@gmail.com>
> Cc: devel@driverdev.osuosl.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Signed-of-by: Martyn Welch <martyn@welchs.me.uk>

> ---
> Greg, please ACK this so I can take this through the GPIO tree.
> ---
>   drivers/staging/vme/devices/vme_pio2_gpio.c | 17 ++++++-----------
>   1 file changed, 6 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/staging/vme/devices/vme_pio2_gpio.c b/drivers/staging/vme/devices/vme_pio2_gpio.c
> index 77901b345a71..a2b740ab7ffe 100644
> --- a/drivers/staging/vme/devices/vme_pio2_gpio.c
> +++ b/drivers/staging/vme/devices/vme_pio2_gpio.c
> @@ -17,7 +17,7 @@
>   #include <linux/device.h>
>   #include <linux/platform_device.h>
>   #include <linux/ctype.h>
> -#include <linux/gpio.h>
> +#include <linux/gpio/driver.h>
>   #include <linux/slab.h>
>   #include <linux/vme.h>
>   
> @@ -25,16 +25,11 @@
>   
>   static const char driver_name[] = "pio2_gpio";
>   
> -static struct pio2_card *gpio_to_pio2_card(struct gpio_chip *chip)
> -{
> -	return container_of(chip, struct pio2_card, gc);
> -}
> -
>   static int pio2_gpio_get(struct gpio_chip *chip, unsigned int offset)
>   {
>   	u8 reg;
>   	int retval;
> -	struct pio2_card *card = gpio_to_pio2_card(chip);
> +	struct pio2_card *card = gpiochip_get_data(chip);
>   
>   	if ((card->bank[PIO2_CHANNEL_BANK[offset]].config == OUTPUT) |
>   		(card->bank[PIO2_CHANNEL_BANK[offset]].config == NOFIT)) {
> @@ -72,7 +67,7 @@ static void pio2_gpio_set(struct gpio_chip *chip, unsigned int offset,
>   {
>   	u8 reg;
>   	int retval;
> -	struct pio2_card *card = gpio_to_pio2_card(chip);
> +	struct pio2_card *card = gpiochip_get_data(chip);
>   
>   	if ((card->bank[PIO2_CHANNEL_BANK[offset]].config == INPUT) |
>   		(card->bank[PIO2_CHANNEL_BANK[offset]].config == NOFIT)) {
> @@ -102,7 +97,7 @@ static void pio2_gpio_set(struct gpio_chip *chip, unsigned int offset,
>   static int pio2_gpio_dir_in(struct gpio_chip *chip, unsigned offset)
>   {
>   	int data;
> -	struct pio2_card *card = gpio_to_pio2_card(chip);
> +	struct pio2_card *card = gpiochip_get_data(chip);
>   
>   	if ((card->bank[PIO2_CHANNEL_BANK[offset]].config == OUTPUT) |
>   		(card->bank[PIO2_CHANNEL_BANK[offset]].config == NOFIT)) {
> @@ -121,7 +116,7 @@ static int pio2_gpio_dir_in(struct gpio_chip *chip, unsigned offset)
>   static int pio2_gpio_dir_out(struct gpio_chip *chip, unsigned offset, int value)
>   {
>   	int data;
> -	struct pio2_card *card = gpio_to_pio2_card(chip);
> +	struct pio2_card *card = gpiochip_get_data(chip);
>   
>   	if ((card->bank[PIO2_CHANNEL_BANK[offset]].config == INPUT) |
>   		(card->bank[PIO2_CHANNEL_BANK[offset]].config == NOFIT)) {
> @@ -207,7 +202,7 @@ int pio2_gpio_init(struct pio2_card *card)
>   	card->gc.set = pio2_gpio_set;
>   
>   	/* This function adds a memory mapped GPIO chip */
> -	retval = gpiochip_add(&(card->gc));
> +	retval = gpiochip_add_data(&(card->gc), card);
>   	if (retval) {
>   		dev_err(&card->vdev->dev, "Unable to register GPIO\n");
>   		kfree(card->gc.label);

