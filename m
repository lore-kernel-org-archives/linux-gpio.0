From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 1/2] gpio: userspace ABI for reading/writing GPIO lines
Date: Fri, 27 May 2016 10:36:42 -0700
Message-ID: <20160527173642.GC25540@dtor-ws>
References: <1461660866-18683-1-git-send-email-linus.walleij@linaro.org>
 <20160426164404.GA30010@dtor-ws>
 <CACRpkdbFasFXq7y3M8LAgR2AQCx6FCOcm3-_u2phZeni1D7ncw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:33584 "EHLO
	mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756241AbcE0Rgq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 27 May 2016 13:36:46 -0400
Received: by mail-pf0-f193.google.com with SMTP id b124so13211552pfb.0
        for <linux-gpio@vger.kernel.org>; Fri, 27 May 2016 10:36:46 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CACRpkdbFasFXq7y3M8LAgR2AQCx6FCOcm3-_u2phZeni1D7ncw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Lee Campbell <leecam@google.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>

Hi Linus,

On Fri, May 27, 2016 at 03:22:52PM +0200, Linus Walleij wrote:
> Hi Dmitry,
> 
> *thanks* for the effort to review this, it's much appreciated.
> 
> On Tue, Apr 26, 2016 at 6:44 PM, Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> > On Tue, Apr 26, 2016 at 10:54:25AM +0200, Linus Walleij wrote:
> 
> >> +/**
> >> + * struct linehandle_state - contains the state of a userspace handle
> >> + * @gdev: the GPIO device the handle pertains to
> >> + * @label: consumer label used to tag descriptors
> >> + * @descs: the GPIO descriptors held by this handle
> >> + * @numdescs: the number of descriptors held in the descs array
> >> + */
> >> +struct linehandle_state {
> >> +     struct gpio_device *gdev;
> >> +     char *label;
> >
> > const char *?
> 
> Actually no, but I made an extra check.

Why not? Do you expect users of linehandle_state object to change the
name after the object has been created?

> 
> >> +static long linehandle_ioctl(struct file *filep, unsigned int cmd,
> >> +                          unsigned long arg)
> >> +{
> >> +     struct linehandle_state *lh = filep->private_data;
> >> +     int __user *ip = (int __user *)arg;
> >
> > You seem to be using the same handler for native and compat calls, but
> > for compat you need to use compat_ptr() because not all arches employ
> > straight cast conversions.
> 
> Argh and that is actually a bug in my primary ioctl(). I sent a separate
> patch fixing this up that should be in your inbox, and also fixed it in this
> patch of course.
> 
> >> +     if (cmd == GPIOHANDLE_GET_LINE_VALUES_IOCTL) {
> >
> > I am fond of switch/case for flows like this.
> 
> I like the if-else-if because it enables me to:
> 
> >> +             int val;
> 
> Declare base block scope-local variables. switch()
> requires a confusing { } to get the same local block.
> It's a bit of taste question I guess.
> 
> >> +             /* Reuse the array setting function */
> >> +             gpiod_set_array_value_complex(false,
> >> +                                           true,
> >> +                                           lh->numdescs,
> >> +                                           lh->descs,
> >> +                                           vals);
> >
> > I wonder if we should be returning errors to userspace in case we failed
> > to toggle one or more gpios (since we seem to moving towards gpio
> > transitions being allowed to fail).
> 
> OK I was actually thinking of that too, so now that you point
> it out I should just fix that with a separate refactoring patch
> making gpiod_set_array_value_complex() return an error
> code.
> 
> >> +     /*
> >> +      * Use devm_* calls with devm_*free() so we can request
> >> +      * and free the memory for these while still be sure that
> >> +      * they will eventually go away with the device if not
> >> +      * before that.
> >> +      */
> >
> > This is quite "interesting" statement. Consider what happens if driver
> > gets unbound from the device, but userspace still holds character device
> > open and calls ioctl on it.
> 
> That is actually a usecase I have spent much time with
> speculating about, and I am trying to make that work. But it's
> kind of complex.
> 
> First I must actually make sure that the device itself doesn't
> go away randomly, so five lines down from this I have this:
> 
> >> +     get_device(&gdev->dev);
> 
> IIUC get_device() will inhibit the device from being unregistered
> so that will not happen, and anything allocated with devm_*
> will still be around, like the linehandles. Notice that this is not
> the physical device but the gpiolib-intrinsic device that gets
> registered from a say platform_device, i2c_device or so.
> The latter is only the parent of this device.

This is wrong assumption(s). First of all devres resources are not tried
to lifetime of device, bit rather to lifetime of the bond between device
and driver. I.e. they go away when driver is unbound from the device,
even though device object is still in memory (either because physical
device is still present in the system, or because of existing references
to the "struct device" object).

Second, get_device() only increments reference count of the device in
question, preventing memory occupied by device object (and its parents)
from being freed. It has no effect whatsoever on the state of the
driver. In other words get_device() does not stop driver core from
unbinding the driver or unregistering the device (either because driver
module is being unloaded, hot-pluggable physical device gone away, or
user unbound the driver through sysfs).

> 
> Even if the parent i2c_device, platform_device or whatever
> goes away, this will stay around because it is referenced
> from userspace. (Or something else that hold a reference
> count to it.)
> 
> Now for the individual lines we also have this in gpiod_get()
> everytime a line is requested from a chip:
> 
> int gpiod_request(struct gpio_desc *desc, const char *label)
> {
> (...)
>     if (try_module_get(gdev->owner)) {
>         status = __gpiod_request(desc, label);
>         if (status < 0)
>             module_put(gdev->owner);
>         else
>             get_device(&gdev->dev);
> 
> So we also reference the device (AND the driver module if it's
> a module) every time a line is taken. So none of these go
> away if any line is in use.
> 
> So what remains is the case where say a device really goes
> away (USB cable unplugged) or someone use the unbind file
> in sysfs (which is the greatest tool on the planet to shoot oneself
> in the foot indeed).
> 
> What happens in gpiochip_remove() is that the device does really
> go away like this:
> 
>     /* Numb the device, cancelling all outstanding operations */
>     gdev->chip = NULL;
> 
> As you can see from an earlier patch, all operations like
> gpiod_get_value() etc contains the macro VALIDATE_DESC()
> which does this:
> 
> #define VALIDATE_DESC(desc) do { \
>     if (!desc || !desc->gdev) { \
>         pr_warn("%s: invalid GPIO\n", __func__); \
>         return -EINVAL; \
>     } \
>     if ( !desc->gdev->chip ) { \
>         dev_warn(&desc->gdev->dev, \
>              "%s: backing chip is gone\n", __func__); \
>         return 0; \
>     } } while (0)
> 
> So what happens (I hope) if you e.g. unplug a USB GPIO
> controller is that it seems like your GPIO operations
> (drivers or userspace or whatever) succeed, but you get
> this warning in the dmesg "foo: backing chip is gone".

That might work, I'll have to go back and look through the patch again,
as long as we do not use devm.

> 
> > IOW any time I see calls to devm_kfree I think it is a mistake and in
> > 99% cases I am right.
> 
> In this case I intend it to work like this: if userspace
> closes the character device (or crashes) the linehandles
> will be released with devm_kfree().
> 
> But maybe I should not even use devm_* in this case,
> but rather kmalloc()/kfree(). It just felt safer to also
> connect it with the device.

No, devm* should only be used in probe/remove paths, everywhere else you
need kmalloc/kfree, etc. Otherwise your memory may disappear too early.

Thanks.

-- 
Dmitry
