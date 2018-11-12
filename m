From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] pinctrl: imx: make sure that maps are fully initialized
Date: Mon, 12 Nov 2018 13:09:26 -0200
Message-ID: <CAOMZO5DbuuVr7JVpK+DCsE4G=tksTg6CRrCGwyaNO55WDuyRzw@mail.gmail.com>
References: <1541871439-4882-1-git-send-email-martin@kaiser.cx> <AM0PR04MB4211FE365D78EDEB0003D74380C10@AM0PR04MB4211.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AM0PR04MB4211FE365D78EDEB0003D74380C10@AM0PR04MB4211.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: Martin Kaiser <martin@kaiser.cx>, Shawn Guo <shawnguo@kernel.org>, Stefan Agner <stefan@agner.ch>, Sascha Hauer <kernel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Leonard Crestez <leonard.crestez@nxp.com>
List-Id: linux-gpio@vger.kernel.org

Hi Dong,

On Mon, Nov 12, 2018 at 1:04 PM A.s. Dong <aisheng.dong@nxp.com> wrote:

> Thanks for reporting this issue.
> The original code intended to save 3 common lines for both SCU and MMIO pads,
> but it did change the code logic a bit which resulted in a regression specificly
> for NO_PAD_CTL cases used on a few legacy boards. (NO_PAD_CTL is deprecated
> for new boards dts).

Just a clarification: NO_PAD_CTL is not deprecated.

It is not recommended for new dts as we should not rely on the
bootloader pinctrl settings.

> As you both had a patch, i'm not sure who i'm going to expect for a updated one,
> so I would send it my own with both of your tags.

Yes, please send a patch putting a Reported-by tag from Martin and a
Suggested-by tag from Leonard.

Thanks
