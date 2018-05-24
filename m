From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: mxc: add clock operation
Date: Thu, 24 May 2018 10:12:31 +0200
Message-ID: <CACRpkdbYDqnroi-X7ECdcoeuALEgwB0afZZszap97D_AF725Hg@mail.gmail.com>
References: <1526897190-28714-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1526897190-28714-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: NXP Linux Team <Linux-imx@nxp.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, May 21, 2018 at 12:06 PM, Anson Huang <Anson.Huang@nxp.com> wrote:

> i.MX6SLL has GPIO clock gates in CCM CCGR, need
> to enable them before accessing registers, add
> optional clock operation for GPIO driver.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Some warnings from the build robot, seem like a missing
#include <linux/clk.h> or something.

Yours,
Linus Walleij
