From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] ARM: pinctrl: stm32: Optimizes and enhances stm32gpio irqchip
Date: Thu, 1 Mar 2018 22:04:56 +0100
Message-ID: <CACRpkdbmmx7y3xJOOy0Dx62tMonkCgZeVzKYzr1B362QZe0fsA@mail.gmail.com>
References: <1519221027-4028-1-git-send-email-radoslaw.pietrzyk@gmail.com> <1519221027-4028-3-git-send-email-radoslaw.pietrzyk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1519221027-4028-3-git-send-email-radoslaw.pietrzyk@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Radoslaw Pietrzyk <radoslaw.pietrzyk@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Feb 21, 2018 at 2:50 PM, Radoslaw Pietrzyk
<radoslaw.pietrzyk@gmail.com> wrote:

>         - removes unneeded irq_chip.irq_eoi callback
>         - adds irq_chip.irq_set_wake callback for possible
>         in the future GPIO wakeup
>
> Signed-off-by: Radoslaw Pietrzyk <radoslaw.pietrzyk@gmail.com>

Patch applied with Alexandre's ACK, stripping ARM from the
commit message, thanks!

Yours,
Linus Walleij
