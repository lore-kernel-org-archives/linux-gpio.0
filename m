From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH] gpiolib: debugfs: display gpios requested as irq only
Date: Thu, 21 May 2015 16:34:01 +0200
Message-ID: <20150521143401.GB30660@localhost>
References: <1431696321-7257-1-git-send-email-grygorii.strashko@linaro.org>
 <20150518110214.GC28127@localhost>
 <5559E3C0.1040207@linaro.org>
 <20150518150815.GH28127@localhost>
 <555A0299.3030803@linaro.org>
 <CACRpkdYs+r+oSegZuMjvg9PueWr6xB7Z-BmsHD+cmgeV=XD=Sg@mail.gmail.com>
 <20150519153940.GP28127@localhost>
 <CACRpkdbupBQBsymB4wcC9XxbFJMhzxoZVXhyKxZT+xxuSxwifA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f170.google.com ([209.85.217.170]:33063 "EHLO
	mail-lb0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754189AbbEUOeB (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 21 May 2015 10:34:01 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdbupBQBsymB4wcC9XxbFJMhzxoZVXhyKxZT+xxuSxwifA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, "Grygorii.Strashko@linaro.org" <grygorii.strashko@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, May 20, 2015 at 09:21:16AM +0200, Linus Walleij wrote:
> On Tue, May 19, 2015 at 5:39 PM, Johan Hovold <johan@kernel.org> wrote:
> > On Tue, May 19, 2015 at 04:12:35PM +0200, Linus Walleij wrote:
> 
> >> What? If I wanted a stable interface I would use sysfs and document
> >> the ABI in Documentation/ABI/*.
> >>
> >> debugfs is not ABI.
> >
> > As I mentioned in my response to Grygorii, not everyone -- and most
> > notably apparently not even Linus Torvalds -- agrees on this:
> 
> Yeah I was sloppy I guess.
> 
> What I mean, precisely is that sysfs is ABI, whether documented or
> not.
> 
> Even debugfs is actually blurry, as per
> Documentation/filesystems/debugfs.txt:
> 
> "The debugfs filesystem is also intended to not serve as a stable
> ABI to user space; in theory, there are no stability constraints placed on
> files exported there.  The real world is not always so simple, though [1];
> even debugfs interfaces are best designed with the idea that they will need
> to be maintained forever."
> 
> But I haven't been bitten by it yet so that's why I allow some poetic
> license.

Yes, and the [1] reference in that quote is the LWN article I referred
to.

I also see you already "broke" that ABI in a similar way in 2013 with
d468bf9ecaab ("gpio: add API to be strict about GPIO IRQ usage") by
adding the IRQ field.

Your call. :)

Johan
