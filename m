From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [RFC PATCH] gpiolib: Provide and export gpiod_export_name
Date: Wed, 23 Jul 2014 23:36:51 -0700
Message-ID: <53D0A983.9000900@roeck-us.net>
References: <1406139132-5404-1-git-send-email-linux@roeck-us.net> <CAAVeFuKsJpSYo2DMyTdYE2J5Cu_ZD=b9o-=S0DLDccyNmwniNg@mail.gmail.com> <53D0A7E4.1040707@aksignal.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.active-venture.com ([67.228.131.205]:50557 "EHLO
	mail.active-venture.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751248AbaGXGgw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Jul 2014 02:36:52 -0400
In-Reply-To: <53D0A7E4.1040707@aksignal.cz>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: jiri.prchal@aksignal.cz, Alexandre Courbot <gnurou@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Randy Dunlap <rdunlap@infradead.org>

On 07/23/2014 11:29 PM, Ji=C5=99=C3=AD Prchal wrote:
> Hi,
> just to append to this: is in plan some kind of exporting named GPIOs=
 from device tree to /sys/* or /dev/*? It would be very useful not only=
 for me. Because I thing what GPIO is used for what is hardware design =
dependent same as for example what SPI chips are used. And SPI chips ar=
e in DT.
>

Yes, for one of my use cases that is how I would probably configure it;
alternatively it would be configured with platform data. It is
somewhat questionable, however, if this approach would be acceptable
for the Linux dt community, as it is a corner case between system
(hardware) description and configuration.

Guenter

> Dne 24.7.2014 v 07:44 Alexandre Courbot napsal(a):
>> On Thu, Jul 24, 2014 at 3:12 AM, Guenter Roeck <linux@roeck-us.net> =
wrote:
>>> gpiod_export_name is similar to gpiod_export, but lets the user
>>> determine the name used to export a gpio pin.
>>>
>>> Currently, the pin name is determined by the chip driver with
>>> the 'names' array in the gpio_chip data structure, or it is set
>>> to gpioX, where X is the pin number, if no name is provided by
>>> the chip driver.
>>
>> Oh, my. I did not even know about this 'names' array. This is pretty
>> bad - a GPIO provider should not decide what its GPIOs are used for.
>>
>> Luckily for you, this creates a precedent that makes this patch more
>> acceptable, in that it is not making the situation worse. Even thoug=
h
>> I consider both solutions to be bad, I actually prefer your
>> gpiod_export_name() function to that 'names' array in gpio_chip...
>>
>>>
>>> It is, however, desirable to be able to provide the pin name when
>>> exporting the pin, for example from platform code. In other words,
>>> it would be useful to move the naming decision from the pin provide=
r
>>> to the pin consumer. The gpio-pca953x driver provides this capabili=
ty
>>> as part of its platform data. Other drivers could be enhanced in a
>>> similar way; however, this is not always possible or easy to accomp=
lish.
>>> For example, mfd client drivers such as gpio-ich already use platfo=
rm
>>> data to pass information from the mfd master driver to the client d=
river.
>>> Overloading this platform data to also provide an array of gpio pin=
 names
>>> would be a challenge if not impossible.
>>>
>>> The alternative to use gpiod_export_link is also not always desirab=
le,
>>> since it only creates a named link to a different directory, meanin=
g
>>> the named gpio pin is not available in /sys/class/gpio but only
>>> in some platform specific directory and thus not as generic as poss=
ible
>>> and/or useful.
>>>
>>> A specific example for a use case is a gpio pin which reports AC po=
wer
>>> loss to user space. Depending on the platform and platform variant,
>>> the pin can be provided by various gpio chip drivers and pin number=
s.
>>> It would be very desirable to have a well defined location such as
>>> /sys/class/gpio/ac_power_loss for this pin, so user space knows whe=
re
>>> to find the attribute without knowledge of the underlying platform
>>> variant or oher hardware details.
>>
>> As I explained on the other thread, I still encourage you to have
>> these GPIOs under device nodes that give a hint of who is provided t=
he
>> GPIO (effectively exporting the (dev, function) tuple to user-space)
>> instead of having them popping out under /sys/class/gpio where nobod=
y
>> knows where they come from and name collisions are much more likely.
>>
>> Your message sounds like you have no choice but have the named GPIO
>> link under the gpiochip's device node, but this is not the case -
>> gpio_export_link() let's you specify the device under which the link
>> should appear. Make that device be your "scu" device and you can hav=
e
>> a consistent sysfs path to access your GPIOs.
>>
>> Allowing GPIOs to pop up in the same directory with an arbitrary nam=
e
>> is just a recipe for a mess. But that's a recipe that is already
>> allowed thanks to that 'names' array. So I'm really confused about
>> what to do with this patch. If you can do with gpio_export_link() (a=
nd
>> I have not seen evidence of the contrary), please go that way instea=
d.
>>
>>>
>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>>> ---
>>> Applies to tip of linux-gpio/for-next.
>>>
>>>   Documentation/gpio/sysfs.txt  | 12 ++++++++----
>>>   drivers/gpio/gpiolib-sysfs.c  | 23 ++++++++++++++++-------
>>>   include/linux/gpio/consumer.h |  9 +++++++++
>>>   3 files changed, 33 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/Documentation/gpio/sysfs.txt b/Documentation/gpio/sysf=
s.txt
>>> index c2c3a97..8e301b2 100644
>>> --- a/Documentation/gpio/sysfs.txt
>>> +++ b/Documentation/gpio/sysfs.txt
>>> @@ -125,7 +125,11 @@ requested using gpio_request():
>>>          /* export the GPIO to userspace */
>>>          int gpiod_export(struct gpio_desc *desc, bool direction_ma=
y_change);
>>>
>>> -       /* reverse gpio_export() */
>>> +       /* export named GPIO to userspace */
>>> +       int gpiod_export_name(struct gpio_desc *desc, const char *i=
oname,
>>> +                       bool direction_may_change);
>>> +
>>> +       /* reverse gpio_export() / gpiod_export_name() */
>>>          void gpiod_unexport(struct gpio_desc *desc);
>>>
>>>          /* create a sysfs link to an exported GPIO node */
>>> @@ -136,9 +140,9 @@ requested using gpio_request():
>>>          int gpiod_sysfs_set_active_low(struct gpio_desc *desc, int=
 value);
>>>
>>>   After a kernel driver requests a GPIO, it may only be made availa=
ble in
>>> -the sysfs interface by gpiod_export(). The driver can control whet=
her the
>>> -signal direction may change. This helps drivers prevent userspace =
code
>>> -from accidentally clobbering important system state.
>>> +the sysfs interface by gpiod_export() or gpiod_export_name(). The =
driver
>>> +can control whether the signal direction may change. This helps dr=
ivers
>>> +prevent userspace code from accidentally clobbering important syst=
em state.
>>>
>>>   This explicit exporting can help with debugging (by making some k=
inds
>>>   of experiments easier), or can provide an always-there interface =
that's
>>> diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sy=
sfs.c
>>> index be45a92..7d36230 100644
>>> --- a/drivers/gpio/gpiolib-sysfs.c
>>> +++ b/drivers/gpio/gpiolib-sysfs.c
>>> @@ -523,13 +523,12 @@ static struct class gpio_class =3D {
>>>    *
>>>    * Returns zero on success, else an error.
>>>    */
>>> -int gpiod_export(struct gpio_desc *desc, bool direction_may_change=
)
>>> +int gpiod_export_name(struct gpio_desc *desc, const char *ioname,
>>> +                     bool direction_may_change)
>>>   {
>>>          unsigned long           flags;
>>>          int                     status;
>>> -       const char              *ioname =3D NULL;
>>>          struct device           *dev;
>>> -       int                     offset;
>>>
>>>          /* can't export until sysfs is available ... */
>>>          if (!gpio_class.p) {
>>> @@ -560,10 +559,6 @@ int gpiod_export(struct gpio_desc *desc, bool =
direction_may_change)
>>>                  direction_may_change =3D false;
>>>          spin_unlock_irqrestore(&gpio_lock, flags);
>>>
>>> -       offset =3D gpio_chip_hwgpio(desc);
>>> -       if (desc->chip->names && desc->chip->names[offset])
>>> -               ioname =3D desc->chip->names[offset];
>>> -
>>>          dev =3D device_create(&gpio_class, desc->chip->dev, MKDEV(=
0, 0),
>>>                              desc, ioname ? ioname : "gpio%u",
>>>                              desc_to_gpio(desc));
>>> @@ -600,6 +595,20 @@ fail_unlock:
>>>          gpiod_dbg(desc, "%s: status %d\n", __func__, status);
>>>          return status;
>>>   }
>>> +EXPORT_SYMBOL_GPL(gpiod_export_name);
>>> +
>>> +int gpiod_export(struct gpio_desc *desc, bool direction_may_change=
)
>>> +{
>>> +       const char *ioname =3D NULL;
>>> +
>>> +       if (desc) {
>>> +               int offset =3D gpio_chip_hwgpio(desc);
>>> +
>>> +               if (desc->chip->names && desc->chip->names[offset])
>>> +                       ioname =3D desc->chip->names[offset];
>>
>> I'd add a
>>
>> else
>>      ioname =3D "gpio%u";
>>
>> so all the name-chosing code is grouped in the same place. Then you
>> can remove that same check from gpiod_export_name().
>>
>>> +       }
>>> +       return gpiod_export_name(desc, ioname, direction_may_change=
);
>>> +}
>>>   EXPORT_SYMBOL_GPL(gpiod_export);
>>>
>>>   static int match_export(struct device *dev, const void *data)
>>> diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/con=
sumer.h
>>> index 05e53cc..986da3e 100644
>>> --- a/include/linux/gpio/consumer.h
>>> +++ b/include/linux/gpio/consumer.h
>>> @@ -260,6 +260,8 @@ static inline int desc_to_gpio(const struct gpi=
o_desc *desc)
>>>   #if IS_ENABLED(CONFIG_GPIOLIB) && IS_ENABLED(CONFIG_GPIO_SYSFS)
>>>
>>>   int gpiod_export(struct gpio_desc *desc, bool direction_may_chang=
e);
>>> +int gpiod_export_name(struct gpio_desc *desc, const char *ioname,
>>> +                     bool direction_may_change);
>>>   int gpiod_export_link(struct device *dev, const char *name,
>>>                        struct gpio_desc *desc);
>>>   int gpiod_sysfs_set_active_low(struct gpio_desc *desc, int value)=
;
>>> @@ -273,6 +275,13 @@ static inline int gpiod_export(struct gpio_des=
c *desc,
>>>          return -ENOSYS;
>>>   }
>>>
>>> +static inline int gpiod_export_name(struct gpio_desc *desc,
>>> +                                   const char *ioname,
>>> +                                   bool direction_may_change)
>>> +{
>>> +       return -ENOSYS;
>>> +}
>>> +
>>>   static inline int gpiod_export_link(struct device *dev, const cha=
r *name,
>>>                                      struct gpio_desc *desc)
>>>   {
>>> --
>>> 1.9.1
>>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-gpio=
" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>
>

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
