From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RESEND V3 1/2] pinctrl: fsl: add scu based pinctrl support
Date: Wed, 31 Oct 2018 12:00:29 +0100
Message-ID: <CACRpkdarOd+e6eXGUh2Je31GP53TQaCUumxuz9zx_C8JU7NhmA@mail.gmail.com>
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
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: Dong Aisheng <dongas86@gmail.com>, Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Oct 30, 2018 at 3:10 PM A.s. Dong <aisheng.dong@nxp.com> wrote:

> Some i.MX SoCs (e.g. MX8QXP and MX8QM) contain a system controller
> that is responsible for controlling the pad setting of the IPs that
> are present. Communication between the host processor running an OS
> and the system controller happens through a SCU protocol.
>
> This patch classifies the pad settings into two categories: MMIO and SCU.
> For the original MMIO method, no functional changes except organize them
> into a few imx_*_mmio() functions. Besides that, we add the SCU based
> Pad Mux and Pinconf setting support which are implemented in pinctrl-scu.c.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

Patch applied!

Yours,
Linus Walleij
