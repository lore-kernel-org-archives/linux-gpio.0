From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: reason for Allwinner SoC specific pinctrl drivers?
Date: Thu, 7 Jan 2016 11:06:58 +0100
Message-ID: <CACRpkdZ+mGBr42Q4E+5tL80-+pFLWTQug8TJu64TVHDaCzE8_g@mail.gmail.com>
References: <568A514D.7070102@arm.com>
	<20160105131006.GI11722@lukather>
Reply-To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDE6RCFOWIARBQ7RXC2AKGQEL2AL2XI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20160105131006.GI11722@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jan 5, 2016 at 2:10 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> This was actually requested during the initial driver submission
> http://lists.infradead.org/pipermail/linux-arm-kernel/2012-December/136809.html
>
> And I actually came to like it, even though the initial port is indeed
> quite painful, for several reasons:
>
> 1) In those times, we didn't have a datasheet available for all these
> SoCs, so no easy way to find out the value to set in the register to
> mux a particular function in. These days are mostly over, but we're
> still in that situation for a few SoCs (mostly the R* and H* SoCs
> though).
>
> 2) It's quite easy to read and debug, at least from the DT PoV. The
> pain mostly comes from writing that table in the first place, but the
> alternative other SoCs have picked to have something readable in the
> DT is a SoC specific header file with the defines of all the functions
> availables for all the pins, which is just as painful to write and
> review, and is essentialy the same thing.
>
> 3) It's easy to maintain. If one of the entry in the table came to be
> wrong, we simply have to update the table, it's completely contained
> in the kernel itself and doesn't require fixing (and updating) the DT.
>
> 4) It allows to catch misconfiguration in the cases where you set a
> function on a pin that doesn't support it as well, which is also quite
> convenient, and wouldn't be possible at all in the case of a header,
> or simply open-coding the value.

They call it Stockholm Syndrome when you start to sympathize with
your kidnappers :D

On a serious note, we are in violent agreement on these bullets.
This driver is easy to maintain and debug, and easy for new developers
to get into precisely because so much knowledge is in the kernel
and not in DT. A quick tour in /sys/kernel/debug/pinctrl/*
should convince anyone that this is actually very helpful to get
things right.

Yours,
Linus Walleij
