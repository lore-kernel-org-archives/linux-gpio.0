From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH] gpio: mxc: add power management support
Date: Fri, 13 Jul 2018 09:19:37 +0200
Message-ID: <CAMRc=McQdbZbd3GDdgi6paKFUXSJTb_3nRG3npzMQs=FEwN2ew@mail.gmail.com>
References: <1531208921-23342-1-git-send-email-Anson.Huang@nxp.com> <CACRpkdaKQ_Lg=t3DLsvXQNLwi=BYugqNGyssEM9Hn2Ss5r-kQw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdaKQ_Lg=t3DLsvXQNLwi=BYugqNGyssEM9Hn2Ss5r-kQw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Anson Huang <Anson.Huang@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, NXP Linux Team <Linux-imx@nxp.com>
List-Id: linux-gpio@vger.kernel.org

2018-07-13 9:11 GMT+02:00 Linus Walleij <linus.walleij@linaro.org>:
> On Tue, Jul 10, 2018 at 9:53 AM Anson Huang <Anson.Huang@nxp.com> wrote:
>
>> GPIO registers could lose context on some i.MX SoCs,
>> like on i.MX7D, when enter LPSR mode, the whole SoC
>> will be powered off except LPSR domain, GPIO banks
>> will lose context in this case, need to restore
>> the context after resume from LPSR mode.
>>
>> This patch adds GPIO save/restore for those necessary
>> registers, and put the save/restore operations in noirq
>> suspend/resume phase, since GPIO is fundamental module
>> which could be used by other peripherals' resume phase.
>>
>> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
>
> Hoping for some review on this before applying...
> Fabio? Bartosz?
>
> Yours,
> Linus Walleij

I'm not familiar with these SoCs but the code looks good and clean to me.

Reviewed-by: Bartosz Golaszewski <brgl@bgdev.pl>
