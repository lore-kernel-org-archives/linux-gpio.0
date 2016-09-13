From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/6] gpio: constify gpio_chip structures
Date: Tue, 13 Sep 2016 10:35:49 +0200
Message-ID: <CACRpkdbA41W+8oA3S-1iMJ33+hSa0ng4Q-XHO3E6FA24KpUa6Q@mail.gmail.com>
References: <1473596082-32690-1-git-send-email-Julia.Lawall@lip6.fr> <1473596082-32690-2-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1473596082-32690-2-git-send-email-Julia.Lawall@lip6.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Alexandre Courbot <gnurou@gmail.com>, kernel-janitors@vger.kernel.org, Support Opensource <support.opensource@diasemi.com>, "open list:WOLFSON MICROELECTRONICS DRIVERS" <patches@opensource.wolfsonmicro.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Joachim Eastwood <manabian@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Ray Jui <rjui@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>
List-Id: linux-gpio@vger.kernel.org

On Sun, Sep 11, 2016 at 2:14 PM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:

> These structures are only used to copy into other structures, so declare
> them as const.
(...)
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Patch applied, awesome work as always, thanks!

Yours,
Linus Walleij
