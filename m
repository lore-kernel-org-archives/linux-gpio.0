From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: mpc8xxx: Correct irq handler function
Date: Mon, 24 Oct 2016 02:22:54 +0200
Message-ID: <CACRpkdbRdfybOPX6WNjH9R90Z1vJE9L0dRDg8HTSvF4kAapdbg@mail.gmail.com>
References: <1477035088-20587-1-git-send-email-Gang.Liu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1477035088-20587-1-git-send-email-Gang.Liu@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liu Gang <Gang.Liu@nxp.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, mingkai.hu@nxp.com, leoyang.li@nxp.com
List-Id: linux-gpio@vger.kernel.org

On Fri, Oct 21, 2016 at 9:31 AM, Liu Gang <Gang.Liu@nxp.com> wrote:

> From the beginning of the gpio-mpc8xxx.c, the "handle_level_irq"
> has being used to handle GPIO interrupts in the PowerPC/Layerscape
> platforms. But actually, almost all PowerPC/Layerscape platforms
> assert an interrupt request upon either a high-to-low change or
> any change on the state of the signal.
>
> So the "handle_level_irq" is not reasonable for PowerPC/Layerscape
> GPIO interrupt, it should be "handle_edge_irq". Otherwise the system
> may lost some interrupts from the PIN's state changes.
>
> Signed-off-by: Liu Gang <Gang.Liu@nxp.com>

Yes and especially so since this irqchip implements .irq_ack() and
unless you use the edge handler it will never be called.

Patch applied for fixes, tell me if it also needs to go into stable.

If you want to look closer at this driver, I think it is possible to
simplify it quite a bit by using GPIOLIB_IRQCHIP like a few
other drivers, for example gpio-pl061.c. Patches accepted :)

Yours,
Linus Walleij
