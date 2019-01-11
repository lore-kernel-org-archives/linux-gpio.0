From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/8] gpio: zynq: Wakeup gpio controller when it is used as
 IRQ controller
Date: Fri, 11 Jan 2019 10:54:20 +0100
Message-ID: <CACRpkdafBpC14TxBNVN2AemkBz-yKkXkKfNpdgkYKQX3qFemag@mail.gmail.com>
References: <cover.1502103715.git.michal.simek@xilinx.com> <72d3cd83bed792a23ab60cf9b6d51b618f5aa084.1502103715.git.michal.simek@xilinx.com>
 <CACRpkdZE-Edr7fWZY5VQM1_65iw7MYGP-iDa2ExZsPxpM0rurQ@mail.gmail.com>
 <6da5fd79-fbc8-b613-954f-dcbe2ef8d6c5@xilinx.com> <20190107164210.3ecf37e8@windsurf>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190107164210.3ecf37e8@windsurf>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Michal Simek <michal.simek@xilinx.com>, Nava kishore Manne <navam@xilinx.com>, Josh Cartwright <josh.cartwright@ni.com>, "monstr@monstr.eu" <monstr@monstr.eu>, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, Borsodi Petr <Petr.Borsodi@i.cz>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robherring2@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, Shubhrajyoti Datta <shubhraj@xilinx.com>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jan 7, 2019 at 4:42 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:

> This patch almost solves the problem. It doesn't work as-is, because it
> assumes that runtime PM is used by all GPIO controllers, which is not
> the case. When runtime PM is not enabled, pm_runtime_get_sync() fails
> with -EACCES, and the whole gpiochip_irq_reqres() function aborts.
(...)
> However, I must say that from a design perspective, I am not a big fan
> of this solution. Indeed for the normal GPIO ->request() and ->free()
> hooks, it is currently the GPIO driver itself that is responsible for
> runtime PM get/put, so it would be weird to have the runtime PM get/put
> for the IRQ request/free be done by the GPIO core.
>
> I believe that either the GPIO core should be in charge of the entire
> runtime PM interaction, or it should entirely be the responsibility of
> each GPIO controller driver. Having a mixed solution seems very
> confusing.

My stance is that the driver is responsible of enabling and managing
runtime PM for its hardware block(s).

Runtime PM in the core should only be added if the core needs to
be aware about it, such as is the case when e.g. a block device
needs to drain its write buffer before going to runtime sleep.

I fail so see why the GPIO core need to be aware about this.

Yours,
Linus Walleij
