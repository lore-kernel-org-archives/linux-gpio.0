From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 3/7] gpio: pcie-idio-24: Implement get_multiple/set_multiple
 callbacks
Date: Mon, 26 Mar 2018 10:25:54 +0200
Message-ID: <CACRpkdYtxbX3iW4hx7=xDvY7jWSue894mLvUDA9zHrB-8zufew@mail.gmail.com>
References: <cover.1521723192.git.vilhelm.gray@gmail.com> <bd4594307521c93f952db774da466a54c434704a.1521723192.git.vilhelm.gray@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <bd4594307521c93f952db774da466a54c434704a.1521723192.git.vilhelm.gray@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Mar 22, 2018 at 2:00 PM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:

> The ACCES I/O PCIe-IDIO-24 series of devices provides 24
> optically-isolated digital I/O accessed via six 8-bit ports. Since eight
> input lines are acquired on a single port input read -- and similarly
> eight output lines are set on a single port output write -- the
> PCIe-IDIO-24 GPIO driver may improve multiple I/O reads/writes by
> utilizing a get_multiple/set_multiple callbacks. This patch implements
> the idio_24_gpio_get_multiple function which serves as the respective
> get_multiple callback, and implements the idio_24_gpio_set_multiple
> function which serves as the respective set_multiple callback.
>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>

Patch applied.

Yours,
Linus Walleij
