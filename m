From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: gpiolib: fix an incorrect use of WARN_ON()
Date: Mon, 12 Sep 2016 14:51:06 +0200
Message-ID: <CACRpkdZiquBt6mSuT7rhTc3W5BC7KUA7g=ZOD3cynGZW86LDNA@mail.gmail.com>
References: <1473412769-17428-1-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:35258 "EHLO
        mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757907AbcILMvI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Sep 2016 08:51:08 -0400
Received: by mail-oi0-f52.google.com with SMTP id d191so94622788oih.2
        for <linux-gpio@vger.kernel.org>; Mon, 12 Sep 2016 05:51:07 -0700 (PDT)
In-Reply-To: <1473412769-17428-1-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vignesh R <vigneshr@ti.com>, Yong Li <yong.b.li@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Fri, Sep 9, 2016 at 11:19 AM, Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:

> This breaks the build due to the format string being passed as
> argument. Fix it by using WARN().
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
> NOTE This patch applies on top of linux-gpio devel branch.

Thanks, Marc realized the mistake and sent a v2 patch so I
have already fixed this up, sorry for leaving the tree in a mess
over the weekend.

Yours,
Linus Walleij
