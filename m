From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH] gpiolib: debugfs: display gpios requested as irq only
Date: Tue, 19 May 2015 17:39:40 +0200
Message-ID: <20150519153940.GP28127@localhost>
References: <1431696321-7257-1-git-send-email-grygorii.strashko@linaro.org>
 <20150518110214.GC28127@localhost>
 <5559E3C0.1040207@linaro.org>
 <20150518150815.GH28127@localhost>
 <555A0299.3030803@linaro.org>
 <CACRpkdYs+r+oSegZuMjvg9PueWr6xB7Z-BmsHD+cmgeV=XD=Sg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f47.google.com ([209.85.215.47]:35089 "EHLO
	mail-la0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752408AbbESPjl (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 19 May 2015 11:39:41 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdYs+r+oSegZuMjvg9PueWr6xB7Z-BmsHD+cmgeV=XD=Sg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "Grygorii.Strashko@linaro.org" <grygorii.strashko@linaro.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, May 19, 2015 at 04:12:35PM +0200, Linus Walleij wrote:
> On Mon, May 18, 2015 at 5:17 PM, Grygorii.Strashko@linaro.org
> <grygorii.strashko@linaro.org> wrote:
> > On 05/18/2015 06:08 PM, Johan Hovold wrote:
> 
> >>       GPIOs 160-191, platform/4805d000.gpio, gpio:
> >>       gpio-171 (<irq-only>          ) in  hi IRQ-209
> >
> > In general agree, but i propose to do it as
> >         GPIOs 160-191, platform/4805d000.gpio, gpio:
> >         gpio-171 ((null)          ) in  hi IRQ-209 <irq-only>
> >
> > My intention is - this interface could be considered as more or less stable, so
> > it is better to add additional information at the end of each line to avoid
> > potential breakage of User space SW (test/debug scripts).
> 
> What? If I wanted a stable interface I would use sysfs and document
> the ABI in Documentation/ABI/*.
> 
> debugfs is not ABI.

As I mentioned in my response to Grygorii, not everyone -- and most
notably apparently not even Linus Torvalds -- agrees on this:

	"The fact that something is documented (whether correctly or
	not) has absolutely _zero_ impact on anything at all. What makes
	something an ABI is that it's useful and available. The only way
	something isn't an ABI is by _explicitly_ making sure that it's
	not available even by mistake in a stable form for binary use.

	Example: kernel internal data structures and function calls. We
	make sure that you simply _cannot_ make a binary that works
	across kernel versions. That is the only way for an ABI to not
	form."

	https://lwn.net/Articles/309298/

In this case, it could be worked around by providing another debugfs
file with gpios used as IRQs, I guess.

Johan
