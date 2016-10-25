From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: gpiolib-devprop: Check chip->parent pointer before dereferencing
Date: Tue, 25 Oct 2016 20:24:04 +0200
Message-ID: <CACRpkdZdHRY0Zc9F+HYdZG+fHS-YgyPhAgXvOjK=UxKEHtUOfg@mail.gmail.com>
References: <1477413083-9159-1-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f178.google.com ([209.85.216.178]:40803 "EHLO
        mail-qt0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753519AbcJYSYF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Oct 2016 14:24:05 -0400
Received: by mail-qt0-f178.google.com with SMTP id p53so6519093qtp.7
        for <linux-gpio@vger.kernel.org>; Tue, 25 Oct 2016 11:24:05 -0700 (PDT)
In-Reply-To: <1477413083-9159-1-git-send-email-tthayer@opensource.altera.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Thor Thayer <tthayer@opensource.altera.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Oct 25, 2016 at 6:31 PM,  <tthayer@opensource.altera.com> wrote:

> From: Thor Thayer <tthayer@opensource.altera.com>
>
> Confirm the chip->parent is valid before dereferencing because
> the parent parameter is optional.
>
> Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>

I wish it wasn't. Not much to do about though.

Patch applied.

Yours,
Linus Walleij
