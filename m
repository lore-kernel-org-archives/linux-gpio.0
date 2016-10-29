From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: max77620: add OF dependency
Date: Sat, 29 Oct 2016 10:30:49 +0200
Message-ID: <CACRpkdYKvbsfKx9=bN1BvCnWC_vTNzkm=5+pR0N7q5MscjiSHw@mail.gmail.com>
References: <20161028081923.3238580-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161028081923.3238580-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee.jones@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Oct 28, 2016 at 10:19 AM, Arnd Bergmann <arnd@arndb.de> wrote:

> Drivers using pinconf_generic_params tables cannot be built with
> CONFIG_OF disabled:
>
> drivers/pinctrl/pinctrl-max77620.c:53:44: error: array type has incomplet=
e element type =E2=80=98struct pinconf_generic_params=E2=80=99
> drivers/pinctrl/pinctrl-max77620.c:55:3: error: field name not in record =
or union initializer
> drivers/pinctrl/pinctrl-max77620.c:55:3: note: (near initialization for =
=E2=80=98max77620_cfg_params=E2=80=99)
> drivers/pinctrl/pinctrl-max77620.c:56:3: error: field name not in record =
or union initializer
>
> This adds a dependency for max77620 to disallow that configuration.
>
> Alternatively, we could rework the pinctrl infrastructure to make the
> configuration valid for compile-testing.
>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Fixes: 453943dc8f45 ("mfd: Enable compile testing for max77620 and max776=
86")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied.

Yours,
Linus Walleij
