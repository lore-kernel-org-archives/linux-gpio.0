From: Alexander Shiyan <shc_work@mail.ru>
Subject: Re: [PATCH v4] gpio: Driver for SYSCON-based GPIOs
Date: Tue, 25 Feb 2014 19:09:23 +0400
Message-ID: <20140225190923.fdd969463717061aea582551@mail.ru>
References: <1389632203-22806-1-git-send-email-shc_work@mail.ru>
	<CACRpkdaVn0iNFYKE3HXWxnb4iCJorF0HSVG4Uvz8Q18SiF5PUQ@mail.gmail.com>
	<20140218232520.GA22492@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp38.i.mail.ru ([94.100.177.98]:56049 "EHLO smtp38.i.mail.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752521AbaBYPJ3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 25 Feb 2014 10:09:29 -0500
In-Reply-To: <20140218232520.GA22492@quad.lixom.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Tue, 18 Feb 2014 15:25:20 -0800
Olof Johansson <olof@lixom.net> wrote:

> On Thu, Jan 30, 2014 at 02:54:36PM +0100, Linus Walleij wrote:
> > On Mon, Jan 13, 2014 at 5:56 PM, Alexander Shiyan <shc_work@mail.ru> wrote:
> > 
> > > SYSCON driver was designed for using memory areas (registers)
> > > that are used in several subsystems. There are systems (CPUs)
> > > which use bits in one register for various purposes and thus
> > > should be handled by various kernel subsystems. This driver
> > > allows you to use the individual SYSCON bits as GPIOs.
> > > ARM CLPS711X SYSFLG1 input lines has been added as first user
> > > of this driver.
> > >
> > > Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
> > 
> > Oh the pain. I am so ambivalent of this patch as it obfuscates
> > some stuff about the hardware that the driver should know,
> > while at the same time being elegant in a way.
> > 
> > What does the ARM SoC maintainers think about this approach?
> > 
> > Arnd, Olof, Kevin: is this something you'd like to see deployed?
> 
> I think the binding needs to be adjusted -- syscon has nothing to do with
> the binding, that's a Linux construct.
> 
> Really, if this is rephrased it becomes much more clear that this is a useful
> driver:
> 
> CLPS711X implements a few GPIO lines in a register area that is shared with
> other system registers. This is a driver for those GPIO lines, implemented
> using the shared syscon infrastructure in the kernel.
> 
> And then take out syscon from the name of the driver (and the binding).
> 
> If we have more drivers like these down the road we can make a common shared
> binding, but until then I don't think there's much point in it.

Is this proposed to remove the generic implementation?
Linus, what is your opinion on this?

-- 
Alexander Shiyan <shc_work@mail.ru>
