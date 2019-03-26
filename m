From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v6 0/1] gpio: add driver for Mellanox BlueField GPIO
Date: Tue, 26 Mar 2019 18:41:58 +0100
Message-ID: <CAMpxmJX6y9aKD8=P+v+5db4_WsOna+5fvw5tGc6RvOE6PFWUnQ@mail.gmail.com>
References: <cover.1553610690.git.sramani@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1553610690.git.sramani@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shravan Kumar Ramani <sramani@mellanox.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

wt., 26 mar 2019 o 15:43 Shravan Kumar Ramani <sramani@mellanox.com> napisa=
=C5=82(a):
>
> Changes since v5:
> Use devm_platform_ioremap_resource().
>
> Shravan Kumar Ramani (1):
>   gpio: add driver for Mellanox BlueField GPIO controller
>
>  drivers/gpio/Kconfig      |   7 +++
>  drivers/gpio/Makefile     |   1 +
>  drivers/gpio/gpio-mlxbf.c | 153 ++++++++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 161 insertions(+)
>  create mode 100644 drivers/gpio/gpio-mlxbf.c
>
> --
> 2.1.2
>

Applied, thanks!

Bart
