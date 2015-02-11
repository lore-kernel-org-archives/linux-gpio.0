From: Rojhalat Ibrahim <imr@rtschenk.de>
Subject: Re: [PATCH v4 2/4] gpiolib: add gpiod_get_array and gpiod_put_array functions
Date: Wed, 11 Feb 2015 13:14:48 +0100
Message-ID: <3291115.YxVM983FZu@pcimr>
References: <1592036.ZMHnOUhaPf@pcimr> <20150211103001.GF29259@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:45990 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751738AbbBKMOy (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Feb 2015 07:14:54 -0500
In-Reply-To: <20150211103001.GF29259@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>

On Wednesday 11 February 2015 12:30:01 Mika Westerberg wrote:
> On Tue, Feb 10, 2015 at 02:40:52PM +0100, Rojhalat Ibrahim wrote:
> > +#ifdef CONFIG_ACPI
> > +
> > +static unsigned int acpi_gpio_package_count(const union acpi_object *obj)
> > +{
> > +	const union acpi_object *element = obj->package.elements;
> > +	const union acpi_object *end = element + obj->package.count;
> > +	unsigned int count = 0;
> > +
> > +	while (element < end) {
> > +		if (element->type == ACPI_TYPE_LOCAL_REFERENCE)
> > +			count++;
> > +
> > +		element++;
> > +	}
> > +	return count;
> > +}
> > +
> > +static int acpi_find_gpio_count(struct acpi_resource *ares, void *data)
> > +{
> > +	unsigned int *count = data;
> > +
> > +	if (ares->type == ACPI_RESOURCE_TYPE_GPIO)
> > +		*count += ares->data.gpio.pin_table_length;
> > +
> > +	return 1;
> > +}
> > +
> > +static int acpi_gpio_count(struct device *dev, const char *con_id)
> > +{
> > +	struct acpi_device *adev = ACPI_COMPANION(dev);
> > +	const union acpi_object *obj;
> > +	const struct acpi_gpio_mapping *gm;
> > +	int count = -ENOENT;
> > +	int ret;
> > +	char propname[32];
> > +	unsigned int i;
> > +
> > +	/* Try first from _DSD */
> > +	for (i = 0; i < ARRAY_SIZE(gpio_suffixes); i++) {
> > +		if (con_id && strcmp(con_id, "gpios"))
> > +			snprintf(propname, sizeof(propname), "%s-%s",
> > +				 con_id, gpio_suffixes[i]);
> > +		else
> > +			snprintf(propname, sizeof(propname), "%s",
> > +				 gpio_suffixes[i]);
> > +
> > +		ret = acpi_dev_get_property(adev, propname, ACPI_TYPE_ANY,
> > +					    &obj);
> > +		if (ret == 0) {
> > +			if (obj->type == ACPI_TYPE_LOCAL_REFERENCE)
> > +				count = 1;
> > +			else if (obj->type == ACPI_TYPE_PACKAGE)
> > +				count = acpi_gpio_package_count(obj);
> > +		} else if (adev->driver_gpios) {
> > +			for (gm = adev->driver_gpios; gm->name; gm++)
> > +				if (strcmp(propname, gm->name) == 0) {
> > +					count = gm->size;
> > +					break;
> > +				}
> > +		}
> > +		if (count >= 0)
> > +			break;
> > +	}
> > +
> > +	/* Then from plain _CRS GPIOs */
> > +	if (count < 0) {
> > +		struct list_head resource_list;
> > +		unsigned int crs_count = 0;
> > +
> > +		INIT_LIST_HEAD(&resource_list);
> > +		acpi_dev_get_resources(adev, &resource_list,
> > +				       acpi_find_gpio_count, &crs_count);
> > +		acpi_dev_free_resource_list(&resource_list);
> > +		if (crs_count > 0)
> > +			count = crs_count;
> > +	}
> > +	return count;
> > +}
> > +
> > +#else
> > +
> > +static int acpi_gpio_count(struct device *dev, const char *con_id)
> > +{
> > +	return -ENODEV;
> > +}
> > +
> > +#endif
> 
> It just occured to me that it would be better to put this code to
> gpiolib-acpi.c and declare acpi_gpio_count() in drivers/gpio/gpiolib.h.
> 

Ok. I will also have to move the definition of gpio_suffixes[] (PATCH 1/4)
to drivers/gpio/gpiolib.h since it is needed by both the OF and the ACPI
portions of the code.

> That said, I tested this code on Lenovo Thinkpad10 by converting
> drivers/input/misc/soc_button_array.c to fetch its GPIOs using this new
> API -- it works just fine (and looks better).
> 
> Once you have done the above change you can add for the ACPI parts,
> 
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Tested-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> 

Great. Thanks.



