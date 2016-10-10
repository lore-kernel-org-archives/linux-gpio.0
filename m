From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio/board.txt: point to gpiod_set_value
Date: Mon, 10 Oct 2016 10:43:56 +0200
Message-ID: <CACRpkdaPRUatdKiN7WTnXCZhUm60pxmhxmmnCdCxrDw-y1yMSg@mail.gmail.com>
References: <20161003084346.GA2749@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:34614 "EHLO
        mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752173AbcJJIn5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Oct 2016 04:43:57 -0400
Received: by mail-oi0-f46.google.com with SMTP id t73so5004520oie.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Oct 2016 01:43:57 -0700 (PDT)
In-Reply-To: <20161003084346.GA2749@amd>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Alexandre Courbot <gnurou@gmail.com>, Jon Corbet <corbet@lwn.net>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Oct 3, 2016 at 10:43 AM, Pavel Machek <pavel@ucw.cz> wrote:

> gpiod_set_value() is preffered interface these days, so add a
> pointer. Also fix a missing ).
>
> Signed-off-by: Pavel Machek <pavel@ucw.cz>

Patch applied with some tweaking.

Yours,
Linus Walleij
