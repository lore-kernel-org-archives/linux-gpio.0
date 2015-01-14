From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 1/2] gpiolib: add gpiod_get_array and gpiod_put_array functions
Date: Wed, 14 Jan 2015 14:11:16 +0900
Message-ID: <CAAVeFuK4ueJ0v8pkbvR+=fTU=6ve0-ie30oTzJe65cVfha-L4g@mail.gmail.com>
References: <3961090.tifPlxnXvR@pcimr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f174.google.com ([209.85.223.174]:60761 "EHLO
	mail-ie0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750719AbbANFLi (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Jan 2015 00:11:38 -0500
Received: by mail-ie0-f174.google.com with SMTP id at20so6987881iec.5
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2015 21:11:37 -0800 (PST)
In-Reply-To: <3961090.tifPlxnXvR@pcimr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rojhalat Ibrahim <imr@rtschenk.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

On Sat, Jan 10, 2015 at 12:19 AM, Rojhalat Ibrahim <imr@rtschenk.de> wrote:
> Introduce new functions for conveniently obtaining and disposing of an entire
> array of GPIOs with one function call.

Excellent, thanks for following up with this! :)

>
> Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Rojhalat Ibrahim <imr@rtschenk.de>
> ---
>  Documentation/gpio/consumer.txt |   28 ++++++++++++-
>  drivers/gpio/gpiolib.c          |   84 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/gpio/consumer.h   |   42 ++++++++++++++++++++
>  3 files changed, 153 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/gpio/consumer.txt b/Documentation/gpio/consumer.txt
> index c67f806..d02f341 100644
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
> @@ -68,6 +67,29 @@ instead of -ENOENT if no GPIO has been assigned to the requested function:
>                                                    unsigned int index,
>                                                    enum gpiod_flags flags)
>
> +For a function using multiple GPIOs all of those can be obtained with one call:
> +
> +       int gpiod_get_array(struct device *dev,
> +                           const char *con_id,
> +                           struct gpio_desc **desc_array,
> +                           unsigned int count,
> +                           enum gpiod_flags flags)
> +
> +In this case an array for storing the GPIO descriptors and the number of GPIOs
> +are required as additional arguments. This function either returns the
> +requested number of GPIOs or an error code. It will not return a positive
> +number if some but not all of the requested GPIOs could be obtained.

I wonder if the following interface would not be more convenient, at
least for the most common cases:

    struct gpiod_descs *gpiod_get_array(struct device *dev, const char
*con_id, enum gpiod_flags flags);

Which would *allocate* the array of descriptors to the right number of
GPIOs and return them all. The current way of doing requires the user
to 1) figure out how many GPIOs there are under (dev, con_id), 2)
allocate a the GPIO array and 3) call this function. The array must
also be explicitly freed after calling gpiod_put_array().

struct gpiod_descs would be something like this:

struct gpiod_descs {
    unsigned count;
    struct gpiod_desc*[];
}

It uses a zero-length array to store the actual descriptors and
carries the count so the user does not have to remember it (it will
always be needed anyway, and that way we don't have to pass it
explicitly to gpiod_put_array()).

The nice thing with this interface is that it works identically to
gpiod_get(), excepted it can handle 1 GPIO or more. This would be
handy in order to implement sysfs v2 on top of it (see
https://lkml.org/lkml/2015/1/3/50).

We could even have a macro to iterate over the GPIOs:

#define for_each_gpio(gpiod_descs, gpiod_desc) ...

If you think your current interface is necessary because users need to
work with already-allocated arrays of descriptors, could you then
rename it under a more "private" name (maybe
gpiod_fill_array/gpiod_free_array?) and build the
gpiod_get_array/gpiod_put_array I suggest on top of it?

Also for the sake of completeness, may I suggest adding the following
function to the gpiod interface:

    int gpiod_count(struct device *dev, const char *con_id);

Which returns the number of GPIOs that are declared for (dev, con_id)?
Right now gpiod_get_array() can only be used properly under the device
tree (which provides of_gpio_named_count()), but we also need to
enable it for ACPI and platform data.

Having this function will allow users of gpiod_get_index() to know the
boundaries they have to work with, no matter how the GPIO mappings are
provided. It will also be needed if you implement the version of
gpiod_get_array() I suggest.

In your patch 2/2, you will then also want to replace the call to
of_gpio_count() in mdio_mux_gpio_probe() by a call to gpiod_count().

> +The following function behaves differently:
> +
> +       int gpiod_get_array_optional(struct device *dev,
> +                                    const char *con_id,
> +                                    struct gpio_desc **desc_array,
> +                                    unsigned int could,
> +                                    enum gpiod_flags flags)
> +
> +This one returns the number of GPIOs actually available which can be smaller
> +than the requested number or even 0.

There is no user for this function yet but I agree it is good to have.

> +
>  Device-managed variants of these functions are also defined:

Do you plan to also add devm variants of the new get_array() function(s)?

>
>         struct gpio_desc *devm_gpiod_get(struct device *dev, const char *con_id,
> @@ -91,6 +113,10 @@ A GPIO descriptor can be disposed of using the gpiod_put() function:
>
>         void gpiod_put(struct gpio_desc *desc)
>
> +For an array of GPIOs this function can be used:
> +
> +       void gpiod_put_array(struct gpio_desc **desc_array, unsigned int count)
> +
>  It is strictly forbidden to use a descriptor after calling this function. The

This paragraph will probably require a s/this/these to be gramatically correct.

>  device-managed variant is, unsurprisingly:
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 56b7c5d..d45fa9c 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1925,6 +1925,76 @@ struct gpio_desc *__must_check __gpiod_get_index_optional(struct device *dev,
>  EXPORT_SYMBOL_GPL(__gpiod_get_index_optional);
>
>  /**
> + * gpiod_get_array - obtain multiple GPIOs from a multi-index GPIO function
> + * @dev:       GPIO consumer, can be NULL for system-global GPIOs
> + * @con_id:    function within the GPIO consumer
> + * @desc_array:        descriptor array for the acquired GPIOs
> + * @count:     number of GPIOs to obtain in the consumer
> + * @flags:     optional GPIO initialization flags
> + *
> + * This function obtains the specified number of GPIOs starting with index 0
> + * for functions that define several GPIOs.
> + *
> + * Return the actual number of acquired GPIOs, -ENOENT if the actual number of
> + * GPIOs assigned to the requested function is smaller than @count,
> + * or another IS_ERR() code if an error occurred while trying to acquire the
> + * GPIOs.
> + */
> +int __must_check __gpiod_get_array(struct device *dev, const char *con_id,
> +                                  struct gpio_desc **desc_array,
> +                                  unsigned int count,
> +                                  enum gpiod_flags flags)
> +{
> +       int r;
> +
> +       r = gpiod_get_array_optional(dev, con_id, desc_array, count, flags);
> +       if ((r >= 0) && (r != count)) {
> +               gpiod_put_array(desc_array, r);
> +               return -ENOENT;
> +       }
> +       return r;
> +}
> +EXPORT_SYMBOL_GPL(__gpiod_get_array);
> +
> +/**
> + * gpiod_get_array_optional - obtain multiple GPIOs from a multi-index GPIO
> + *                            function
> + * @dev:       GPIO consumer, can be NULL for system-global GPIOs
> + * @con_id:    function within the GPIO consumer
> + * @desc_array:        descriptor array for the acquired GPIOs
> + * @count:     number of GPIOs to obtain in the consumer
> + * @flags:     optional GPIO initialization flags
> + *
> + * This is equivalent to gpiod_get_array(), except that when the actual number
> + * of GPIOs assigned to the requested function is smaller than @count it will
> + * not return an error but the number of GPIOs actually available.
> + */
> +int __must_check __gpiod_get_array_optional(struct device *dev,
> +                                           const char *con_id,
> +                                           struct gpio_desc **desc_array,
> +                                           unsigned int count,
> +                                           enum gpiod_flags flags)
> +{
> +       struct gpio_desc *desc;
> +       unsigned int n;
> +
> +       for (n = 0; n < count; ) {
> +               desc = gpiod_get_index(dev, con_id, n, flags);
> +               if (IS_ERR(desc)) {
> +                       if (PTR_ERR(desc) != -ENOENT) {
> +                               gpiod_put_array(desc_array, n);
> +                               return PTR_ERR(desc);
> +                       }
> +                       break;
> +               }
> +               desc_array[n] = desc;
> +               n++;
> +       }
> +       return n;
> +}
> +EXPORT_SYMBOL_GPL(__gpiod_get_array_optional);
> +
> +/**
>   * gpiod_put - dispose of a GPIO descriptor
>   * @desc:      GPIO descriptor to dispose of
>   *
> @@ -1936,6 +2006,20 @@ void gpiod_put(struct gpio_desc *desc)
>  }
>  EXPORT_SYMBOL_GPL(gpiod_put);
>
> +/**
> + * gpiod_put_array - dispose of multiple GPIO descriptors
> + * @desc_array:        GPIO descriptor array
> + * @count:     number of GPIOs in the array
> + */
> +void gpiod_put_array(struct gpio_desc **desc_array, unsigned int count)
> +{
> +       unsigned int n;
> +
> +       for (n = 0; n < count; n++)
> +               gpiod_put(desc_array[n]);
> +}
> +EXPORT_SYMBOL_GPL(gpiod_put_array);

The implementation looks good to me. I'd just like you to consider the
alternative interface I propose, as I suspect it might make the life
of users easier.
