From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] pinctrl: freescale: Break dependency on SOC_IMX8MQ for i.MX8MQ
Date: Wed, 26 Dec 2018 14:55:14 -0200
Message-ID: <CAOMZO5Be40EHVw63FKksy0s5DHMLbQLyRVgCxczgz_55tHJYMw@mail.gmail.com>
References: <1545548891-24671-1-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1545548891-24671-1-git-send-email-abel.vesa@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Abel Vesa <abel.vesa@nxp.com>
Cc: Stefan Agner <stefan.agner@toradex.com>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sun, Dec 23, 2018 at 2:38 PM Abel Vesa <abel.vesa@nxp.com> wrote:
>
> The CONFIG_SOC_IMX8MQ will go away, so the dependency can be based on
> ARCH_MXC && ARM64.
>
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
