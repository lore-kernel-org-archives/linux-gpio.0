From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] gpiolib: Re-use bitmap_fill() instead of open coded loop
Date: Mon, 29 May 2017 11:32:53 +0200
Message-ID: <CACRpkdY6bqKP=j=EiVZ=6Sp5fK2Hga2qbC8nh97dDCfA5zXsdQ@mail.gmail.com>
References: <20170525130838.58877-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f42.google.com ([209.85.214.42]:36496 "EHLO
        mail-it0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750787AbdE2Jcz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 May 2017 05:32:55 -0400
Received: by mail-it0-f42.google.com with SMTP id o5so24261883ith.1
        for <linux-gpio@vger.kernel.org>; Mon, 29 May 2017 02:32:55 -0700 (PDT)
In-Reply-To: <20170525130838.58877-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, May 25, 2017 at 3:08 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Re-use bitmap_fill() instead of open coded loop for setting an area of
> bits in a bitmap.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Nice optimization.
Patch applied.

Yours,
Linus Walleij
