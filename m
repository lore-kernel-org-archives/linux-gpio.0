From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: gpiolib-of: Cannot request gpio with multiple chips
Date: Mon, 24 Oct 2016 02:37:14 +0200
Message-ID: <CACRpkdZ7y4K7nCA=ms4SZkr=KqCVPma14O6mx8tCLTx6Egx8Tw@mail.gmail.com>
References: <CAKXjFTNbWRcNfCZdCPq6e8GVDoe-5ipdtDGC8XsiX-J=yJPK8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f177.google.com ([209.85.220.177]:33918 "EHLO
        mail-qk0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752193AbcJXAhP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 23 Oct 2016 20:37:15 -0400
Received: by mail-qk0-f177.google.com with SMTP id x11so8077683qka.1
        for <linux-gpio@vger.kernel.org>; Sun, 23 Oct 2016 17:37:15 -0700 (PDT)
In-Reply-To: <CAKXjFTNbWRcNfCZdCPq6e8GVDoe-5ipdtDGC8XsiX-J=yJPK8A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Haslam <ahaslam@baylibre.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Kevin Hilman <khilman@baylibre.com>

On Thu, Oct 20, 2016 at 5:22 PM, Axel Haslam <ahaslam@baylibre.com> wrote:

> if you agree with the above, What is the best way to proceed ?
> - fix the davinci gpio driver to the new behavior of gpiolib-of
> - fix the gpiolib-of to loop all chips again?

Either fix all users or make the same semantic come back, whatever
makes most sense and gives the cleanest code.

> - revert the patches?

Nah, it's a nice cleanup. Let's see if we can do something better first.
It should be a last resort.

Yours,
Linus Walleij
