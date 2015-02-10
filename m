From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH v3 2/4] gpiolib: add gpiod_get_array and gpiod_put_array functions
Date: Tue, 10 Feb 2015 15:18:16 +0900
Message-ID: <CAAVeFuKAbZn+GZrmQ=G8s2Cp7Z6tehLAAQbZwTLHpK-hjaOwkQ@mail.gmail.com>
References: <5520672.Jf0M3ih51r@pcimr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f173.google.com ([209.85.223.173]:42508 "EHLO
	mail-ie0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751346AbbBJGSh (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Feb 2015 01:18:37 -0500
Received: by iery20 with SMTP id y20so13975863ier.9
        for <linux-gpio@vger.kernel.org>; Mon, 09 Feb 2015 22:18:36 -0800 (PST)
In-Reply-To: <5520672.Jf0M3ih51r@pcimr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rojhalat Ibrahim <imr@rtschenk.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>

On Tue, Feb 10, 2015 at 2:07 AM, Rojhalat Ibrahim <imr@rtschenk.de> wrote:
> Introduce new functions for conveniently obtaining and disposing of an entire
> array of GPIOs with one function call.
>
> Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Rojhalat Ibrahim <imr@rtschenk.de>
> ---
> Change log:
>   v3: - rebase on current linux-gpio devel branch
>       - fix ACPI GPIO counting
>       - allow for zero-sized arrays
>       - make the flags argument mandatory for the new functions
>       - clarify documentation
>   v2: change interface
>
>  Documentation/gpio/consumer.txt |  33 +++++-
>  drivers/gpio/gpiolib.c          | 231 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/gpio/consumer.h   |  46 ++++++++
>  3 files changed, 307 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/gpio/consumer.txt b/Documentation/gpio/consumer.txt
> index d85fbae..85a7e30 100644
> --- a/Documentation/gpio/consumer.txt
> +++ b/Documentation/gpio/consumer.txt
> @@ -58,7 +58,6 @@ pattern where a GPIO is optional, the gpiod_get_optional() and
>  gpiod_get_index_optional() functions can be used. These functions return NULL
>  instead of -ENOENT if no GPIO has been assigned to the requested function:
>
> -
>         struct gpio_desc *gpiod_get_optional(struct device *dev,
>                                              const char *con_id,
>                                              enum gpiod_flags flags)
> @@ -68,6 +67,27 @@ instead of -ENOENT if no GPIO has been assigned to the requested function:
>                                                    unsigned int index,
>                                                    enum gpiod_flags flags)
>
> +For a function using multiple GPIOs all of those can be obtained with one call:
> +
> +       struct gpio_descs *gpiod_get_array(struct device *dev,
> +                                          const char *con_id,
> +                                          enum gpiod_flags flags)
> +
> +This function returns a struct gpio_descs which contains an array of
> +descriptors:
> +
> +       struct gpio_descs {
> +               unsigned int array_size;
> +               struct gpio_desc *desc_array[];

I missed this in the previous revision, but how about having shorter
names for these members? Like

array_size -> ndescs
desc_array -> desc

These would be more comfortable to work with I believe.

> +       }
> +
> +The following function returns NULL instead of -ENOENT if no GPIOs have been
> +assigned to the requested function:
> +
> +       struct gpio_descs *gpiod_get_array_optional(struct device *dev,
> +                                                   const char *con_id,
> +                                                   enum gpiod_flags flags)
> +
>  Device-managed variants of these functions are also defined:
>
>         struct gpio_desc *devm_gpiod_get(struct device *dev, const char *con_id,
> @@ -91,8 +111,15 @@ A GPIO descriptor can be disposed of using the gpiod_put() function:
>
>         void gpiod_put(struct gpio_desc *desc)
>
> -It is strictly forbidden to use a descriptor after calling this function. The
> -device-managed variant is, unsurprisingly:
> +For an array of GPIOs this function can be used:
> +
> +       void gpiod_put_array(struct gpio_descs *descs)
> +
> +It is strictly forbidden to use a descriptor after calling these functions.
> +It is also not allowed to individually release descriptors (using gpiod_put())
> +from an array acquired with gpiod_get_array().
> +
> +The device-managed variant is, unsurprisingly:
>
>         void devm_gpiod_put(struct device *dev, struct gpio_desc *desc)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index ff2b80d..d4153e0 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1804,6 +1804,158 @@ static struct gpio_desc *gpiod_find(struct device *dev, const char *con_id,
>         return desc;
>  }
>
> +static int dt_gpio_count(struct device *dev, const char *con_id)
> +{
> +       int ret;
> +       char propname[32];
> +       unsigned int i;
> +
> +       for (i = 0; i < ARRAY_SIZE(gpio_suffixes); i++) {
> +               if (con_id)
> +                       snprintf(propname, sizeof(propname), "%s-%s",
> +                                con_id, gpio_suffixes[i]);
> +               else
> +                       snprintf(propname, sizeof(propname), "%s",
> +                                gpio_suffixes[i]);
> +
> +               ret = of_gpio_named_count(dev->of_node, propname);
> +               if (ret >= 0)
> +                       break;
> +       }
> +       return ret;
> +}
> +
> +#ifdef CONFIG_ACPI
> +
> +static unsigned int acpi_gpio_package_count(const union acpi_object *obj)
> +{
> +       const union acpi_object *element = obj->package.elements;
> +       const union acpi_object *end = element + obj->package.count;
> +       unsigned int count = 0;
> +
> +       while (element < end) {
> +               if (element->type == ACPI_TYPE_LOCAL_REFERENCE)
> +                       count++;
> +
> +               element++;
> +       }
> +       return count;
> +}
> +
> +static int acpi_find_gpio_count(struct acpi_resource *ares, void *data)
> +{
> +       unsigned int *count = data;
> +
> +       if (ares->type == ACPI_RESOURCE_TYPE_GPIO)
> +               *count += ares->data.gpio.pin_table_length;
> +
> +       return 1;
> +}
> +
> +static int acpi_gpio_count(struct device *dev, const char *con_id)
> +{
> +       struct acpi_device *adev = ACPI_COMPANION(dev);
> +       const union acpi_object *obj;
> +       const struct acpi_gpio_mapping *gm;
> +       int count = -ENOENT;
> +       int ret;
> +       char propname[32];
> +       unsigned int i;
> +
> +       /* Try first from _DSD */
> +       for (i = 0; i < ARRAY_SIZE(gpio_suffixes); i++) {
> +               if (con_id && strcmp(con_id, "gpios"))
> +                       snprintf(propname, sizeof(propname), "%s-%s",
> +                                con_id, gpio_suffixes[i]);
> +               else
> +                       snprintf(propname, sizeof(propname), "%s",
> +                                gpio_suffixes[i]);
> +
> +               ret = acpi_dev_get_property(adev, propname, ACPI_TYPE_ANY,
> +                                           &obj);
> +               if (ret == 0) {
> +                       if (obj->type == ACPI_TYPE_LOCAL_REFERENCE)
> +                               count = 1;
> +                       else if (obj->type == ACPI_TYPE_PACKAGE)
> +                               count = acpi_gpio_package_count(obj);
> +               } else if (adev->driver_gpios) {
> +                       for (gm = adev->driver_gpios; gm->name; gm++)
> +                               if (strcmp(propname, gm->name) == 0) {
> +                                       count = gm->size;
> +                                       break;
> +                               }
> +               }
> +               if (count >= 0)
> +                       break;
> +       }
> +
> +       /* Then from plain _CRS GPIOs */
> +       if (count < 0) {
> +               struct list_head resource_list;
> +               unsigned int crs_count = 0;
> +
> +               INIT_LIST_HEAD(&resource_list);
> +               acpi_dev_get_resources(adev, &resource_list,
> +                                      acpi_find_gpio_count, &crs_count);
> +               acpi_dev_free_resource_list(&resource_list);
> +               if (crs_count > 0)
> +                       count = crs_count;
> +       }
> +       return count;
> +}

Mika, does the ACPI part look good to you?

> +
> +#else
> +
> +static int acpi_gpio_count(struct device *dev, const char *con_id)
> +{
> +       return -ENODEV;
> +}
> +
> +#endif
> +
> +static int lut_gpio_count(struct device *dev, const char *con_id)

I did not reply to your previous comment, but I'd prefer if this was
named platform_gpio_count, for clarity.

These are my last nits - after they are fixed, please feel free to add my

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

to the next revision.
