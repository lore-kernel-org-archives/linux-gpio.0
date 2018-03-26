From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 6/7] gpio: gpio-mm: Implement get_multiple callback
Date: Mon, 26 Mar 2018 10:27:54 +0200
Message-ID: <CACRpkdaDWyjNA6DajVAuiOX+sad3mzEMfx7sUKTDMr9oOfDdKQ@mail.gmail.com>
References: <cover.1521723192.git.vilhelm.gray@gmail.com> <dca781eea9e47dafa3da9d450e2de54d11c62878.1521723192.git.vilhelm.gray@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <dca781eea9e47dafa3da9d450e2de54d11c62878.1521723192.git.vilhelm.gray@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Mar 22, 2018 at 2:00 PM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:

> The Diamond Systems GPIO-MM series of devices contain two 82C55A
> devices, which each feature three 8-bit ports of I/O. Since eight input
> lines are acquired on a single port input read, the GPIO-MM GPIO driver
> may improve multiple input reads by utilizing a get_multiple callback.
> This patch implements the gpiomm_gpio_get_multiple function which serves
> as the respective get_multiple callback.
>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>

Patch applied.

Yours,
Linus Walleij
