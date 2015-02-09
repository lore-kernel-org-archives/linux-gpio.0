From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 1/3][v2] gpiolib: add gpiod_get_array and gpiod_put_array
 functions
Date: Mon, 9 Feb 2015 14:09:26 +0200
Message-ID: <20150209120926.GC1480@lahna.fi.intel.com>
References: <1485356.H0CQOKK5aG@pcimr>
 <CAAVeFu+Z+ExaCimgB-7gT0zZspNLmpKPC+C_+wzYTYb2UMBJUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:24934 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932488AbbBIMLi (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 9 Feb 2015 07:11:38 -0500
Content-Disposition: inline
In-Reply-To: <CAAVeFu+Z+ExaCimgB-7gT0zZspNLmpKPC+C_+wzYTYb2UMBJUQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Rojhalat Ibrahim <imr@rtschenk.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

On Mon, Feb 09, 2015 at 02:12:39PM +0900, Alexandre Courbot wrote:
> > +#ifdef CONFIG_ACPI
> > +
> > +static int acpi_find_gpio_count(struct acpi_resource *ares, void *data)
> > +{
> > +       unsigned int *count = data;
> > +
> > +       if (ares->type == ACPI_RESOURCE_TYPE_GPIO)
> > +               *count = ares->data.gpio.pin_table_length;
> > +
> > +       return 1;
> > +}
> > +
> > +static unsigned int acpi_gpio_count(struct device *dev, const char *con_id)
> > +{
> > +       struct acpi_device *adev = ACPI_COMPANION(dev);
> > +       const union acpi_object *obj;
> > +       const struct acpi_gpio_mapping *gm;
> > +       unsigned int count = 0;
> > +       int ret;
> > +       char propname[32];
> > +       unsigned int i;
> > +
> > +       /* Try first from _DSD */
> > +       for (i = 0; i < ARRAY_SIZE(gpio_suffixes); i++) {
> > +               if (con_id && strcmp(con_id, "gpios"))
> > +                       snprintf(propname, sizeof(propname), "%s-%s",
> > +                                con_id, gpio_suffixes[i]);
> > +               else
> > +                       snprintf(propname, sizeof(propname), "%s",
> > +                                gpio_suffixes[i]);
> > +
> > +               ret = acpi_dev_get_property(adev, propname, ACPI_TYPE_ANY,
> > +                                           &obj);
> > +               if (ret == 0) {
> > +                       if (obj->type == ACPI_TYPE_LOCAL_REFERENCE)
> > +                               count = 1;
> > +                       else if (obj->type == ACPI_TYPE_PACKAGE)
> > +                               count = obj->package.count;
> > +               } else if (adev->driver_gpios) {
> > +                       for (gm = adev->driver_gpios; gm->name; gm++)
> > +                               if (strcmp(propname, gm->name) == 0) {
> > +                                       count = gm->size;
> > +                                       break;
> > +                               }
> > +               }
> > +               if (count)
> > +                       break;
> > +       }
> > +
> > +       /* Then from plain _CRS GPIOs */
> > +       if (!count) {
> > +               struct list_head resource_list;
> > +
> > +               INIT_LIST_HEAD(&resource_list);
> > +               acpi_dev_get_resources(adev, &resource_list,
> > +                                      acpi_find_gpio_count, &count);
> > +               acpi_dev_free_resource_list(&resource_list);
> > +       }
> > +       return count;
> > +}
> 
> I'd really like to have an acked-by from some of the ACPI people
> (Mika?) for this part.

If I understand correctly the new interface allows requesting all GPIOs
for a given device?

In that case the above code will not work. In ACPI a device may have
several GpioIo/GpioInt resources and each can hold several pins. If I
read the above code right, it re-assigns 'count' for each GPIO instead
of adding to it.

The _DSD path also seems to return number of elements in a package:

	Package () {"reset-gpios", Package() {^BTH, 1, 1, 0}},

Here for example it returns 4 which is not what is expected. I think in
this case the correct value is 1.

Also there may be several GPIOs for a single property like:

	Package () {"reset-gpios", Package() {^BTH, 1, 1, 0, ^BTH, 1, 2, 0}},

I'm not sure if that is handled correctly here.
