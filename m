From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/7] gpiolib: clean up includes
Date: Tue, 31 Jan 2017 14:20:02 +0100
Message-ID: <CACRpkdZonYwVJKJi+Z9Vpj=F1VO5cAXBJ_+Nw6WGQN2AFkAdFA@mail.gmail.com>
References: <1485358461-24070-1-git-send-email-bgolaszewski@baylibre.com> <1485358461-24070-2-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1485358461-24070-2-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jan 25, 2017 at 4:34 PM, Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:

> gpiolib.h uses enum gpiod_flags, but doesn't pull in gpio/consumer.h.
> Include it in gpiolib.h and don't include neither consumer.h nor
> driver.h from modules that already include gpiolib.h.

Nah.... .c files should include the headers representing the
symbols they use. Not rely on secondary inclusions.

Drivers should ideally *always* and *only*
include <linux/gpio/driver.h>. If they include other stuff,
that is just tautological icing on the cake.

So, I'm gonna drop this.

Yours,
Linus Walleij
