From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] pinctrl: qcom: spmi-gpio: Fix pmic_gpio_config_get()
 to be compliant
Date: Mon, 9 Jul 2018 13:17:01 +0200
Message-ID: <CACRpkdbGejz1a1doN_LuBNgYeHo9Hdz54vRYU=inQZfyiJEmaA@mail.gmail.com>
References: <20180702225939.109169-1-dianders@chromium.org> <20180702225939.109169-3-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180702225939.109169-3-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, "Ivan T. Ivanov" <iivanov@mm-sol.com>, Stephen Boyd <swboyd@chromium.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Tue, Jul 3, 2018 at 1:00 AM Douglas Anderson <dianders@chromium.org> wrote:

> If you do this on an sdm845 board:
>   grep "" /sys/kernel/debug/pinctrl/*spmi:pmic*/pinconf-groups
>
> ...it looks like nonsense.  For every pin you see listed:
>   input bias disabled, input bias high impedance, input bias pull down, input bias pull up, ...
>
> That's because pmic_gpio_config_get() isn't complying with the rules
> that pinconf_generic_dump_one() expects.  Specifically for boolean
> parameters (anything with a "struct pin_config_item" where has_arg is
> false) the function expects that the function should return its value
> not through the "config" parameter but should return "0" if the value
> is set and "-EINVAL" if the value isn't set.
>
> Let's fix this.
>
> From a quick sample of other pinctrl drivers, it appears to be
> tradition to also return 1 through the config parameter for these
> boolean parameters when they exist.  I'm not one to knock tradition,
> so I'll follow tradition and return 1 in these cases.  While I'm at
> it, I'll also continue searching for four leaf clovers, kocking on
> wood three times, and trying not to break mirrors.
>
> NOTE: This also fixes an apparent typo for reading
> PIN_CONFIG_BIAS_DISABLE where the old driver was accidentally
> using "=" instead of "==" and thus was setting some internal
> state when you tried to query PIN_CONFIG_BIAS_DISABLE.  Oops.
>
> Fixes: eadff3024472 ("pinctrl: Qualcomm SPMI PMIC GPIO pin controller driver")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Patch applied, same thing. Stays in unless Bjorn has some
objections.

Yours,
Linus Walleij
