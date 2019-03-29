From: Mukesh Ojha <mojha@codeaurora.org>
Subject: Re: [PATCH] gpio: of: Optimize quirk checks
Date: Fri, 29 Mar 2019 15:32:20 +0530
Message-ID: <2aa29620-13c9-e618-93e9-dedc464cfa74@codeaurora.org>
References: <20190329084229.17018-1-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190329084229.17018-1-geert+renesas@glider.be>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org


On 3/29/2019 2:12 PM, Geert Uytterhoeven wrote:
> Simple string comparisons are cheaper than DT lookups, as the latter
> involve taking a spinlock and traversing properties.
> Hence optimize quirk checks by postponing DT lookups after string
> comparisons.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>


Looks good to me.

Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

Cheers,
-Mukesh

> ---
>   drivers/gpio/gpiolib-of.c | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index 6a3ec575a404ed9f..3a6bb53d89dfed32 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -86,9 +86,9 @@ static void of_gpio_flags_quirks(struct device_node *np,
>   	if (IS_ENABLED(CONFIG_REGULATOR) &&
>   	    (of_device_is_compatible(np, "regulator-fixed") ||
>   	     of_device_is_compatible(np, "reg-fixed-voltage") ||
> -	     (of_device_is_compatible(np, "regulator-gpio") &&
> -	      !(strcmp(propname, "enable-gpio") &&
> -	        strcmp(propname, "enable-gpios"))))) {
> +	     (!(strcmp(propname, "enable-gpio") &&
> +		strcmp(propname, "enable-gpios")) &&
> +	      of_device_is_compatible(np, "regulator-gpio")))) {
>   		/*
>   		 * The regulator GPIO handles are specified such that the
>   		 * presence or absence of "enable-active-high" solely controls
> @@ -119,9 +119,8 @@ static void of_gpio_flags_quirks(struct device_node *np,
>   	 * property named "cs-gpios" we need to inspect the child node
>   	 * to determine if the flags should have inverted semantics.
>   	 */
> -	if (IS_ENABLED(CONFIG_SPI_MASTER) &&
> -	    of_property_read_bool(np, "cs-gpios") &&
> -	    !strcmp(propname, "cs-gpios")) {
> +	if (IS_ENABLED(CONFIG_SPI_MASTER) && !strcmp(propname, "cs-gpios") &&
> +	    of_property_read_bool(np, "cs-gpios")) {
>   		struct device_node *child;
>   		u32 cs;
>   		int ret;
