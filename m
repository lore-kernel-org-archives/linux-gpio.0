From: Mukesh Ojha <mojha@codeaurora.org>
Subject: Re: [PATCH 1/3] gpio: of: Fix of_gpiochip_add() error path
Date: Thu, 28 Mar 2019 21:07:10 +0530
Message-ID: <144289c1-4051-5a2f-3e8d-f1d5a44661c3@codeaurora.org>
References: <20190328131349.18838-1-geert+renesas@glider.be>
 <20190328131349.18838-2-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190328131349.18838-2-geert+renesas@glider.be>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Benoit Parrot <bparrot@ti.com>, Laxman Dewangan <ldewangan@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org


On 3/28/2019 6:43 PM, Geert Uytterhoeven wrote:
> If the call to of_gpiochip_scan_gpios() in of_gpiochip_add() fails, no
> error handling is performed.  This lead to the need of callers to call
> of_gpiochip_remove() on failure, which causes "BAD of_node_put() on ..."
> if the failure happened before the call to of_node_get().
>
> Fix this by adding proper error handling.
>
> Note that calling gpiochip_remove_pin_ranges() multiple times causes no
> harm: subsequent calls are a no-op.
>
> Fixes: dfbd379ba9b7431e ("gpio: of: Return error if gpio hog configuration failed")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>


Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

-Mukesh

> ---
>   drivers/gpio/gpiolib-of.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index 8b9c3ab70f6eade4..257be7bac032a855 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -717,7 +717,13 @@ int of_gpiochip_add(struct gpio_chip *chip)
>   
>   	of_node_get(chip->of_node);
>   
> -	return of_gpiochip_scan_gpios(chip);
> +	status = of_gpiochip_scan_gpios(chip);
> +	if (status) {
> +		of_node_put(chip->of_node);
> +		gpiochip_remove_pin_ranges(chip);
> +	}
> +
> +	return status;
>   }
>   
>   void of_gpiochip_remove(struct gpio_chip *chip)
