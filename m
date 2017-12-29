From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: Re: [PATCH v2] gpio: winbond: add driver
Date: Fri, 29 Dec 2017 11:09:18 -0500
Message-ID: <20171229160918.GA8195@sophia>
References: <309acd17-5244-da8c-a28e-dace15ada4fb@maciej.szmigiero.name>
 <1514473954.7000.418.camel@linux.intel.com>
 <786affb2-68e9-1c5d-6a73-98f3ea09f7b1@maciej.szmigiero.name>
 <1514543232.7000.507.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yw0-f171.google.com ([209.85.161.171]:39735 "EHLO
        mail-yw0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750869AbdL2QJ0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Dec 2017 11:09:26 -0500
Content-Disposition: inline
In-Reply-To: <1514543232.7000.507.camel@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org

On Fri, Dec 29, 2017 at 12:27:12PM +0200, Andy Shevchenko wrote:
>On Fri, 2017-12-29 at 00:44 +0100, Maciej S. Szmigiero wrote:
>> On 28.12.2017 16:12, Andy Shevchenko wrote:
>> > On Fri, 2017-12-22 at 19:58 +0100, Maciej S. Szmigiero wrote:
>> > > 
>
>> > > +	  You will need to provide a module parameter "gpios", or
>> > > a
>> > > +	  boot-time parameter "gpio_winbond.gpios" with a bitmask
>> > > of
>> > > GPIO
>> > > +	  ports to enable (bit 0 is GPIO1, bit 1 is GPIO2, etc.).
>> > 
>> > 1. Why it's required?
>> 
>> It is required bacause "[o]ne should be careful which ports one
>> tinkers
>> with since some might be managed by the firmware (for functions like
>> powering on and off, sleeping, BIOS recovery, etc.) and some of GPIO
>> port
>> pins are physically shared with other devices included in the Super
>> I/O
>> chip".
>
>I would like to be clear, I was asking about module parameters. Nowadays
>we won't have new parameters to the kernel.
>
>Is there any strong argument to do it so? Is it one above? Can we detect
>as much as possible run time?

The Low Pin Count (LPC) bus is a modern computer bus which to software
resembles the legacy ISA bus of the 1980s. Unfortunately, this means
port addresses for devices are assumed based on convention and manual
configuration rather than hardware detection -- as such, there is a
danger of clobbering another device's address space since addressing
must be resolved manually.

Maciej, although the base address for the Winbond Super I/O chip cannot
be probed, does the chip itself offer configuration information for how
many GPIO are available -- or instead is the total number of GPIO
supported by firmware always the same and it is left up to the user to
make sure they do not clobber other devices' address spaces during use?
My suspicion is the latter, but I figure I may as well ask.

If so, I suggest simply allowing access to all supported GPIO to the
user. My reasoning is this: the user is the one loading the module
parameter, so they should already know which GPIO they intend to use --
as such, if they wouldn't have requested it in your "gpios" module
parameter, they won't use it when the gpiochip is registered. Thus, the
"gpios" module parameter can be removed and ngpios simply set to the
total number of supported GPIO.

For example, the 104-IDIO-16 GPIO driver supports 32 GPIO lines because
104-IDIO-16 devices have 32 available GPIO lines. However, this same
driver may be use for 104-IDIO-8 devices which are firmware compatible
with 104-IDIO-16 devices. In this case, despite 104-IDIO-8 devices only
having 16 GPIO lines, ngpios is still set to 32 because the user already
knows that the upper 16 GPIO lines are not available for their device,
despite the driver permitting access to them.

One problem I do see is how to handle your "ppgpios" and "odgpios"
module parameters, which allow the configuration of push-pull mode and
open drain mode respectfully. I would like to see these module
parameters go aways as well and leave it up for the user to configure at
runtime. Linus, does the GPIO subsystem have a method of dynamically
setting these kind of pin configurations?

William Breathitt Gray

>
>-- 
>Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>Intel Finland Oy
