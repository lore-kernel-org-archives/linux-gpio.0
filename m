From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 05/21] regulator: arizona-ldo1: Look up a descriptor and
 pass to the core
Date: Thu, 19 Apr 2018 16:02:13 +0100
Message-ID: <20180419150213.kzcl5ghpzkt2kkgk@localhost.localdomain>
References: <20180212131717.27193-1-linus.walleij@linaro.org>
 <20180212131717.27193-6-linus.walleij@linaro.org>
 <20180213110631.o3zn5bifvypofsyg@localhost.localdomain>
 <CACRpkdbOfycfGD-13OTEk7xT5FqLQsvcHrN-mn-vgjQ93cPHyQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdbOfycfGD-13OTEk7xT5FqLQsvcHrN-mn-vgjQ93cPHyQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, patches@opensource.cirrus.com, Richard Fitzgerald <rf@opensource.cirrus.com>
List-Id: linux-gpio@vger.kernel.org

On Thu, Apr 19, 2018 at 03:43:22PM +0200, Linus Walleij wrote:
> On Tue, Feb 13, 2018 at 12:06 PM, Charles Keepax
> <ckeepax@opensource.cirrus.com> wrote:
> > On Mon, Feb 12, 2018 at 02:17:01PM +0100, Linus Walleij wrote:
> >> Instead of passing a global GPIO number, pass a descriptor looked
> >> up with the standard devm_gpiod_get_optional() call.
> >>
> >> We have augmented the GPIO core to look up the regulator special
> >> GPIO "wlf,ldoena" in a separate patch.
> >>
> >> Cc: patches@opensource.cirrus.com
> >> Cc: Richard Fitzgerald <rf@opensource.cirrus.com>
> >> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> >> ---
> > Also looking at this more you will need to you
> > devm_gpio_get_from_of_node here since the device tree binding is
> > for wlf,ldoena not wlf,ldoena-gpio. So this patch currently
> > breaks the binding.
> 
> Actually not, because I fixed that in  the special quirk patch
> 6a537d48461d
> "gpio: of: Support regulator nonstandard GPIO properties"
> as mentioned in the commit message. (Will clarify.)

Apologies my bad should have spotted that in the commit message.

Thanks,
Charles
