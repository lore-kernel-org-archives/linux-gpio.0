From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 3/3] pinctrl: qcom: spmi-gpio: Fix pmic_gpio_config_get() to be
 compliant
Date: Mon, 02 Jul 2018 23:09:07 -0700
Message-ID: <153059814703.143105.275831530209187562@swboyd.mtv.corp.google.com>
References: <20180702225939.109169-1-dianders@chromium.org>
 <20180702225939.109169-3-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180702225939.109169-3-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: iivanov@mm-sol.com, Douglas Anderson <dianders@chromium.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Quoting Douglas Anderson (2018-07-02 15:59:39)
> If you do this on an sdm845 board:
>   grep "" /sys/kernel/debug/pinctrl/*spmi:pmic*/pinconf-groups
> =

> ...it looks like nonsense.  For every pin you see listed:
>   input bias disabled, input bias high impedance, input bias pull down, i=
nput bias pull up, ...
> =

> That's because pmic_gpio_config_get() isn't complying with the rules
> that pinconf_generic_dump_one() expects.  Specifically for boolean
> parameters (anything with a "struct pin_config_item" where has_arg is
> false) the function expects that the function should return its value
> not through the "config" parameter but should return "0" if the value
> is set and "-EINVAL" if the value isn't set.
> =

> Let's fix this.
> =

> From a quick sample of other pinctrl drivers, it appears to be
> tradition to also return 1 through the config parameter for these
> boolean parameters when they exist.  I'm not one to knock tradition,
> so I'll follow tradition and return 1 in these cases.  While I'm at
> it, I'll also continue searching for four leaf clovers, kocking on

Small typo here.

> wood three times, and trying not to break mirrors.
> =

> NOTE: This also fixes an apparent typo for reading
> PIN_CONFIG_BIAS_DISABLE where the old driver was accidentally
> using "=3D" instead of "=3D=3D" and thus was setting some internal
> state when you tried to query PIN_CONFIG_BIAS_DISABLE.  Oops.

Awesome!

> =

> Fixes: eadff3024472 ("pinctrl: Qualcomm SPMI PMIC GPIO pin controller dri=
ver")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

We should fix the ssbi-gpio/mpp and spmi-mpp drivers too. All those
drivers are designed on the same buggy original driver.
