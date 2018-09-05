From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFT PATCH 0/2] pinctrl: Fix two more xxx_config_get() functions
 to be compliant
Date: Wed, 5 Sep 2018 12:12:15 +0200
Message-ID: <CACRpkdbW7NGwT=kjoo5ZEKBivg9wYSmitJVZwHz_2J24OEdfoA@mail.gmail.com>
References: <20180830152340.242249-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180830152340.242249-1-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, "Ivan T. Ivanov" <iivanov@mm-sol.com>, Stephen Boyd <swboyd@chromium.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Thu, Aug 30, 2018 at 5:24 PM Douglas Anderson <dianders@chromium.org> wrote:

> I have no way to test the patches in this series, but Stephen Boyd
> pointed out the problems being fixed here when he reviewed my patch
> ("pinctrl: qcom: spmi-gpio: Fix pmic_gpio_config_get() to be
> compliant").  It seemed nice to (finally) follow-up and address the
> problems that Stephen found.  Hopefully someone can test them out and
> make sure they work as advertised.

Both patches applied with the review tags.

If people don't test RFT patches, then maybe they will test
linux-next.

So applied to devel for now.

Yours,
Linus Walleij
