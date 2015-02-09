From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 1/3][v2] gpiolib: add gpiod_get_array and gpiod_put_array functions
Date: Mon, 9 Feb 2015 14:12:39 +0900
Message-ID: <CAAVeFu+Z+ExaCimgB-7gT0zZspNLmpKPC+C_+wzYTYb2UMBJUQ@mail.gmail.com>
References: <1485356.H0CQOKK5aG@pcimr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f171.google.com ([209.85.213.171]:45111 "EHLO
	mail-ig0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750713AbbBIFNB (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Feb 2015 00:13:01 -0500
Received: by mail-ig0-f171.google.com with SMTP id h15so14146113igd.4
        for <linux-gpio@vger.kernel.org>; Sun, 08 Feb 2015 21:13:00 -0800 (PST)
In-Reply-To: <1485356.H0CQOKK5aG@pcimr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rojhalat Ibrahim <imr@rtschenk.de>, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

Hi Rojhalat, apologies for the time I took to review this.

On Thu, Jan 22, 2015 at 1:46 AM, Rojhalat Ibrahim <imr@rtschenk.de> wrote:
> Introduce new functions for conveniently obtaining and disposing of an entire
> array of GPIOs with one function call.

This patch does not apply on Linus' latest devel branch, certainly
because I took too long to review. Could you rebase? It won't be for
nothing since I have comments anyway. :)

>
> Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Rojhalat Ibrahim <imr@rtschenk.de>
> ---
> v2: change interface
>
> The ACPI and platform stuff is only compile-tested.
>
>  Documentation/gpio/consumer.txt |   30 ++++-
>  drivers/gpio/gpiolib.c          |  228 ++++++++++++++++++++++++++++++++++++++--
>  include/linux/gpio/consumer.h   |   53 +++++++++
>  3 files changed, 300 insertions(+), 11 deletions(-)
>
> diff --git a/Documentation/gpio/consumer.txt b/Documentation/gpio/consumer.txt
> index d85fbae..4c9689d 100644
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
> @@ -91,8 +111,12 @@ A GPIO descriptor can be disposed of using the gpiod_put() function:
>
>         void gpiod_put(struct gpio_desc *desc)
>
> -It is strictly forbidden to use a descriptor after calling this function. The
> -device-managed variant is, unsurprisingly:
> +For an array of GPIOs this function can be used:
> +
> +       void gpiod_put_array(struct gpio_descs *descs)

Before people start doing funny things: maybe we should be explicit
about the fact that GPIOs obtained using gpiod_get_array() *cannot* be
individually released by gpiod_put(). I can foresee people trying to
do it. :P

> +
> +It is strictly forbidden to use a descriptor after calling these functions.
> +The device-managed variant is, unsurprisingly:
>
>         void devm_gpiod_put(struct device *dev, struct gpio_desc *desc)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 9d2a371..3e882ec 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -53,6 +53,9 @@ static DEFINE_MUTEX(gpio_lookup_lock);
>  static LIST_HEAD(gpio_lookup_list);
>  LIST_HEAD(gpio_chips);
>
> +/* gpio suffixes used for ACPI and device tree lookup */
> +static const char const *gpio_suffixes[] = { "gpios", "gpio" };
> +
>  static inline void desc_set_label(struct gpio_desc *d, const char *label)
>  {
>         d->label = label;
> @@ -1657,17 +1660,17 @@ static struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
>                                       unsigned int idx,
>                                       enum gpio_lookup_flags *flags)
>  {
> -       static const char const *suffixes[] = { "gpios", "gpio" };
>         char prop_name[32]; /* 32 is max size of property name */
>         enum of_gpio_flags of_flags;
>         struct gpio_desc *desc;
>         unsigned int i;
>
> -       for (i = 0; i < ARRAY_SIZE(suffixes); i++) {
> +       for (i = 0; i < ARRAY_SIZE(gpio_suffixes); i++) {
>                 if (con_id)
> -                       snprintf(prop_name, 32, "%s-%s", con_id, suffixes[i]);
> +                       snprintf(prop_name, 32, "%s-%s", con_id,
> +                                gpio_suffixes[i]);
>                 else
> -                       snprintf(prop_name, 32, "%s", suffixes[i]);
> +                       snprintf(prop_name, 32, "%s", gpio_suffixes[i]);
>
>                 desc = of_get_named_gpiod_flags(dev->of_node, prop_name, idx,
>                                                 &of_flags);
> @@ -1688,7 +1691,6 @@ static struct gpio_desc *acpi_find_gpio(struct device *dev, const char *con_id,
>                                         unsigned int idx,
>                                         enum gpio_lookup_flags *flags)
>  {
> -       static const char * const suffixes[] = { "gpios", "gpio" };
>         struct acpi_device *adev = ACPI_COMPANION(dev);
>         struct acpi_gpio_info info;
>         struct gpio_desc *desc;
> @@ -1696,13 +1698,13 @@ static struct gpio_desc *acpi_find_gpio(struct device *dev, const char *con_id,
>         int i;
>
>         /* Try first from _DSD */
> -       for (i = 0; i < ARRAY_SIZE(suffixes); i++) {
> +       for (i = 0; i < ARRAY_SIZE(gpio_suffixes); i++) {
>                 if (con_id && strcmp(con_id, "gpios")) {
>                         snprintf(propname, sizeof(propname), "%s-%s",
> -                                con_id, suffixes[i]);
> +                                con_id, gpio_suffixes[i]);
>                 } else {
>                         snprintf(propname, sizeof(propname), "%s",
> -                                suffixes[i]);
> +                                gpio_suffixes[i]);
>                 }

This is helpful but has nothing to do with the newly introduced
functions. Maybe move this to its own patch for clarity?

>
>                 desc = acpi_get_gpiod_by_index(adev, propname, idx, &info);
> @@ -1801,6 +1803,136 @@ static struct gpio_desc *gpiod_find(struct device *dev, const char *con_id,
>         return desc;
>  }
>
> +static unsigned int dt_gpio_count(struct device *dev, const char *con_id)
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
> +               if (ret > 0)
> +                       return ret;
> +       }
> +       return 0;
> +}
> +
> +#ifdef CONFIG_ACPI
> +
> +static int acpi_find_gpio_count(struct acpi_resource *ares, void *data)
> +{
> +       unsigned int *count = data;
> +
> +       if (ares->type == ACPI_RESOURCE_TYPE_GPIO)
> +               *count = ares->data.gpio.pin_table_length;
> +
> +       return 1;
> +}
> +
> +static unsigned int acpi_gpio_count(struct device *dev, const char *con_id)
> +{
> +       struct acpi_device *adev = ACPI_COMPANION(dev);
> +       const union acpi_object *obj;
> +       const struct acpi_gpio_mapping *gm;
> +       unsigned int count = 0;
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
> +                               count = obj->package.count;
> +               } else if (adev->driver_gpios) {
> +                       for (gm = adev->driver_gpios; gm->name; gm++)
> +                               if (strcmp(propname, gm->name) == 0) {
> +                                       count = gm->size;
> +                                       break;
> +                               }
> +               }
> +               if (count)
> +                       break;
> +       }
> +
> +       /* Then from plain _CRS GPIOs */
> +       if (!count) {
> +               struct list_head resource_list;
> +
> +               INIT_LIST_HEAD(&resource_list);
> +               acpi_dev_get_resources(adev, &resource_list,
> +                                      acpi_find_gpio_count, &count);
> +               acpi_dev_free_resource_list(&resource_list);
> +       }
> +       return count;
> +}

I'd really like to have an acked-by from some of the ACPI people
(Mika?) for this part.

> +
> +#else
> +
> +static unsigned int acpi_gpio_count(struct device *dev, const char *con_id)
> +{
> +       return 0;
> +}
> +
> +#endif
> +
> +static unsigned int lut_gpio_count(struct device *dev, const char *con_id)

What does "lut" stands for here?

> +{
> +       struct gpiod_lookup_table *table;
> +       struct gpiod_lookup *p;
> +       unsigned int count = 0;
> +
> +       table = gpiod_find_lookup_table(dev);
> +       if (!table)
> +               return 0;
> +
> +       for (p = &table->table[0]; p->chip_label; p++) {
> +               if ((con_id && p->con_id && !strcmp(con_id, p->con_id)) ||
> +                   (!con_id && !p->con_id))
> +                       count++;
> +       }
> +       return count;
> +}
> +
> +/**
> + * gpiod_count - return the number of GPIOs associated with a device / function
> + * @dev:       GPIO consumer, can be NULL for system-global GPIOs
> + * @con_id:    function within the GPIO consumer
> + */
> +unsigned int gpiod_count(struct device *dev, const char *con_id)
> +{
> +       unsigned int count = 0;
> +
> +       if (IS_ENABLED(CONFIG_OF) && dev && dev->of_node)
> +               count = dt_gpio_count(dev, con_id);
> +       else if (IS_ENABLED(CONFIG_ACPI) && dev && ACPI_HANDLE(dev))
> +               count = acpi_gpio_count(dev, con_id);
> +
> +       if (!count)

Careful, having a count of 0 seems like a valid case here. I think the
above functions should probably return an error code (-ENOENT) if
there is no GPIO property defined to discriminate against the case
where it is present, but empty. The above line would then be changed
to "if (count < 0)" and count originally initialized to e.g. -ENOENT.

> +               count = lut_gpio_count(dev, con_id);
> +
> +       return count;
> +}
> +EXPORT_SYMBOL_GPL(gpiod_count);
> +
>  /**
>   * gpiod_get - obtain a GPIO for a given GPIO function
>   * @dev:       GPIO consumer, can be NULL for system-global GPIOs
> @@ -2002,6 +2134,71 @@ struct gpio_desc *__must_check __gpiod_get_index_optional(struct device *dev,
>  EXPORT_SYMBOL_GPL(__gpiod_get_index_optional);
>
>  /**
> + * gpiod_get_array - obtain multiple GPIOs from a multi-index GPIO function
> + * @dev:       GPIO consumer, can be NULL for system-global GPIOs
> + * @con_id:    function within the GPIO consumer
> + * @flags:     optional GPIO initialization flags
> + *
> + * This function obtains all GPIOs for functions that define several GPIOs.

-> This function acquires all the GPIOs defined under a given function?

> + *
> + * Return a struct gpio_descs containing an array of descriptors, -ENOENT if
> + * no GPIO has been assigned to the requested function, or another IS_ERR()
> + * code if an error occurred while trying to acquire the GPIOs.
> + */
> +struct gpio_descs *__must_check __gpiod_get_array(struct device *dev,
> +                                                 const char *con_id,
> +                                                 enum gpiod_flags flags)
> +{
> +       struct gpio_desc *desc;
> +       struct gpio_descs *descs;
> +       unsigned int count;
> +
> +       count = gpiod_count(dev, con_id);
> +       if (!count)

Taking into account what I have said above, this would become "if
(IS_ERR(count))".

A zero-sized array of GPIOs is a weird thing to have, but is valid nonetheless.

> +               return ERR_PTR(-ENOENT);
> +
> +       descs = kzalloc(sizeof(*descs) + sizeof(descs->desc_array[0]) * count,
> +                       GFP_KERNEL);
> +
> +       for (descs->array_size = 0; descs->array_size < count; ) {
> +               desc = gpiod_get_index(dev, con_id, descs->array_size, flags);
> +               if (IS_ERR(desc)) {
> +                       gpiod_put_array(descs);
> +                       return ERR_PTR(PTR_ERR(desc));
> +               }
> +               descs->desc_array[descs->array_size] = desc;
> +               descs->array_size++;
> +       }
> +       return descs;
> +}
> +EXPORT_SYMBOL_GPL(__gpiod_get_array);
> +
> +/**
> + * gpiod_get_array_optional - obtain multiple GPIOs from a multi-index GPIO
> + *                            function
> + * @dev:       GPIO consumer, can be NULL for system-global GPIOs
> + * @con_id:    function within the GPIO consumer
> + * @flags:     optional GPIO initialization flags
> + *
> + * This is equivalent to gpiod_get_array(), except that when no GPIO was
> + * assigned to the requested function it will return NULL.
> + */
> +struct gpio_descs *__must_check __gpiod_get_array_optional(struct device *dev,
> +                                                       const char *con_id,
> +                                                       enum gpiod_flags flags)
> +{
> +       struct gpio_descs *descs;
> +
> +       descs = gpiod_get_array(dev, con_id, flags);
> +       if (IS_ERR(descs)) {
> +               if (PTR_ERR(descs) == -ENOENT)

if (IS_ERR(descs && PTR_ERR(descs) == -ENOENT) ?

> +                       return NULL;
> +       }
> +       return descs;
> +}
> +EXPORT_SYMBOL_GPL(__gpiod_get_array_optional);
> +
> +/**
>   * gpiod_put - dispose of a GPIO descriptor
>   * @desc:      GPIO descriptor to dispose of
>   *
> @@ -2013,6 +2210,21 @@ void gpiod_put(struct gpio_desc *desc)
>  }
>  EXPORT_SYMBOL_GPL(gpiod_put);
>
> +/**
> + * gpiod_put_array - dispose of multiple GPIO descriptors
> + * @descs:     struct gpio_descs containing an array of descriptors
> + */
> +void gpiod_put_array(struct gpio_descs *descs)
> +{
> +       unsigned int i;
> +
> +       for (i = 0; i < descs->array_size; i++)
> +               gpiod_put(descs->desc_array[i]);

if (descs->desc_array[i]), otherwise we might get warnings in the
error path of gpiod_get_array().

> +
> +       kfree(descs);
> +}
> +EXPORT_SYMBOL_GPL(gpiod_put_array);
> +
>  #ifdef CONFIG_DEBUG_FS
>
>  static void gpiolib_dbg_show(struct seq_file *s, struct gpio_chip *chip)
> diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
> index 45afc2d..0582435 100644
> --- a/include/linux/gpio/consumer.h
> +++ b/include/linux/gpio/consumer.h
> @@ -16,6 +16,15 @@ struct device;
>   */
>  struct gpio_desc;
>
> +/**
> + * Struct containing an array of descriptors that can be obtained using
> + * gpiod_get_array().
> + */
> +struct gpio_descs {
> +       unsigned int array_size;
> +       struct gpio_desc *desc_array[];
> +};
> +
>  #define GPIOD_FLAGS_BIT_DIR_SET                BIT(0)
>  #define GPIOD_FLAGS_BIT_DIR_OUT                BIT(1)
>  #define GPIOD_FLAGS_BIT_DIR_VAL                BIT(2)
> @@ -34,6 +43,9 @@ enum gpiod_flags {
>
>  #ifdef CONFIG_GPIOLIB
>
> +/* Return the number of GPIOs associated with a device / function */
> +unsigned int gpiod_count(struct device *dev, const char *con_id);
> +
>  /* Acquire and dispose GPIOs */
>  struct gpio_desc *__must_check __gpiod_get(struct device *dev,
>                                          const char *con_id,
> @@ -49,7 +61,14 @@ struct gpio_desc *__must_check __gpiod_get_index_optional(struct device *dev,
>                                                         const char *con_id,
>                                                         unsigned int index,
>                                                         enum gpiod_flags flags);
> +struct gpio_descs *__must_check __gpiod_get_array(struct device *dev,
> +                                                 const char *con_id,
> +                                                 enum gpiod_flags flags);
> +struct gpio_descs *__must_check __gpiod_get_array_optional(struct device *dev,
> +                                                       const char *con_id,
> +                                                       enum gpiod_flags flags);
>  void gpiod_put(struct gpio_desc *desc);
> +void gpiod_put_array(struct gpio_descs *descs);
>
>  struct gpio_desc *__must_check __devm_gpiod_get(struct device *dev,
>                                               const char *con_id,
> @@ -113,6 +132,11 @@ struct gpio_desc *devm_get_gpiod_from_child(struct device *dev,
>                                             struct fwnode_handle *child);
>  #else /* CONFIG_GPIOLIB */
>
> +static inline unsigned int gpiod_count(struct device *dev, const char *con_id)
> +{
> +       return 0;
> +}
> +
>  static inline struct gpio_desc *__must_check __gpiod_get(struct device *dev,
>                                                 const char *con_id,
>                                                 enum gpiod_flags flags)
> @@ -142,6 +166,20 @@ __gpiod_get_index_optional(struct device *dev, const char *con_id,
>         return ERR_PTR(-ENOSYS);
>  }
>
> +static inline struct gpio_descs *__must_check
> +__gpiod_get_array(struct device *dev, const char *con_id,
> +                 enum gpiod_flags flags)
> +{
> +       return ERR_PTR(-ENOSYS);
> +}
> +
> +static inline struct gpio_descs *__must_check
> +__gpiod_get_array_optional(struct device *dev, const char *con_id,
> +                          enum gpiod_flags flags)
> +{
> +       return ERR_PTR(-ENOSYS);
> +}
> +
>  static inline void gpiod_put(struct gpio_desc *desc)
>  {
>         might_sleep();
> @@ -150,6 +188,14 @@ static inline void gpiod_put(struct gpio_desc *desc)
>         WARN_ON(1);
>  }
>
> +static inline void gpiod_put_array(struct gpio_descs *descs)
> +{
> +       might_sleep();
> +
> +       /* GPIO can never have been requested */
> +       WARN_ON(1);
> +}
> +
>  static inline struct gpio_desc *__must_check
>  __devm_gpiod_get(struct device *dev,
>                  const char *con_id,
> @@ -351,6 +397,13 @@ static inline int desc_to_gpio(const struct gpio_desc *desc)
>         __gpiod_get_index_optional(dev, con_id, index, flags)
>  #define gpiod_get_index_optional(varargs...)                           \
>         __gpiod_get_index_optional(varargs, GPIOD_ASIS)
> +#define __gpiod_get_array(dev, con_id, flags, ...)     \
> +       __gpiod_get_array(dev, con_id, flags)
> +#define gpiod_get_array(varargs...) __gpiod_get_array(varargs, GPIOD_ASIS)
> +#define __gpiod_get_array_optional(dev, con_id, flags, ...) \
> +       __gpiod_get_array_optional(dev, con_id, flags)
> +#define gpiod_get_array_optional(varargs...)                           \
> +       __gpiod_get_array_optional(varargs, GPIOD_ASIS)

I don't think you need to bother with these. gpiod_get_array() and
gpiod_get_new_array_optional() are new functions, so we can simply say
that the flags argument is not optional for them. This macro trickery
is used to ease the transition to the new form of gpiod_get(), but for
a completely new function it is not required.

So here you can just define and export gpiod_get_array() in gpiolib.c,
and go completely without __gpiod_get_array() (same for the
gpiod_get_array_optional)

I really like this. We have another ongoing discussion about sysfs v2
for GPIO and this interface might become the basis of it, as we want a
way to easily set multiple GPIOs from user-space.

I also wonder if, as a future step, we could/should not have
gpiod_get/set_array() take a gpio_descs * instead of an array and GPIO
count ? But that's for after this series is merged.
