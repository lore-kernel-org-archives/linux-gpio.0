From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 3/3] pinctrl: qcom: spmi-gpio: Fix pmic_gpio_config_get()
 to be compliant
Date: Thu, 30 Aug 2018 08:28:23 -0700
Message-ID: <CAD=FV=X1qK2ALKiorXe3SCYYijPsVPF57tUR+TdR3is3hLKGsQ@mail.gmail.com>
References: <20180702225939.109169-1-dianders@chromium.org>
 <20180702225939.109169-3-dianders@chromium.org> <153059814703.143105.275831530209187562@swboyd.mtv.corp.google.com>
 <CACRpkdY6zShFajBv=yhgxk7NRP8WBbM=m16fSiuL6xqsYdP6Dg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdY6zShFajBv=yhgxk7NRP8WBbM=m16fSiuL6xqsYdP6Dg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Stephen Boyd <swboyd@chromium.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, "Ivan T. Ivanov" <iivanov@mm-sol.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi,

On Mon, Jul 9, 2018 at 4:17 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Jul 3, 2018 at 8:09 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
>> > Fixes: eadff3024472 ("pinctrl: Qualcomm SPMI PMIC GPIO pin controller driver")
>> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>>
>> We should fix the ssbi-gpio/mpp and spmi-mpp drivers too. All those
>> drivers are designed on the same buggy original driver.
>
> Agreed. Looking forward to the patches :D

Well, it took a little while for me to get to it, but patches are
available at <http://lore.kernel.org/r/20180830152340.242249-1-dianders@chromium.org>.
I personally have no way to test them so I prefixed them with RFT.
Enjoy!

-Doug
