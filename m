From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] gpio: handle compatible ioctl() pointers
Date: Fri, 27 May 2016 10:22:22 -0700
Message-ID: <20160527172222.GB25540@dtor-ws>
References: <1464352373-25108-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f66.google.com ([209.85.220.66]:34916 "EHLO
	mail-pa0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756010AbcE0RW0 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 27 May 2016 13:22:26 -0400
Received: by mail-pa0-f66.google.com with SMTP id gp3so6400989pac.2
        for <linux-gpio@vger.kernel.org>; Fri, 27 May 2016 10:22:26 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1464352373-25108-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>

On Fri, May 27, 2016 at 02:32:53PM +0200, Linus Walleij wrote:
> If we're using the compatible ioctl() we need to handle the
> argument pointer in a special way or there will be trouble.
> 
> Fixes: 3c702e9987e2 ("gpio: add a userspace chardev ABI for GPIOs")
> Reported-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

> ---
>  drivers/gpio/gpiolib.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index e901d2666b46..f1ef27014e6e 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -20,6 +20,7 @@
>  #include <linux/cdev.h>
>  #include <linux/fs.h>
>  #include <linux/uaccess.h>
> +#include <linux/compat.h>
>  #include <uapi/linux/gpio.h>
>  
>  #include "gpiolib.h"
> @@ -316,7 +317,7 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  {
>  	struct gpio_device *gdev = filp->private_data;
>  	struct gpio_chip *chip = gdev->chip;
> -	int __user *ip = (int __user *)arg;
> +	void __user *ip = (void __user *)arg;
>  
>  	/* We fail any subsequent ioctl():s when the chip is gone */
>  	if (!chip)
> @@ -388,6 +389,14 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  	return -EINVAL;
>  }
>  
> +#ifdef CONFIG_COMPAT
> +static long gpio_ioctl_compat(struct file *filp, unsigned int cmd,
> +			      unsigned long arg)
> +{
> +	return gpio_ioctl(filep, cmd, (unsigned long)compat_ptr(arg));
> +}
> +#endif
> +
>  /**
>   * gpio_chrdev_open() - open the chardev for ioctl operations
>   * @inode: inode for this chardev
> @@ -431,7 +440,9 @@ static const struct file_operations gpio_fileops = {
>  	.owner = THIS_MODULE,
>  	.llseek = noop_llseek,
>  	.unlocked_ioctl = gpio_ioctl,
> -	.compat_ioctl = gpio_ioctl,
> +#ifdef CONFIG_COMPAT
> +	.compat_ioctl = gpio_ioctl_compat,
> +#endif
>  };
>  
>  static void gpiodevice_release(struct device *dev)
> -- 
> 2.4.11
> 

-- 
Dmitry
