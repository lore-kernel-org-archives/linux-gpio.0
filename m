From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: mxc: add check to return defer probe if clock tree
 NOT ready
Date: Mon, 25 Feb 2019 13:43:32 +0100
Message-ID: <CACRpkdYWB2FVN3YPZmvVnOexbmNsq-Oz59ps5RyNq3PWe6j38A@mail.gmail.com>
References: <1550891629-29004-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550891629-29004-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: linux-gpio@vger.kernel.org

On Sat, Feb 23, 2019 at 4:18 AM Anson Huang <anson.huang@nxp.com> wrote:

> On i.MX8MQ platform, clock driver uses platform driver
> model and it is probed after GPIO driver, so when GPIO
> driver fails to get clock, it should check the error type
> to decide whether to return defer probe or just ignore
> the clock operation.
>
> Fixes: 2808801aab8a ("gpio: mxc: add clock operation")
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Patch applied.

Yours,
Linus Walleij
