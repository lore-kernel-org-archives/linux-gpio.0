From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] gpio: mxc: add power management support
Date: Tue, 17 Jul 2018 10:43:32 -0300
Message-ID: <CAOMZO5BrGdX3b9wcsA=3TkoGgh4H-fvghEqmhgovk-4uhYph7w@mail.gmail.com>
References: <1531208921-23342-1-git-send-email-Anson.Huang@nxp.com>
 <CAOMZO5BSt4jdLWmXjNmTDAegGwtRWjbMuVAwdrnRyHWvSBuU5A@mail.gmail.com>
 <AM3PR04MB131577674FDF0BC65BEF518EF55F0@AM3PR04MB1315.eurprd04.prod.outlook.com>
 <CAOMZO5DCsdwXK0eftcpwzT4my30HZLR7-H2c+V=ro+_fOMAWCw@mail.gmail.com> <AM3PR04MB13153EB5ADEBCD57A7122B61F55D0@AM3PR04MB1315.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AM3PR04MB13153EB5ADEBCD57A7122B61F55D0@AM3PR04MB1315.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: linux-gpio@vger.kernel.org

Hi Anson,

On Mon, Jul 16, 2018 at 3:14 AM, Anson Huang <anson.huang@nxp.com> wrote:

> OK, since i.MX7D has same GPIO type as i.MX35, to make it simple, I just added
> a flag to indicate whether it supports save/restore, only i.MX7D enables

In imx7s.dtsi the gpio nodes have:

compatible = "fsl,imx7d-gpio", "fsl,imx35-gpio";

If you add fsl,imx7d-gpio entry in the gpio driver, then the match
will be done against "fsl,imx7d-gpio" since it is more specific.

Then in the mx8 dts you can add:

compatible = "fsl,imx8m-gpio", "fsl,imx7d-gpio";

and it will also match the more generic "fsl,imx7d-gpio" compatible.

> the flag now, since other i.MX8 SoCs' dts is NOT upstreamed yet, so I did NOT add
> support for i.MX8 SoCs, please help review V2 patch, thanks.

I did not see the v2. Did you put me on Cc?
