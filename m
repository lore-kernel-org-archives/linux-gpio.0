From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: of: Check for "spi-cs-high" in child instead of
 parent node
Date: Thu, 28 Mar 2019 17:11:34 +0100
Message-ID: <CACRpkda3f=7t+qnNrvDchaQUM+1g+gCcM83eD8vy0Ja73DEL7w@mail.gmail.com>
References: <20190326063209.6421-1-andrew.smirnov@gmail.com> <20190326063209.6421-2-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190326063209.6421-2-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Chris Healy <cphealy@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Mar 26, 2019 at 7:32 AM Andrey Smirnov <andrew.smirnov@gmail.com> wrote:

> "spi-cs-high" is going to be specified in child node of an SPI
> controller's representing attached SPI device, so change the code to
> look for it there, instead of checking parent node.
>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Chris Healy <cphealy@gmail.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org

Patch applied for fixes.

I could bet I exercised these code paths just the other
week, but I don't know how it all ended up like this... :/

Thanks for fixing it up!!

Yours,
Linus Walleij
