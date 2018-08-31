From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [RFT PATCH 2/2] pinctrl: spmi-mpp: Fix pmic_mpp_config_get() to be
 compliant
Date: Thu, 30 Aug 2018 18:00:16 -0700
Message-ID: <153567721669.93865.15006485526507438075@swboyd.mtv.corp.google.com>
References: <20180830152340.242249-1-dianders@chromium.org>
 <20180830152340.242249-3-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180830152340.242249-3-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: "Ivan T . Ivanov" <iivanov@mm-sol.com>, Douglas Anderson <dianders@chromium.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Quoting Douglas Anderson (2018-08-30 08:23:39)
> If you look at "pinconf-groups" in debugfs for ssbi-mpp you'll notice
> it looks like nonsense.
> =

> The problem is fairly well described in commit 1cf86bc21257 ("pinctrl:
> qcom: spmi-gpio: Fix pmic_gpio_config_get() to be compliant") and
> commit 05e0c828955c ("pinctrl: msm: Fix msm_config_group_get() to be
> compliant"), but it was pointed out that ssbi-mpp has the same
> problem.  Let's fix it there too.
> =

> NOTE: in case it's helpful to someone reading this, the way to tell
> whether to do the -EINVAL or not is to look at the PCONFDUMP for a
> given attribute.  If the last element (has_arg) is false then you need
> to do the -EINVAL trick.
> =

> ALSO NOTE: it seems unlikely that the values returned when we try to
> get PIN_CONFIG_BIAS_PULL_UP will actually be printed since "has_arg"
> is false for that one, but I guess it's still fine to return different
> values so I kept doing that.  It seems like another driver (ssbi-gpio)
> uses a custom attribute (PM8XXX_QCOM_PULL_UP_STRENGTH) for something
> similar so maybe a future change should do that here too.
> =

> Fixes: cfb24f6ebd38 ("pinctrl: Qualcomm SPMI PMIC MPP pin controller driv=
er")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
