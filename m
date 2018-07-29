From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V3] gpio: mxc: add power management support
Date: Sun, 29 Jul 2018 22:24:32 +0200
Message-ID: <CACRpkda-syvCjO2U9pnZdHKnGSeDB738tcjKG31kevF=hKcKQg@mail.gmail.com>
References: <1531877132-14280-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1531877132-14280-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, NXP Linux Team <Linux-imx@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jul 18, 2018 at 3:30 AM Anson Huang <Anson.Huang@nxp.com> wrote:

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

Patch applied with Fabio's ACK!

Yours,
Linus Walleij
