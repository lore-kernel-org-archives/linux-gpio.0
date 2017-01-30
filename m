From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 1/5] gpio: Add the devm_get_index_gpiod_from_child() helper
Date: Mon, 30 Jan 2017 11:19:54 +0100
Message-ID: <20170130111954.0f7ef130@bbrezillon>
References: <1485534846-28111-1-git-send-email-boris.brezillon@free-electrons.com>
 <1485534846-28111-2-git-send-email-boris.brezillon@free-electrons.com>
 <CACRpkdYsE_3twu6ZxTUD2A=YddU-Lq+0L+g12p7Ws99Aqjz97g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdYsE_3twu6ZxTUD2A=YddU-Lq+0L+g12p7Ws99Aqjz97g@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Haavard Skinnemoen <hskinnemoen@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Vinod Koul <vinod.koul@intel.com>, Richard Weinberger <richard@nod.at>, Nicolas Ferre <nicolas.ferre@atmel.com>, Russell King <linux@armlinux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Wenyou Yang <wenyou.yang@atmel.com>, Marek Vasut <marek.vasut@gmail.com>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Josh Wu <rainyfeeling@outlook.com>, dmaengine@vger.kernel.org, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Dan Williams <dan.j.williams@intel.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Hans-Christian
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

On Mon, 30 Jan 2017 10:49:23 +0100
Linus Walleij <linus.walleij@linaro.org> wrote:

> On Fri, Jan 27, 2017 at 5:34 PM, Boris Brezillon
> <boris.brezillon@free-electrons.com> wrote:
> 
> > devm_get_gpiod_from_child() currently allows GPIO users to request a GPIO
> > that is defined in a child fwnode instead of directly in the device
> > fwnode. Extend this API by adding the devm_get_index_gpiod_from_child()
> > helpers which does the same except you can also specify an index in case
> > the 'xx-gpios' property describe several GPIOs.
> >
> > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>  
> 
> Cc Russell who faced this problem in the mvebu PCI driver (IIRC).
> 
> (...)
> 
> > +struct gpio_desc *devm_get_index_gpiod_from_child(struct device *dev,
> > +                                                 const char *con_id,
> > +                                                 int index,
> > +                                                 struct fwnode_handle *child)
> >  {
> >         static const char * const suffixes[] = { "gpios", "gpio" };
> >         char prop_name[32]; /* 32 is max size of property name */
> > @@ -154,7 +157,7 @@ struct gpio_desc *devm_get_gpiod_from_child(struct device *dev,
> >                         snprintf(prop_name, sizeof(prop_name), "%s",
> >                                                                suffixes[i]);
> >
> > -               desc = fwnode_get_named_gpiod(child, prop_name);
> > +               desc = fwnode_get_named_gpiod(child, prop_name, index);
> >                 if (!IS_ERR(desc) || (PTR_ERR(desc) != -ENOENT))
> >                         break;
> >         }
> > @@ -168,6 +171,23 @@ struct gpio_desc *devm_get_gpiod_from_child(struct device *dev,
> >
> >         return desc;
> >  }
> > +EXPORT_SYMBOL(devm_get_index_gpiod_from_child);  
> 
> Rename this devm_fwnode_get_index_gpiod_from_child()
> so that it fits the namespace of the other fwnode functions.

Okay.

> 
> > + * devm_get_gpiod_from_child - get a GPIO descriptor from a device's child node
> > + * @dev:       GPIO consumer
> > + * @con_id:    function within the GPIO consumer
> > + * @child:     firmware node (child of @dev)
> > + *
> > + * GPIO descriptors returned from this function are automatically disposed on
> > + * driver detach.
> > + */
> > +struct gpio_desc *devm_get_gpiod_from_child(struct device *dev,
> > +                                           const char *con_id,
> > +                                           struct fwnode_handle *child)
> > +{
> > +       return devm_get_index_gpiod_from_child(dev, con_id, 0, child);
> > +}  
> 
> Take the opportunity to rename this devm_fwnode_get_gpiod_from_child()
> as well.

Sure, I'll provide a separate patch renaming this function.

Thanks,

Boris
