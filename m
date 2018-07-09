From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] pinctrl: qcom: spmi-gpio: Fix pmic_gpio_config_get()
 to be compliant
Date: Mon, 9 Jul 2018 13:17:48 +0200
Message-ID: <CACRpkdY6zShFajBv=yhgxk7NRP8WBbM=m16fSiuL6xqsYdP6Dg@mail.gmail.com>
References: <20180702225939.109169-1-dianders@chromium.org>
 <20180702225939.109169-3-dianders@chromium.org> <153059814703.143105.275831530209187562@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <153059814703.143105.275831530209187562@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Doug Anderson <dianders@chromium.org>, "Ivan T. Ivanov" <iivanov@mm-sol.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Tue, Jul 3, 2018 at 8:09 AM Stephen Boyd <swboyd@chromium.org> wrote:

> > Fixes: eadff3024472 ("pinctrl: Qualcomm SPMI PMIC GPIO pin controller driver")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> We should fix the ssbi-gpio/mpp and spmi-mpp drivers too. All those
> drivers are designed on the same buggy original driver.

Agreed. Looking forward to the patches :D

Yours,
Linus Walleij
