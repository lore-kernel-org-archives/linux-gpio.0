From: jic23@jic23.retrosnub.co.uk
Subject: Re: [PATCH v2] gpio: add userspace ABI for GPIO line information
Date: Fri, 19 Feb 2016 11:35:35 +0000
Message-ID: <8756ef874911997cc5ef45fec30fb75e@jic23.retrosnub.co.uk>
References: <1455542435-3182-1-git-send-email-linus.walleij@linaro.org>
 <20160217205445.GA2394@deathstar>
 <CACRpkdYgxJme3V1RSkvmsBL=b5zroNKwPJH70mgDbxMD=XQJtw@mail.gmail.com>
 <20160219094620.GA28750@deathstar>
 <CACRpkdairn2nnpWz48gakwdwcbPUiv3mVOzcdhdW9Yy8W=XZog@mail.gmail.com>
 <20160219102614.GA31335@deathstar>
 <CACRpkdYEpzPX+4fCwUixbvGnGgR4Vm2j8DGL7aqNGWKbFD+PWg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from saturn.retrosnub.co.uk ([178.18.118.26]:45095 "EHLO
	saturn.retrosnub.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1424436AbcBSLf5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Feb 2016 06:35:57 -0500
In-Reply-To: <CACRpkdYEpzPX+4fCwUixbvGnGgR4Vm2j8DGL7aqNGWKbFD+PWg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Welling <mwelling@ieee.org>, Jonathan Cameron <jic23@kernel.org>, linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Markus Pargmann <mpa@pengutronix.de>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>

On 19.02.2016 11:25, Linus Walleij wrote:
> On Fri, Feb 19, 2016 at 11:26 AM, Michael Welling <mwelling@ieee.org> 
> wrote:
>> On Fri, Feb 19, 2016 at 10:47:45AM +0100, Linus Walleij wrote:
>>> On Fri, Feb 19, 2016 at 10:46 AM, Michael Welling <mwelling@ieee.org> 
>>> wrote:
>>> 
>>> > I am looking forward to see how the GPIOs will be modified from userspace.
>>> > The fact that single controllers can host hundreds of GPIOs is going to
>>> > make it an interesting problem.
>>> >
>>> > Do you have a sketch of how the accesses with be performed?
>>> > ioctl, read, write.
>>> 
>>> No. Suggestions welcome. Looking at drivers/iio for inspiration.
>>> 
>> 
>> Well one thing I never liked about the iio userspace is the mixed API.
>> You have to use sysfs to setup buffered reads and character device for
>> the reads.
>> 
>> I suppose individual GPIOs could be configured by simply calling
>> specific ioctls passing the (offset, value) as the argument.
> 
> I think so too... I guess we can safely assume that only one
> userspace process will need to access a GPIO chip at the same
> time, and in case there'd be several of them, they have to
> mediate access through a daemon (as is already done with other
> things).
> 
>> GPIO_EXPORT_LINE_IOCTL - Allocate the GPIO to userspace.
> 
> I suspect this should take an argument with a list of
> GPIOs from the start, so you can request several GPIO
> lines, with flags. Requesting several lines makes it
> possible to use devm_gpiod_get_array() and handle
> a bunch of GPIOs similtaneously.
> 
>> GPIO_SET_DIRECTION_IOCTL - Set GPIO direction.
>> GPIO_SET_VALUE_IOCTL - Set GPIO value.
>> GPIO_GET_VALUE_IOCTL - Get GPIO value.
> 
> Those we probably need.
> 
>> GPIO_SET_ACTIVE_IOCTL - Set GPIO active high/low.
>> GPIO_SET_OPEN_DRAIN_IOCTL - Set GPIO open drain.
>> GPIO_SET_OPEN_SOURCE_IOCTL - Set GPIO open source.
> 
> Those need to be flags passed when exporting a line due
> to the nature of the GPIO driver subsystem. Also I don't think
> it makes sense to change any of these dynamically anyway,
> you set this up when requesting a line.
> 
>> Then all exported GPIOs could be accessible using
>> read and write callbacks.
> 
> The kernel will just take the gpio descriptors and manage
> them, it'll "just work" I think.
> 
>> Handling interrupts may prove a little trickier.
>> The poll could be used on the character device but then there would 
>> have to
>> be a way to resolve which GPIO triggered the interrupt.
> 
> Here I lean toward the IIO event interface, that if you want to
> monitor a GPIO line you should ask for an event file
> descriptor and select() it waiting for events in userspace,
> i.e. every such request comes with obtaining a new fd
> and watching it.
> 
On events, it might be worth doing it a bit more input evdev
like and allowing mor than one consumer.

Do we need to describe to userspace what GPIOs are available?
Right now I don't have a board to hand to see what info is
already available on that front.  Strikes me as that side of
things may be more complex than the interface to actually get hole
of them.  It's this side of things that makes IOCTLs on highly
varied devices a pain (any why we ended up with the split interface
in IIO which is sort of an input / hwmon hybrid).

Jonathan

> Yours,
> Linus Walleij
