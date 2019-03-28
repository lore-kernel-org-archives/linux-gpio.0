From: Mukesh Ojha <mojha@codeaurora.org>
Subject: Re: [PATCH 3/3] gpio: Remove obsolete comment about
 gpiochip_free_hogs() usage
Date: Thu, 28 Mar 2019 20:31:48 +0530
Message-ID: <ff6d95d6-9022-4cab-bc53-bb9ffd14ed68@codeaurora.org>
References: <20190328131349.18838-1-geert+renesas@glider.be>
 <20190328131349.18838-4-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190328131349.18838-4-geert+renesas@glider.be>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Benoit Parrot <bparrot@ti.com>, Laxman Dewangan <ldewangan@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org


On 3/28/2019 6:43 PM, Geert Uytterhoeven wrote:
> gpiochip_free_hogs() was always called from gpiochip_remove(), not
> of_gpiochip_remove().  It is now also called from the failure patch in
> gpiochip_add_data_with_key().
>
> Fixes: f625d4601759f1cf ("gpio: add GPIO hogging mechanism")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>


Looks good to be removed.
Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

-Mukesh

> ---
>   drivers/gpio/gpiolib.c | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index ed4da07effe0ac40..ec326bd84b1f1c50 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -4449,8 +4449,6 @@ int gpiod_hog(struct gpio_desc *desc, const char *name,
>   /**
>    * gpiochip_free_hogs - Scan gpio-controller chip and release GPIO hog
>    * @chip:	gpio chip to act on
> - *
> - * This is only used by of_gpiochip_remove to free hogged gpios
>    */
>   static void gpiochip_free_hogs(struct gpio_chip *chip)
>   {
