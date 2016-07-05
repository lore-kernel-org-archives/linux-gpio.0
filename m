From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH] Revert "gpiolib: Split GPIO flags parsing and GPIO
 configuration"
Date: Tue, 5 Jul 2016 11:12:20 +0200
Message-ID: <20160705091220.GC17168@localhost>
References: <1467563525-30227-1-git-send-email-johan@kernel.org>
 <58708801.29lRIIaT3y@avalon>
 <CACRpkdZFUjFUApC-pZEjw7O54uCeivEvkjEBah_eq1x4nhnv+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:35134 "EHLO
	mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752669AbcGEJMR (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jul 2016 05:12:17 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdZFUjFUApC-pZEjw7O54uCeivEvkjEBah_eq1x4nhnv+w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Jul 05, 2016 at 08:54:36AM +0200, Linus Walleij wrote:
> On Mon, Jul 4, 2016 at 10:33 PM, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> 
> > As we're not dealing with a v4.7 regression that would need to be applied this
> > week, can't you propose a proper fix instead of a revert ?
> 
> AFAICT the proper fix is to simply move the gpiod_request() sites earlier,
> I can propose something if that's all right?

How would that work?

You still need to claim the pin before touching the descriptor flags,
and that isn't done until gpiod_request(). Furthermore, it's that very
function that calls the gpio driver request() callback, which in turn
was supposed to do the sanity check.

So what you need to do is to pass the desired flags down the call stack,
and make sure not to apply them before claiming the pin.

This may work without modifying the request callback prototype (which I
mentioned in my reply to Laurent), but it could still get a bit
invasive and hence not suitable for stable (and we really need this to
be fixed in 4.[456] stable).

Your call. :)

Thanks,
Johan
