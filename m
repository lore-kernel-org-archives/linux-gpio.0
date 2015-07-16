From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: zynq: Fix problem with unbalanced pm_runtime_enable
Date: Thu, 16 Jul 2015 13:01:24 +0200
Message-ID: <CACRpkdYZ8JMrjSknLGERU2Z-0HvKT-fBpC04QMBF-W+nfbxJeA@mail.gmail.com>
References: <b4b2bb2d7747f8c9223fb50fd2868f77a7c7f63a.1435220957.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b4b2bb2d7747f8c9223fb50fd2868f77a7c7f63a.1435220957.git.michal.simek@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michal Simek <monstr@monstr.eu>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robherring2@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Josh Cartwright <josh.cartwright@ni.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jun 25, 2015 at 10:29 AM, Michal Simek <michal.simek@xilinx.com> wrote:

> Add missing pm_runtime_disabled to remove().
>
> Error log:
> root@zynqmp:~# modprobe gpio_zynq
> root@zynqmp:~# lsmod
>     Not tainted
> gpio_zynq 7086 0 - Live 0xffffffbffc00a000
> root@zynqmp:~# rmmod gpio_zynq
> root@zynqmp:~# lsmod
>     Not tainted
> root@zynqmp:~# modprobe gpio_zynq
> [  246.924438] zynq-gpio ff0a0000.gpio: Unbalanced pm_runtime_enable!
> root@zynqmp:~# rmmod gpio_zynq
> root@zynqmp:~# lsmod
>     Not tainted
>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>

Patch applied with Alex' ACK.

Yours,
Linus Walleij
