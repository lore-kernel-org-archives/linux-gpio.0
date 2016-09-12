From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v6 4/5] gpio: pca953x: remove an unused variable
Date: Mon, 12 Sep 2016 14:49:05 +0200
Message-ID: <CACRpkdZFUom2kLndd8CEGj-iDg67DTXGTEuxGf3XULrhu5JjPw@mail.gmail.com>
References: <1473412658-13120-1-git-send-email-bgolaszewski@baylibre.com> <1473412658-13120-5-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1473412658-13120-5-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vignesh R <vigneshr@ti.com>, Yong Li <yong.b.li@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Sep 9, 2016 at 11:17 AM, Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:

> The chip_type variable in struct pca953x_chip is no longer required.
>
> Remove it.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied.

Yours,
Linus Walleij
