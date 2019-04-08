From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: freescale: use devm_platform_ioremap_resource()
 to simplify code
Date: Mon, 8 Apr 2019 13:41:58 +0200
Message-ID: <CACRpkdb9-G+Zc4xrZh4qHFv8kA7F2Wm8G46w_YPvPb2kUUPQ_Q@mail.gmail.com>
References: <1554094986-14897-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554094986-14897-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, "festevam@gmail.com" <festevam@gmail.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "stefan@agner.ch" <stefan@agner.ch>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: linux-gpio@vger.kernel.org

On Mon, Apr 1, 2019 at 7:07 AM Anson Huang <anson.huang@nxp.com> wrote:

> Use the new helper devm_platform_ioremap_resource() which wraps the
> platform_get_resource() and devm_ioremap_resource() together, to
> simplify the code.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Patch applied.

Yours,
Linus Walleij
