From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] i2c: pca953x: fix a lockdep warning
Date: Mon, 22 Aug 2016 16:21:55 +0200
Message-ID: <CACRpkdZuyJCsTPyjhH9HtdN0CaPoUYR=YzHYCQ6XRMgsi_VnhQ@mail.gmail.com>
References: <1471872572-25818-1-git-send-email-bgolaszewski@baylibre.com>
 <CACRpkdZjDGDY=Kez-4C6pUV8Xpj3t+jP8DtqxdWwQ_EiPDMt6Q@mail.gmail.com> <CAMpxmJVzCgSWJkS2RNx9T9Y0gpmsBe5MzczfJhKj=SiEMOfy4Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMpxmJVzCgSWJkS2RNx9T9Y0gpmsBe5MzczfJhKj=SiEMOfy4Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vignesh R <vigneshr@ti.com>, Yong Li <yong.b.li@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Aug 22, 2016 at 4:15 PM, Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
> 2016-08-22 16:06 GMT+02:00 Linus Walleij <linus.walleij@linaro.org>:
>> On Mon, Aug 22, 2016 at 3:29 PM, Bartosz Golaszewski
>> <bgolaszewski@baylibre.com> wrote:
>>
>> The $SUBJECT of this patch should be something beginning with
>> gpio: atleast.
>>
>
> Oops, it was supposed to be gpio, but I was working on i2c stuff and
> mixed it. I'll fix that in v2 after getting some reviews.

OK! Pls include the people I added on the To: line when you repost.

Yours,
Linus Walleij
