From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pl061: add support for wakeup configuration
Date: Mon, 14 Dec 2015 15:02:02 +0100
Message-ID: <CACRpkdbmSXiOtubuUX0tGs_3-j9+jje+U5TkyJcMRgMSzykuSw@mail.gmail.com>
References: <1448644755-29183-1-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1448644755-29183-1-git-send-email-sudeep.holla@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Fri, Nov 27, 2015 at 6:19 PM, Sudeep Holla <sudeep.holla@arm.com> wrote:

> The PL061 supports interrupts and those can be wakeup interrupts. We
> need to provide support for configuring those interrupts as wakeup
> sources.
>
> This patch adds irq_set_wake callback for PL061 so that GPIO interrupts
> can be configured as wakeup.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>

Patch applied, since I can't think of anything better.

Yours,
Linus Walleij
