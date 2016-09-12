From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/4] ARM: dts: Add NextThing GR8 dtsi
Date: Mon, 12 Sep 2016 14:40:15 +0200
Message-ID: <CACRpkdbrvDZGM3OJsAMk4T5awSSbrJ4MDyKXV2C45ZSE7zUVNQ@mail.gmail.com>
References: <20160907145400.27192-1-maxime.ripard@free-electrons.com>
 <20160907145400.27192-4-maxime.ripard@free-electrons.com> <CACRpkdZsxA7avmO85R=-Quu7FQwSVMPhQMDmmgL+xbkVTB-2HQ@mail.gmail.com>
 <CAGb2v64h7kq2jWzUJ74vDdOOQOXPxjx3ruSsJMXvyr7fP63BGg@mail.gmail.com> <20160908073748.GF8913@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160908073748.GF8913@lukather>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mylene Josserand <mylene.josserand@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Alexander Kaplan <alex@nextthing.co>
List-Id: linux-gpio@vger.kernel.org

On Thu, Sep 8, 2016 at 9:37 AM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> On Thu, Sep 08, 2016 at 12:46:14PM +0800, Chen-Yu Tsai wrote:

>> Also, I think we are needlessly using pin groups, 1 pin per group.
>> Can pinconf/pinctrl work without them? Would there be any harm
>> converting the sunxi driver to work directly with pins? This would
>> make it match generic pinconf parsing, and make it easier to get
>> both working together.
>
> I think it comes from a requirement that you had to have groups at
> some point (I don't know if it's still the case), which is why we
> ended up with single-pin groups, because we can mux each pins entirely
> separately.
>
> If it's not required anymore, then yes, it makes total sense to remove
> it.

The groups vs individual pins is an eternal debate that has
been going on since the inception of pinctrl.

If you see it from the point of the programmer, you may just see
a register for each pin and they seem all independent. This is
why pinctrl-single exist, and that driver is for this purpose: one
register per pin, software-wise independent.

HOWEVER it often turns out that while you can programmatically
and individually set pins to any function (and biasing etc), the
person designing the hardware was not thinking that you should
be able to do whatever you like, e.g. even if it is possible to
take two pins and use one of them for half an SPI bus and the
other for half an I2C bus, that doesn't mean that this is useful
or makes any kind of electronic sense, it just makes "software
sense".

So for a deeper understanding, several SoCs (amongst them
my own and Qualcomm etc) define groups that are not really
about software restrictions for what you can do with the pins, but
about usecase and electronic restrictions for what can be done
with the pins.

E.g. it makes *sense* to have a group for muxing I2C on two
pins, and not allow one of them to be muxed to I2C and the other
not, because it does not make electronic sense.

One-group-per-pin groups is usually coming from a failure or
inability to identify these electronically sound and usecase
oriented pingroups.

Some (like pinctrl-single) say they don't care, and wish to
see things as the world is just software and one register per
pin, removing those electric usecase restrictions, and only
keeping the muxing restrictions to e.g. the four different functions
that can be muxed on that pin, disregarding the bigger picture.

I don't know about this driver or the pins it manages,
I seldom have time or brains to dive in and review things
deeply enough :(

Yours,
Linus Walleij
