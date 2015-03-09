From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: at91: move lock/unlock_as_irq calls into
 request/release resources methods
Date: Mon, 9 Mar 2015 17:14:39 +0100
Message-ID: <CACRpkdazTt+_9m-iWEee2gJy4MQ+QNo3Rb2JY9hVSSXK2-dJRw@mail.gmail.com>
References: <1423419822-6258-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1423419822-6258-1-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jean-Jacques Hiblot <jjhiblot@traphandler.com>
List-Id: linux-gpio@vger.kernel.org

On Sun, Feb 8, 2015 at 7:23 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:

> The gpiochip_lock_as_irq call can fail and return an error, while the
> irq_startup is not expected to fail (returns an unsigned int which is not
> checked by irq core code).
>
> irq_request/release_resources functions have been created to address this
> problem.
>
> Move gpiochip_lock/unlock_as_irq calls into
> irq_request/release_resources functions to prevent using a gpio as an irq
> if the gpiochip_lock_as_irq call failed.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Patch applied with all the ACKs.

Happy new year J-C!

Yours,
Linus Walleij
