From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH v2] gpio: add userspace ABI for GPIO line information
Date: Fri, 19 Feb 2016 11:29:47 +0000
Message-ID: <CACxGe6voZgYK6SV-NZpYTV93JA-E1LfEbNDbJXoNHRF7jhjpgQ@mail.gmail.com>
References: <1455542435-3182-1-git-send-email-linus.walleij@linaro.org>
 <20160217205445.GA2394@deathstar> <CACRpkdYgxJme3V1RSkvmsBL=b5zroNKwPJH70mgDbxMD=XQJtw@mail.gmail.com>
 <20160219094620.GA28750@deathstar> <CACRpkdairn2nnpWz48gakwdwcbPUiv3mVOzcdhdW9Yy8W=XZog@mail.gmail.com>
 <20160219102614.GA31335@deathstar> <CACRpkdYEpzPX+4fCwUixbvGnGgR4Vm2j8DGL7aqNGWKbFD+PWg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f181.google.com ([209.85.213.181]:34649 "EHLO
	mail-ig0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1426497AbcBSLaH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Feb 2016 06:30:07 -0500
Received: by mail-ig0-f181.google.com with SMTP id g6so36416245igt.1
        for <linux-gpio@vger.kernel.org>; Fri, 19 Feb 2016 03:30:07 -0800 (PST)
In-Reply-To: <CACRpkdYEpzPX+4fCwUixbvGnGgR4Vm2j8DGL7aqNGWKbFD+PWg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Welling <mwelling@ieee.org>, Jonathan Cameron <jic23@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Markus Pargmann <mpa@pengutronix.de>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>

On Fri, Feb 19, 2016 at 11:25 AM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> On Fri, Feb 19, 2016 at 11:26 AM, Michael Welling <mwelling@ieee.org> wrote:
>> On Fri, Feb 19, 2016 at 10:47:45AM +0100, Linus Walleij wrote:
>>> On Fri, Feb 19, 2016 at 10:46 AM, Michael Welling <mwelling@ieee.org> wrote:
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
>> The poll could be used on the character device but then there would have to
>> be a way to resolve which GPIO triggered the interrupt.
>
> Here I lean toward the IIO event interface, that if you want to
> monitor a GPIO line you should ask for an event file
> descriptor and select() it waiting for events in userspace,
> i.e. every such request comes with obtaining a new fd
> and watching it.

That seems overly heavyweight. It would be reasonable to select on a
single file descriptor, and then on read it will also return a bitmap
of which pin(s) actually raised the event.

g.
