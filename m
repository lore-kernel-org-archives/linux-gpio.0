From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 2/2] gpio: mockup: implement event injecting over debugfs
Date: Mon, 13 Feb 2017 08:38:11 +0100
Message-ID: <CACRpkdYdmimFY4MP7dGPD4OmE1BnwoP9kUFpZ67HwfFB6X0Jhg@mail.gmail.com>
References: <1486390268-31362-1-git-send-email-bgolaszewski@baylibre.com> <1486390268-31362-3-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f45.google.com ([209.85.214.45]:35171 "EHLO
        mail-it0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751712AbdBMHiM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Feb 2017 02:38:12 -0500
Received: by mail-it0-f45.google.com with SMTP id 203so176663125ith.0
        for <linux-gpio@vger.kernel.org>; Sun, 12 Feb 2017 23:38:12 -0800 (PST)
In-Reply-To: <1486390268-31362-3-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Lars-Peter Clausen <lars@metafoo.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Feb 6, 2017 at 3:11 PM, Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:

> Create a debugfs directory for every mockup chip and a single file
> for every line. Writing (0 or 1) to these files allows the user to
> inject line events (falling or rising edge respectively).
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Patch applied.

Yours,
Linus Walleij
