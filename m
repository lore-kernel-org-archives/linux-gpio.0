From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v5 6/6] gpio: pca953x: make the define names consistent
Date: Thu, 8 Sep 2016 16:16:19 +0200
Message-ID: <CAMpxmJWdMx2mHN4bWueRAcNMCLGVZr_MkQ2uvpkoBG6MnntgfQ@mail.gmail.com>
References: <1473331702-26711-1-git-send-email-bgolaszewski@baylibre.com>
 <1473331702-26711-7-git-send-email-bgolaszewski@baylibre.com>
 <1473337655.11323.94.camel@linux.intel.com> <1473337770.11323.95.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f54.google.com ([209.85.214.54]:38012 "EHLO
        mail-it0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754676AbcIHOQU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Sep 2016 10:16:20 -0400
Received: by mail-it0-f54.google.com with SMTP id c198so82587450ith.1
        for <linux-gpio@vger.kernel.org>; Thu, 08 Sep 2016 07:16:20 -0700 (PDT)
In-Reply-To: <1473337770.11323.95.camel@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Vignesh R <vigneshr@ti.com>, Yong Li <yong.b.li@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

2016-09-08 14:29 GMT+02:00 Andy Shevchenko <andriy.shevchenko@linux.intel.com>:
> On Thu, 2016-09-08 at 15:27 +0300, Andy Shevchenko wrote:
>> On Thu, 2016-09-08 at 12:48 +0200, Bartosz Golaszewski wrote:
>> >
>> > The register offset defines for the pca953x and pca957x expander
>> > families should have the same names to better reflect their similar
>> > purposes.
>>
>
> And one more question. If it is done in datasheet as is used currently
> in the driver I would leave it to be aligned with official
> documentation.
>

Right, the current names seem to come from the datasheet register
table. I'll drop this patch in v6.

Thanks,
Bartosz
