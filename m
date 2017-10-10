From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 0/4] Add support for muxing individual pins
Date: Tue, 10 Oct 2017 09:45:04 +0100
Message-ID: <20171010084504.dusockowbrlosbsz@localhost.localdomain>
References: <20170929101503.6769-1-ckeepax@opensource.cirrus.com>
 <CACRpkdYMBan5WrEvsQDu0dveq13bW4w=3bOgS71fcFfd4e=UGA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:33084 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1755763AbdJJIpM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Oct 2017 04:45:12 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdYMBan5WrEvsQDu0dveq13bW4w=3bOgS71fcFfd4e=UGA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: ext Tony Lindgren <tony@atomide.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, patches@opensource.cirrus.com, Bjorn Andersson <bjorn.andersson@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>

On Mon, Oct 09, 2017 at 11:10:34PM +0200, Linus Walleij wrote:
> On Fri, Sep 29, 2017 at 12:14 PM, Charles Keepax
> <ckeepax@opensource.cirrus.com> wrote:
> 
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
> 
> There is currently a driver in the pin control subsystem that
> handles individual pins and that is pinctrl-single.c.
> 
> The driver is deployed for single pins muxed by a single
> register, and if this infrastructure is to be deployed it must
> be applied also in pinctrl-single. We cannot have several ways
> of doing the same thing, that way lies madness.
> 

Apologies for the oversight I will have a look at that and try to
update the series as appropriate. I am travelling for the next
couple of weeks so there might be a small lag in getting an
updated version out.

> So you need Tony Lindgren's review and direction on this
> patch series.
> 

Any thoughts would be greatly appreciated.

> I see the problem you are setting out to solve. I too have ran
> into the situation (on systems such as Qualcomm's) where
> single-pin groups are more rule than exception. It would be
> good to alleviate this and handle it in the core somehow.

Thanks,
Charles
