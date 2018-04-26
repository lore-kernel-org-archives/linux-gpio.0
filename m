From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: pmic_eic: Add edge trigger emulation for PMIC EIC
Date: Thu, 26 Apr 2018 10:12:54 +0200
Message-ID: <CACRpkdYqZbU8q_gRz8rUhtA81F=jKFDYJ1S+6oBhJNsa7Y6kaw@mail.gmail.com>
References: <bdaaa8823cc3aef44352ee867fb6274278f2a2a9.1522392153.git.baolin.wang@linaro.org>
 <7bac44aef748c61863fd9651ef3c52b4e51c511a.1522392153.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7bac44aef748c61863fd9651ef3c52b4e51c511a.1522392153.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Mar 30, 2018 at 9:02 AM, Baolin Wang <baolin.wang@linaro.org> wrote:

> This patch will toggle the EIC level to emulate the edge trigger to
> support PMIC EIC egdge trigger function, which is required by gpio-keys
> driver.
>
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>

Patch applied.

Also adding Uwe to this thread so he can have a look.

Yours,
Linus Walleij
