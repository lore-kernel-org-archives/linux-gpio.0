From: Tobias Diedrich <ranma@tdiedrich.de>
Subject: Re: [PATCH] gpio / ACPI: Add label to the gpio request
Date: Sat, 13 Jun 2015 21:25:36 +0200
Message-ID: <20150613192536.GA29802@yumi.tdiedrich.de>
References: <20150611000822.GA21213@yumi.tdiedrich.de>
 <20150612144927.GE1478@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from yumi.uguu.de ([85.10.200.126]:46859 "EHLO mx.tdiedrich.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750802AbbFMTZj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sat, 13 Jun 2015 15:25:39 -0400
Content-Disposition: inline
In-Reply-To: <20150612144927.GE1478@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Mika Westerberg wrote:
> On Thu, Jun 11, 2015 at 02:08:22AM +0200, Tobias Diedrich wrote:
> > In create_gpio_led only the legacy pass propagates the label by passing it into
> > devm_gpio_request_one.
> > 
> > On the newer devicetree/acpi path the label is lost as far as the GPIO
> > subsystem goes (it is only retained as name in struct gpio_led.
> > 
> > Amend devm_get_gpiod_from_child to also pass the label into the GPIO layer, so
> > it will show up in /sys/kernel/debug/gpio, so instead of:
> > 
> > GPIOs 288-511, platform/PRP0001:00, AMD SBX00:
> >  gpio-477 (?                   ) out hi
> >  gpio-478 (?                   ) out lo
> >  gpio-479 (?                   ) out hi
> > 
> > we get the much nicer output:
> > 
> > GPIOs 288-511, platform/PRP0001:00, AMD SBX00:
> >  gpio-477 (led1                ) out hi
> >  gpio-478 (led2                ) out lo
> >  gpio-479 (led3                ) out hi
> 
> I wonder if we can just put the con_id there?

leds-gpio doesn't seem to set con_id:
  led.gpiod = devm_get_gpiod_from_child(dev, NULL, child);

> > Signed-off-by: Tobias Diedrich <ranma+kernel@tdiedrich.de>
> > ---
> >  drivers/gpio/devres.c         | 6 +++++-
> >  drivers/gpio/gpiolib.c        | 6 ++++--
> >  include/linux/gpio/consumer.h | 3 ++-
> >  3 files changed, 11 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpio/devres.c b/drivers/gpio/devres.c
> > index 07ba823..089db97 100644
> > --- a/drivers/gpio/devres.c
> > +++ b/drivers/gpio/devres.c
> > @@ -103,13 +103,17 @@ struct gpio_desc *__must_check __devm_gpiod_get_index(struct device *dev,
> >  {
> >  	struct gpio_desc **dr;
> >  	struct gpio_desc *desc;
> > +	const char *label = NULL;
> >  
> >  	dr = devres_alloc(devm_gpiod_release, sizeof(struct gpio_desc *),
> >  			  GFP_KERNEL);
> >  	if (!dr)
> >  		return ERR_PTR(-ENOMEM);
> >  
> > -	desc = gpiod_get_index(dev, con_id, idx, flags);
> > +	if (fwnode_property_present(child, "label"))
> > +		fwnode_property_read_string(child, "label", &label);
> 
> This binding needs to be documented, I suppose.
> 
> But then again, does it really describe the hardware? We already have
> names like "linux,label" in the bindings but as far as I understand
> adding such things is not recommended.

Strange, this shouldn't even have compiled, botched the merge to git
HEAD.  Apparently my compile test didn't end up including this file.
This was supposed to go into devm_get_gpiod_from_child.

At least gpio-keys-polled and gpio-leds both use "label" and "gpios",
but I suppose that might not be true for all users of
devm_get_gpiod_from_child.

> > +
> > +	desc = gpiod_get_index(dev, con_id, idx, flags, label);
> >  	if (IS_ERR(desc)) {
> >  		devres_free(dr);
> >  		return desc;
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index 6bc612b..fb2be68 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -2017,6 +2017,7 @@ EXPORT_SYMBOL_GPL(__gpiod_get_index);
> >   * fwnode_get_named_gpiod - obtain a GPIO from firmware node
> >   * @fwnode:	handle of the firmware node
> >   * @propname:	name of the firmware property representing the GPIO
> > + * @label:	optional label for the GPIO
> >   *
> >   * This function can be used for drivers that get their configuration
> >   * from firmware.
> > @@ -2028,7 +2029,8 @@ EXPORT_SYMBOL_GPL(__gpiod_get_index);
> >   * In case of error an ERR_PTR() is returned.
> >   */
> >  struct gpio_desc *fwnode_get_named_gpiod(struct fwnode_handle *fwnode,
> > -					 const char *propname)
> > +					 const char *propname,
> > +					 const char *label)
> >  {
> >  	struct gpio_desc *desc = ERR_PTR(-ENODEV);
> >  	bool active_low = false;
> > @@ -2056,7 +2058,7 @@ struct gpio_desc *fwnode_get_named_gpiod(struct fwnode_handle *fwnode,
> >  	if (IS_ERR(desc))
> >  		return desc;
> >  
> > -	ret = gpiod_request(desc, NULL);
> > +	ret = gpiod_request(desc, label);
> >  	if (ret)
> >  		return ERR_PTR(ret);
> >  
> > diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
> > index 3a7c9ff..ef7d322 100644
> > --- a/include/linux/gpio/consumer.h
> > +++ b/include/linux/gpio/consumer.h
> > @@ -134,7 +134,8 @@ int desc_to_gpio(const struct gpio_desc *desc);
> >  struct fwnode_handle;
> >  
> >  struct gpio_desc *fwnode_get_named_gpiod(struct fwnode_handle *fwnode,
> > -					 const char *propname);
> > +					 const char *propname,
> > +					 const char *label);
> >  struct gpio_desc *devm_get_gpiod_from_child(struct device *dev,
> >  					    const char *con_id,
> >  					    struct fwnode_handle *child);
> > -- 
> > 2.1.4

-- 
Tobias						PGP: http://8ef7ddba.uguu.de
