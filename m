From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 0/4] Add support for muxing individual pins
Date: Fri, 8 Dec 2017 20:15:11 -0800
Message-ID: <20171209041511.GB4803@minitux>
References: <20170929101503.6769-1-ckeepax@opensource.cirrus.com>
 <CACRpkdYMBan5WrEvsQDu0dveq13bW4w=3bOgS71fcFfd4e=UGA@mail.gmail.com>
 <20171208142923.2exqaateli2qmtzl@localhost.localdomain>
 <CACRpkdZ_TjC2zoghHpHLXY3tFGkicRGz0pyt=i0828fDs4NjWQ@mail.gmail.com>
 <20171208172244.tbqybyrcubvrnwmm@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pg0-f41.google.com ([74.125.83.41]:46468 "EHLO
        mail-pg0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753674AbdLIEPP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Dec 2017 23:15:15 -0500
Received: by mail-pg0-f41.google.com with SMTP id b11so8059430pgu.13
        for <linux-gpio@vger.kernel.org>; Fri, 08 Dec 2017 20:15:15 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20171208172244.tbqybyrcubvrnwmm@localhost.localdomain>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, ext Tony Lindgren <tony@atomide.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, patches@opensource.cirrus.com, Stephen Warren <swarren@wwwdotorg.org>

On Fri 08 Dec 09:22 PST 2017, Charles Keepax wrote:

> On Fri, Dec 08, 2017 at 03:40:49PM +0100, Linus Walleij wrote:
> > On Fri, Dec 8, 2017 at 3:29 PM, Charles Keepax
> > <ckeepax@opensource.cirrus.com> wrote:
> > 
> > > (...) I have finally
> > > managed to get some time to look over the pinctrl-single stuff.
> > >
> > > Naively one could convert the pinctrl-single stuff over to use
> > > the patches I proposed creating one large group for the driver
> > > and then mux each pin individually from within that.  However I
> > > am not really sure it would make sense. From the implementation
> > > so far the pinctrl-single stuff appears to target systems where
> > > there isn't really a concept of groups. Each pin is just a
> > > completely separate entry and you can only configure things one
> > > pin at a time. In that case it almost makes more sense to model
> > > each pin as an individual group such that it is clearly distinct
> > > from the others. My thinking had been more along the lines of you
> > > perhaps have a group that represents an I2S port but you can also
> > > individually assign each of those pins as a GPIO when not in use
> > > as the I2S port.
> > 
> > So then I toss the qcom driver into the game instead :)
> > 
> > If you look at drivers/pinctrl/qcom/* e.g. pinctrl-ipq4019.c or
> > essentially any of the subdrivers, you find exactly this scenario.
> > 
> > I am concerned that if we add infrastructure for this, it needs
> > to have more than one user. Qualcomm does fit your description
> > above I think.
> > 
> 
> Yeah I could certainly have a hunt through for other users that
> would make good candidates to update. The QC driver certainly
> looks like it would be capable of muxing individual pins,
> although it looks like it might not let you mux an individual
> GPIO at the moment, need to dig into that more.
> 

In the Qualcomm hardware we have X GPIO pins and some number of special
purpose pins. GPIO pins can be muxed and controlled individually and
the special purpose pins (e.g. SDCC) are controlled as a group.

I expected to describe both of these types as "pinctrl groups", but
after struggling with this I realized that as the control is on
pin-granularity (for the GPIOs) this is what should be represented as a
group in pinctl/pinmux/pinconf.

So each GPIO pin can be controlled/muxed individually and as such is
represented as a group, special groups are describes as one group
(matching the single set of registers).

To configure a "logical group" (e.g. a UART), we list each pin
(technically group), specify the same function and the necessary
configuration options.


So if you hardware supports configuring individual pins within a group
my suggestion is that you should rework the driver to make "group" match
"configurable thing" and then tie together logical groups when
configuring your system.

PS. A side effect of this is that e.g. UART is a function of 4 pins, but
by specifying the pinmux/pinconf of only two of them I have a 2 pin
UART, without having to describe this setup in the pinctrl driver.

Regards,
Bjorn
