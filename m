From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: msic: fix error return code in platform_msic_gpio_probe()
Date: Mon, 7 Aug 2017 14:58:26 +0200
Message-ID: <CACRpkdZD7=AGavGaizM+Su=299mv=7vZpJ5UEyV+OV6REv7DHA@mail.gmail.com>
References: <20170803220001.GA7282@embeddedgus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170803220001.GA7282@embeddedgus>
Sender: linux-kernel-owner@vger.kernel.org
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Aug 4, 2017 at 12:00 AM, Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:

> platform_get_irq() returns an error code, but the gpio-msic driver
> ignores it and always returns -EINVAL. This is not correct, and
> prevents -EPROBE_DEFER from being propagated properly.
>
> Notice that platform_get_irq() no longer returns 0 on error:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e330b9a6bb35dc7097a4f02cb1ae7b6f96df92af
>
> Print and propagate the return value of platform_get_irq on failure.
>
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Patch applied.

Yours,
Linus Walleij
