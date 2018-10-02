From: Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [PATCH v4 3/3] gpiolib: Show correct direction from the beginning
Date: Tue, 2 Oct 2018 09:21:22 -0600
Message-ID: <d1bbafcb-1b6a-b137-1fd1-954c17e14836@codeaurora.org>
References: <20181002140858.16833-1-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181002140858.16833-1-ricardo.ribalda@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Timur Tabi <timur@kernel.org>, swboyd@chromium.org, linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On 10/2/2018 8:08 AM, Ricardo Ribalda Delgado wrote:
> Current code assumes that the direction is input if direction_input
> function is set.
> This might not be the case on GPIOs with programmable direction.
> 
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

I'll try to get this series tested on QDF2400 by the end of the week.

> ---
> Changelog v4:
> 
> timur@kernel.org:
> Remove REVISIT comment
> 
>   drivers/gpio/gpiolib.c | 27 +++++++++++++--------------
>   1 file changed, 13 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 6925196136ce..cad859fece65 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1344,20 +1344,6 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
>   
>   	spin_unlock_irqrestore(&gpio_lock, flags);
>   
> -	for (i = 0; i < chip->ngpio; i++) {
> -		struct gpio_desc *desc = &gdev->descs[i];
> -
> -		desc->gdev = gdev;
> -
> -		/* REVISIT: most hardware initializes GPIOs as inputs (often
> -		 * with pullups enabled) so power usage is minimized. Linux
> -		 * code should set the gpio direction first thing; but until
> -		 * it does, and in case chip->get_direction is not set, we may
> -		 * expose the wrong direction in sysfs.
> -		 */
> -		desc->flags = !chip->direction_input ? (1 << FLAG_IS_OUT) : 0;
> -	}
> -
>   #ifdef CONFIG_PINCTRL
>   	INIT_LIST_HEAD(&gdev->pin_ranges);
>   #endif
> @@ -1374,6 +1360,19 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
>   	if (status)
>   		goto err_remove_irqchip_mask;
>   
> +	for (i = 0; i < chip->ngpio; i++) {
> +		struct gpio_desc *desc = &gdev->descs[i];
> +
> +		desc->gdev = gdev;
> +
> +		if (chip->get_direction && gpiochip_line_is_valid(chip, i))
> +			desc->flags = !chip->get_direction(chip, i) ?
> +					(1 << FLAG_IS_OUT) : 0;
> +		else
> +			desc->flags = !chip->direction_input ?
> +					(1 << FLAG_IS_OUT) : 0;
> +	}
> +
>   	status = gpiochip_add_irqchip(chip, lock_key, request_key);
>   	if (status)
>   		goto err_remove_chip;
> 


-- 
Jeffrey Hugo
Qualcomm Datacenter Technologies as an affiliate of Qualcomm 
Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
