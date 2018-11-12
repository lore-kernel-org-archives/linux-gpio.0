From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [PATCH 1/1] pinctrl: imx: fix NO_PAD_CTL setting for MMIO pads
Date: Mon, 12 Nov 2018 17:20:00 +0000
Message-ID: <a4683f6e901225d3125be8dd15c8857ac02ac79f.camel@nxp.com>
References: <1542036051-23840-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1542036051-23840-1-git-send-email-aisheng.dong@nxp.com>
Content-Language: en-US
Content-ID: <0E7F3AF05DBE224DB2C0F89B52D13922@eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "A.s. Dong" <aisheng.dong@nxp.com>
Cc: "dongas86@gmail.com" <dongas86@gmail.com>, "martin@kaiser.cx" <martin@kaiser.cx>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "stefan@agner.ch" <stefan@agner.ch>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, 2018-11-12 at 15:25 +0000, A.s. Dong wrote:
> After patch b96eea718bf6 ("pinctrl: fsl: add scu based pinctrl support"),
> NO_PAD_CTL pads map are not skipped anymore which results in
> a possible memory corruption. As we actually only need to create config
> maps for SCU pads and MMIO pads which are not using the default config
> (a.k.a IMX_NO_PAD_CTL), so let's add a proper check before creating
> the config maps. And during MMIO pads parsing, we also need update the
> list_p point as SCU case to ensure the pin data next parsed is correct.
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Fixes: b96eea718bf6 ("pinctrl: fsl: add scu based pinctrl support")
> Reported-by: Martin Kaiser <martin@kaiser.cx>
> Suggested-by: Leonard Crestez <leonard.crestez@nxp.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

Tested-by: Leonard Crestez <leonard.crestez@nxp.com>
