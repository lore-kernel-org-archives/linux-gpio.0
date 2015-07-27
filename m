From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/2] ARM: sunxi: dt: Convert users to the PIO
 interrupts binding
Date: Mon, 27 Jul 2015 14:58:29 +0200
Message-ID: <CACRpkdYT0gsrZZcWrkES4EdF0G1oY_t0isOTbJtbCGx2KP2HTw@mail.gmail.com>
References: <1438000918-9026-1-git-send-email-maxime.ripard@free-electrons.com>
	<1438000918-9026-3-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438000918-9026-3-git-send-email-maxime.ripard@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jul 27, 2015 at 2:41 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:

> The current DTs were setting the cell size to 2, but used the default xlate
> function that was assuming an interrupt cell size of 1, leading to the
> second part of the cell (the flags) being ignored, while we were having an
> inconsistent binding between the interrupts and gpio (that could also be
> used as interrupts).
>
> That "binding" doesn't work either with newer SoCs that have multiple irq
> banks.
>
> Now that we fixed the pinctrl driver to handle this like it should always
> have been handled, convert the DT users, and while we're at it, remove the
> size-cells property of PIO that is completely useless.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

I guess this will be merged through ARM SoC?

If you want me to carry it in pinctrl and you're *certain* it
will not collide with something else coming in from ARM SoC
then tell me ... prefer to even have ARM SoC maintainers
ACK on this actually.

Yours,
Linus Walleij
