Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144F43BBA03
	for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 07:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786435191; cv=none; b=tQM64gHLcaldxegtu7ZZ0VepqaTfdkDoHQExQHhXPWhBlBa8xvzd6kaVqX1bBolGtfhGPytgUgnRWILo4szcSOapv7YMlplbQ/JCUpILB5bZgzNGYkby5jn2Hjx4IaF8zW9C5cpLxKdNhZAgk3ShJwt7Muj4CpXY32eiskiorco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786435191; c=relaxed/simple;
	bh=QeJ1rLZ5ikE9dUhtu4tpAD6oPoDPpoI/rVK0vfjKHfU=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aWBaWYId3C/HiBcdazXUCHKcaFbUDp30NhAcmObcV5RgAll8NUsR5DEZru8IoTsWC9FO5KTBTTl2UQcCLFrPHG1syIRaNYQyEDqWfT8BYo8oaiWegydXBKuTmqVVxMAxmTc9gBOFiTz/aYOF5nw9Rx+nLxT0RNhxcC3LPz/kCSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QE3JXyRM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QE3JXyRM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF16C1F00ACA
	for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 07:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786435189;
	bh=SVw6Xuh57X1Gm11bx6S43NVdZqtFwJGakaeaVNvi2Tw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=QE3JXyRMZ9lbwPvRygnCJ6i3pnhS72dzsjR0NVKyT7aDINVknqjIi8YCe+CPmC2TK
	 ifzIrCGH6m3XTPZoLz8d3oikp2GMDzgbFEByOToOkUhUApfAGjAKXduFGdqK07XKrN
	 IgG+Gt28rcC8mkcLwozRnIsxIrWDXXUEhaAMYiIyFK9Bb/F6W7aDp6gFQt6oNgWzi/
	 Cff/jGvWvU/aB79WJ/QBVxhW1YiCw9K4pN6zJxLCTf5T6zUva6kpDjNrqu4D485Tgu
	 Hro1mGpY76SVEkSsKNFpGuFuKrIPhzg36RMF61MhLi7uSm+3eRAUKdRE54mYtiGsAt
	 8JO1qPdZbXOPQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b159850b16so429301e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 00:59:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqLigvHjOl/26QRp6xb1GNOznZVUwFJsMsXPNPNkdzXOkDBUWcrM5KuSrE+yc3EdMXQHsY4AhZuOI6r@vger.kernel.org
X-Gm-Message-State: AOJu0YxKgiubpEtM5eAVJiIaVmm4h2ZppqN3/nTXhPxW081wWsTD+z4t
	Jz4YBM1yxh8tdOX86fWM1gV3kcx0LZztjRcyRnEgPBRH2kJi63MsaBB070W54hjq4TqNzKq11Zn
	Zf6IILE1tCQ9Fqqaa0WmAo24Ds4kgglenHdM5Wr5IZA==
X-Received: by 2002:a05:6512:a82:b0:5b0:113d:8ad9 with SMTP id
 2adb3069b0e04-5b44860826emr254959e87.12.1786435188612; Tue, 11 Aug 2026
 00:59:48 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 11 Aug 2026 00:59:44 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 11 Aug 2026 00:59:44 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260810-ls2kbmc-mod-v8-6-16e44f7322f4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810-ls2kbmc-mod-v8-0-16e44f7322f4@gmail.com> <20260810-ls2kbmc-mod-v8-6-16e44f7322f4@gmail.com>
Date: Tue, 11 Aug 2026 00:59:44 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mc7+kXwHcYtcF9jgmAzSGF+wydOnsvA7Hby0KxhAL2YUA@mail.gmail.com>
X-Gm-Features: AUfX_mzPLGVI4fz-cG7N2nV8ZY0FnxfWPx2UZJwXs5JVI8GHm-_9VGyqPrHcu6U
Message-ID: <CAMRc=Mc7+kXwHcYtcF9jgmAzSGF+wydOnsvA7Hby0KxhAL2YUA@mail.gmail.com>
Subject: Re: [PATCH RFC v8 6/8] gpiolib: add gpio_device_get_fwnode() helper
To: shankerwangmiao@gmail.com
Cc: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>, 
	Xi Ruoyao <xry111@xry111.site>, WANG Xuerui <kernel@xen0n.name>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, openipmi-developer@lists.sourceforge.net, 
	Binbin Zhou <zhoubinbin@loongson.cn>, Chong Qiao <qiaochong@loongson.cn>, 
	Lee Jones <lee@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Corey Minyard <corey@minyard.net>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 10 Aug 2026 15:04:29 +0200, Miao Wang via B4 Relay
<devnull+shankerwangmiao.gmail.com@kernel.org> said:
> From: Miao Wang <shankerwangmiao@gmail.com>
>
> Add a helper function to retrieve the fwnode associated with a
> struct gpio_device. This is useful for drivers that need to access the
> fwnode of a GPIO device for various purposes, such as creating software
> nodes or handling GPIOs in a platform-specific manner.
>
> Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
> ---
>  drivers/gpio/gpiolib.c      | 13 +++++++++++++
>  include/linux/gpio/driver.h |  1 +
>  2 files changed, 14 insertions(+)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index e5fb60111151f6de20b424551acf213fb058e190..3774ebbbe550cdce0989a2d06f2ab658529c3bab 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1583,6 +1583,19 @@ struct device *gpio_device_to_device(struct gpio_device *gdev)
>  }
>  EXPORT_SYMBOL_GPL(gpio_device_to_device);
>
> +/**
> + * gpio_device_get_fwnode() - Retrieve the fwnode of the underlying device.
> + * @gdev: GPIO device for which to return the fwnode.
> + *
> + * Returns:
> + * The fwnode handle of the underlying device.
> + */

Please extend the kernel doc to also say that the call does not bump the
reference count of the firmware node as the caller already holds a reference
to the GPIO device that owns it so no call to fwnode_handle_put() is required.

With that:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

And it can go through the MFD tree.

Thanks,
Bartosz

> +struct fwnode_handle *gpio_device_get_fwnode(struct gpio_device *gdev)
> +{
> +	return dev_fwnode(gpio_device_to_device(gdev));
> +}
> +EXPORT_SYMBOL_GPL(gpio_device_get_fwnode);
> +
>  #ifdef CONFIG_GPIOLIB_IRQCHIP
>
>  /*
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index 17511434ed077dde8807bd7630c342e146e5230b..4dd9120707ec72a978f5f916cc5473a91b65d2b9 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -641,6 +641,7 @@ DEFINE_FREE(gpio_device_put, struct gpio_device *,
>  	    if (!IS_ERR_OR_NULL(_T)) gpio_device_put(_T))
>
>  struct device *gpio_device_to_device(struct gpio_device *gdev);
> +struct fwnode_handle *gpio_device_get_fwnode(struct gpio_device *gdev);
>
>  bool gpiochip_line_is_irq(struct gpio_chip *gc, unsigned int offset);
>  int gpiochip_reqres_irq(struct gpio_chip *gc, unsigned int offset);
>
> --
> 2.49.0
>
>
>
