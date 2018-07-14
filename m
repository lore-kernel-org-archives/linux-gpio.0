From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] gpio: mxc: add power management support
Date: Sat, 14 Jul 2018 13:13:02 -0300
Message-ID: <CAOMZO5DCsdwXK0eftcpwzT4my30HZLR7-H2c+V=ro+_fOMAWCw@mail.gmail.com>
References: <1531208921-23342-1-git-send-email-Anson.Huang@nxp.com>
 <CAOMZO5BSt4jdLWmXjNmTDAegGwtRWjbMuVAwdrnRyHWvSBuU5A@mail.gmail.com> <AM3PR04MB131577674FDF0BC65BEF518EF55F0@AM3PR04MB1315.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AM3PR04MB131577674FDF0BC65BEF518EF55F0@AM3PR04MB1315.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: linux-gpio@vger.kernel.org

Hi Anson,

On Fri, Jul 13, 2018 at 10:53 PM, Anson Huang <anson.huang@nxp.com> wrote:

> Here are the details, i.MX7D LPSR mode and i.MX8QM/8QXP etc.' suspend/resume
> may cause GPIO bank lose power, so need to save/restore, for other i.MX SoCs,
> although no need to do save/restore, but doing it is NOT harmful, so do you think
> we should add SoC type check here?

I think it would be safer to restrict the save/restore operations to mx7/mx8.

You can add a fsl,imx7d-gpio compatible entry in the driver.

Thanks
