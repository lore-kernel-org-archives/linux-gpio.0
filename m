From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/7] gpio: brcmstb: allow all instances to be wakeup sources
Date: Sat, 7 Oct 2017 12:52:47 +0200
Message-ID: <CACRpkdaLBXeSJBMgXM2e5JhZWnLL4rq0Qt97AeRfTZ7V-_NLDA@mail.gmail.com>
References: <20170930034057.15166-1-opendmb@gmail.com> <20170930034057.15166-2-opendmb@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170930034057.15166-2-opendmb@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Berger <opendmb@gmail.com>
Cc: Gregory Fong <gregory.0xf0@gmail.com>, Brian Norris <computersforpeace@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Sat, Sep 30, 2017 at 5:40 AM, Doug Berger <opendmb@gmail.com> wrote:

> This commit allows a wakeup parent interrupt to be shared between
> instances.
>
> It also removes the redundant can_wake member of the private data
> structure by using whether the parent_wake_irq has been defined to
> indicate that the GPIO device can wake.
>
> Fixes: 19a7b6940b78 ("gpio: brcmstb: Add interrupt and wakeup source support")
> Signed-off-by: Doug Berger <opendmb@gmail.com>

Patch applied with Gregory's and Florian's ACKs.

Yours,
Linus Walleij
