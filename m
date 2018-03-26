From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 1/7] gpio: 104-idio-16: Implement get_multiple callback
Date: Mon, 26 Mar 2018 10:10:43 +0200
Message-ID: <CACRpkdbkX8iW0T1cDKmiMK=zXtQ=DULx7-KW5_jAwWZszS+coQ@mail.gmail.com>
References: <cover.1521723192.git.vilhelm.gray@gmail.com> <1699105253cb33680bb27ca61e6fc9fb0bd2aaf8.1521723192.git.vilhelm.gray@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1699105253cb33680bb27ca61e6fc9fb0bd2aaf8.1521723192.git.vilhelm.gray@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Mar 22, 2018 at 1:59 PM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:

> The ACCES I/O 104-IDIO-16 series of devices provides 16
> optically-isolated digital inputs accessed via two 8-bit ports. Since
> eight input lines are acquired on a single port input read, the
> 104-IDIO-16 GPIO driver may improve multiple input reads by utilizing a
> get_multiple callback. This patch implements the
> idio_16_gpio_get_multiple function which serves as the respective
> get_multiple callback.
>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>

Patch applied.

Yours,
Linus Walleij
