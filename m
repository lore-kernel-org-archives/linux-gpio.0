From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2 4/5] gpio: pca953x: remove an unused variable
Date: Wed, 7 Sep 2016 13:40:58 +0200
Message-ID: <CAMpxmJULK+ayGU5RfkNJ8nOB6axBYknObCT-q94YuQD9abBC0w@mail.gmail.com>
References: <1473240297-19881-1-git-send-email-bgolaszewski@baylibre.com>
 <1473240297-19881-5-git-send-email-bgolaszewski@baylibre.com> <1473248188.11323.40.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f46.google.com ([209.85.214.46]:35367 "EHLO
        mail-it0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751499AbcIGLk7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Sep 2016 07:40:59 -0400
Received: by mail-it0-f46.google.com with SMTP id e124so191408191ith.0
        for <linux-gpio@vger.kernel.org>; Wed, 07 Sep 2016 04:40:59 -0700 (PDT)
In-Reply-To: <1473248188.11323.40.camel@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Vignesh R <vigneshr@ti.com>, Yong Li <yong.b.li@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

2016-09-07 13:36 GMT+02:00 Andy Shevchenko <andriy.shevchenko@linux.intel.com>:
> On Wed, 2016-09-07 at 11:24 +0200, Bartosz Golaszewski wrote:
>> The chip_type variable in struct pca953x_chip is no longer required.
>>
>> Remove it.
>
> Would it be patch 4 in the series?

Hi Andy,

I'm afraid I don't understand the question. Could you elaborate?

Thanks,
Bartosz
