From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: ingenic: Fix group & function error checking
Date: Wed, 29 Aug 2018 13:44:19 +0200
Message-ID: <CACRpkdYHZUxoTdkxUyUXi3hSo1-cyo7xVk7fcZFY5nLcC6pdxw@mail.gmail.com>
References: <20180825175328.16687-1-paul.burton@mips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180825175328.16687-1-paul.burton@mips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: paul.burton@mips.com
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Paul Cercueil <paul@crapouillou.net>, ext Tony Lindgren <tony@atomide.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sat, Aug 25, 2018 at 7:54 PM Paul Burton <paul.burton@mips.com> wrote:

> Commit a203728ac6bb ("pinctrl: core: Return selector to the pinctrl
> driver") and commit f913cfce4ee4 ("pinctrl: pinmux: Return selector to
> the pinctrl driver") modified the return values of
> pinctrl_generic_add_group() and pinmux_generic_add_function()
> respectively, but did so without updating their callers. This broke the
> pinctrl-ingenic driver, which treats non-zero return values from these
> functions as errors & fails to probe. For example on a MIPS Ci20:
>
>   pinctrl-ingenic 10010000.pin-controller: Failed to register group uart0-hwflow
>   pinctrl-ingenic: probe of 10010000.pin-controller failed with error 1
>
> Without the pinctrl driver probed, other drivers go on to fail to probe
> too & the system is unusable.
>
> Fix this by modifying the error checks to treat only negative values as
> errors, matching the commits that introduced the breakage & similar
> changes made to other drivers.
>
> Signed-off-by: Paul Burton <paul.burton@mips.com>
> Fixes: a203728ac6bb ("pinctrl: core: Return selector to the pinctrl driver")
> Fixes: f913cfce4ee4 ("pinctrl: pinmux: Return selector to the pinctrl driver")
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Paul Cercueil <paul@crapouillou.net>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org

Patch applied for fixes.

Yours,
Linus Walleij
