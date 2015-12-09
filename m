From: David Daney <ddaney@caviumnetworks.com>
Subject: Re: [PATCH 045/182] gpio: octeon: use gpiochip data pointer
Date: Wed, 9 Dec 2015 09:42:29 -0800
Message-ID: <56686805.8030804@caviumnetworks.com>
References: <1449667142-31883-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bl2on0085.outbound.protection.outlook.com ([65.55.169.85]:32256
	"EHLO na01-bl2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1750994AbbLIUOj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 9 Dec 2015 15:14:39 -0500
In-Reply-To: <1449667142-31883-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, David Daney <david.daney@cavium.com>

On 12/09/2015 05:19 AM, Linus Walleij wrote:
> This makes the driver use the data pointer added to the gpio_chip
> to store a pointer to the state container instead of relying on
> container_of().
>
> Cc: David Daney <david.daney@cavium.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

This seems sane.

Reviewed-by: David Daney <david.daney@cavium.com>



> ---
>   drivers/gpio/gpio-octeon.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpio/gpio-octeon.c b/drivers/gpio/gpio-octeon.c
> index afbb2417dfbc..7665ebcd0c1d 100644
> --- a/drivers/gpio/gpio-octeon.c
> +++ b/drivers/gpio/gpio-octeon.c
> @@ -41,7 +41,7 @@ struct octeon_gpio {
>
>   static int octeon_gpio_dir_in(struct gpio_chip *chip, unsigned offset)
>   {
> -	struct octeon_gpio *gpio = container_of(chip, struct octeon_gpio, chip);
> +	struct octeon_gpio *gpio = gpiochip_get_data(chip);
>
>   	cvmx_write_csr(gpio->register_base + bit_cfg_reg(offset), 0);
>   	return 0;
> @@ -49,7 +49,7 @@ static int octeon_gpio_dir_in(struct gpio_chip *chip, unsigned offset)
>
>   static void octeon_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
>   {
> -	struct octeon_gpio *gpio = container_of(chip, struct octeon_gpio, chip);
> +	struct octeon_gpio *gpio = gpiochip_get_data(chip);
>   	u64 mask = 1ull << offset;
>   	u64 reg = gpio->register_base + (value ? TX_SET : TX_CLEAR);
>   	cvmx_write_csr(reg, mask);
> @@ -58,7 +58,7 @@ static void octeon_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
>   static int octeon_gpio_dir_out(struct gpio_chip *chip, unsigned offset,
>   			       int value)
>   {
> -	struct octeon_gpio *gpio = container_of(chip, struct octeon_gpio, chip);
> +	struct octeon_gpio *gpio = gpiochip_get_data(chip);
>   	union cvmx_gpio_bit_cfgx cfgx;
>
>   	octeon_gpio_set(chip, offset, value);
> @@ -72,7 +72,7 @@ static int octeon_gpio_dir_out(struct gpio_chip *chip, unsigned offset,
>
>   static int octeon_gpio_get(struct gpio_chip *chip, unsigned offset)
>   {
> -	struct octeon_gpio *gpio = container_of(chip, struct octeon_gpio, chip);
> +	struct octeon_gpio *gpio = gpiochip_get_data(chip);
>   	u64 read_bits = cvmx_read_csr(gpio->register_base + RX_DAT);
>
>   	return ((1ull << offset) & read_bits) != 0;
> @@ -117,7 +117,7 @@ static int octeon_gpio_probe(struct platform_device *pdev)
>   	chip->get = octeon_gpio_get;
>   	chip->direction_output = octeon_gpio_dir_out;
>   	chip->set = octeon_gpio_set;
> -	err = gpiochip_add(chip);
> +	err = gpiochip_add_data(chip, gpio);
>   	if (err)
>   		goto out;
>
>

