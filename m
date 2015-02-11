From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH v4 2/4] gpiolib: add gpiod_get_array and gpiod_put_array functions
Date: Wed, 11 Feb 2015 22:31:12 +0900
Message-ID: <CAAVeFuL-P3RbZEhr5pLPxdeiyq0dBe_vXJA90-nD+Df67Jdxiw@mail.gmail.com>
References: <1592036.ZMHnOUhaPf@pcimr> <20150211103001.GF29259@lahna.fi.intel.com>
 <3291115.YxVM983FZu@pcimr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f169.google.com ([209.85.223.169]:37104 "EHLO
	mail-ie0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752401AbbBKNbd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Feb 2015 08:31:33 -0500
Received: by iecrl12 with SMTP id rl12so1456523iec.4
        for <linux-gpio@vger.kernel.org>; Wed, 11 Feb 2015 05:31:33 -0800 (PST)
In-Reply-To: <3291115.YxVM983FZu@pcimr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rojhalat Ibrahim <imr@rtschenk.de>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>

On Wed, Feb 11, 2015 at 9:14 PM, Rojhalat Ibrahim <imr@rtschenk.de> wrote:
> On Wednesday 11 February 2015 12:30:01 Mika Westerberg wrote:
>> On Tue, Feb 10, 2015 at 02:40:52PM +0100, Rojhalat Ibrahim wrote:
>> > +#ifdef CONFIG_ACPI
>> > +
>> > +static unsigned int acpi_gpio_package_count(const union acpi_object *obj)
>> > +{
>> > +   const union acpi_object *element = obj->package.elements;
>> > +   const union acpi_object *end = element + obj->package.count;
>> > +   unsigned int count = 0;
>> > +
>> > +   while (element < end) {
>> > +           if (element->type == ACPI_TYPE_LOCAL_REFERENCE)
>> > +                   count++;
>> > +
>> > +           element++;
>> > +   }
>> > +   return count;
>> > +}
>> > +
>> > +static int acpi_find_gpio_count(struct acpi_resource *ares, void *data)
>> > +{
>> > +   unsigned int *count = data;
>> > +
>> > +   if (ares->type == ACPI_RESOURCE_TYPE_GPIO)
>> > +           *count += ares->data.gpio.pin_table_length;
>> > +
>> > +   return 1;
>> > +}
>> > +
>> > +static int acpi_gpio_count(struct device *dev, const char *con_id)
>> > +{
>> > +   struct acpi_device *adev = ACPI_COMPANION(dev);
>> > +   const union acpi_object *obj;
>> > +   const struct acpi_gpio_mapping *gm;
>> > +   int count = -ENOENT;
>> > +   int ret;
>> > +   char propname[32];
>> > +   unsigned int i;
>> > +
>> > +   /* Try first from _DSD */
>> > +   for (i = 0; i < ARRAY_SIZE(gpio_suffixes); i++) {
>> > +           if (con_id && strcmp(con_id, "gpios"))
>> > +                   snprintf(propname, sizeof(propname), "%s-%s",
>> > +                            con_id, gpio_suffixes[i]);
>> > +           else
>> > +                   snprintf(propname, sizeof(propname), "%s",
>> > +                            gpio_suffixes[i]);
>> > +
>> > +           ret = acpi_dev_get_property(adev, propname, ACPI_TYPE_ANY,
>> > +                                       &obj);
>> > +           if (ret == 0) {
>> > +                   if (obj->type == ACPI_TYPE_LOCAL_REFERENCE)
>> > +                           count = 1;
>> > +                   else if (obj->type == ACPI_TYPE_PACKAGE)
>> > +                           count = acpi_gpio_package_count(obj);
>> > +           } else if (adev->driver_gpios) {
>> > +                   for (gm = adev->driver_gpios; gm->name; gm++)
>> > +                           if (strcmp(propname, gm->name) == 0) {
>> > +                                   count = gm->size;
>> > +                                   break;
>> > +                           }
>> > +           }
>> > +           if (count >= 0)
>> > +                   break;
>> > +   }
>> > +
>> > +   /* Then from plain _CRS GPIOs */
>> > +   if (count < 0) {
>> > +           struct list_head resource_list;
>> > +           unsigned int crs_count = 0;
>> > +
>> > +           INIT_LIST_HEAD(&resource_list);
>> > +           acpi_dev_get_resources(adev, &resource_list,
>> > +                                  acpi_find_gpio_count, &crs_count);
>> > +           acpi_dev_free_resource_list(&resource_list);
>> > +           if (crs_count > 0)
>> > +                   count = crs_count;
>> > +   }
>> > +   return count;
>> > +}
>> > +
>> > +#else
>> > +
>> > +static int acpi_gpio_count(struct device *dev, const char *con_id)
>> > +{
>> > +   return -ENODEV;
>> > +}
>> > +
>> > +#endif
>>
>> It just occured to me that it would be better to put this code to
>> gpiolib-acpi.c and declare acpi_gpio_count() in drivers/gpio/gpiolib.h.
>>
>
> Ok. I will also have to move the definition of gpio_suffixes[] (PATCH 1/4)
> to drivers/gpio/gpiolib.h since it is needed by both the OF and the ACPI
> portions of the code.

We will really need to factorize this lookup code. I will give it a
look, but first I'd like to merge this good stuff.

I am mixed about moving these declarations into gpiolib.h - maybe have
one static declaration per file instead, especially since lookup on
ACPI is not necessarily the same as lookup on DT. It makes sense to
have it that way.

>
>> That said, I tested this code on Lenovo Thinkpad10 by converting
>> drivers/input/misc/soc_button_array.c to fetch its GPIOs using this new
>> API -- it works just fine (and looks better).
>>
>> Once you have done the above change you can add for the ACPI parts,
>>
>> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
>> Tested-by: Mika Westerberg <mika.westerberg@linux.intel.com>
>>
>
> Great. Thanks.

Hopefully the next revision will be the right one! :)
