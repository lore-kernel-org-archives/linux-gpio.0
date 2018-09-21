From: Timur Tabi <timur@kernel.org>
Subject: Re: [PATCH v2] gpiolib: Show correct direction from the beginning
Date: Fri, 21 Sep 2018 07:25:14 -0500
Message-ID: <7bda989e-3a7d-8a95-78b0-60b79e414245@kernel.org>
References: <20180921103604.13361-1-ricardo.ribalda@gmail.com>
 <20180921103604.13361-2-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180921103604.13361-2-ricardo.ribalda@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jeffrey Hugo <jhugo@codeaurora.org>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, swboyd@chromium.org, linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Jeff, can you test these two patches on Amberwing to make sure that they 
don't cause an XPU violation on boot?

The call to gpiochip_line_is_valid() should return false on any GPIOs 
that aren't listed in the ACPI table.

My concern is that this patch might be calling gpiochip_line_is_valid() 
too early, before all the arrays have been set up.

Thanks.

On 9/21/18 5:36 AM, Ricardo Ribalda Delgado wrote:
> Current code assumes that the direction is input if direction_input
> function is set.
> This might not be the case on GPIOs with programmable direction.
> 
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>   drivers/gpio/gpiolib.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 4b45de883ada..00c17f64d9ff 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1352,7 +1352,12 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
>   		 * it does, and in case chip->get_direction is not set, we may
>   		 * expose the wrong direction in sysfs.
>   		 */
> -		desc->flags = !chip->direction_input ? (1 << FLAG_IS_OUT) : 0;
> +		if (chip->get_direction && gpiochip_line_is_valid(chip, i))
> +			desc->flags = !chip->get_direction(chip, i) ?
> +					(1 << FLAG_IS_OUT) : 0;
> +		else
> +			desc->flags = !chip->direction_input ?
> +					(1 << FLAG_IS_OUT) : 0;
>   	}
>   
>   #ifdef CONFIG_PINCTRL
> 
