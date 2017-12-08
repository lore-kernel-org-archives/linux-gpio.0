From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 0/4] Add support for muxing individual pins
Date: Fri, 8 Dec 2017 17:22:44 +0000
Message-ID: <20171208172244.tbqybyrcubvrnwmm@localhost.localdomain>
References: <20170929101503.6769-1-ckeepax@opensource.cirrus.com>
 <CACRpkdYMBan5WrEvsQDu0dveq13bW4w=3bOgS71fcFfd4e=UGA@mail.gmail.com>
 <20171208142923.2exqaateli2qmtzl@localhost.localdomain>
 <CACRpkdZ_TjC2zoghHpHLXY3tFGkicRGz0pyt=i0828fDs4NjWQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:48506 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752645AbdLHRWs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Dec 2017 12:22:48 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdZ_TjC2zoghHpHLXY3tFGkicRGz0pyt=i0828fDs4NjWQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: ext Tony Lindgren <tony@atomide.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, patches@opensource.cirrus.com, Bjorn Andersson <bjorn.andersson@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>

On Fri, Dec 08, 2017 at 03:40:49PM +0100, Linus Walleij wrote:
> On Fri, Dec 8, 2017 at 3:29 PM, Charles Keepax
> <ckeepax@opensource.cirrus.com> wrote:
> 
> > (...) I have finally
> > managed to get some time to look over the pinctrl-single stuff.
> >
> > Naively one could convert the pinctrl-single stuff over to use
> > the patches I proposed creating one large group for the driver
> > and then mux each pin individually from within that.  However I
> > am not really sure it would make sense. From the implementation
> > so far the pinctrl-single stuff appears to target systems where
> > there isn't really a concept of groups. Each pin is just a
> > completely separate entry and you can only configure things one
> > pin at a time. In that case it almost makes more sense to model
> > each pin as an individual group such that it is clearly distinct
> > from the others. My thinking had been more along the lines of you
> > perhaps have a group that represents an I2S port but you can also
> > individually assign each of those pins as a GPIO when not in use
> > as the I2S port.
> 
> So then I toss the qcom driver into the game instead :)
> 
> If you look at drivers/pinctrl/qcom/* e.g. pinctrl-ipq4019.c or
> essentially any of the subdrivers, you find exactly this scenario.
> 
> I am concerned that if we add infrastructure for this, it needs
> to have more than one user. Qualcomm does fit your description
> above I think.
> 

Yeah I could certainly have a hunt through for other users that
would make good candidates to update. The QC driver certainly
looks like it would be capable of muxing individual pins,
although it looks like it might not let you mux an individual
GPIO at the moment, need to dig into that more.

I guess maybe a bigger question is do we think this is a problem
worth solving or should really just be adding a group for each
pin I want to be able to mux?

Thanks,
Charles
