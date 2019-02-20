From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/2] drivers: provide devm_platform_ioremap_resource()
Date: Wed, 20 Feb 2019 11:34:59 +0100
Message-ID: <20190220103459.GA12108@kroah.com>
References: <20190215152507.31066-1-brgl@bgdev.pl>
 <20190215152507.31066-2-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190215152507.31066-2-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Keerthy <j-keerthy@ti.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

On Fri, Feb 15, 2019 at 04:25:06PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> There are currently 1200+ instances of using platform_get_resource()
> and devm_ioremap_resource() together in the kernel tree.
> 
> This patch wraps these two calls in a single helper. Thanks to that
> we don't have to declare a local variable for struct resource * and can
> omit the redundant argument for resource type. We also have one
> function call less.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  drivers/base/platform.c         | 18 ++++++++++++++++++
>  include/linux/platform_device.h |  3 +++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index 1c958eb33ef4..14400a63cc81 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -79,6 +79,24 @@ struct resource *platform_get_resource(struct platform_device *dev,
>  }
>  EXPORT_SYMBOL_GPL(platform_get_resource);
>  
> +/**
> + * devm_platform_ioremap_resource - call devm_ioremap_resource() for a platform
> + *				    device
> + *
> + * @pdev: platform device to use both for memory resource lookup as well as
> + *        resource managemend
> + * @index: resource index
> + */
> +void __iomem *devm_platform_ioremap_resource(struct platform_device *pdev,
> +					     unsigned int index)
> +{
> +	struct resource *res;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, index);
> +	return devm_ioremap_resource(&pdev->dev, res);
> +}
> +EXPORT_SYMBOL(devm_platform_ioremap_resource);

functions in drivers/base/* should be EXPORT_SYMBOL_GPL() please.

thanks,

greg k-h
