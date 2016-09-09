From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 1/5] gpio: pca953x: coding style fixes
Date: Fri, 9 Sep 2016 17:08:27 +0200
Message-ID: <CAMpxmJXR5H12wwMTS-FxBiEFzoxQfe1d1cZw6-cfpZ9MM1NUHA@mail.gmail.com>
References: <1473085895-31711-1-git-send-email-bgolaszewski@baylibre.com>
 <1473085895-31711-2-git-send-email-bgolaszewski@baylibre.com>
 <CACRpkdb18bvEasNLoOvMXYcKcig1UL2hBDGRgOoT1yto5t6+qQ@mail.gmail.com> <CACRpkdYGh2iqoY-uyoBxmgN3WoB7cKMrHYXvXqgj1K9s6U5sjg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYGh2iqoY-uyoBxmgN3WoB7cKMrHYXvXqgj1K9s6U5sjg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vignesh R <vigneshr@ti.com>, Yong Li <yong.b.li@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

2016-09-08 1:15 GMT+02:00 Linus Walleij <linus.walleij@linaro.org>:
> On Wed, Sep 7, 2016 at 11:55 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Mon, Sep 5, 2016 at 4:31 PM, Bartosz Golaszewski
>> <bgolaszewski@baylibre.com> wrote:
>>
>>> pca953x_gpio_set_multiple() has some coding style issues that make it
>>> harder to read. Tweak the code a bit.
>>>
>>> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>
>> Much better like this.
>>
>> Patch applied.
>
> Ah I see there was a later version and it was moved around.
>
> OK backing this out. Let's go for latest version and also please
> rebase it onto my devel branch.
>
> Yours,
> Linus Walleij

Done. The current, rebased version is v6.

Thanks,
Bartosz
