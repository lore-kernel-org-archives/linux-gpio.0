From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/2] gpio: hlwd: Add basic IRQ support
Date: Mon, 21 Jan 2019 14:34:18 +0100
Message-ID: <CACRpkdaK1KZUqNfxnpmZ4UD+rYjvcdK7LreGZwhbXfUxb9UWnA@mail.gmail.com>
References: <20190114191450.11597-1-j.neuschaefer@gmx.net> <20190114191450.11597-2-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190114191450.11597-2-j.neuschaefer@gmx.net>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jan 14, 2019 at 8:15 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:

> This patch implements level-triggered IRQs in the Hollywood GPIO driver.
> Edge triggered interrupts are not supported in this GPIO controller, so
> I moved their emulation into a separate patch.
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> ---
>
> v2:
> - Changed register addresses to io{read,write}32be() instead of
>   hlwd->gpioc.{read,write}_reg, as suggested by Linus Walleij.
> - Changed the IRQ chip's name from "GPIO" to dev_name(&pdev->dev), which
>   is "d8000c0.gpio" for the one GPIO controller in the Wii, but might
>   help tell the two GPIO controllers in the Wii U apart.
>   (also suggested by Linus Walleij)

Excellent work, patch applied!

Yours,
Linus Walleij
