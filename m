From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: bcm2835: fix build warning in bcm2835_gpio_irq_handle_bank
Date: Thu, 21 Sep 2017 14:12:00 +0200
Message-ID: <CACRpkdYFL-NwxPSsyTxJqq=Yqi4S=JjjZWc1W80EuqmUcZ0tcw@mail.gmail.com>
References: <20170919190456.26522-1-clabbe.montjoie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170919190456.26522-1-clabbe.montjoie@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>, Stefan Wahren <stefan.wahren@i2se.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Sep 19, 2017 at 9:04 PM, Corentin Labbe
<clabbe.montjoie@gmail.com> wrote:

> This patch fix the following build warning:
> drivers/pinctrl/bcm/pinctrl-bcm2835.c:376:15: warning: variable 'type' set but not used [-Wunused-but-set-variable]
>
> Furthermore, it is unused for a long time, at least since commit 85ae9e512f43 ("pinctrl: bcm2835: switch to GPIOLIB_IRQCHIP")
> where a "FIXME no clue why the code looks up the type here" was added.
> A year after, nobody answeered this question, so its time to remove it.
>
> Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>

Patch applied with Stefan's ACK.

Yours,
Linus Walleij
