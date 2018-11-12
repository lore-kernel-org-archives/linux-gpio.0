From: Martin Kaiser <martin@kaiser.cx>
Subject: Re: [PATCH 1/1] pinctrl: imx: fix NO_PAD_CTL setting for MMIO pads
Date: Mon, 12 Nov 2018 16:47:55 +0100
Message-ID: <20181112154755.msekhs5xg5ylopkz@viti.kaiser.cx>
References: <1542036051-23840-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1542036051-23840-1-git-send-email-aisheng.dong@nxp.com>
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
Cc: "dongas86@gmail.com" <dongas86@gmail.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "stefan@agner.ch" <stefan@agner.ch>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Leonard Crestez <leonard.crestez@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

Hi Dong,

your patch looks good to me.

Thus wrote A.s. Dong (aisheng.dong@nxp.com):

> After patch b96eea718bf6 ("pinctrl: fsl: add scu based pinctrl support"),
> NO_PAD_CTL pads map are not skipped anymore which results in
> a possible memory corruption. As we actually only need to create config
> maps for SCU pads and MMIO pads which are not using the default config
> (a.k.a IMX_NO_PAD_CTL), so let's add a proper check before creating
> the config maps. And during MMIO pads parsing, we also need update the
> list_p point as SCU case to ensure the pin data next parsed is correct.

> Cc: Linus Walleij <linus.walleij@linaro.org>
> Fixes: b96eea718bf6 ("pinctrl: fsl: add scu based pinctrl support")
> Reported-by: Martin Kaiser <martin@kaiser.cx>
> Suggested-by: Leonard Crestez <leonard.crestez@nxp.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

Reviewed-by: Martin Kaiser <martin@kaiser.cx>
