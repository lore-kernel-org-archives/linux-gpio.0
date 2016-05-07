From: Colin Pitrat <colin.pitrat@gmail.com>
Subject: Re: [PATCH] gpio: sch: Fix Oops on module load on Asus Eee PC 1201
Date: Sat, 7 May 2016 20:37:53 +0100
Message-ID: <20160507193751.GA1159@pitrat4.localdomain>
References: <20160506214917.GA1691@pitrat4.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:35676 "EHLO
	mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750924AbcEGTiC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 7 May 2016 15:38:02 -0400
Content-Disposition: inline
In-Reply-To: <20160506214917.GA1691@pitrat4.localdomain>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: rebecca.swee.fun.chang@intel.com, mika.westerberg@linux.intel.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, May 06, 2016 at 10:49:23PM +0100, Colin Pitrat wrote:
> This fixes the issue descirbe in bug 117531. 
> It's a regression introduced in linux 4.5 that causes a Oops at load of
> gpio_sch and prevents powering off the computer.
> 
> The patch consist in reverting commit 737c8fccf1c5b2aae3c6d9a66dce17e35fc39b71 
> (a.k.a 'gpio: sch: use gpiochip data pointer') that causes this regression.
> However, although it does work for me, I'm not sure of the impact of reverting
> only this part of the patch.
> 
> Signed-off-by: Colin Pitrat <colin.pitrat@gmail.com>
> 
> ---
>  drivers/gpio/gpio-sch.c | 23 +++++++++++++++++------
>  1 file changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-sch.c b/drivers/gpio/gpio-sch.c
> index e85e753..a8a333ad 100644
> --- a/drivers/gpio/gpio-sch.c
> +++ b/drivers/gpio/gpio-sch.c
> @@ -41,6 +41,8 @@ struct sch_gpio {
>  	unsigned short resume_base;
>  };
>  
> +#define to_sch_gpio(gc)	container_of(gc, struct sch_gpio, chip)
> +
>  static unsigned sch_gpio_offset(struct sch_gpio *sch, unsigned gpio,
>  				unsigned reg)
>  {
> @@ -63,7 +65,7 @@ static unsigned sch_gpio_bit(struct sch_gpio *sch, unsigned gpio)
>  
>  static int sch_gpio_reg_get(struct gpio_chip *gc, unsigned gpio, unsigned reg)
>  {
> -	struct sch_gpio *sch = gpiochip_get_data(gc);
> +	struct sch_gpio *sch = to_sch_gpio(gc);
>  	unsigned short offset, bit;
>  	u8 reg_val;
>  
> @@ -78,7 +80,7 @@ static int sch_gpio_reg_get(struct gpio_chip *gc, unsigned gpio, unsigned reg)
>  static void sch_gpio_reg_set(struct gpio_chip *gc, unsigned gpio, unsigned reg,
>  			     int val)
>  {
> -	struct sch_gpio *sch = gpiochip_get_data(gc);
> +	struct sch_gpio *sch = to_sch_gpio(gc);
>  	unsigned short offset, bit;
>  	u8 reg_val;
>  
> @@ -95,7 +97,7 @@ static void sch_gpio_reg_set(struct gpio_chip *gc, unsigned gpio, unsigned reg,
>  
>  static int sch_gpio_direction_in(struct gpio_chip *gc, unsigned gpio_num)
>  {
> -	struct sch_gpio *sch = gpiochip_get_data(gc);
> +	struct sch_gpio *sch = to_sch_gpio(gc);
>  
>  	spin_lock(&sch->lock);
>  	sch_gpio_reg_set(gc, gpio_num, GIO, 1);
> @@ -110,7 +112,7 @@ static int sch_gpio_get(struct gpio_chip *gc, unsigned gpio_num)
>  
>  static void sch_gpio_set(struct gpio_chip *gc, unsigned gpio_num, int val)
>  {
> -	struct sch_gpio *sch = gpiochip_get_data(gc);
> +	struct sch_gpio *sch = to_sch_gpio(gc);
>  
>  	spin_lock(&sch->lock);
>  	sch_gpio_reg_set(gc, gpio_num, GLV, val);
> @@ -120,7 +122,7 @@ static void sch_gpio_set(struct gpio_chip *gc, unsigned gpio_num, int val)
>  static int sch_gpio_direction_out(struct gpio_chip *gc, unsigned gpio_num,
>  				  int val)
>  {
> -	struct sch_gpio *sch = gpiochip_get_data(gc);
> +	struct sch_gpio *sch = to_sch_gpio(gc);
>  
>  	spin_lock(&sch->lock);
>  	sch_gpio_reg_set(gc, gpio_num, GIO, 0);
> @@ -215,7 +217,15 @@ static int sch_gpio_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, sch);
>  
> -	return devm_gpiochip_add_data(&pdev->dev, &sch->chip, sch);
> +	return gpiochip_add(&sch->chip);
> +}
> +
> +static int sch_gpio_remove(struct platform_device *pdev)
> +{
> +	struct sch_gpio *sch = platform_get_drvdata(pdev);
> +
> +	gpiochip_remove(&sch->chip);
> +	return 0;
>  }
>  
>  static struct platform_driver sch_gpio_driver = {
> @@ -223,6 +233,7 @@ static struct platform_driver sch_gpio_driver = {
>  		.name = "sch_gpio",
>  	},
>  	.probe		= sch_gpio_probe,
> +	.remove		= sch_gpio_remove,
>  };
>  
>  module_platform_driver(sch_gpio_driver);
> -- 
> 2.8.2
> 

Oups sorry, this patch is wrong !
It reverts two changes instead of just the one causing the issue.
I'll send a v2 with only the required change reverted.

Sorry for the inconvenience.
