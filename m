From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pxa: avoid attempting to set pin direction via
 pinctrl on MMP2
Date: Thu, 14 Feb 2019 09:13:24 +0100
Message-ID: <CACRpkdYyT20Um+5bDAiZAfB-A3M+q5DpUQS31+CkLUSb+qpQOw@mail.gmail.com>
References: <20190213230618.1907-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190213230618.1907-1-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Lubomir Rintel <lkundrak@v3.sk>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>
List-Id: linux-gpio@vger.kernel.org

On Thu, Feb 14, 2019 at 12:06 AM Lubomir Rintel <lkundrak@v3.sk> wrote:

> Similarly to PXA3xx, pinctrl-single can't set pin direction on MMP2 either.
> See also: commit 9dabfdd84bdfa ("gpio: pxa: disable pinctrl calls for
> PXA3xx")
>
> Fixes: a770d946371e ("gpio: pxa: add pin control gpio direction and request")
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> Acked-by: Pavel Machek <pavel@ucw.cz>

Patch applied for fixes.

Should this even go into stable?

Yours,
Linus Walleij
