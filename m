From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next 3/3] qcom: ssbi-gpio: correct boundary conditions in pm8xxx_domain_translate
Date: Thu, 14 Feb 2019 09:18:26 +0100
Message-ID: <CACRpkdYSMjyQ07TKaeoC1WbWk=6WomJOkd0Hm_8ho_yDqj6wQA@mail.gmail.com>
References: <20190214013641.9740-1-masneyb@onstation.org> <20190214013641.9740-3-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190214013641.9740-3-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee.jones@linaro.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Feb 14, 2019 at 2:36 AM Brian Masney <masneyb@onstation.org> wrote:

> SSBI GPIOs are numbered 1..ngpio, so the boundary check in
> pm8xxx_domain_translate() is off by one. This patch corrects that check.
>
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---
> Originally found by Bjorn Andersson in spmi-gpio.
>
> Linus: For your ib-qcom-ssbi branch.

Thanks applied it there!

This small bug stuff is sorting itself out nicely :)
Less stuff to deal with in the -rc phase.

Yours,
Linus Walleij
