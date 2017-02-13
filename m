From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] pinctrl: berlin: make bool drivers explicitly non-modular
Date: Mon, 13 Feb 2017 14:25:35 +0100
Message-ID: <CACRpkdYU=eJU7Gs9QL34XduKPbNw9WtOW7b0x=DFHv2VQhN=3w@mail.gmail.com>
References: <20170206080352.17808-1-paul.gortmaker@windriver.com> <20170206080352.17808-4-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170206080352.17808-4-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jisheng Zhang <jszhang@marvell.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Thomas Hebb <tommyhebb@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Feb 6, 2017 at 9:03 AM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> None of the Kconfigs for any of these drivers are tristate,
> meaning that they currently are not being built as a module by anyone.
>
> Lets remove the modular code that is essentially orphaned, so that
> when reading the driver there is no doubt it is builtin-only.
>
> Since module_platform_driver() uses the same init level priority as
> builtin_platform_driver() the init ordering remains unchanged with
> this commit.
>
> Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.
>
> We also delete the MODULE_LICENSE tag etc. since all that information
> is already contained at the top of the file in the comments.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: "Antoine T=C3=A9nart" <antoine.tenart@free-electrons.com>
> Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> Cc: Jisheng Zhang <jszhang@marvell.com>
> Cc: Hongzhou Yang <hongzhou.yang@mediatek.com>
> Cc: Thomas Hebb <tommyhebb@gmail.com>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Patch applied.

Yours,
Linus Walleij
