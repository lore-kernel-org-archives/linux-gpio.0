From: "A.s. Dong" <aisheng.dong@nxp.com>
Subject: RE: [PATCH V2 4/8] gpio: vf610: add optional clock support
Date: Tue, 23 Oct 2018 12:23:12 +0000
Message-ID: <AM0PR04MB42119A454DD2F53590BCE7FF80F50@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1540295058-26090-1-git-send-email-aisheng.dong@nxp.com>
 <1540295058-26090-5-git-send-email-aisheng.dong@nxp.com>
 <20181023120401.GO30658@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181023120401.GO30658@n2100.armlinux.org.uk>
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
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: "dongas86@gmail.com" <dongas86@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Stefan Agner <stefan@agner.ch>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

Hi Russell,

> -----Original Message-----
> From: Russell King - ARM Linux [mailto:linux@armlinux.org.uk]
> Sent: Tuesday, October 23, 2018 8:04 PM
[...]
> On Tue, Oct 23, 2018 at 11:49:17AM +0000, A.s. Dong wrote:
> > +	clk_gpio = devm_clk_get(&pdev->dev, "gpio");
> > +	clk_port = devm_clk_get(&pdev->dev, "port");
> > +	if ((PTR_ERR(clk_gpio) == -EPROBE_DEFER) ||
> > +	    (PTR_ERR(clk_port) == -EPROBE_DEFER)) {
> 
> 	if (clk_gpio == ERR_PTR(-EPROBE_DEFER) ||
> 	    clk_port == ERR_PTR(-EPROBE_DEFER)) {
> 

Thanks for the suggestion. I will update it in next series.
Before that, let's wait a moment to see if any more review comments.

BTW, as I see kernel currently is widely using PTR_ERR(ptr) to compare
-EPROBE_DEFER, I'm not quite get the point why the new approach
you suggested is better, is it less error-prone? Or something else?
would you please help clarify a bit more?

Regards
Dong Aisheng

> --
> RMK's Patch system:
> https://emea01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fwww.
> armlinux.org.uk%2Fdeveloper%2Fpatches%2F&amp;data=02%7C01%7Caishen
> g.dong%40nxp.com%7C34fcfce2f5d042efd0b808d638dfaaed%7C686ea1d3bc
> 2b4c6fa92cd99c5c301635%7C0%7C0%7C636758930627945785&amp;sdata=
> PME05RkmX0mxRmhO%2Bj%2FofV3VN2VMx3FWU9bbqFr3XAg%3D&amp;res
> erved=0
> FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps
> up According to speedtest.net: 11.9Mbps down 500kbps up
