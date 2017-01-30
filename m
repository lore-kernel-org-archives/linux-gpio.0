From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/5] gpio: Add the devm_get_index_gpiod_from_child() helper
Date: Mon, 30 Jan 2017 10:49:23 +0100
Message-ID: <CACRpkdYsE_3twu6ZxTUD2A=YddU-Lq+0L+g12p7Ws99Aqjz97g@mail.gmail.com>
References: <1485534846-28111-1-git-send-email-boris.brezillon@free-electrons.com>
 <1485534846-28111-2-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1485534846-28111-2-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org, Nicolas Ferre <nicolas.ferre@atmel.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Wenyou Yang <wenyou.yang@atmel.com>, Josh Wu <rainyfeeling@outlook.com>, Haavard Skinnemoen <hskinnemoen@gmail.com>, Hans-Christian Egtvedt <egtvedt@samfundet.no>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-arm-ke
List-Id: linux-gpio@vger.kernel.org

On Fri, Jan 27, 2017 at 5:34 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:

> devm_get_gpiod_from_child() currently allows GPIO users to request a GPIO
> that is defined in a child fwnode instead of directly in the device
> fwnode. Extend this API by adding the devm_get_index_gpiod_from_child()
> helpers which does the same except you can also specify an index in case
> the 'xx-gpios' property describe several GPIOs.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Cc Russell who faced this problem in the mvebu PCI driver (IIRC).

(...)

> +struct gpio_desc *devm_get_index_gpiod_from_child(struct device *dev,
> +                                                 const char *con_id,
> +                                                 int index,
> +                                                 struct fwnode_handle *child)
>  {
>         static const char * const suffixes[] = { "gpios", "gpio" };
>         char prop_name[32]; /* 32 is max size of property name */
> @@ -154,7 +157,7 @@ struct gpio_desc *devm_get_gpiod_from_child(struct device *dev,
>                         snprintf(prop_name, sizeof(prop_name), "%s",
>                                                                suffixes[i]);
>
> -               desc = fwnode_get_named_gpiod(child, prop_name);
> +               desc = fwnode_get_named_gpiod(child, prop_name, index);
>                 if (!IS_ERR(desc) || (PTR_ERR(desc) != -ENOENT))
>                         break;
>         }
> @@ -168,6 +171,23 @@ struct gpio_desc *devm_get_gpiod_from_child(struct device *dev,
>
>         return desc;
>  }
> +EXPORT_SYMBOL(devm_get_index_gpiod_from_child);

Rename this devm_fwnode_get_index_gpiod_from_child()
so that it fits the namespace of the other fwnode functions.

> + * devm_get_gpiod_from_child - get a GPIO descriptor from a device's child node
> + * @dev:       GPIO consumer
> + * @con_id:    function within the GPIO consumer
> + * @child:     firmware node (child of @dev)
> + *
> + * GPIO descriptors returned from this function are automatically disposed on
> + * driver detach.
> + */
> +struct gpio_desc *devm_get_gpiod_from_child(struct device *dev,
> +                                           const char *con_id,
> +                                           struct fwnode_handle *child)
> +{
> +       return devm_get_index_gpiod_from_child(dev, con_id, 0, child);
> +}

Take the opportunity to rename this devm_fwnode_get_gpiod_from_child()
as well.

I don't remember exactly why this wasn't added earlier, there was some
problem with referencing nodes that do not have devices.

Yours,
Linus Walleij
