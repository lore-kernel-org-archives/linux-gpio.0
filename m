From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: qcom: fix 'const' pointer handling
Date: Wed, 3 Oct 2018 09:12:58 +0200
Message-ID: <CACRpkdZ_+v1rqYP=Z1tdY-YSeLJ3UYbJWJKa_+4PZXKxdLWieQ@mail.gmail.com>
References: <20181002211555.2779637-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181002211555.2779637-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Oct 2, 2018 at 11:15 PM Arnd Bergmann <arnd@arndb.de> wrote:

> The 'tiles' array is initialized to a constant pointers to constant
> strings, but the declaration is only half as constant:
>
> drivers/pinctrl/qcom/pinctrl-qcs404.c:1660:11: error: initialization discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
> drivers/pinctrl/qcom/pinctrl-sdm660.c:1417:11: error: initialization discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
>
> Let's make it more constant.
>
> Fixes: 22eb8301dbc1 ("pinctrl: qcom: Add qcs404 pinctrl driver")
> Fixes: a46d5e98190d ("pinctrl: qcom: Support dispersed tiles")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied with Bjorn's ACK.

Yours,
Linus Walleij
