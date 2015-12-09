From: Michael Hennerich <michael.hennerich@analog.com>
Subject: Re: [PATCH 155/182] input: adp5588-keys: use gpiochip data pointer
Date: Wed, 9 Dec 2015 14:42:48 +0100
Message-ID: <56682FD8.8080003@analog.com>
References: <1449668693-5734-1-git-send-email-linus.walleij@linaro.org>
Reply-To: <michael.hennerich@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bn1on0080.outbound.protection.outlook.com ([157.56.110.80]:45888
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1754640AbbLINtP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 9 Dec 2015 08:49:15 -0500
In-Reply-To: <1449668693-5734-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Dmitry Torokhov <dmitry.torokhov@gmail.com>

On 12/09/2015 02:44 PM, Linus Walleij wrote:
> This makes the driver use the data pointer added to the gpio_chip
> to store a pointer to the state container instead of relying on
> container_of().
>
> Cc: Michael Hennerich <michael.hennerich@analog.com>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Michael Hennerich <michael.hennerich@analog.com>

> ---
> Dmitry: please ACK this so I can take it through the GPIO tree.
> ---
>   drivers/input/keyboard/adp5588-keys.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/input/keyboard/adp5588-keys.c b/drivers/input/keyboard/adp5588-keys.c
> index 21a62d0fa764..53fe9a3fb620 100644
> --- a/drivers/input/keyboard/adp5588-keys.c
> +++ b/drivers/input/keyboard/adp5588-keys.c
> @@ -73,7 +73,7 @@ static int adp5588_write(struct i2c_client *client, u8 reg, u8 val)
>   #ifdef CONFIG_GPIOLIB
>   static int adp5588_gpio_get_value(struct gpio_chip *chip, unsigned off)
>   {
> -	struct adp5588_kpad *kpad = container_of(chip, struct adp5588_kpad, gc);
> +	struct adp5588_kpad *kpad = gpiochip_get_data(chip);
>   	unsigned int bank = ADP5588_BANK(kpad->gpiomap[off]);
>   	unsigned int bit = ADP5588_BIT(kpad->gpiomap[off]);
>   	int val;
> @@ -93,7 +93,7 @@ static int adp5588_gpio_get_value(struct gpio_chip *chip, unsigned off)
>   static void adp5588_gpio_set_value(struct gpio_chip *chip,
>   				   unsigned off, int val)
>   {
> -	struct adp5588_kpad *kpad = container_of(chip, struct adp5588_kpad, gc);
> +	struct adp5588_kpad *kpad = gpiochip_get_data(chip);
>   	unsigned int bank = ADP5588_BANK(kpad->gpiomap[off]);
>   	unsigned int bit = ADP5588_BIT(kpad->gpiomap[off]);
>
> @@ -112,7 +112,7 @@ static void adp5588_gpio_set_value(struct gpio_chip *chip,
>
>   static int adp5588_gpio_direction_input(struct gpio_chip *chip, unsigned off)
>   {
> -	struct adp5588_kpad *kpad = container_of(chip, struct adp5588_kpad, gc);
> +	struct adp5588_kpad *kpad = gpiochip_get_data(chip);
>   	unsigned int bank = ADP5588_BANK(kpad->gpiomap[off]);
>   	unsigned int bit = ADP5588_BIT(kpad->gpiomap[off]);
>   	int ret;
> @@ -130,7 +130,7 @@ static int adp5588_gpio_direction_input(struct gpio_chip *chip, unsigned off)
>   static int adp5588_gpio_direction_output(struct gpio_chip *chip,
>   					 unsigned off, int val)
>   {
> -	struct adp5588_kpad *kpad = container_of(chip, struct adp5588_kpad, gc);
> +	struct adp5588_kpad *kpad = gpiochip_get_data(chip);
>   	unsigned int bank = ADP5588_BANK(kpad->gpiomap[off]);
>   	unsigned int bit = ADP5588_BIT(kpad->gpiomap[off]);
>   	int ret;
> @@ -210,7 +210,7 @@ static int adp5588_gpio_add(struct adp5588_kpad *kpad)
>
>   	mutex_init(&kpad->gpio_lock);
>
> -	error = gpiochip_add(&kpad->gc);
> +	error = gpiochip_add_data(&kpad->gc, kpad);
>   	if (error) {
>   		dev_err(dev, "gpiochip_add failed, err: %d\n", error);
>   		return error;
>


-- 
Greetings,
Michael

--
Analog Devices GmbH      Wilhelm-Wagenfeld-Str. 6      80807 Muenchen
Sitz der Gesellschaft: Muenchen; Registergericht: Muenchen HRB 40368;
Geschaeftsfuehrer:Dr.Carsten Suckrow, Thomas Wessel, William A. Martin,
Margaret Seif
