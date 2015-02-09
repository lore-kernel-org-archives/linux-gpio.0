From: Rojhalat Ibrahim <imr@rtschenk.de>
Subject: Re: [PATCH 2/3][v2] gpiolib: add devm_gpiod_get_array and devm_gpiod_put_array functions
Date: Mon, 09 Feb 2015 10:08:31 +0100
Message-ID: <3238389.y1IoHjLNyC@pcimr>
References: <1531555.i80LcbnH1V@pcimr> <CAAVeFuKeFjku3fY_n78ZNGuY=1qLVt0jXMauhcDtBvu8GaSeyQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:51696 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932646AbbBIJIh (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Feb 2015 04:08:37 -0500
In-Reply-To: <CAAVeFuKeFjku3fY_n78ZNGuY=1qLVt0jXMauhcDtBvu8GaSeyQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

On Monday 09 February 2015 14:16:55 Alexandre Courbot wrote:
> On Thu, Jan 22, 2015 at 1:46 AM, Rojhalat Ibrahim <imr@rtschenk.de> wrote:
> > Add device managed variants of gpiod_get_array() / gpiod_put_array()
> > functions for conveniently obtaining and disposing of an entire array
> > of GPIOs with one function call.
> >
> > Signed-off-by: Rojhalat Ibrahim <imr@rtschenk.de>
> > ---
> > v2: add this patch to the set
> >
> > Only compile-tested.
> >
> >  Documentation/gpio/consumer.txt |   14 +++++-
> >  drivers/gpio/devres.c           |   91 ++++++++++++++++++++++++++++++++++++++++
> >  include/linux/gpio/consumer.h   |   38 ++++++++++++++++
> >  3 files changed, 141 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/gpio/consumer.txt b/Documentation/gpio/consumer.txt
> > index 4c9689d..805e6f9 100644
> > --- a/Documentation/gpio/consumer.txt
> > +++ b/Documentation/gpio/consumer.txt
> > @@ -102,11 +102,19 @@ Device-managed variants of these functions are also defined:
> >                                                   const char *con_id,
> >                                                   enum gpiod_flags flags)
> >
> > -       struct gpio_desc * devm_gpiod_get_index_optional(struct device *dev,
> > +       struct gpio_desc *devm_gpiod_get_index_optional(struct device *dev,
> >                                                         const char *con_id,
> >                                                         unsigned int index,
> >                                                         enum gpiod_flags flags)
> >
> > +       struct gpio_descs *devm_gpiod_get_array(struct device *dev,
> > +                                               const char *con_id,
> > +                                               enum gpiod_flags flags)
> > +
> > +       struct gpio_descs *devm_gpiod_get_array_optional(struct device *dev,
> > +                                                        const char *con_id,
> > +                                                        enum gpiod_flags flags)
> > +
> >  A GPIO descriptor can be disposed of using the gpiod_put() function:
> >
> >         void gpiod_put(struct gpio_desc *desc)
> > @@ -116,10 +124,12 @@ For an array of GPIOs this function can be used:
> >         void gpiod_put_array(struct gpio_descs *descs)
> >
> >  It is strictly forbidden to use a descriptor after calling these functions.
> > -The device-managed variant is, unsurprisingly:
> > +The device-managed variants are, unsurprisingly:
> >
> >         void devm_gpiod_put(struct device *dev, struct gpio_desc *desc)
> >
> > +       void devm_gpiod_put_array(struct device *dev, struct gpio_descs *descs)
> > +
> >
> >  Using GPIOs
> >  ===========
> > diff --git a/drivers/gpio/devres.c b/drivers/gpio/devres.c
> > index 13dbd3d..6198cb1 100644
> > --- a/drivers/gpio/devres.c
> > +++ b/drivers/gpio/devres.c
> > @@ -35,6 +35,20 @@ static int devm_gpiod_match(struct device *dev, void *res, void *data)
> >         return *this == *gpio;
> >  }
> >
> > +static void devm_gpiod_release_array(struct device *dev, void *res)
> > +{
> > +       struct gpio_descs **descs = res;
> > +
> > +       gpiod_put_array(*descs);
> > +}
> > +
> > +static int devm_gpiod_match_array(struct device *dev, void *res, void *data)
> > +{
> > +       struct gpio_descs **this = res, **gpios = data;
> > +
> > +       return *this == *gpios;
> > +}
> > +
> >  /**
> >   * devm_gpiod_get - Resource-managed gpiod_get()
> >   * @dev:       GPIO consumer
> > @@ -170,6 +184,68 @@ struct gpio_desc *__must_check __devm_gpiod_get_index_optional(struct device *de
> >  EXPORT_SYMBOL(__devm_gpiod_get_index_optional);
> >
> >  /**
> > + * devm_gpiod_get_array - Resource-managed gpiod_get_array()
> > + * @dev:       GPIO consumer
> > + * @con_id:    function within the GPIO consumer
> > + * @flags:     optional GPIO initialization flags
> > + *
> > + * Managed gpiod_get_array(). GPIO descriptors returned from this function are
> > + * automatically disposed on driver detach. See gpiod_get_array() for detailed
> > + * information about behavior and return values.
> > + */
> > +struct gpio_descs *__must_check __devm_gpiod_get_array(struct device *dev,
> > +                                                      const char *con_id,
> > +                                                      enum gpiod_flags flags)
> > +{
> > +       struct gpio_descs **dr;
> > +       struct gpio_descs *descs;
> > +
> > +       dr = devres_alloc(devm_gpiod_release_array,
> > +                         sizeof(struct gpio_descs *), GFP_KERNEL);
> > +       if (!dr)
> > +               return ERR_PTR(-ENOMEM);
> > +
> > +       descs = gpiod_get_array(dev, con_id, flags);
> > +       if (IS_ERR(descs)) {
> > +               devres_free(dr);
> > +               return descs;
> > +       }
> > +
> > +       *dr = descs;
> > +       devres_add(dev, dr);
> > +
> > +       return descs;
> > +}
> > +EXPORT_SYMBOL(__devm_gpiod_get_array);
> > +
> > +/**
> > + * devm_gpiod_get_array_optional - Resource-managed gpiod_get_array_optional()
> > + * @dev:       GPIO consumer
> > + * @con_id:    function within the GPIO consumer
> > + * @flags:     optional GPIO initialization flags
> > + *
> > + * Managed gpiod_get_array_optional(). GPIO descriptors returned from this
> > + * function are automatically disposed on driver detach.
> > + * See gpiod_get_array_optional() for detailed information about behavior and
> > + * return values.
> > + */
> > +struct gpio_descs *__must_check
> > +__devm_gpiod_get_array_optional(struct device *dev, const char *con_id,
> > +                               enum gpiod_flags flags)
> > +{
> > +       struct gpio_descs *descs;
> > +
> > +       descs = devm_gpiod_get_array(dev, con_id, flags);
> > +       if (IS_ERR(descs)) {
> > +               if (PTR_ERR(descs) == -ENOENT)
> > +                       return NULL;
> > +       }
> > +
> > +       return descs;
> > +}
> > +EXPORT_SYMBOL(__devm_gpiod_get_array_optional);
> > +
> > +/**
> >   * devm_gpiod_put - Resource-managed gpiod_put()
> >   * @desc:      GPIO descriptor to dispose of
> >   *
> > @@ -184,6 +260,21 @@ void devm_gpiod_put(struct device *dev, struct gpio_desc *desc)
> >  }
> >  EXPORT_SYMBOL(devm_gpiod_put);
> >
> > +/**
> > + * devm_gpiod_put_array - Resource-managed gpiod_put_array()
> > + * @descs:     GPIO descriptor array to dispose of
> > + *
> > + * Dispose of an array of GPIO descriptors obtained with devm_gpiod_get_array().
> > + * Normally this function will not be called as the GPIOs will be disposed of
> > + * by the resource management code.
> > + */
> > +void devm_gpiod_put_array(struct device *dev, struct gpio_descs *descs)
> > +{
> > +       WARN_ON(devres_release(dev, devm_gpiod_release_array,
> > +                              devm_gpiod_match_array, &descs));
> > +}
> > +EXPORT_SYMBOL(devm_gpiod_put_array);
> > +
> >
> >
> >
> > diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
> > index 0582435..5cc2762 100644
> > --- a/include/linux/gpio/consumer.h
> > +++ b/include/linux/gpio/consumer.h
> > @@ -83,7 +83,14 @@ struct gpio_desc *__must_check __devm_gpiod_get_optional(struct device *dev,
> >  struct gpio_desc *__must_check
> >  __devm_gpiod_get_index_optional(struct device *dev, const char *con_id,
> >                               unsigned int index, enum gpiod_flags flags);
> > +struct gpio_descs *__must_check __devm_gpiod_get_array(struct device *dev,
> > +                                                      const char *con_id,
> > +                                                      enum gpiod_flags flags);
> > +struct gpio_descs *__must_check
> > +__devm_gpiod_get_array_optional(struct device *dev, const char *con_id,
> > +                               enum gpiod_flags flags);
> >  void devm_gpiod_put(struct device *dev, struct gpio_desc *desc);
> > +void devm_gpiod_put_array(struct device *dev, struct gpio_descs *descs);
> >
> >  int gpiod_get_direction(struct gpio_desc *desc);
> >  int gpiod_direction_input(struct gpio_desc *desc);
> > @@ -227,6 +234,20 @@ __devm_gpiod_get_index_optional(struct device *dev, const char *con_id,
> >         return ERR_PTR(-ENOSYS);
> >  }
> >
> > +static inline struct gpio_descs *__must_check
> > +__devm_gpiod_get_array(struct device *dev, const char *con_id,
> > +                      enum gpiod_flags flags)
> > +{
> > +       return ERR_PTR(-ENOSYS);
> > +}
> > +
> > +static inline struct gpio_descs *__must_check
> > +__devm_gpiod_get_array_optional(struct device *dev, const char *con_id,
> > +                               enum gpiod_flags flags)
> > +{
> > +       return ERR_PTR(-ENOSYS);
> > +}
> > +
> >  static inline void devm_gpiod_put(struct device *dev, struct gpio_desc *desc)
> >  {
> >         might_sleep();
> > @@ -235,6 +256,15 @@ static inline void devm_gpiod_put(struct device *dev, struct gpio_desc *desc)
> >         WARN_ON(1);
> >  }
> >
> > +static inline void devm_gpiod_put_array(struct device *dev,
> > +                                       struct gpio_descs *descs)
> > +{
> > +       might_sleep();
> > +
> > +       /* GPIO can never have been requested */
> > +       WARN_ON(1);
> > +}
> > +
> >
> >  static inline int gpiod_get_direction(const struct gpio_desc *desc)
> >  {
> > @@ -419,6 +449,14 @@ static inline int desc_to_gpio(const struct gpio_desc *desc)
> >         __devm_gpiod_get_index_optional(dev, con_id, index, flags)
> >  #define devm_gpiod_get_index_optional(varargs...)                      \
> >         __devm_gpiod_get_index_optional(varargs, GPIOD_ASIS)
> > +#define __devm_gpiod_get_array(dev, con_id, flags, ...)                        \
> > +       __devm_gpiod_get_array(dev, con_id, flags)
> > +#define devm_gpiod_get_array(varargs...)                               \
> > +       __devm_gpiod_get_array(varargs, GPIOD_ASIS)
> > +#define __devm_gpiod_get_array_optional(dev, con_id, flags, ...)       \
> > +       __devm_gpiod_get_array_optional(dev, con_id, flags)
> > +#define devm_gpiod_get_array_optional(varargs...)                      \
> > +       __devm_gpiod_get_array_optional(varargs, GPIOD_ASIS)
> 
> Same remark as the previous patch: please have the flags argument
> mandatory for these new functions, as this is the direction we want to
> give to the whole API anyway.

Will do.


