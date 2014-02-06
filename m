From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [RFC 1/2] gpio: make the GPIOs shareable
Date: Thu, 6 Feb 2014 22:23:22 +0900
Message-ID: <CAAVeFuJQv9kJB9xN3L5NitoJ5s3YWNC_x6jOF4e-tZbv3+i=AA@mail.gmail.com>
References: <1391011876-7207-1-git-send-email-jjhiblot@traphandler.com>
 <1391011876-7207-2-git-send-email-jjhiblot@traphandler.com>
 <CAAVeFuL9ru0vL7S_caUGRLxPmag+enyCboYXMg+TVd3weZqrKw@mail.gmail.com> <CACh+v5N51NztnBqPnyYc3PzjkxBv12cB3AEL0m8G3sAObRib2w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ve0-f174.google.com ([209.85.128.174]:53365 "EHLO
	mail-ve0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755790AbaBFNXn (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Feb 2014 08:23:43 -0500
Received: by mail-ve0-f174.google.com with SMTP id pa12so1472855veb.33
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2014 05:23:42 -0800 (PST)
In-Reply-To: <CACh+v5N51NztnBqPnyYc3PzjkxBv12cB3AEL0m8G3sAObRib2w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jean-Jacques Hiblot <jjhiblot@traphandler.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Feb 3, 2014 at 7:26 PM, Jean-Jacques Hiblot
<jjhiblot@traphandler.com> wrote:
> Hi Alexandre,
>
>
> 2014-02-03 Alexandre Courbot <gnurou@gmail.com>:
>
>> Hi Jean-Jacques,
>>
>> Sorry for taking so much time to reply, I had to go through the AT91
>> thread several times to (hopefully) get a clear idea of what you need.
>>
>>
>> On Thu, Jan 30, 2014 at 1:11 AM, Jean-Jacques Hiblot
>> <jjhiblot@traphandler.com> wrote:
>> > The patch implements a new requesting scheme for GPIOs that allow a gpio
>> > to be
>> > requested more than once.
>> >
>> > This new request scheme is:
>> > * only 1 user can request a GPIO with a full control over the direction
>> > of the
>> >   GPIO. Full control means being able to configure the gpio as an input
>> > or as
>> >   an ouput.
>> > * several users can request a GPIO with a limited control over the
>> > direction.
>> >   Limited control means: the gpio can be configured as an input if
>> > someone
>> >   doesn't have a full control of the direction. It can't be never be
>> > configured
>> >   as an output.
>> > * a GPIO used as an interrupt source can't be configured as an output.
>>
>> So if I understand correctly (correct me if I don't), the problem is
>> that you need to be able to read the value of a GPIO that is currently
>> being used as an interrupt source. One example of this happening is
>> the touchscreen node of arch/arm/boot/dts/imx28-tx28.dts:
>>
>>         touchscreen: tsc2007@48 {
>>                 ...
>>                 interrupt-parent = <&gpio3>;
>>                 interrupts = <20 0>;
>>                 pendown-gpio = <&gpio3 20 1>;
>>         };
>>
>> While you are at it, you also want to allow a GPIO to be requested
>> several times as long as these requests are not conflicting (which is
>> a generalization of your initial need).
>
> exactly. Whle we're at it, we could try to make it work for other use cases.
>>
>> This should probably be
>> considered dangerous for the integer-based interface, but with gpiod
>> GPIOs are now assigned by platform files or firmware, so this sounds
>> much more legitimate in this context.
>
> agreed. The integer-based interface must not be impacted by this.
>>
>>
>> > To achieve this, a unique gpio_desc is returned by gpiod_request. The
>> > old
>> > gpio_desc is replaced by a gpio_hw_desc. Integer name space is still
>> > supported
>> > and a gpio requested by its number is requested with full direction
>> > control.
>> >
>> > This patch is for RFC only. I feel that the API change need to be
>> > discussed
>> > before going further. Also there are probably some race conditions that
>> > are
>> > more important to fix now than when a gpio was an exclusive property.
>>
>> If I understand your goals correctly, I believe they can be reached by
>> a simpler solution. For your initial problem the
>> at91_gpio_irq_domain_xlate() should obtain a GPIO descriptor and call
>> gpiod_lock_as_irq() on it. This will allow the GPIO from being
>> requested as input later. Currently it is not possible to obtain a
>> GPIO descriptor outside of gpiod_get() (which will request the GPIO at
>> the same time), but it should be acceptable to consider that the
>> holder of a gpio_chip * (either the GPIO driver itself, or in your
>> case the AT91 pinctrl driver) is priviledged and can get access to any
>> of the chip's descriptor through a new driver function (we already
>> discussed doing so in https://lkml.org/lkml/2013/10/8/823 ).
>>
> For the touchscreen case, this is indeed a simple solution that would work.

Great - in this case I would suggest to go for it, as you can
implement it immediately (you will need to implement that driver
function that allows a driver to access any of its descriptor, this
should be easy if you follow the mail linked above) and it really is
the best-fit solution to this particular problem.

>
>>
>> As for the multiple-consumer case, couldn't we avoid the complexity
>> introduced by the different kinds of descriptors by simply using read
>> and write reference counters in each GPIO descriptor? Basically a call
>> to gpiod_get() would always return the corresponding descriptor as
>> this means the GPIO is mapped. But when attempting to set the
>> direction, the reference counters are checked to confirm that this
>> would not put the GPIO into one of the forbidden cases (e.g. no write
>> if FLAG_USED_AS_IRQ is set, only one writer, but as many readers as we
>> want). This sounds like it could be implemented much more succintly,
>> and should (IIUC) do what you wanted.
>>
> Actually it was the first approach I tried.  It takes care of most of the
> problem. But there are some drawbacks:
> * no control of permissions for gpiod_set_value. A consumer requesting for
> read would be able to set the gpio's value.
> * need to modify the gpiod_free API to pass the same permissions flags as to
> gpiod_request(). The consequence is that the flags need to be stored along
> the gpio_desc* in the consumers' private data.
> * same problem with the gpio's label.

All valid points indeed. I am still a little bit turned off by the
added complexity this brings to a subsystem that is supposed to remain
simple to use (obtain a GPIO descriptor, drive the GPIO). We also need
to consider all special cases (active-low, open-drain, etc) and make
sure we handle all conflicts (what if a consumer requires open-source
and the other open-drain?). I'm afraid this could quickly turn into a
nightmare.

Not that I am rejecting your idea. It's just that we are entering a
new unknown zone with this and we really need to think it through.

> There's another feature that I didn't post because its use case is probably
> not very common. I wanted to be able to share output gpios. My use case is
> the gpio tracing mechanism I posted a few weeks ago.

Yes, I remember that patch.

> To reduce the complexity of tracking the gpio used by the probes, I thought
> that maybe this task could be delegated to the gpiolib. Implementation could
> be very straightforward there:
> * in gpiod_request (or equivalent) pass an ownership tag (NULL would be a
> special default value)
> * in the case were the ouput is already owned, check if the ownership tag
> are the same and not NULL. If so the request succeeds otherwise it fails.

So the two drivers would need to communicate that ownership tag so the
second can "hijack" the GPIO with permission from the first? You could
also pass a handle directly, like PRIME does for buffers (then we
could plug kdbus in and have user processes exchange GPIO handles
securely. Now I'm scared).

I would be even more cautious about sharing output GPIOs. If possible
at all, I'd really prefer to see a scheme where the two consuming
drivers yield the GPIO when they don't need it. After all, if you
enter a situation where both drivers want to drive the GPIO output,
you are obviously going to have a problem.

Alex.
