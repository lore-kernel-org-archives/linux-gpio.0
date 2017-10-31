From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 4/7] gpio: brcmstb: switch to handle_level_irq flow
Date: Tue, 31 Oct 2017 10:30:20 +0100
Message-ID: <CACRpkdYFTi4qspSP_2YL6_GP5DSm5RvjyX9arx4pPy0mhG+Wkg@mail.gmail.com>
References: <20171024195451.30535-1-opendmb@gmail.com> <20171024195451.30535-5-opendmb@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171024195451.30535-5-opendmb@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Berger <opendmb@gmail.com>
Cc: Gregory Fong <gregory.0xf0@gmail.com>, Brian Norris <computersforpeace@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Oct 24, 2017 at 9:54 PM, Doug Berger <opendmb@gmail.com> wrote:

> Reading and writing the gpio bank status register each time a pending
> interrupt bit is serviced could cause new pending bits to be cleared
> without servicing the associated interrupts.
>
> By using the handle_level_irq flow instead of the handle_simple_irq
> flow we get proper handling of interrupt masking as well as acking
> of interrupts.  The irq_ack method is added to support this.
>
> Fixes: 19a7b6940b78 ("gpio: brcmstb: Add interrupt and wakeup source support")
> Signed-off-by: Doug Berger <opendmb@gmail.com>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> Acked-by: Gregory Fong <gregory.0xf0@gmail.com>

Patch applied.

Yours,
Linus Walleij
