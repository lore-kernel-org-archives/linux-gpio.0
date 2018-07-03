From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH] gpiolib: Defer on non-DT find_chip_by_name() failure
Date: Tue, 3 Jul 2018 19:31:41 +0200
Message-ID: <20180703193141.747fa950@bbrezillon>
References: <20180703172635.32508-1-jmkrzyszt@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180703172635.32508-1-jmkrzyszt@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi Janusz,

On Tue,  3 Jul 2018 19:26:35 +0200
Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote:

> Avoid replication of error code conversion in non-DT GPIO consumers'
> code by returning -EPROBE_DEFER from gpiod_find() in case a chip
> identified by its label in a registered lookup table is not ready.
> 
> See https://lkml.org/lkml/2018/5/30/176 for example case.
> 
> Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> ---
> If accepted, please add
> 	Suggested-by: Boris Brezillon <boris.brezillon@bootlin.com>
> if Boris doesn't mind.
> 
> Thanks,
> Janusz
> 
>  drivers/gpio/gpiolib.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index e11a3bb03820..15dc77c80328 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -3639,9 +3639,16 @@ static struct gpio_desc *gpiod_find(struct device *dev, const char *con_id,
>  		chip = find_chip_by_name(p->chip_label);
>  
>  		if (!chip) {
> -			dev_err(dev, "cannot find GPIO chip %s\n",
> -				p->chip_label);
> -			return ERR_PTR(-ENODEV);
> +			/*
> +			 * As the lookup table indicates a chip with
> +			 * p->chip_label should exist, assume it may
> +			 * still appear latar and let the interested

					^ later

> +			 * consumer be probed again or let the Deferred
> +			 * Probe infrastructure handle the error.
> +			 */
> +			dev_warn(dev, "cannot find GPIO chip %s, deferring\n",
> +				 p->chip_label);
> +			return ERR_PTR(-EPROBE_DEFER);
>  		}
>  
>  		if (chip->ngpio <= p->chip_hwnum) {

Looks good otherwise. Let's hope we're not breaking implementations
testing for -ENODEV...

Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>

Regards,

Boris
