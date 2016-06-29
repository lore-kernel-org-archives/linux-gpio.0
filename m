From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: Re: [PATCH 1/4] gpio: userspace ABI for reading/writing GPIO lines
Date: Wed, 29 Jun 2016 10:53:13 +0200
Message-ID: <2026706.RhdqQzbNxG@ws-stein>
References: <1464868289-1766-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from webbox1416.server-home.net ([77.236.96.61]:40813 "EHLO
	webbox1416.server-home.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750802AbcF2IxV (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Wed, 29 Jun 2016 04:53:21 -0400
In-Reply-To: <1464868289-1766-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Lee Campbell <leecam@google.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>

On Thursday 02 June 2016 13:51:26, Linus Walleij wrote:
> This adds a userspace ABI for reading and writing GPIO lines.
> The mechanism returns an anonymous file handle to a request
> to read/write n offsets from a gpiochip. This file handle
> in turn accepts two ioctl()s: one that reads and one that
> writes values to the selected lines.
> [...]
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

When will linehandle_release actually be called? When we explicitely call 
close(req.fd) or when application exits and all FDs will be closed anyway?

> +	if (fd < 0) {
> +		ret = fd;
> +		goto out_free_descs;
> +	}
> +
> +	handlereq.fd = fd;
> +	if (copy_to_user(ip, &handlereq, sizeof(handlereq)))
> +		return -EFAULT;

If I'm right above doesn't that then leak lh until application eventually 
exits? Userspace won't receive the newly created fd. The same would apply to 
patch 3/4.

Best regards,
Alexander

