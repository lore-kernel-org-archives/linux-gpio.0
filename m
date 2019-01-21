From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: pca953x: reduce indentation level in pca953x_irq_setup()
Date: Mon, 21 Jan 2019 14:05:13 +0100
Message-ID: <CACRpkdaN=kjgP7wgcOTfxuu_BM_ggADhKtesf4qEhx3aNhS4_Q@mail.gmail.com>
References: <20190116093158.2850-1-thomas.petazzoni@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190116093158.2850-1-thomas.petazzoni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Marek Vasut <marex@denx.de>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jan 16, 2019 at 10:32 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:

> The current design of pca953x_irq_setup() is:
>
>  if (all conditions to support IRQ are met) {
>    lots of code to support IRQs, which goes to a serious indentation
>    level.
>  }
>
>  return 0;
>
> It makes more sense to handle this like this:
>
>  if (!all conditions to support IRQ are met)
>    return 0;
>
>  handle IRQ support
>
> This commit does just this change, reducing by one tab the indentation
> level of the IRQ setup code. Thanks to this reduced indentation level,
> we are less restricted by the 80-column limit, and we can have more
> function arguments on the same line.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Patch applied.

Yours,
Linus Walleij
