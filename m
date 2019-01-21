From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/2] gpio: hlwd: Implement edge trigger emulation
Date: Mon, 21 Jan 2019 14:35:16 +0100
Message-ID: <CACRpkdajHGy2rhTvgOfq76SYhVe1L5cYmznq-s0kVYcmzdqe0Q@mail.gmail.com>
References: <20190114191450.11597-1-j.neuschaefer@gmx.net> <20190114191450.11597-3-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190114191450.11597-3-j.neuschaefer@gmx.net>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jan 14, 2019 at 8:15 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:

> Like the Spreadtrum EIC driver[1], this driver needs to emulate edge
> triggered interrupts to support the generic gpio-keys driver.
>
> [1]: https://www.spinics.net/lists/kernel/msg2764576.html
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> ---
>
> v2:
> - Changed register addresses to io{read,write}32be() instead of
>   hlwd->gpioc.{read,write}_reg, as suggested by Linus Walleij.

Patch applied!

Yours,
Linus Walleij
