From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH V3] gpio: mxc: add power management support
Date: Tue, 17 Jul 2018 22:34:46 -0300
Message-ID: <CAOMZO5By77kWa_yjuuzi_0=9F0VCiuAP1bxOV__74g7nmq=XVQ@mail.gmail.com>
References: <1531877132-14280-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1531877132-14280-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, NXP Linux Team <Linux-imx@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>
List-Id: linux-gpio@vger.kernel.org

Hi Anson,

On Tue, Jul 17, 2018 at 10:25 PM, Anson Huang <Anson.Huang@nxp.com> wrote:
> GPIO registers could lose context on i.MX7D, when
> enter LPSR mode, the whole SoC will be powered off
> except LPSR domain, GPIO banks will lose context
> in this case, need to restore the context after
> resume from LPSR mode.
>
> This patch adds new compatible string for i.MX7D
> which supports GPIO power off feature in suspend,
> and adds the GPIO save/restore operations in noirq
> suspend/resume phase, since GPIO is fundamental
> module which could be used by other peripherals'
> resume phase.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Looks good for me, thanks:

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
