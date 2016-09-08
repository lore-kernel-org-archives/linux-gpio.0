From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v5 6/6] gpio: pca953x: make the define names consistent
Date: Thu, 8 Sep 2016 14:29:11 +0200
Message-ID: <CAMpxmJUJT0AEnDe8L5N3Nd8Bg5=jpB6dvyw_sfBf6yZ+=rKr=Q@mail.gmail.com>
References: <1473331702-26711-1-git-send-email-bgolaszewski@baylibre.com>
 <1473331702-26711-7-git-send-email-bgolaszewski@baylibre.com> <1473337655.11323.94.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1473337655.11323.94.camel@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Vignesh R <vigneshr@ti.com>, Yong Li <yong.b.li@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

2016-09-08 14:27 GMT+02:00 Andy Shevchenko <andriy.shevchenko@linux.intel.com>:
> On Thu, 2016-09-08 at 12:48 +0200, Bartosz Golaszewski wrote:
>> The register offset defines for the pca953x and pca957x expander
>> families should have the same names to better reflect their similar
>> purposes.
>
>
>
>
>>       chip->regs = &pca957x_regs;
>>
>> -     ret = pca953x_read_regs(chip, PCA957X_OUT, chip->reg_output);
>> +     ret = pca953x_read_regs(chip, PCA957X_OUTPUT, chip-
>> >reg_output);
>>       if (ret)
>>               goto out;
>> -     ret = pca953x_read_regs(chip, PCA957X_CFG, chip-
>> >reg_direction);
>> +     ret = pca953x_read_regs(chip, PCA957X_DIRECTION, chip-
>> >reg_direction);
>
> Bu we may use chip->regs->direction here, right? And output before.
>

Yes, though it should go into patch 1/6.

Thanks,
Bartosz
