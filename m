From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 6/7] gpiolib: include <gpio/consumer.h> from gpiolib.h
Date: Mon, 6 Feb 2017 14:30:40 +0100
Message-ID: <CACRpkdZPMY_sxvgMNFYOW_zwvWRNC8SW2s0VVHsvrkJd9P2iHw@mail.gmail.com>
References: <1486383041-16758-1-git-send-email-bgolaszewski@baylibre.com> <1486383041-16758-7-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1486383041-16758-7-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Feb 6, 2017 at 1:10 PM, Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:

> We want pull gpiolib.h in from the gpio mockup driver, but gpiod_flags
> is defined in consumer.h, so we need that too indirectly.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Can't you just add the include to the mockup driver...?

Yours,
Linus Walleij
