From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v4 2/4] gpiolib: add gpiod_get_array and gpiod_put_array
 functions
Date: Wed, 11 Feb 2015 16:19:19 +0200
Message-ID: <20150211141919.GA1561@lahna.fi.intel.com>
References: <1592036.ZMHnOUhaPf@pcimr>
 <3291115.YxVM983FZu@pcimr>
 <CAAVeFuL-P3RbZEhr5pLPxdeiyq0dBe_vXJA90-nD+Df67Jdxiw@mail.gmail.com>
 <6594257.m7JYREYCDP@pcimr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:64689 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751990AbbBKOTX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 11 Feb 2015 09:19:23 -0500
Content-Disposition: inline
In-Reply-To: <6594257.m7JYREYCDP@pcimr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rojhalat Ibrahim <imr@rtschenk.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>

On Wed, Feb 11, 2015 at 03:00:16PM +0100, Rojhalat Ibrahim wrote:
> On Wednesday 11 February 2015 22:31:12 Alexandre Courbot wrote:
> > On Wed, Feb 11, 2015 at 9:14 PM, Rojhalat Ibrahim <imr@rtschenk.de> wrote:
> > > On Wednesday 11 February 2015 12:30:01 Mika Westerberg wrote:
> > >> On Tue, Feb 10, 2015 at 02:40:52PM +0100, Rojhalat Ibrahim wrote:
> > >> > +#ifdef CONFIG_ACPI
> > >> > +
> > >> > +static unsigned int acpi_gpio_package_count(const union acpi_object *obj)
> > >> > +{
> > >> > +   const union acpi_object *element = obj->package.elements;
> > >> > +   const union acpi_object *end = element + obj->package.count;
> > >> > +   unsigned int count = 0;
> > >> > +
> > >> > +   while (element < end) {
> > >> > +           if (element->type == ACPI_TYPE_LOCAL_REFERENCE)
> > >> > +                   count++;
> > >> > +
> > >> > +           element++;
> > >> > +   }
> > >> > +   return count;
> > >> > +}
> > >> > +
> > >> > +static int acpi_find_gpio_count(struct acpi_resource *ares, void *data)
> > >> > +{
> > >> > +   unsigned int *count = data;
> > >> > +
> > >> > +   if (ares->type == ACPI_RESOURCE_TYPE_GPIO)
> > >> > +           *count += ares->data.gpio.pin_table_length;
> > >> > +
> > >> > +   return 1;
> > >> > +}
> > >> > +
> > >> > +static int acpi_gpio_count(struct device *dev, const char *con_id)
> > >> > +{
> > >> > +   struct acpi_device *adev = ACPI_COMPANION(dev);
> > >> > +   const union acpi_object *obj;
> > >> > +   const struct acpi_gpio_mapping *gm;
> > >> > +   int count = -ENOENT;
> > >> > +   int ret;
> > >> > +   char propname[32];
> > >> > +   unsigned int i;
> > >> > +
> > >> > +   /* Try first from _DSD */
> > >> > +   for (i = 0; i < ARRAY_SIZE(gpio_suffixes); i++) {
> > >> > +           if (con_id && strcmp(con_id, "gpios"))
> > >> > +                   snprintf(propname, sizeof(propname), "%s-%s",
> > >> > +                            con_id, gpio_suffixes[i]);
> > >> > +           else
> > >> > +                   snprintf(propname, sizeof(propname), "%s",
> > >> > +                            gpio_suffixes[i]);
> > >> > +
> > >> > +           ret = acpi_dev_get_property(adev, propname, ACPI_TYPE_ANY,
> > >> > +                                       &obj);
> > >> > +           if (ret == 0) {
> > >> > +                   if (obj->type == ACPI_TYPE_LOCAL_REFERENCE)
> > >> > +                           count = 1;
> > >> > +                   else if (obj->type == ACPI_TYPE_PACKAGE)
> > >> > +                           count = acpi_gpio_package_count(obj);
> > >> > +           } else if (adev->driver_gpios) {
> > >> > +                   for (gm = adev->driver_gpios; gm->name; gm++)
> > >> > +                           if (strcmp(propname, gm->name) == 0) {
> > >> > +                                   count = gm->size;
> > >> > +                                   break;
> > >> > +                           }
> > >> > +           }
> > >> > +           if (count >= 0)
> > >> > +                   break;
> > >> > +   }
> > >> > +
> > >> > +   /* Then from plain _CRS GPIOs */
> > >> > +   if (count < 0) {
> > >> > +           struct list_head resource_list;
> > >> > +           unsigned int crs_count = 0;
> > >> > +
> > >> > +           INIT_LIST_HEAD(&resource_list);
> > >> > +           acpi_dev_get_resources(adev, &resource_list,
> > >> > +                                  acpi_find_gpio_count, &crs_count);
> > >> > +           acpi_dev_free_resource_list(&resource_list);
> > >> > +           if (crs_count > 0)
> > >> > +                   count = crs_count;
> > >> > +   }
> > >> > +   return count;
> > >> > +}
> > >> > +
> > >> > +#else
> > >> > +
> > >> > +static int acpi_gpio_count(struct device *dev, const char *con_id)
> > >> > +{
> > >> > +   return -ENODEV;
> > >> > +}
> > >> > +
> > >> > +#endif
> > >>
> > >> It just occured to me that it would be better to put this code to
> > >> gpiolib-acpi.c and declare acpi_gpio_count() in drivers/gpio/gpiolib.h.
> > >>
> > >
> > > Ok. I will also have to move the definition of gpio_suffixes[] (PATCH 1/4)
> > > to drivers/gpio/gpiolib.h since it is needed by both the OF and the ACPI
> > > portions of the code.
> > 
> > We will really need to factorize this lookup code. I will give it a
> > look, but first I'd like to merge this good stuff.
> > 
> > I am mixed about moving these declarations into gpiolib.h - maybe have
> > one static declaration per file instead, especially since lookup on
> > ACPI is not necessarily the same as lookup on DT. It makes sense to
> > have it that way.
> > 
> 
> If we do one static declaration per file then acpi_find_gpio() in gpiolib.c
> is going to use potentially different suffixes from acpi_gpio_count() in
> gpiolib-acpi.c. That can't be good.
> 
> Furthermore it seems to me that while the suffixes do not necessarily have to
> be the same for ACPI and DT, they are now, and it may even be desirable to
> keep them consistent as long as there is no reason for not doing so.

Yeah, I didn't realize that by moving stuff to gpiolib-acpi.c you need
to duplicate gpio_suffixes as well.

So either leave it as is now or then we can have a bit stricter suffixes
for ACPI (which I would prefer). In other words we only accept
"foo-gpios" or "gpios". The only user currently is rfkill-gpio.c and
that already has "-gpios" there.

I think Alexandre suggested that already some time ago when we were
discussing about ACPI properties wrt. GPIOs.
