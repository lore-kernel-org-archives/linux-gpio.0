From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH RESEND V3 1/2] pinctrl: fsl: add scu based pinctrl support
Date: Wed, 14 Nov 2018 22:32:59 -0200
Message-ID: <CAOMZO5DU6ATmJkXrDd7XJ2_xwjWOa+o1LOdCb_Y0DDdLJAB1nw@mail.gmail.com>
References: <1540908354-26809-1-git-send-email-aisheng.dong@nxp.com>
 <1540908354-26809-2-git-send-email-aisheng.dong@nxp.com>
 <7hin0zgp84.fsf@eze.i-did-not-set--mail-host-address--so-tickle-me>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <7hin0zgp84.fsf@eze.i-did-not-set--mail-host-address--so-tickle-me>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Dong Aisheng <dongas86@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Stefan Agner <stefan@agner.ch>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Mark Brown <broonie@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

Hi Kevin,

On Wed, Nov 14, 2018 at 10:26 PM Kevin Hilman <khilman@baylibre.com> wrote:

> kernelCI found boot failure caused by this patch.
>
> imx6 started failing in kernelCI in next-20181114 on several wand
> boards[1].  There was no kernel output, after uboot started the kernel.
>
> Using the imx6q-wandboard, I bisected it down to this commit.
>
> I verified that reverting this commit on top of next-20181114 fixes the
> problem.

Thanks for the report.

Dong has sent a fix for this issue:
https://www.spinics.net/lists/arm-kernel/msg686738.html
