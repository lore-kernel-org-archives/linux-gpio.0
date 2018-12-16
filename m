From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: max7301: fix driver for use with CONFIG_VMAP_STACK
Date: Sun, 16 Dec 2018 01:14:55 +0100
Message-ID: <CACRpkdahnp42c1vT6JHLDVWerCqUH9ugSE4i9Xiu+y49xHE76g@mail.gmail.com>
References: <3f9179c9a1c8e2486cdd15d28530cd2e381a8830.1544152023.git.christophe.leroy@c-s.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3f9179c9a1c8e2486cdd15d28530cd2e381a8830.1544152023.git.christophe.leroy@c-s.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org list" <linuxppc-dev@lists.ozlabs.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, stable <stable@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Dec 7, 2018 at 2:07 PM Christophe Leroy <christophe.leroy@c-s.fr> wrote:

> spi_read() and spi_write() require DMA-safe memory. When
> CONFIG_VMAP_STACK is selected, those functions cannot be used
> with buffers on stack.
>
> This patch replaces calls to spi_read() and spi_write() by
> spi_write_then_read() which doesn't require DMA-safe buffers.
>
> Fixes: 0c36ec314735 ("gpio: gpio driver for max7301 SPI GPIO expander")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Patch applied for fixes.

Yours,
Linus Walleij
