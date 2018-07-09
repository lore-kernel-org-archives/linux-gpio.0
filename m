From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] pinctrl: msm: Fix msm_config_group_get() to be compliant
Date: Mon, 9 Jul 2018 13:15:15 +0200
Message-ID: <CACRpkdbXyBZhKcWH-SVWJmp4jd=fbHRaerzfv0BGHWtgucV-Aw@mail.gmail.com>
References: <20180702225939.109169-1-dianders@chromium.org> <20180702225939.109169-2-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180702225939.109169-2-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, "Ivan T. Ivanov" <iivanov@mm-sol.com>, Stephen Boyd <swboyd@chromium.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Tue, Jul 3, 2018 at 1:00 AM Douglas Anderson <dianders@chromium.org> wrote:

> If you do this on an sdm845 board:
>   cat /sys/kernel/debug/pinctrl/3400000.pinctrl/pinconf-groups
>
> ...it looks like nonsense.  For every pin you see listed:
>   input bias bus hold, input bias disabled, input bias pull down, input bias pull up
>
> That's because msm_config_group_get() isn't complying with the rules
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
> Fixes: f365be092572 ("pinctrl: Add Qualcomm TLMM driver")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Looks solid to me so patch applied, unless Bjorn has objections
it stays in.

Yours,
Linus Walleij
