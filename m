From: Alex Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH v2 2/5] gpiolib: introduce chip_* to print with chip->label
 prefix
Date: Thu, 5 Dec 2013 11:22:07 +0900
Message-ID: <529FE34F.3040704@nvidia.com>
References: <1386164580-32288-1-git-send-email-andriy.shevchenko@linux.intel.com> <1386164580-32288-3-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:5790 "EHLO
	hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751994Ab3LECWL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2013 21:22:11 -0500
In-Reply-To: <1386164580-32288-3-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>

On 12/04/2013 10:42 PM, Andy Shevchenko wrote:
> In several places we are printing messages with prefix based on chip->label.
> Introduced macros help us to do this easier and in uniform way.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>   drivers/gpio/gpiolib.c | 41 ++++++++++++++++++++++++++---------------
>   1 file changed, 26 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 7cf3f84..70e560c 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -85,6 +85,8 @@ static DEFINE_IDR(dirent_idr);
>   static int gpiod_request(struct gpio_desc *desc, const char *label);
>   static void gpiod_free(struct gpio_desc *desc);
>
> +/* With descriptor prefix */
> +
>   #ifdef CONFIG_DEBUG_FS
>   #define gpiod_emerg(desc, fmt, ...)					       \
>   	pr_emerg("gpio-%d (%s): " fmt, desc_to_gpio(desc), desc->label ? : "?",\
> @@ -119,6 +121,21 @@ static void gpiod_free(struct gpio_desc *desc);
>   	pr_debug("gpio-%d: " fmt, desc_to_gpio(desc), ##__VA_ARGS__)
>   #endif
>
> +/* With chip prefix */
> +
> +#define chip_emerg(chip, fmt, ...)					\
> +	pr_emerg("%s: GPIO chip: " fmt, chip->label, ##__VA_ARGS__)
> +#define chip_crit(chip, fmt, ...)					\
> +	pr_crit("%s: GPIO chip: " fmt, chip->label, ##__VA_ARGS__)
> +#define chip_err(chip, fmt, ...)					\
> +	pr_err("%s: GPIO chip: " fmt, chip->label, ##__VA_ARGS__)
> +#define chip_warn(chip, fmt, ...)					\
> +	pr_warn("%s: GPIO chip: " fmt, chip->label, ##__VA_ARGS__)
> +#define chip_info(chip, fmt, ...)					\
> +	pr_info("%s: GPIO chip: " fmt, chip->label, ##__VA_ARGS__)
> +#define chip_dbg(chip, fmt, ...)					\
> +	pr_debug("%s: GPIO chip: " fmt, chip->label, ##__VA_ARGS__)

One last comment on this: how about using "GPIO chip %s: " for message 
prefix instead? (less ':' and less characters overall).
