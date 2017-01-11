From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/1] pinctrl: baytrail: Rectify debounce support
Date: Wed, 11 Jan 2017 14:09:37 +0100
Message-ID: <CACRpkdajKe8wFtwvebydN7Xp=i1MS7DGLZfKogQSo-nsN8ZF5Q@mail.gmail.com>
References: <20170110143852.93880-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f171.google.com ([209.85.216.171]:35306 "EHLO
        mail-qt0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758903AbdAKNJj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Jan 2017 08:09:39 -0500
Received: by mail-qt0-f171.google.com with SMTP id x49so128346510qtc.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jan 2017 05:09:38 -0800 (PST)
In-Reply-To: <20170110143852.93880-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Cristina Ciocan <cristina.ciocan@intel.com>

On Tue, Jan 10, 2017 at 3:38 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The commit 658b476c742f ("pinctrl: baytrail: Add debounce configuration")
> implements debounce for Baytrail pin control, but seems wasn't tested properly.
>
> The register which keeps debounce value is separated from the configuration
> one. Writing wrong values to the latter will guarantee wrong behaviour of the
> driver and even might break something physically.
>
> Besides above there is missed case how to disable it, which is actually done
> through the bit in configuration register.
>
> Rectify implementation here by using proper register for debounce value.
>
> Fixes: 658b476c742f ("pinctrl: baytrail: Add debounce configuration")
> Cc: Cristina Ciocan <cristina.ciocan@intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied for fixes with Mika's ACK.

Yours,
Linus Walleij
