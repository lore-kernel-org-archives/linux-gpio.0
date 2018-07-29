From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: ml-ioh: Fix buffer underwrite on probe error path
Date: Sun, 29 Jul 2018 23:13:42 +0200
Message-ID: <CACRpkdZ1RuSOFh8_w0Ds4sC2rpJhVEEtuo=SzVxFLk4OggM7_A@mail.gmail.com>
References: <20180723165330.25213-1-vasilyev@ispras.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180723165330.25213-1-vasilyev@ispras.ru>
Sender: linux-kernel-owner@vger.kernel.org
To: vasilyev@ispras.ru
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, ldv-project@linuxtesting.org
List-Id: linux-gpio@vger.kernel.org

On Mon, Jul 23, 2018 at 6:54 PM Anton Vasilyev <vasilyev@ispras.ru> wrote:

> If ioh_gpio_probe() fails on devm_irq_alloc_descs() then chip may point
> to any element of chip_save array, so reverse iteration from pointer chip
> may become chip_save[-1] and gpiochip_remove() will operate with wrong
> memory.
>
> The patch fix the error path of ioh_gpio_probe() to correctly bypass
> chip_save array.
>
> Found by Linux Driver Verification project (linuxtesting.org).
>
> Signed-off-by: Anton Vasilyev <vasilyev@ispras.ru>

Patch applied, nice work!

Yours,
Linus Walleij
