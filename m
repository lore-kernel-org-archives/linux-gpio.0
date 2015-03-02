From: Michael Welling <mwelling@ieee.org>
Subject: Re: Fw: [3.18.3] poll() on gpio pins broken
Date: Mon, 2 Mar 2015 01:27:09 -0600
Message-ID: <20150302072655.GA17089@deathray>
References: <20150130234552.GA20407@sysresccd>
 <20150131083300.GZ21469@belle.intranet.vanheusden.com>
 <CAAVeFuJ6+W-CpXKCE2uY=T7RUVjA4d2PML708xH8dPQwij5NTg@mail.gmail.com>
 <20150203090325.GA29693@deathray>
 <CACRpkdbGo1+v_aVJP7+pbbw2HnRdqrBwwPv=0fC87Ze5JveAnw@mail.gmail.com>
 <20150219085303.GI21469@belle.intranet.vanheusden.com>
 <CACRpkdbPEoyyPqgmZXFT9AQAahgwVjfz0DOnH6ZW2omq=SWCTA@mail.gmail.com>
 <CAAVeFuKbgFqHKR5F_VeF9Ti=FvijK2CScNsUeapSpNde9OJqSA@mail.gmail.com>
 <CACRpkdajCuob668o_9oF+4pomjaAkLz58Kg4Hx-ibbkBQv=h3w@mail.gmail.com>
 <CAAVeFuJxki5mqY91ugumpDEuq9BMbBin4ypr1H2qcA_uzWGT9Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f179.google.com ([209.85.213.179]:34704 "EHLO
	mail-ig0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750839AbbCBH1O (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Mar 2015 02:27:14 -0500
Received: by igal13 with SMTP id l13so13970214iga.1
        for <linux-gpio@vger.kernel.org>; Sun, 01 Mar 2015 23:27:13 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CAAVeFuJxki5mqY91ugumpDEuq9BMbBin4ypr1H2qcA_uzWGT9Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, folkert <folkert@vanheusden.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Mar 02, 2015 at 03:16:06PM +0900, Alexandre Courbot wrote:
> On Fri, Feb 27, 2015 at 10:15 PM, Linus Walleij
> <linus.walleij@linaro.org> wrote:
> > On Thu, Feb 26, 2015 at 11:27 AM, Alexandre Courbot <gnurou@gmail.com> wrote:
> >> On Fri, Feb 20, 2015 at 1:52 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> >>> On Thu, Feb 19, 2015 at 9:53 AM, folkert <folkert@vanheusden.com> wrote:
> >>>
> >>>> I also think that this interface is cumbersome. I did not measure it(!)
> >>>> but I think adding this open/seek + read construction may add all kinds
> >>>> of overhead. Especially since my use-case requires the lowest latency
> >>>> possible. Not to forget that conversion of the measured value to ascii
> >>>> and back.

I may have opened this can of worms so I figured I should chime in.

The context switches probably of more concern than string conversion.

> >>>
> >>> Yes this interface sucks.
> >>>
> >>> The tentative long-term plan is to replace it with something like
> >>> a char device that can handle a quick context switch and also
> >>> issuing calls to set multiple pins at once, as we now have an
> >>> in-kernel interface for that (that I totally refuse to support from
> >>> sysfs).
> >>
> >> Mmm, I was thinking it would be nice to have a (new, redesigned) sysfs
> >> interface for this. :P
> >>
> >> Aren't we going to make things less accessible if we use a char device?
> >
> > Since sysfs has a "one value per file" paradigm, it also has a
> > "one context switch per operation" paradigm, meaning any
> > efficiency-oriented use cases where a lot of stuff needs to be
> > changed in one context switch are by the very construction
> > not suitable for sysfs IMO. That is the use case for ioctl()
> > operations that can pass an entire struct of stuff over.
> >
> > And things like bit-banging a clock+data line which would in
> > a sysfs case involve two context switches (one per value, since
> > that is one file per GPIO line) in an ioctl() case it would be
> > just one, already 50% less context switches for a very basic
> > use case.
> 
> These are absolutely legitimate concerns, but couldn't the desired
> result be achieved using an interface like this (warning: raw and
> dirty draft):
> 
>     cd /sys/class/gpio
>     echo "gpiochip0:12 gpiochip0:13 gpiochip1:7 lcd_gpios" >export   #
> exports GPIOs 12 and 13 of chip0 and 7 of chip 1 under the node
> "lcd_gpios"
>     echo 5 >lcd_gpios/value # sets gpiochip0:12 and gpiochip1:7
> 
> ... or we could request the user to export each GPIO individually,
> then have a "group" node allowing to create a group of GPIOs from
> already-exported ones. This idea might actually work better as it
> would allow finer control over the properties of individual GPIO (e.g.
> active-low status).
> 

It may be beneficial and easier to perform the grouping in the device tree.
Then the system could come up with the groups pre-exported in /sys/class/gpio.

The GPIOs would be self consumed like with the proposed pin hogging mechanism
but then available as a single group in the sysfs layer.

What do you guys think?

> I understand that even this way sysfs might be slower than a character
> device, but when you need that level of performance don't you just
> need a dedicated driver? The ioctls might also get complex as it also
> needs to be able to set all the GPIO properties.
> 
> Independently of this issue, I think it would be worth to create
> alternative "export" nodes at the chip-level, like the pwm subsystem
> has:
> 
>     pwm/pwmchip0/export
>     pwm/pwmchip0/pwm1
>     pwm/pwmchip0/pwm1/duty_cycle
> 
> This is much saner and would provide a sysfs interface that does not
> rely on the global GPIO numberspace, which cannot be relied upon as
> shown by countless evidence.
> 
> IMHO this is needed regardless of whether we decide to provide a
> character device as well, so I thought we might also add the ability
> to set multiple GPIOs in one call to it. Maintaining two user-space
> ABIs (sysfs and char device) sounds a little bit overkill for
> something as simple as GPIOs.

Perhaps an ioctl would be overkill seeing as the right way to emulate a bus 
or whatever timing critical would be in a kernel driver.

String conversion sucks but I could deal with it if more IOs were acessible
with a single system call.

As for the lseek thing I am not sure of the solution yet.

