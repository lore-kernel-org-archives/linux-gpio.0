From: Johan Hovold <johan@kernel.org>
Subject: Re: gpiolib, gpio removal while a gpio in-use
Date: Wed, 22 Apr 2015 18:29:33 +0200
Message-ID: <20150422162933.GE16828@localhost>
References: <190351B32828744FBA3BD9565204D27B5330D2D2@NA-MBX-03.mgc.mentorg.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f180.google.com ([209.85.217.180]:36272 "EHLO
	mail-lb0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965429AbbDVQ3d (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Apr 2015 12:29:33 -0400
Received: by lbbqq2 with SMTP id qq2so184380344lbb.3
        for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2015 09:29:32 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <190351B32828744FBA3BD9565204D27B5330D2D2@NA-MBX-03.mgc.mentorg.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Frkuska, Joshua" <Joshua_Frkuska@mentor.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Mar 17, 2015 at 02:59:08AM +0000, Frkuska, Joshua wrote:
> Hello,
> 
> In 3.18, the upstream commit e1db1706c8 made it acceptable to remove
> gpio chips that were in use in exchange for a critical message. The
> reasoning from what I gathered from the mailing list was to avoid
> handling errors in the device remove handler. The justification was
> that the error seemed unused by most drivers and there was a compiler
> warning when ignoring the return value.
>
> At a higher level, this is a gpio handling policy shift. Previously
> the behavior was to result in an error and disallow the gpio device to
> be removed. Then starting at 3.18, it becomes ok to free a gpio device
> regardless of whatever the (possibly critical) gpio may be doing as
> long as a critical message is displayed.

It still isn't acceptable to remove a gpio chip with requested gpios as
it will lead to memory leaks (even though the most pre-3.18 crashes have
been fixed).

The main reason for not allowing gpiochip_remove to fail is truly
hot-pluggable buses such as USB, for which deregistration must not fail.
The device is gone -- gpiolib must deal with it.

Unfortunately, the change was made without implementing the "deal with
it" part.

> Prior to this change in 3.18, I ran across a problem in 3.8 and in
> 3.14, where I have a gpio expander chip on an i2c bus controlling some
> external power regulators. The regulator reserves the gpio and puts
> them in use. Then if for any reason, the i2c bus adapter/driver is
> destroyed/unloaded, the i2c client gets destroyed causing a dangling
> pointer to be left in the gpio descriptor gpio list. Since the
> regulator knows the gpio id any subsequent access from the regulator
> core of the gpiolib causes a dereference of this pointer as follows:

Here the answer appears straight-forward: don't unload drivers for buses
that are in use.

Again, the problem is real hot-pluggable buses such as USB or Greybus.

> 1. gpio_set_value_cansleep() <in my case it was due to a regulator
> that used the gpio being put/switched> 2. __gpio_get_value() 3.
> gpiod_get_raw_value() 4. _gpiod_get_raw_value() 5. chip->get() 6.
> pca953x_gpio_get_value() <any bus based gpio expander in this case> 7.
> pca953x_read_single() 8. i2c_smbus_read_byte_data() 9. dereferencing
> an element of the i2c client pointer causes invalid memory access.
> 
> This can be prevented a number of ways but all seem unclean (e.g. i2c
> bus driver from being unloaded/hot unplugged if there is a non-zero
> reference count). I would like to know if there is a preferred
> approach. From my understanding this use case is not supported as the
> comment in gpiolib suggests.

This sounds like it should be fixed in i2c with controller reference
counting.

> /* gpio_lock prevents conflicts during gpio_desc[] table updates.  *
> While any GPIO is requested, its gpio_chip is not removable; * each
> GPIO's "requested" flag serves as a lock and refcount.  */
> 
> Should a hotplug gpio chip be considered? If the answer is yes, then I
> would like to ask if there has been any discussion regarding this
> topic and if so, what the outcome was. 

Yes, I started looking into this a while back, but got side-tracked with
other work.

The most critical use case, the sysfs interface, where gpios could stay
requested indefinitely is now handled (patches posted for review).

I also have some working test code for dealing with some use cases with
generic hot-pluggable buses, but it is not at all trivial to support.

> Fast forward to 3.18+, this issue goes away because a gpio in use can
> now be removed. Doing so cleans up the gpio data structures and
> eliminates the problem above.

Not really, we are still leaking memory.

> The consequence of this is that the gpio may be put into an unintended
> state when freed while in-use in the system. An example of this could
> be the gpio cleaned up/turned off whilst controlling a regulator that
> is being used by some critical hardware function and it wouldn't be so
> obvious to a root user that this occurred just because he unloaded the
> bus driver.

We need not worry about what a careless root user does.

But for hot-pluggable buses, this is one of the issues -- we need to
inform the consumer (driver) that the gpio operation failed (and that
the chip is gone). With the current interface this is not even possible
as gpio_get does not return errors and gpio_set is declared void. [ It's
not an option to return a "default" value for gpio_get. ]

We also have no generic hotplug support in driver core and most
subsystems are not prepared for dealing with it either.

> In 3.18+, where should the logic for handling the removal of a
> critical gpio in-use go? Does it go in the actual gpio device
> remove/free function or somewhere else? In this case perhaps only the
> element using the gpio knows what to do or at least should be informed
> in order to keep things safe.

Precisely.

> I realize that putting a critical gpio on a removable bus is a risk
> itself and can be mitigated at design time but for the sake of the
> argument, it may be unavoidable due to hardware constraints.

Yes, that is part of the solution. Don't put critical gpios on a
removable bus (i2c controllers are generally not removable). And don't
go around unloading drivers in such a system. ;)

Johan
