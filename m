From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/5] gpio: pca953x: code refactoring
Date: Thu, 8 Sep 2016 00:02:40 +0200
Message-ID: <CACRpkdb9snPXT+7y2gavPA_wDcN0VJKLKqhKCwTmGNTb1fkJfA@mail.gmail.com>
References: <1473085895-31711-1-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:36736 "EHLO
        mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753998AbcIGWCl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Sep 2016 18:02:41 -0400
Received: by mail-oi0-f53.google.com with SMTP id w78so45595556oie.3
        for <linux-gpio@vger.kernel.org>; Wed, 07 Sep 2016 15:02:40 -0700 (PDT)
In-Reply-To: <1473085895-31711-1-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vignesh R <vigneshr@ti.com>, Yong Li <yong.b.li@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Mon, Sep 5, 2016 at 4:31 PM, Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:

> I'm working on converting the pca953x driver to using regmap, but since
> it's not a trivial task I figured I'd post a couple refactoring patches
> I did so far for 4.9.

I'm in. I'm also ready to merge more patches on top late, because
it is a noble goal.

Yours,
Linus Walleij
