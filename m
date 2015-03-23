From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: gpiolib, gpio removal while a gpio in-use
Date: Mon, 23 Mar 2015 16:00:21 +0900
Message-ID: <CAAVeFuL=PsgGnfb_Og5dvWYmXUdXSQuApfgrO-gRZ88OmbAX9w@mail.gmail.com>
References: <190351B32828744FBA3BD9565204D27B5330D2D2@NA-MBX-03.mgc.mentorg.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f180.google.com ([209.85.213.180]:34586 "EHLO
	mail-ig0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751352AbbCWHAm convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Mar 2015 03:00:42 -0400
Received: by igcau2 with SMTP id au2so27495567igc.1
        for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2015 00:00:41 -0700 (PDT)
In-Reply-To: <190351B32828744FBA3BD9565204D27B5330D2D2@NA-MBX-03.mgc.mentorg.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Frkuska, Joshua" <Joshua_Frkuska@mentor.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Mar 17, 2015 at 11:59 AM, Frkuska, Joshua
<Joshua_Frkuska@mentor.com> wrote:
> Hello,
>
> In 3.18, the upstream commit e1db1706c8 made it acceptable to remove gpio chips that were in use in exchange for a critical message. The reasoning from what I gathered from the mailing list was to avoid handling errors in the device remove handler. The justification was that the error seemed unused by most drivers and there was a compiler warning when ignoring the return value.
>
> At a higher level, this is a gpio handling policy shift. Previously the behavior was to result in an error and disallow the gpio device to be removed. Then starting at 3.18, it becomes ok to free a gpio device regardless of whatever the (possibly critical) gpio may be doing as long as a critical message is displayed.
>
> Prior to this change in 3.18, I ran across a problem in 3.8 and in 3.14, where I have a gpio expander chip on an i2c bus controlling some external power regulators. The regulator reserves the gpio and puts them in use. Then if for any reason, the i2c bus adapter/driver is destroyed/unloaded, the i2c client gets destroyed causing a dangling pointer to be left in the gpio descriptor gpio list. Since the regulator knows the gpio id any subsequent access from the regulator core of the gpiolib causes a dereference of this pointer as follows:
>
> 1. gpio_set_value_cansleep() <in my case it was due to a regulator that used the gpio being put/switched>
> 2. __gpio_get_value()
> 3. gpiod_get_raw_value()
> 4. _gpiod_get_raw_value()
> 5. chip->get()
> 6. pca953x_gpio_get_value() <any bus based gpio expander in this case>
> 7. pca953x_read_single()
> 8. i2c_smbus_read_byte_data()
> 9. dereferencing an element of the i2c client pointer causes invalid memory access.
>
> This can be prevented a number of ways but all seem unclean (e.g. i2c bus driver from being unloaded/hot unplugged if there is a non-zero reference count). I would like to know if there is a preferred approach. From my understanding this use case is not supported as the comment in gpiolib suggests.
>
> /* gpio_lock prevents conflicts during gpio_desc[] table updates.
> * While any GPIO is requested, its gpio_chip is not removable;
> * each GPIO's "requested" flag serves as a lock and refcount.
> */
>
> Should a hotplug gpio chip be considered? If the answer is yes, then I would like to ask if there has been any discussion regarding this topic and if so, what the outcome was.
>
> Fast forward to 3.18+, this issue goes away because a gpio in use can now be removed. Doing so cleans up the gpio data structures and eliminates the problem above. The consequence of this is that the gpio may be put into an unintended state when freed while in-use in the system. An example of this could be the gpio cleaned up/turned off whilst controlling a regulator that is being used by some critical hardware function and it wouldn't be so obvious to a root user that this occurred just because he unloaded the bus driver. In 3.18+, where should the logic for handling the removal of a critical gpio in-use go? Does it go in the actual gpio device remove/free function or somewhere else? In this case perhaps only the element using the gpio knows what to do or at least should be informed in 
 order to keep things safe.
>
> I realize that putting a critical gpio on a removable bus is a risk itself and can be mitigated at design time but for the sake of the argument, it may be unavoidable due to hardware constraints.

As I see it, the correct behavior for a GPIO whose chip is removed at
runtime should be to return an error the next time that GPIO is used.
Problem is, gpiod_set_value() returns void, so it is not clear to me
where such error signaling should take place. At least, an error
should be printed in the kernel log, both when a GPIO chips whose
GPIOs are in use it removed, and when said GPIOs are used
post-removal. Is it what happens with 3.18+?

Having critical GPIOs on a i2c bus is a rather common thing (think
PMIC), so yeah, we should certainly define the state of the hardware
whenever GPIO chips are removed. I suppose the most common practice is
to leave the GPIOs in their last state, but maybe we should codify
this somewhere so GPIO drivers can follow that rule.
