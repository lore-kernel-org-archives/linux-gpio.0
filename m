From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: gpio-reg: fix build
Date: Thu, 7 Dec 2017 09:56:14 +0100
Message-ID: <CACRpkdZZrwWd4dLHB5uygDZu4GcTqVNupqBsWWenCtmGYsOfng@mail.gmail.com>
References: <20171206173745.19853-1-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171206173745.19853-1-grygorii.strashko@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Russell King - ARM Linux <linux@armlinux.org.uk>
List-Id: linux-gpio@vger.kernel.org

On Wed, Dec 6, 2017 at 6:37 PM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> Revert changes introduced by commit f0fbe7bce733 ("gpio: Move irqdomain
> into struct gpio_irq_chip") as they are not aplicable to this driver.
>
> Cc: Russell King - ARM Linux <linux@armlinux.org.uk>
> Fixes: f0fbe7bce733 ("gpio: Move irqdomain into struct gpio_irq_chip")
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

Patch applied for fixes.

Yours,
Linus Walleij
