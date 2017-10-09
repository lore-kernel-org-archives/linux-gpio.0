From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/4] Add support for muxing individual pins
Date: Mon, 9 Oct 2017 23:10:34 +0200
Message-ID: <CACRpkdYMBan5WrEvsQDu0dveq13bW4w=3bOgS71fcFfd4e=UGA@mail.gmail.com>
References: <20170929101503.6769-1-ckeepax@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170929101503.6769-1-ckeepax@opensource.cirrus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.cirrus.com>, ext Tony Lindgren <tony@atomide.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, patches@opensource.cirrus.com, Bjorn Andersson <bjorn.andersson@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Sep 29, 2017 at 12:14 PM, Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:

> This series add support for muxing individual pins within
> pin mux, rather than just whole groups. Mainly, I had two
> motivations here, one to avoid the need to add loads of groups
> containing individual pins and hardware that actually has some
> internal concept of groups of pins, and disambiguating that from
> individual pin muxing.  I have marked it as RFC to just get
> peoples opinions at this stage, although it should be pretty well
> tested. Sorry about the amount of files touched in patch 2 it
> would be possible to drop it from the chain although it leaves
> the field rather inaccurately named.
>
> Also I have left all the existing code paths parsing all mux
> options as groups from DT, and added a new helper to unlock the
> pin based functionality this should ease the transition across.

There is currently a driver in the pin control subsystem that
handles individual pins and that is pinctrl-single.c.

The driver is deployed for single pins muxed by a single
register, and if this infrastructure is to be deployed it must
be applied also in pinctrl-single. We cannot have several ways
of doing the same thing, that way lies madness.

So you need Tony Lindgren's review and direction on this
patch series.

I see the problem you are setting out to solve. I too have ran
into the situation (on systems such as Qualcomm's) where
single-pin groups are more rule than exception. It would be
good to alleviate this and handle it in the core somehow.

Yours,
Linus Walleij
