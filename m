From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: of: Check propname before applying "cs-gpios" quirks
Date: Thu, 28 Mar 2019 17:08:59 +0100
Message-ID: <CACRpkdZLxr8JWTbhpKKxt-kciERAYUmDLiemFij30oJTjYeMiQ@mail.gmail.com>
References: <20190326063209.6421-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190326063209.6421-1-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Chris Healy <cphealy@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Mar 26, 2019 at 7:32 AM Andrey Smirnov <andrew.smirnov@gmail.com> wrote:

> SPI GPIO device has more than just "cs-gpio" property in its node and
> would request those GPIOs as a part of its initialization. To avoid
> applying CS-specific quirk to all of them add a check to make sure
> that propname is "cs-gpios".
>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Chris Healy <cphealy@gmail.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org

Patch applied for fixes.

Sorry for my mistakes...

Yours,
Linus Walleij
