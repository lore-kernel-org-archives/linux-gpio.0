From: Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [PATCH v5 3/3] gpiolib: Show correct direction from the beginning
Date: Fri, 5 Oct 2018 10:17:55 -0600
Message-ID: <8d10f9b4-7ea9-7d27-478a-39982ba49587@codeaurora.org>
References: <20181005065300.22882-1-ricardo.ribalda@gmail.com>
 <20181005065300.22882-3-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181005065300.22882-3-ricardo.ribalda@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Timur Tabi <timur@kernel.org>, Stephen Boyd <swboyd@chromium.org>, linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On 10/5/2018 12:53 AM, Ricardo Ribalda Delgado wrote:
> Current code assumes that the direction is input if direction_input
> function is set.
> This might not be the case on GPIOs with programmable direction.
> 
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>   drivers/gpio/gpiolib.c | 27 +++++++++++++--------------
>   1 file changed, 13 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 907019b67a58..e016b22658ff 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1349,20 +1349,6 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
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
> @@ -1391,6 +1377,19 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
>   	if (status)
>   		goto err_remove_chip;
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
>   	acpi_gpiochip_add(chip);
>   
>   	machine_gpiochip_add(chip);
> 

We have a successful boot this time.

Timur I see:
ubuntu@ubuntu:~$ dmesg | grep gpio
[    7.388887] gpiochip_find_base: found new base at 362
[    7.433186] gpio gpiochip0: (QCOM8002:00): added GPIO chardev (254:0)
[    7.433218] gpiochip_setup_dev: registered GPIOs 362 to 511 on 
device: gpiochip0 (QCOM8002:00)
[    7.433222] gpio gpiochip0: (QCOM8002:00): created GPIO range 0->149 
==> QCOM8002:00 PIN 0->149

Looks like the driver is initing just fine to me.  Is setting up the 
jumpers and running gpio-test warranted?

-- 
Jeffrey Hugo
Qualcomm Datacenter Technologies as an affiliate of Qualcomm 
Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
