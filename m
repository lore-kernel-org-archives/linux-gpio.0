From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH RESEND V3 1/2] pinctrl: fsl: add scu based pinctrl support
Date: Wed, 14 Nov 2018 16:26:51 -0800
Message-ID: <7hin0zgp84.fsf@eze.i-did-not-set--mail-host-address--so-tickle-me>
References: <1540908354-26809-1-git-send-email-aisheng.dong@nxp.com>
 <1540908354-26809-2-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1540908354-26809-2-git-send-email-aisheng.dong@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Cc: "A.s. Dong" <aisheng.dong@nxp.com>, "dongas86@gmail.com" <dongas86@gmail.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "stefan@agner.ch" <stefan@agner.ch>, Mark Brown <broonie@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Fabio Estevam <festevam@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

"A.s. Dong" <aisheng.dong@nxp.com> writes:

> Some i.MX SoCs (e.g. MX8QXP and MX8QM) contain a system controller
> that is responsible for controlling the pad setting of the IPs that
> are present. Communication between the host processor running an OS
> and the system controller happens through a SCU protocol.
>
> This patch classifies the pad settings into two categories: MMIO and SCU.
> For the original MMIO method, no functional changes except organize them
> into a few imx_*_mmio() functions. Besides that, we add the SCU based
> Pad Mux and Pinconf setting support which are implemented in pinctrl-scu.c.

kernelCI found boot failure caused by this patch.

imx6 started failing in kernelCI in next-20181114 on several wand
boards[1].  There was no kernel output, after uboot started the kernel.

Using the imx6q-wandboard, I bisected it down to this commit.

I verified that reverting this commit on top of next-20181114 fixes the
problem.

Kevin

[1]
https://kernelci.org/boot/all/job/next/branch/master/kernel/next-20181114/
