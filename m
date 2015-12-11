From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/6] gpio: make the gpiochip a real device
Date: Fri, 11 Dec 2015 19:06:54 +0100
Message-ID: <CACRpkdZopnozc4w3tUqkm7K4RhFm8d9H1oGnZJxYL9=arO2b-w@mail.gmail.com>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
	<1445502750-22672-2-git-send-email-linus.walleij@linaro.org>
	<20151102103116.GE8676@localhost>
	<CACRpkdaVu_1pAPd-7sUeGLEYymynA10WtuxJcnVPKZVYQOeruw@mail.gmail.com>
	<CACRpkda6Ad4SGW5H4ZDLn0VLZzq0LqLxSC7f2gcCBDNWH5FMnA@mail.gmail.com>
	<20151105094411.GD7561@localhost>
	<CACRpkdavyg8f8fWoQBQCqRAJKxiZDiC72QDSsWjbk1b1v=u3Lw@mail.gmail.com>
	<CACRpkdbeFJMZ5vbHGFmPeG_5qTdKsL+2xL4RjKHF759PFiz5Yw@mail.gmail.com>
	<20151208092928.GB13090@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:35910 "EHLO
	mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751054AbbLKSGy (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2015 13:06:54 -0500
Received: by oiww189 with SMTP id w189so66975218oiw.3
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2015 10:06:54 -0800 (PST)
In-Reply-To: <20151208092928.GB13090@localhost>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Mark Brown <broonie@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>

On Tue, Dec 8, 2015 at 10:29 AM, Johan Hovold <johan@kernel.org> wrote:
> On Thu, Dec 03, 2015 at 03:04:14PM +0100, Linus Walleij wrote:
>> On Mon, Nov 16, 2015 at 3:27 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
>>
>> > If I don't use device_add()/device_del(), I see this must mean I have to use
>> > device_register()/device_unregister() as the latter only decrease the refcount
>> > and wait for the instance to die off.
>> >
>> > So am I reading it correctly if I understand that this is what we should be
>> > doing? I.e device_register()/device_unregister() and then wait for the
>> > .remove() call to do its deed, so the kobj/struct device is kept around if
>> > e.g. sysfs or the chardev has open files.
>>
>> Hard to get advice on design here I see. Anyways, the clean thing to
>> do (after some weeks of thinking) seems to be this:
>>
>> 1. Introduce a void *data into gpio_chip and gpiochip_set_data()
>>    gpiochip_get_data() set/get it.
>>
>> 2. Replace all occurences of container_of() dereferencing in all
>>    GPIO drivers with gpiochip_[set|get]_data() so as to avoid having
>>    gpio_chip to be embedded into state containers.
>>
>> 3-1. Split gpio_chip in a static descriptor with a vtable for callbacks
>>    and other static config called struct gpio_chip, and
>>    struct gpio_device that is returned as a pointer from
>>    gpiochip_add(). It will need to be free:ed by gpiodevice_remove()
>>    after that.
>>
>> 3-2. In the same patch set rename all functions to indicate that
>>    we are now operating on a gpio_device not a gpio_chip.
>>
>> 3-3. After a GPIO driver issues gpio_device_unregister()
>>    it may stay around if there are still references to the
>>    struct device.
>>
>> This is a very tiresome refactoring, but I'm growing confident that
>> it is what needs to happen to manage gpio devices in the future.
>>
>> After step 3-3 we have a clean gpio_device containing a
>> struct device, and from there we apply the initial chardev
>> interface.
>
> This sounds unnecessarily complicated.
>
> Why not use a more standard approach of
>
>         gpiochip_create()
>
> that allocates the state container that the driver can then initialise
> further (e.g. callback pointers) and finally register with a call to:
>
>         gpiochip_add()
>
> When the parent device is going away, it calls
>
>         gpiochip_remove()
>
> which unregisters the gpiochip device (i.e. calls device_del), updates
> its state to "disconnected" and drops the gpiolib's reference.
>
> There may still be other devices (consumers) holding references to the
> gpiochip device, which is not deallocated until the final reference is
> dropped (i.e. at final gpiod_free).

Yeah after discussing with Russell it seems something like this is better.
I really like what netdev is doing with alloc_netdev(), so I imagine:

struct gpio_device *alloc_gpiodev(sizeof_priv, name, setup)

Where sizeof_priv is the size of the state container for the GPIO driver
instance, setup() is a callback to fill in vtable etc and name is what we
now call label.

Then ther will be gpiodev_priv(dev) to get the private data as a void *
pointer.

The whole thing is memory managed by the gpiolib core.

gpiodev_remove() to get rid of the driver reference.

And this would come with a proper struct device and all.

Right now I'm thinking about how to put in this interface so that
we can convert drivers one by one and need not convert all in
a gigantice 20.000 line patch.

Yours,
Linus Walleij
