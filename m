From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: eic: Add edge trigger emulation for EIC
Date: Thu, 26 Apr 2018 10:10:11 +0200
Message-ID: <CACRpkdY+rbEqk3CqkrD09WEO=zLsD4VK1P56K4o=k_4gATaS0w@mail.gmail.com>
References: <bdaaa8823cc3aef44352ee867fb6274278f2a2a9.1522392153.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <bdaaa8823cc3aef44352ee867fb6274278f2a2a9.1522392153.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Mar 30, 2018 at 9:02 AM, Baolin Wang <baolin.wang@linaro.org> wrote=
:

> The Spreadtrum debounce EIC and latch EIC can not support edge trigger,
> but most GPIO users (like gpio-key driver) only use the edge trigger,
> thus the EIC driver need add some support to emulate the edge trigger
> to satisfy this requirement.
>
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>

Patch applied.

The patch is fine and in line with other kernel drivers doing edge
trigger emulation and we do not hold back on useful features.

But I want to take this opportunity to ping Uwe Kleine-K=C3=B6nig about
his ideas for an edge trigger emulation library in the gpiolib core,
and whether this also follows the pattern.

I think we have a slew of these drivers doing similar stuff around.

Yours,
Linus Walleij
