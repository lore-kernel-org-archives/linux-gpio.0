From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: dwapb: Add wakeup source support
Date: Tue, 12 Sep 2017 11:47:52 +0200
Message-ID: <CACRpkdYPxiK4HdKYzGw5CCKvS-nsKn8c1iZsMs0Pb34vp0er1w@mail.gmail.com>
References: <1504910475-6682-1-git-send-email-hotran@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1504910475-6682-1-git-send-email-hotran@apm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hoan Tran <hotran@apm.com>, Xiaoguang Chen <xgchenshy@gmail.com>, Jisheng Zhang <jszhang@marvell.com>, Jamie Iles <jamie@jamieiles.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Loc Ho <lho@apm.com>, kdinh@apm.com
List-Id: linux-gpio@vger.kernel.org

On Sat, Sep 9, 2017 at 12:41 AM, Hoan Tran <hotran@apm.com> wrote:

> This patch supports irq_set_wake for dwapb gpio. It allows GPIOs
> to be configured as wakeup sources and wake the system from suspend.
>
> Signed-off-by: Hoan Tran <hotran@apm.com>

Seems very useful, patch applied for v4.15 (next).

This important, complex and versatile driver does not
have an active maintainer in MAINTAINERS.

Jamie, do you consider yourself maintainer? If not
would someone else using this driver please step up?

Yours,
Linus Walleij
