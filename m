From: Michael Welling <mwelling@ieee.org>
Subject: Re: [PATCH 1/4] gpio: userspace ABI for reading/writing GPIO lines
Date: Thu, 2 Jun 2016 13:12:32 -0500
Message-ID: <20160602181219.GA8154@deathstar>
References: <1464868289-1766-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:34656 "EHLO
	mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752285AbcFBSMo (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Jun 2016 14:12:44 -0400
Received: by mail-pf0-f196.google.com with SMTP id c84so8769715pfc.1
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jun 2016 11:12:43 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1464868289-1766-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Markus Pargmann <mpa@pengutronix.de>, Lee Campbell <leecam@google.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>

On Thu, Jun 02, 2016 at 01:51:26PM +0200, Linus Walleij wrote:
> This adds a userspace ABI for reading and writing GPIO lines.
> The mechanism returns an anonymous file handle to a request
> to read/write n offsets from a gpiochip. This file handle
> in turn accepts two ioctl()s: one that reads and one that
> writes values to the selected lines.
> 
> - Handles can be requested as input/output, active low,
>   open drain, open source, however when you issue a request
>   for n lines with GPIO_GET_LINEHANDLE_IOCTL, they must all
>   have the same flags, i.e. all inputs or all outputs, all
>   open drain etc. If a granular control of the flags for
>   each line is desired, they need to be requested
>   individually, not in a batch.
> 
> - The GPIOHANDLE_GET_LINE_VALUES_IOCTL read ioctl() can be
>   issued also to output lines to verify that the hardware
>   is in the expected state.
> 
> - It reads and writes up to GPIOHANDLES_MAX lines at once,
>   utilizing the .set_multiple() call in the driver if
>   possible, making the call efficient if several lines
>   can be written with a single register update.
> 
> The limitation of GPIOHANDLES_MAX to 64 lines is done under
> the assumption that we may expect hardware that can issue a
> transaction updating 64 bits at an instant but unlikely
> anything larger than that.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

The SPI based gpio controllers do not invoke a warning anymore when using this
interface.

Acked-by: Michael Welling <mwelling@ieee.org>

> ---
> ChangeLog v2->v3:
> - Use gpiod_get_value_cansleep() so we support also slowpath
>   GPIO drivers.
> - Fix up the UAPI docs kerneldoc.
> - Allocate the anonymous fd last, so that the release
>   function don't get called until that point of something
>   fails. After this point, skip the errorpath.
> ChangeLog v1->v2:
> - Handle ioctl_compat() properly based on a similar patch
>   to the other ioctl() handling code.
> - Use _IOWR() as we pass pointers both in and out of the
>   ioctl()
> - Use kmalloc() and kfree() for the linehandled, do not
>   try to be fancy with devm_* it doesn't work the way I
>   thought.
> - Fix const-correctness on the linehandle name field.
> ---
>  drivers/gpio/gpiolib.c    | 193 ++++++++++++++++++++++++++++++++++++++++++++++
>  include/uapi/linux/gpio.h |  61 ++++++++++++++-
>  2 files changed, 251 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 68dbff5d8f57..8cfb06410ba7 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -21,6 +21,7 @@
>  #include <linux/fs.h>
>  #include <linux/uaccess.h>
>  #include <linux/compat.h>
> +#include <linux/anon_inodes.h>
>  #include <uapi/linux/gpio.h>
>  
>  #include "gpiolib.h"
> @@ -310,6 +311,196 @@ static int gpiochip_set_desc_names(struct gpio_chip *gc)
>  	return 0;
>  }
>  
> +/*
> + * GPIO line handle management
> + */
> +
> +/**
> + * struct linehandle_state - contains the state of a userspace handle
> + * @gdev: the GPIO device the handle pertains to
> + * @label: consumer label used to tag descriptors
> + * @descs: the GPIO descriptors held by this handle
> + * @numdescs: the number of descriptors held in the descs array
> + */
> +struct linehandle_state {
> +	struct gpio_device *gdev;
> +	const char *label;
> +	struct gpio_desc *descs[GPIOHANDLES_MAX];
> +	u32 numdescs;
> +};
> +
> +static long linehandle_ioctl(struct file *filep, unsigned int cmd,
> +			     unsigned long arg)
> +{
> +	struct linehandle_state *lh = filep->private_data;
> +	void __user *ip = (void __user *)arg;
> +	struct gpiohandle_data ghd;
> +	int i;
> +
> +	if (cmd == GPIOHANDLE_GET_LINE_VALUES_IOCTL) {
> +		int val;
> +
> +		/* TODO: check if descriptors are really input */
> +		for (i = 0; i < lh->numdescs; i++) {
> +			val = gpiod_get_value_cansleep(lh->descs[i]);
> +			if (val < 0)
> +				return val;
> +			ghd.values[i] = val;
> +		}
> +
> +		if (copy_to_user(ip, &ghd, sizeof(ghd)))
> +			return -EFAULT;
> +
> +		return 0;
> +	} else if (cmd == GPIOHANDLE_SET_LINE_VALUES_IOCTL) {
> +		int vals[GPIOHANDLES_MAX];
> +
> +		/* TODO: check if descriptors are really output */
> +		if (copy_from_user(&ghd, ip, sizeof(ghd)))
> +			return -EFAULT;
> +
> +		/* Clamp all values to [0,1] */
> +		for (i = 0; i < lh->numdescs; i++)
> +			vals[i] = !!ghd.values[i];
> +
> +		/* Reuse the array setting function */
> +		gpiod_set_array_value_complex(false,
> +					      true,
> +					      lh->numdescs,
> +					      lh->descs,
> +					      vals);
> +		return 0;
> +	}
> +	return -EINVAL;
> +}
> +
> +#ifdef CONFIG_COMPAT
> +static long linehandle_ioctl_compat(struct file *filep, unsigned int cmd,
> +			     unsigned long arg)
> +{
> +	return linehandle_ioctl(filep, cmd, (unsigned long)compat_ptr(arg));
> +}
> +#endif
> +
> +static int linehandle_release(struct inode *inode, struct file *filep)
> +{
> +	struct linehandle_state *lh = filep->private_data;
> +	struct gpio_device *gdev = lh->gdev;
> +	int i;
> +
> +	for (i = 0; i < lh->numdescs; i++)
> +		gpiod_free(lh->descs[i]);
> +	kfree(lh->label);
> +	kfree(lh);
> +	put_device(&gdev->dev);
> +	return 0;
> +}
> +
> +static const struct file_operations linehandle_fileops = {
> +	.release = linehandle_release,
> +	.owner = THIS_MODULE,
> +	.llseek = noop_llseek,
> +	.unlocked_ioctl = linehandle_ioctl,
> +#ifdef CONFIG_COMPAT
> +	.compat_ioctl = linehandle_ioctl_compat,
> +#endif
> +};
> +
> +static int linehandle_create(struct gpio_device *gdev, void __user *ip)
> +{
> +	struct gpiohandle_request handlereq;
> +	struct linehandle_state *lh;
> +	int fd, i, ret;
> +
> +	if (copy_from_user(&handlereq, ip, sizeof(handlereq)))
> +		return -EFAULT;
> +	if ((handlereq.lines == 0) || (handlereq.lines > GPIOHANDLES_MAX))
> +		return -EINVAL;
> +
> +	lh = kzalloc(sizeof(*lh), GFP_KERNEL);
> +	if (!lh)
> +		return -ENOMEM;
> +	lh->gdev = gdev;
> +	get_device(&gdev->dev);
> +
> +	/* Make sure this is terminated */
> +	handlereq.consumer_label[sizeof(handlereq.consumer_label)-1] = '\0';
> +	if (strlen(handlereq.consumer_label)) {
> +		lh->label = kstrdup(handlereq.consumer_label,
> +				    GFP_KERNEL);
> +		if (!lh->label) {
> +			ret = -ENOMEM;
> +			goto out_free_lh;
> +		}
> +	}
> +
> +	/* Request each GPIO */
> +	for (i = 0; i < handlereq.lines; i++) {
> +		u32 offset = handlereq.lineoffsets[i];
> +		u32 lflags = handlereq.flags;
> +		struct gpio_desc *desc;
> +
> +		desc = &gdev->descs[offset];
> +		ret = gpiod_request(desc, lh->label);
> +		if (ret)
> +			goto out_free_descs;
> +		lh->descs[i] = desc;
> +
> +		if (lflags & GPIOHANDLE_REQUEST_ACTIVE_LOW)
> +			set_bit(FLAG_ACTIVE_LOW, &desc->flags);
> +		if (lflags & GPIOHANDLE_REQUEST_OPEN_DRAIN)
> +			set_bit(FLAG_OPEN_DRAIN, &desc->flags);
> +		if (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)
> +			set_bit(FLAG_OPEN_SOURCE, &desc->flags);
> +
> +		/*
> +		 * Lines have to be requested explicitly for input
> +		 * or output, else the line will be treated "as is".
> +		 */
> +		if (lflags & GPIOHANDLE_REQUEST_OUTPUT) {
> +			int val = !!handlereq.default_values[i];
> +
> +			ret = gpiod_direction_output(desc, val);
> +			if (ret)
> +				goto out_free_descs;
> +		} else if (lflags & GPIOHANDLE_REQUEST_INPUT) {
> +			ret = gpiod_direction_input(desc);
> +			if (ret)
> +				goto out_free_descs;
> +		}
> +		dev_dbg(&gdev->dev, "registered chardev handle for line %d\n",
> +			offset);
> +	}
> +	lh->numdescs = handlereq.lines;
> +
> +	fd = anon_inode_getfd("gpio-linehandle",
> +			      &linehandle_fileops,
> +			      lh,
> +			      O_RDONLY | O_CLOEXEC);
> +	if (fd < 0) {
> +		ret = fd;
> +		goto out_free_descs;
> +	}
> +
> +	handlereq.fd = fd;
> +	if (copy_to_user(ip, &handlereq, sizeof(handlereq)))
> +		return -EFAULT;
> +
> +	dev_dbg(&gdev->dev, "registered chardev handle for %d lines\n",
> +		lh->numdescs);
> +
> +	return 0;
> +
> +out_free_descs:
> +	for (; i >= 0; i--)
> +		gpiod_free(lh->descs[i]);
> +	kfree(lh->label);
> +out_free_lh:
> +	kfree(lh);
> +	put_device(&gdev->dev);
> +	return ret;
> +}
> +
>  /**
>   * gpio_ioctl() - ioctl handler for the GPIO chardev
>   */
> @@ -385,6 +576,8 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  		if (copy_to_user(ip, &lineinfo, sizeof(lineinfo)))
>  			return -EFAULT;
>  		return 0;
> +	} else if (cmd == GPIO_GET_LINEHANDLE_IOCTL) {
> +		return linehandle_create(gdev, ip);
>  	}
>  	return -EINVAL;
>  }
> diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
> index d0a3cac72250..21905531dcf4 100644
> --- a/include/uapi/linux/gpio.h
> +++ b/include/uapi/linux/gpio.h
> @@ -1,7 +1,7 @@
>  /*
>   * <linux/gpio.h> - userspace ABI for the GPIO character devices
>   *
> - * Copyright (C) 2015 Linus Walleij
> + * Copyright (C) 2016 Linus Walleij
>   *
>   * This program is free software; you can redistribute it and/or modify it
>   * under the terms of the GNU General Public License version 2 as published by
> @@ -26,8 +26,8 @@ struct gpiochip_info {
>  	__u32 lines;
>  };
>  
> -/* Line is in use by the kernel */
> -#define GPIOLINE_FLAG_KERNEL		(1UL << 0)
> +/* Informational flags */
> +#define GPIOLINE_FLAG_KERNEL		(1UL << 0) /* Line used by the kernel */
>  #define GPIOLINE_FLAG_IS_OUT		(1UL << 1)
>  #define GPIOLINE_FLAG_ACTIVE_LOW	(1UL << 2)
>  #define GPIOLINE_FLAG_OPEN_DRAIN	(1UL << 3)
> @@ -52,7 +52,62 @@ struct gpioline_info {
>  	char consumer[32];
>  };
>  
> +/* Maximum number of requested handles */
> +#define GPIOHANDLES_MAX 64
> +
> +/* Request flags */
> +#define GPIOHANDLE_REQUEST_INPUT	(1UL << 0)
> +#define GPIOHANDLE_REQUEST_OUTPUT	(1UL << 1)
> +#define GPIOHANDLE_REQUEST_ACTIVE_LOW	(1UL << 2)
> +#define GPIOHANDLE_REQUEST_OPEN_DRAIN	(1UL << 3)
> +#define GPIOHANDLE_REQUEST_OPEN_SOURCE	(1UL << 4)
> +
> +/**
> + * struct gpiohandle_request - Information about a GPIO handle request
> + * @lineoffsets: an array desired lines, specified by offset index for the
> + * associated GPIO device
> + * @flags: desired flags for the desired GPIO lines, such as
> + * GPIOHANDLE_REQUEST_OUTPUT, GPIOHANDLE_REQUEST_ACTIVE_LOW etc, OR:ed
> + * together. Note that even if multiple lines are requested, the same flags
> + * must be applicable to all of them, if you want lines with individual
> + * flags set, request them one by one. It is possible to select
> + * a batch of input or output lines, but they must all have the same
> + * characteristics, i.e. all inputs or all outputs, all active low etc
> + * @default_values: if the GPIOHANDLE_REQUEST_OUTPUT is set for a requested
> + * line, this specifies the default output value, should be 0 (low) or
> + * 1 (high), anything else than 0 or 1 will be interpreted as 1 (high)
> + * @consumer_label: a desired consumer label for the selected GPIO line(s)
> + * such as "my-bitbanged-relay"
> + * @lines: number of lines requested in this request, i.e. the number of
> + * valid fields in the above arrays, set to 1 to request a single line
> + * @fd: if successful this field will contain a valid anonymous file handle
> + * after a GPIO_GET_LINEHANDLE_IOCTL operation, zero or negative value
> + * means error
> + */
> +struct gpiohandle_request {
> +	__u32 lineoffsets[GPIOHANDLES_MAX];
> +	__u32 flags;
> +	__u8 default_values[GPIOHANDLES_MAX];
> +	char consumer_label[32];
> +	__u32 lines;
> +	int fd;
> +};
> +
>  #define GPIO_GET_CHIPINFO_IOCTL _IOR(0xB4, 0x01, struct gpiochip_info)
>  #define GPIO_GET_LINEINFO_IOCTL _IOWR(0xB4, 0x02, struct gpioline_info)
> +#define GPIO_GET_LINEHANDLE_IOCTL _IOWR(0xB4, 0x03, struct gpiohandle_request)
> +
> +/**
> + * struct gpiohandle_data - Information of values on a GPIO handle
> + * @values: when getting the state of lines this contains the current
> + * state of a line, when setting the state of lines these should contain
> + * the desired target state
> + */
> +struct gpiohandle_data {
> +	__u8 values[GPIOHANDLES_MAX];
> +};
> +
> +#define GPIOHANDLE_GET_LINE_VALUES_IOCTL _IOWR(0xB4, 0x08, struct gpiohandle_data)
> +#define GPIOHANDLE_SET_LINE_VALUES_IOCTL _IOWR(0xB4, 0x09, struct gpiohandle_data)
>  
>  #endif /* _UAPI_GPIO_H_ */
> -- 
> 2.4.11
> 
