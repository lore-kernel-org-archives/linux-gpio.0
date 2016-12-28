From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] gpio: mockup: make pins_name_start static
Date: Wed, 28 Dec 2016 14:12:22 +0100
Message-ID: <CACRpkdYdr1pEJbPyMNh16N7bN1zBc42Ox7hQ7Bp1c31LwbQT-g@mail.gmail.com>
References: <1482233300-20078-1-git-send-email-bgolaszewski@baylibre.com> <1482233300-20078-2-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f171.google.com ([209.85.216.171]:34112 "EHLO
        mail-qt0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751678AbcL1NMe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Dec 2016 08:12:34 -0500
Received: by mail-qt0-f171.google.com with SMTP id d45so127319308qta.1
        for <linux-gpio@vger.kernel.org>; Wed, 28 Dec 2016 05:12:23 -0800 (PST)
In-Reply-To: <1482233300-20078-2-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Dec 20, 2016 at 12:28 PM, Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:

> This variable is not used outside this module. Make it static.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Patch applied.

Yours,
Linus Walleij
