From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V2 1/1] pinctrl: imx8qxp: break the dependency on
 SOC_IMX8QXP
Date: Fri, 21 Dec 2018 11:23:41 +0100
Message-ID: <CACRpkdbAy=N=L7HJPjGaeWinJHQC9JFc3UNdC5Rn-dSb30=d5A@mail.gmail.com>
References: <1545060770-19191-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1545060770-19191-1-git-send-email-aisheng.dong@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Aisheng Dong <aisheng.dong@nxp.com>
Cc: "dongas86@gmail.com" <dongas86@gmail.com>, Fabio Estevam <festevam@gmail.com>, "stefan@agner.ch" <stefan@agner.ch>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Dec 17, 2018 at 4:38 PM Aisheng Dong <aisheng.dong@nxp.com> wrote:

> ARM64 SoC does not encourage people to add more finegrained SoC
> config options rather than a single ARCH_<family> in arch Kconfig.
> So this patch aims to break the dependency on SOC_IMX8QXP.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Acked-by: Shawn Guo <shawnguo@kernel.org>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
> v1->v2:
>  * do not mention the deletion of SOC_IMX8QXP as it's still not
>    hit mainline

Patch applied.

Yours,
Linus Walleij
