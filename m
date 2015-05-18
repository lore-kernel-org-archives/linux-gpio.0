From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH] gpiolib: debugfs: display gpios requested as irq only
Date: Mon, 18 May 2015 17:08:15 +0200
Message-ID: <20150518150815.GH28127@localhost>
References: <1431696321-7257-1-git-send-email-grygorii.strashko@linaro.org>
 <20150518110214.GC28127@localhost>
 <5559E3C0.1040207@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f51.google.com ([209.85.215.51]:36742 "EHLO
	mail-la0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753879AbbERPIT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 18 May 2015 11:08:19 -0400
Content-Disposition: inline
In-Reply-To: <5559E3C0.1040207@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Grygorii.Strashko@linaro.org" <grygorii.strashko@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, May 18, 2015 at 04:06:08PM +0300, Grygorii.Strashko@linaro.org wrote:
> Hi Johan,
> On 05/18/2015 02:02 PM, Johan Hovold wrote:
> > On Fri, May 15, 2015 at 04:25:21PM +0300, grygorii.strashko@linaro.org wrote:
> >> From: Grygorii Strashko <grygorii.strashko@linaro.org>
> >>
> >> Now GPIOs, wich are requested as IRQ only, will not be displayed
> >> through GPIO debugfs. For example:
> >>   # cat /proc/interrupts
> >>              CPU0       CPU1
> >> ...
> >> 209:          0          0  4805d000.gpio  11 Edge      0-0021
> >>
> >>   # cat /debug/gpio
> >> ...
> >> GPIOs 160-191, platform/4805d000.gpio, gpio:
> >> <--- no info about gpio used as IRQ only here
> >>
> >> GPIOs 192-223, platform/48051000.gpio, gpio:
> >>   gpio-203 (vtt_fixed           ) out hi
> >> ...
> >>
> >> Hence, improve GPIO debugfs code to show such kind of gpio and print
> >> IRQ number also. In addition, add marker "requested" for GPIOs wich
> >> were requested by using gpioX_request().
> >>
> >> After this patch sys/kernel/debug/gpio will produce following output:
> >>
> >>   # cat /debug/gpio
> >> ...
> >> GPIOs 160-191, platform/4805d000.gpio, gpio:
> >>   gpio-171 ((null)              ) in  hi IRQ209
> >>
> >> GPIOs 192-223, platform/48051000.gpio, gpio:
> >>   gpio-203 (vtt_fixed           ) out hi requested
> > 
> > This is backwards. All gpios *should* be requested. *If* we are to
> > include not-requested gpios in the debug output, then it is those pins
> > that need to be marked as not-requested.
> 
> Sry, but I didn't fully understand your point here ( - Why is it
> backward?

My main point was that you should mark the pins used for irq only
instead of the other way round.

We should also consider making sure that pins only used for irq are also
requested.

With the current sysfs-interface it is for example to possible to
request the same irq, and when that pin is unexported (or only irq
released) the pin will no longer be marked for irq (just a flag that is
cleared) so that the direction can be changed...

gpiolib also depends on pins to be requested to prevent the
gpio-controller driver from being unloaded while in use.

[...]

> Of course, format of the marker "requested" is discussable. Could be:
> - "requested" --> "not-requested"
> - "I R" or "I G" where I - IRQ, G - GPIO, R - requested
> - etc.

How about instead of

	GPIOs 160-191, platform/4805d000.gpio, gpio:
	gpio-171 ((null)              ) in  hi IRQ209

you do something like:

	GPIOs 160-191, platform/4805d000.gpio, gpio:
	gpio-171 (<irq-only>          ) in  hi IRQ-209

> > The irq-number mapping could perhaps be useful, but it should go in a
> > separate patch. I'd suggest adding a '-' before the irq-number (e.g.
> > "IRQ-209").
> 
> I've thought about this, but finally decided not to split it.
> Could be done, if you insist )

Yes, you should split self-contained, logical changes into separate
patches (so they can be reviewed, applied or rejected separately as
well).

Johan
