From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/7] gpio: mockup: readability tweaks
Date: Mon, 6 Feb 2017 14:20:51 +0100
Message-ID: <CACRpkdbT+149LKxRL5wYn-fYgOdczTuzR8J6Vkh1HPnryr3Vgw@mail.gmail.com>
References: <1486383041-16758-1-git-send-email-bgolaszewski@baylibre.com> <1486383041-16758-2-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f170.google.com ([209.85.223.170]:36150 "EHLO
        mail-io0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751372AbdBFNUx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Feb 2017 08:20:53 -0500
Received: by mail-io0-f170.google.com with SMTP id j13so65004522iod.3
        for <linux-gpio@vger.kernel.org>; Mon, 06 Feb 2017 05:20:53 -0800 (PST)
In-Reply-To: <1486383041-16758-2-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Feb 6, 2017 at 1:10 PM, Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:

> The following patch tries to improve the readability of the mockup
> driver.
>
> The driver is called gpio-mockup, so add the same prefix to all
> functions and structures.
>
> Add some newlines and use a temporary pointer in gpio_mockup_add().
>
> Drop the name of the direction enum and rename the enum values to
> better reflect their purpose.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Patch applied.

Yours,
Linus Walleij
