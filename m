From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: vf610: Use PTR_ERR_OR_ZERO() in vf610_gpio_probe()
Date: Thu, 16 May 2019 14:00:07 +0200
Message-ID: <CACRpkdbgkh5o6HojAot6orHcT8xV-eaYa9KCgXmhp0wN7OGGpw@mail.gmail.com>
References: <20190429054948.9185-1-andrew.smirnov@gmail.com> <20190429054948.9185-2-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190429054948.9185-2-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Chris Healy <cphealy@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Apr 29, 2019 at 7:50 AM Andrey Smirnov <andrew.smirnov@gmail.com> wrote:

> Simplify error checking code by replacing multiple ERR macros with a
> call to PTR_ERR_OR_ZERO. No functional change intended.
>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Chris Healy <cphealy@gmail.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org

Patch applied for v5.3.

Yours,
Linus Walleij
