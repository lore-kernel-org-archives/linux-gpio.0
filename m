From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH] gpio: gpiolib: use devm_* API to simplify driver code
Date: Tue, 25 Aug 2015 11:38:47 +0300
Message-ID: <55DC2997.9030705@ti.com>
References: <1440417930-15876-1-git-send-email-van.freenix@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1440417930-15876-1-git-send-email-van.freenix@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peng Fan <van.freenix@gmail.com>, linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On 08/24/2015 03:05 PM, Peng Fan wrote:
> Use devm_* API to simplify driver code.
>
> Signed-off-by: Peng Fan <van.freenix@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
  ---
>   drivers/gpio/gpiolib.c | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 6bc612b..f9470b0 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -243,7 +243,8 @@ int gpiochip_add(struct gpio_chip *chip)
>   	int		base = chip->base;
>   	struct gpio_desc *descs;
>
> -	descs = kcalloc(chip->ngpio, sizeof(descs[0]), GFP_KERNEL);
> +	descs = devm_kcalloc(chip->dev, chip->ngpio, sizeof(descs[0]),
> +			     GFP_KERNEL);

^ above will not work for every one as NOT all GPIO drivers
implemented using dev/drv model, so chip->dev could be not set
(at least it was true when I've checked it last time).




-- 
regards,
-grygorii
