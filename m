From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 0/4] Add support for muxing individual pins
Date: Fri, 8 Dec 2017 14:29:23 +0000
Message-ID: <20171208142923.2exqaateli2qmtzl@localhost.localdomain>
References: <20170929101503.6769-1-ckeepax@opensource.cirrus.com>
 <CACRpkdYMBan5WrEvsQDu0dveq13bW4w=3bOgS71fcFfd4e=UGA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:34816 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753675AbdLHO33 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Dec 2017 09:29:29 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdYMBan5WrEvsQDu0dveq13bW4w=3bOgS71fcFfd4e=UGA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: ext Tony Lindgren <tony@atomide.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, patches@opensource.cirrus.com, Bjorn Andersson <bjorn.andersson@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>

On Mon, Oct 09, 2017 at 11:10:34PM +0200, Linus Walleij wrote:
> On Fri, Sep 29, 2017 at 12:14 PM, Charles Keepax
> <ckeepax@opensource.cirrus.com> wrote:
> > This series add support for muxing individual pins within
> > pin mux, rather than just whole groups. Mainly, I had two
> > motivations here, one to avoid the need to add loads of groups
> > containing individual pins and hardware that actually has some
> > internal concept of groups of pins, and disambiguating that from
> > individual pin muxing.  I have marked it as RFC to just get
> > peoples opinions at this stage, although it should be pretty well
> > tested. Sorry about the amount of files touched in patch 2 it
> > would be possible to drop it from the chain although it leaves
> > the field rather inaccurately named.
> >
> > Also I have left all the existing code paths parsing all mux
> > options as groups from DT, and added a new helper to unlock the
> > pin based functionality this should ease the transition across.
> There is currently a driver in the pin control subsystem that
> handles individual pins and that is pinctrl-single.c.
> 
> The driver is deployed for single pins muxed by a single
> register, and if this infrastructure is to be deployed it must
> be applied also in pinctrl-single. We cannot have several ways
> of doing the same thing, that way lies madness.
> 
> So you need Tony Lindgren's review and direction on this
> patch series.

Apologies for the delay on this one, I got some what snowed under
with other tasks. Please let me know if you would rather I just
resent the series to refresh everyones memory. But I have finally
managed to get some time to look over the pinctrl-single stuff.

Naively one could convert the pinctrl-single stuff over to use
the patches I proposed creating one large group for the driver
and then mux each pin individually from within that.  However I
am not really sure it would make sense. From the implementation
so far the pinctrl-single stuff appears to target systems where
there isn't really a concept of groups. Each pin is just a
completely separate entry and you can only configure things one
pin at a time. In that case it almost makes more sense to model
each pin as an individual group such that it is clearly distinct
from the others. My thinking had been more along the lines of you
perhaps have a group that represents an I2S port but you can also
individually assign each of those pins as a GPIO when not in use
as the I2S port.

Alternatively one could perhaps look at expanding the pinctrl-single
stuff to have some notion of groups as well. So you could define
sub groups of the pins that can be set as a block. Allowing users
to configure either groups or individual pins.

I guess my main question is what is the intention of the
pinctrl-single code, is this something that should be seeing
expansion to handle groups as well or is it firmly for the
unrelated pins cases?

Thanks,
Charles
