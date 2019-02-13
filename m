From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: sprd: Add missing break in switch statement
Date: Wed, 13 Feb 2019 10:40:36 +0100
Message-ID: <CACRpkdYov_jBDZd_sQ98cZbMAOe671NdnF0-VnNGcK0+A6c71A@mail.gmail.com>
References: <20190211185001.GA19472@embeddedor>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190211185001.GA19472@embeddedor>
Sender: linux-kernel-owner@vger.kernel.org
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linaro.org>, Chunyan Zhang <zhang.lyra@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Feb 11, 2019 at 7:50 PM Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:

> Fix the following warning by adding a missing break:
>
> drivers/gpio/gpio-eic-sprd.c: In function =E2=80=98sprd_eic_irq_set_type=
=E2=80=99:
> drivers/gpio/gpio-eic-sprd.c:403:3: warning: this statement may fall thro=
ugh [-Wimplicit-fallthrough=3D]
>    switch (flow_type) {
>    ^~~~~~
> drivers/gpio/gpio-eic-sprd.c:435:2: note: here
>   default:
>   ^~~~~~~
>
> This patch is part of the ongoing efforts to enable
> -Wimplicit-fallthrough.
>
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Patch applied with Baolin's review tag.

Yours,
Linus Walleij
