From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH] gpiolib: debugfs: display gpios requested as irq only
Date: Mon, 25 May 2015 22:39:13 +0200
Message-ID: <20150525203913.GA17840@localhost>
References: <1431696321-7257-1-git-send-email-grygorii.strashko@linaro.org>
 <20150518110214.GC28127@localhost>
 <CACRpkdb9K5oi0Ld-njEz2a85X1NhYgFa8DCTZquqALdohL7WKA@mail.gmail.com>
 <20150521142524.GA30660@localhost>
 <555E40FD.7010209@linaro.org>
 <20150524171251.GA25494@localhost>
 <55636FE5.7090709@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f43.google.com ([209.85.215.43]:36854 "EHLO
	mail-la0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751150AbbEYUjN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 25 May 2015 16:39:13 -0400
Content-Disposition: inline
In-Reply-To: <55636FE5.7090709@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Grygorii.Strashko@linaro.org" <grygorii.strashko@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, May 25, 2015 at 09:54:29PM +0300, Grygorii.Strashko@linaro.org wrote:
> On 05/24/2015 08:12 PM, Johan Hovold wrote:
> > On Thu, May 21, 2015 at 11:33:01PM +0300, Grygorii.Strashko@linaro.org wrote:
> >> On 05/21/2015 05:25 PM, Johan Hovold wrote:

> >>> A problem with the current implementation is that it uses as a flag
> >>> rather than a refcount. As I pointed out elsewhere in this thread, it is
> >>> possible to request a shared IRQ (e.g. via the sysfs interface) and
> >>> release it, thereby making it possible to change the direction of the
> >>> pin while still in use for irq.
> >>
> >> Yes (checked). And this is an issue which need to be fixed.
> >> - gpio sysfs should not call gpiochip_un/lock_as_irq()
> > 
> > This is a known but unrelated issue. The lock/unlock call in the sysfs
> > implementation is at worst redundant. I suggested removing it earlier,
> > but Linus pointed out that there were still a few drivers not
> > implementing the irq resource callbacks that need to be updated first.
> > 
> >> - gpio drivers should use gpiochip API or implement
> >>    .irq_release/request_resources() callbacks
> >>
> >> in this case case IRQ core will do just what is required. Right?
> > 
> > No, the problem is that the "lock" is implemented using a flag rather
> > than a refcount.
> 
> I've rechecked __setup_irq() and what I can see from it is that
> irq_request_resources(), __irq_set_trigger() and irq_startup() 
> functions will be called only when the first IRQ action is installed.
> So, It looks like flag should work here. Am I missing smth?

You're absolutely right. I didn't look at the code after I managed to
trigger the bug using sysfs and my memory failed me. Bah, sorry about
that.

It is indeed a sysfs-interface bug.

> > At least the gpio-irq mapping for requested gpios could be useful.
> > 
> > Another issue here is that you would start calling gpio accessors for
> > unrequested gpios. Are you sure all gpio drivers can, and will always be
> > able to, handle that? [ When using the gpiod interface, gpios will always
> > be requested and must not be accessed after having been released. ]
> 
> Agree :(. I'm not sure.  This is very sensible remark:
> - call of gpiod_get_direction() can be avoided, in general, for <irq-only> case
> - but gpiod_to_irq() -- is not.
> 
> .. Looks like it's time to drop this stuff :,,(

You can always export the pins using sysfs or request them using the new
hogging mechanism from DT so that the pins you're interested in
debugging show up in debugfs.

Thanks,
Johan
