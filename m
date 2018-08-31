From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [RFT PATCH 1/2] pinctrl: ssbi-gpio: Fix pm8xxx_pin_config_get() to be
 compliant
Date: Thu, 30 Aug 2018 18:00:08 -0700
Message-ID: <153567720861.93865.11098054819022547198@swboyd.mtv.corp.google.com>
References: <20180830152340.242249-1-dianders@chromium.org>
 <20180830152340.242249-2-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180830152340.242249-2-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: "Ivan T . Ivanov" <iivanov@mm-sol.com>, Douglas Anderson <dianders@chromium.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Quoting Douglas Anderson (2018-08-30 08:23:38)
> If you look at "pinconf-groups" in debugfs for ssbi-gpio you'll notice
> it looks like nonsense.
> =

> The problem is fairly well described in commit 1cf86bc21257 ("pinctrl:
> qcom: spmi-gpio: Fix pmic_gpio_config_get() to be compliant") and
> commit 05e0c828955c ("pinctrl: msm: Fix msm_config_group_get() to be
> compliant"), but it was pointed out that ssbi-gpio has the same
> problem.  Let's fix it there too.
> =

> Fixes: b4c45fe974bc ("pinctrl: qcom: ssbi: Family A gpio & mpp drivers")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
