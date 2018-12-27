From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: freescale: Break dependency on SOC_IMX8MQ for i.MX8MQ
Date: Thu, 27 Dec 2018 10:40:19 +0100
Message-ID: <CACRpkdb6zubc0w+scQ7uaC9WmPLM3Y4kR70Lwb09A2nJ6hj1Cw@mail.gmail.com>
References: <1545548891-24671-1-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1545548891-24671-1-git-send-email-abel.vesa@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Abel Vesa <abel.vesa@nxp.com>
Cc: Stefan Agner <stefan.agner@toradex.com>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sun, Dec 23, 2018 at 8:08 AM Abel Vesa <abel.vesa@nxp.com> wrote:

> The CONFIG_SOC_IMX8MQ will go away, so the dependency can be based on
> ARCH_MXC && ARM64.
>
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>

Patch applied with Dong's and Fabio's ACKs.

Yours,
Linus Walleij
