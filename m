From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: pcf857x: Avoid calling irq_domain_cleanup twice
Date: Wed, 28 May 2014 09:20:22 +0200
Message-ID: <CACRpkdbXqvMN4RF2XbN23jeQjWDC-hj=uUdLUfd1fDu-9DgNFw@mail.gmail.com>
References: <1400824647-2525-1-git-send-email-george.cherian@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1400824647-2525-1-git-send-email-george.cherian@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: George Cherian <george.cherian@ti.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
List-Id: linux-gpio@vger.kernel.org

On Fri, May 23, 2014 at 7:57 AM, George Cherian <george.cherian@ti.com> wrote:

> Currently irq_domain_cleanup is called twice if irq_domain_init fails.
> This causes the following crash.

Patch applied with Alex' ACK.

NB: this driver should be switched to the gpiolib irqchip helpers to
avoid fixing spurious bugs like this.

Yours,
Linus Walleij
