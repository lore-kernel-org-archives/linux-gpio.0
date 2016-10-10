From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v6 1/1] USB: serial: cp210x: Adding GPIO support for CP2105
Date: Mon, 10 Oct 2016 11:24:48 +0200
Message-ID: <CACRpkdakQ144xCwk278f8afhBkZ-KyHTZeTrx+QqwjiLVeTHcQ@mail.gmail.com>
References: <b77f588156e346037d7efda72f9ed1dc460b810a.1474670298.git.martyn.welch@collabora.co.uk>
 <CACRpkdbQzigYvx61S__+=qW1+NWxDyxUyg-Tm0=8Sj42xy6EWg@mail.gmail.com> <20161007153126.GA355@hermes.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:36081 "EHLO
        mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751033AbcJJJZe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Oct 2016 05:25:34 -0400
Received: by mail-oi0-f46.google.com with SMTP id m72so120849580oik.3
        for <linux-gpio@vger.kernel.org>; Mon, 10 Oct 2016 02:24:49 -0700 (PDT)
In-Reply-To: <20161007153126.GA355@hermes.home>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Martyn Welch <martyn.welch@collabora.co.uk>
Cc: Johan Hovold <johan@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Karl Palsson <karlp@tweak.net.au>, Konstantin Shkolnyy <Konstantin.Shkolnyy@silabs.com>, Peter Senna Tschudin <peter.senna@collabora.com>

On Fri, Oct 7, 2016 at 5:31 PM, Martyn Welch
<martyn.welch@collabora.co.uk> wrote:

> WRT this driver, I think I need to keep set_single_ended, but change .direction_input
> to always return a failure and have .direction_output always return success to
> avoid pins being driven in unexpected ways. Does that sould acceptable?

I'm pretty sure it's OK, I just want you to consider and think these things
over. Your conclusion is as good as mine. I suspect I will just ACK your
patch when you have it working.

Yours,
Linus Walleij
