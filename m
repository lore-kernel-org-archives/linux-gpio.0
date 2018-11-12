From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [PATCH] pinctrl: imx: Fix imx_dt_node_to_map handling of
 IMX_NO_PAD_CTL
Date: Mon, 12 Nov 2018 00:46:43 +0000
Message-ID: <AM0PR04MB4290A84F40154F18858D00C0EEC10@AM0PR04MB4290.eurprd04.prod.outlook.com>
References: <1547d44dba63cbfd1b813018866f8916013b3381.1541973902.git.leonard.crestez@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>, Fabio Estevam <fabio.estevam@nxp.com>, "A.s. Dong" <aisheng.dong@nxp.com>, Martin Kaiser <martin@kaiser.cx>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>
List-Id: linux-gpio@vger.kernel.org

On 11/12/2018 12:15 AM, Leonard Crestez wrote:
> After changes for SCU support the IMX_NO_PAD_CTL flag is not longer
> handled correctly in imx_dt_node_to_map. Pins with this flag are no
> longer skipped and the new_map array can overflow and corrupt memory.
> 
> This fixes imx6-sabreauto boards failing to boot.

On a second look this is not sufficient; this just prevents a crash but 
network boot is not successful. After some investigation it seems that 
pin parsing also got broken. Here's a possible fix:

diff --git drivers/pinctrl/freescale/pinctrl-imx.c 
drivers/pinctrl/freescale/pinctrl-imx.c
index 51312e81eff7..2005d31601f9 100644
--- drivers/pinctrl/freescale/pinctrl-imx.c
+++ drivers/pinctrl/freescale/pinctrl-imx.c
@@ -551,10 +551,11 @@ static void imx_pinctrl_parse_pin_mmio(struct 
imx_pinctrl *ipctl,
                 pin_mmio->config = config & ~IMX_PAD_SION;
         }

         dev_dbg(ipctl->dev, "%s: 0x%x 0x%08lx", info->pins[*pin_id].name,
                              pin_mmio->mux_mode, pin_mmio->config);
+       *list_p = list;
  }

  static int imx_pinctrl_parse_groups(struct device_node *np,
                                     struct group_desc *grp,
                                     struct imx_pinctrl *ipctl
It needs a bit more testing.
