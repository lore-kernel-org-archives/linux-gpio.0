From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 1/2] gpiolib: add gpiod_get_array and gpiod_put_array functions
Date: Thu, 15 Jan 2015 13:52:46 +0900
Message-ID: <CAAVeFu+Sni4Xguba8z_cwpVu2PhCy_mbrLxsqV=ADcqdmfSsnQ@mail.gmail.com>
References: <3961090.tifPlxnXvR@pcimr> <CAAVeFuK4ueJ0v8pkbvR+=fTU=6ve0-ie30oTzJe65cVfha-L4g@mail.gmail.com>
 <2909581.Ya6Uc7XXnK@pcimr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f175.google.com ([209.85.223.175]:62142 "EHLO
	mail-ie0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751031AbbAOExI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Jan 2015 23:53:08 -0500
Received: by mail-ie0-f175.google.com with SMTP id x19so12969680ier.6
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2015 20:53:06 -0800 (PST)
In-Reply-To: <2909581.Ya6Uc7XXnK@pcimr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rojhalat Ibrahim <imr@rtschenk.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

On Wed, Jan 14, 2015 at 9:55 PM, Rojhalat Ibrahim <imr@rtschenk.de> wrote:
> On Wednesday 14 January 2015 14:11:16 Alexandre Courbot wrote:
>> On Sat, Jan 10, 2015 at 12:19 AM, Rojhalat Ibrahim <imr@rtschenk.de> wrote:
>> > Introduce new functions for conveniently obtaining and disposing of an entire
>> > array of GPIOs with one function call.
>>
>> Excellent, thanks for following up with this! :)
>>
>> >
>> > Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
>> > Signed-off-by: Rojhalat Ibrahim <imr@rtschenk.de>
>> > ---
>> >  Documentation/gpio/consumer.txt |   28 ++++++++++++-
>> >  drivers/gpio/gpiolib.c          |   84 ++++++++++++++++++++++++++++++++++++++++
>> >  include/linux/gpio/consumer.h   |   42 ++++++++++++++++++++
>> >  3 files changed, 153 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/Documentation/gpio/consumer.txt b/Documentation/gpio/consumer.txt
>> > index c67f806..d02f341 100644
>> > --- a/Documentation/gpio/consumer.txt
>> > +++ b/Documentation/gpio/consumer.txt
>> > @@ -58,7 +58,6 @@ pattern where a GPIO is optional, the gpiod_get_optional() and
>> >  gpiod_get_index_optional() functions can be used. These functions return NULL
>> >  instead of -ENOENT if no GPIO has been assigned to the requested function:
>> >
>> > -
>> >         struct gpio_desc *gpiod_get_optional(struct device *dev,
>> >                                              const char *con_id,
>> >                                              enum gpiod_flags flags)
>> > @@ -68,6 +67,29 @@ instead of -ENOENT if no GPIO has been assigned to the requested function:
>> >                                                    unsigned int index,
>> >                                                    enum gpiod_flags flags)
>> >
>> > +For a function using multiple GPIOs all of those can be obtained with one call:
>> > +
>> > +       int gpiod_get_array(struct device *dev,
>> > +                           const char *con_id,
>> > +                           struct gpio_desc **desc_array,
>> > +                           unsigned int count,
>> > +                           enum gpiod_flags flags)
>> > +
>> > +In this case an array for storing the GPIO descriptors and the number of GPIOs
>> > +are required as additional arguments. This function either returns the
>> > +requested number of GPIOs or an error code. It will not return a positive
>> > +number if some but not all of the requested GPIOs could be obtained.
>>
>> I wonder if the following interface would not be more convenient, at
>> least for the most common cases:
>>
>>     struct gpiod_descs *gpiod_get_array(struct device *dev, const char
>> *con_id, enum gpiod_flags flags);
>>
>> Which would *allocate* the array of descriptors to the right number of
>> GPIOs and return them all. The current way of doing requires the user
>> to 1) figure out how many GPIOs there are under (dev, con_id), 2)
>> allocate a the GPIO array and 3) call this function. The array must
>> also be explicitly freed after calling gpiod_put_array().
>>
>> struct gpiod_descs would be something like this:
>>
>> struct gpiod_descs {
>>     unsigned count;
>>     struct gpiod_desc*[];
>> }
>>
>> It uses a zero-length array to store the actual descriptors and
>> carries the count so the user does not have to remember it (it will
>> always be needed anyway, and that way we don't have to pass it
>> explicitly to gpiod_put_array()).
>>
>> The nice thing with this interface is that it works identically to
>> gpiod_get(), excepted it can handle 1 GPIO or more. This would be
>> handy in order to implement sysfs v2 on top of it (see
>> https://lkml.org/lkml/2015/1/3/50).
>>
>> We could even have a macro to iterate over the GPIOs:
>>
>> #define for_each_gpio(gpiod_descs, gpiod_desc) ...
>>
>
> I see your point. It certainly makes sense.
>
> The gpiod_get_array function would have to not only allocate the array of
> descriptors but also the struct containing the pointer to the array.
> Alternatively gpiod_get_array could return a struct gpiod_descs instead of
> a pointer to such a struct:
>
>         struct gpiod_descs gpiod_get_array(struct device *dev,
>                                                                    const char *con_id,
>                                                                    enum gpiod_flags flags);
>
> Errors could be returned either as a negative count or in an additional
> struct member.
>
> Would that also be an acceptable interface? Or should a gpiod_get_ function
> always return a pointer?

If you use the following struct, you should be able to overcome that
double-allocation issue:

struct gpiod_descs {
    unsigned count;
    struct gpiod_desc*[] desc;
};

The last member is a flexible array member. See
https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html if you are not
familiar with them. With such a declaration, you can do something like
this:

struct gpiod_descs *descs;
int count = 10;

descs = kzalloc(sizeof(*descs) + sizeof(descs->desc[0]) * count);
descs->count = count;

for (i = 0; i < count; i++)
        descs->desc[i] = ...;

That way you can get away with a single allocation for the whole
structure and return a pointer.

>
>> If you think your current interface is necessary because users need to
>> work with already-allocated arrays of descriptors, could you then
>> rename it under a more "private" name (maybe
>> gpiod_fill_array/gpiod_free_array?) and build the
>> gpiod_get_array/gpiod_put_array I suggest on top of it?
>>
>
> I think that's unnecessary for now.
>
>> Also for the sake of completeness, may I suggest adding the following
>> function to the gpiod interface:
>>
>>     int gpiod_count(struct device *dev, const char *con_id);
>>
>> Which returns the number of GPIOs that are declared for (dev, con_id)?
>> Right now gpiod_get_array() can only be used properly under the device
>> tree (which provides of_gpio_named_count()), but we also need to
>> enable it for ACPI and platform data.
>>
>> Having this function will allow users of gpiod_get_index() to know the
>> boundaries they have to work with, no matter how the GPIO mappings are
>> provided. It will also be needed if you implement the version of
>> gpiod_get_array() I suggest.
>>
>> In your patch 2/2, you will then also want to replace the call to
>> of_gpio_count() in mdio_mux_gpio_probe() by a call to gpiod_count().
>>
>
> I'll look into that.
>
>> > +The following function behaves differently:
>> > +
>> > +       int gpiod_get_array_optional(struct device *dev,
>> > +                                    const char *con_id,
>> > +                                    struct gpio_desc **desc_array,
>> > +                                    unsigned int could,
>> > +                                    enum gpiod_flags flags)
>> > +
>> > +This one returns the number of GPIOs actually available which can be smaller
>> > +than the requested number or even 0.
>>
>> There is no user for this function yet but I agree it is good to have.
>>
>
> So for the interface you propose that would mean:
>
> gpiod_get_array returns with exactly the number of GPIO descriptors as
> gpiod_count returns or an error code whereas gpiod_get_array_optional can also
> return with fewer or no descriptors at all.
>
> Right? Or is one of the two unnecessary?

Mmm if you switch to the interface I proposed, then I believe that
gpiod_get_array_optional() becomes less useful since gpiod_get_array()
will always return the "right" number of GPIOs. However it might still
be good to have it for the same purpose as gpiod_get_optional()
exists: to make it easier to handle the case where not having a
mapping for the requested GPIO is not an error.

So gpiod_get_array_optional() would just call gpiod_get_array(), and
simply return NULL instead of -ENOENT if no mapping exist.

Cheers,
Alex.
