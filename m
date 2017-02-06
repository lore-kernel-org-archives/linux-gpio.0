From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/7] gpio: mockup: implement naming the lines
Date: Mon, 6 Feb 2017 14:22:41 +0100
Message-ID: <CACRpkdaJdNt+uioTiNNBvMT=YbdFZfO5Tp8T-QKuRdNn50RQWQ@mail.gmail.com>
References: <1486383041-16758-1-git-send-email-bgolaszewski@baylibre.com> <1486383041-16758-4-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f45.google.com ([209.85.214.45]:38342 "EHLO
        mail-it0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750950AbdBFNWn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Feb 2017 08:22:43 -0500
Received: by mail-it0-f45.google.com with SMTP id c7so56409294itd.1
        for <linux-gpio@vger.kernel.org>; Mon, 06 Feb 2017 05:22:42 -0800 (PST)
In-Reply-To: <1486383041-16758-4-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Feb 6, 2017 at 1:10 PM, Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:

> In order to allow testing line lookup by name from user space, add
> a new boolean parameter that indicates whether we want the lines to
> be named. The name is created by concatenating the chip name and the
> line offset value.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Patch applied.

Yours,
Linus Walleij
