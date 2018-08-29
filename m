From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: dwapb: Fix error handling in dwapb_gpio_probe()
Date: Wed, 29 Aug 2018 14:04:30 +0200
Message-ID: <CACRpkdZuA0S7CmHu07mHz545QfDsvN62VeoPcmEwpYGuCWu1WQ@mail.gmail.com>
References: <1535488826-30200-1-git-send-email-khoroshilov@ispras.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1535488826-30200-1-git-send-email-khoroshilov@ispras.ru>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexey Khoroshilov <khoroshilov@ispras.ru>
Cc: Hoan Tran <hotran@apm.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, ldv-project@linuxtesting.org
List-Id: linux-gpio@vger.kernel.org

On Tue, Aug 28, 2018 at 10:43 PM Alexey Khoroshilov
<khoroshilov@ispras.ru> wrote:

> If dwapb_gpio_add_port() fails in dwapb_gpio_probe(),
> gpio->clk is left undisabled.
>
> Found by Linux Driver Verification project (linuxtesting.org).
>
> Signed-off-by: Alexey Khoroshilov <khoroshilov@ispras.ru>

Patch applied for fixes.

Yours,
Linus Walleij
