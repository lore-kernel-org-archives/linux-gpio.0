From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: rename gpio_lock_as_irq to gpiochip_lock_as_irq
Date: Tue, 28 Oct 2014 17:32:14 +0100
Message-ID: <CACRpkdbFYi3O7ONeo-Z1iA_ZkL-YSekL7hDz9Dj1eHdKe5y8Tg@mail.gmail.com>
References: <1414052827-21942-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1414052827-21942-1-git-send-email-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Thu, Oct 23, 2014 at 10:27 AM, Alexandre Courbot <acourbot@nvidia.com> wrote:

> This function actually operates on a gpio_chip, so its prefix should
> reflect that fact for consistency with other functions defined in
> gpio/driver.h.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> Just a consistency change ; hopefully we can slip this under the GPIO
> tree without getting acked-bys from each subsystem.

OK patch applied, hope I don't get too much breakage from new
drivers using the call. Maybe I'll have to apply the patch to
both the GPIO and pin control subsystem :-P

Yours,
Linus Walleij
