From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] i2c: pca953x: fix a lockdep warning
Date: Mon, 22 Aug 2016 16:06:57 +0200
Message-ID: <CACRpkdZjDGDY=Kez-4C6pUV8Xpj3t+jP8DtqxdWwQ_EiPDMt6Q@mail.gmail.com>
References: <1471872572-25818-1-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1471872572-25818-1-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vignesh R <vigneshr@ti.com>, Yong Li <yong.b.li@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Aug 22, 2016 at 3:29 PM, Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:

The $SUBJECT of this patch should be something beginning with
gpio: atleast.

Apart from that it'd be nice to get review from the other people using
the PCA953x driver, since it's rather complex.

Yours,
Linus Walleij
