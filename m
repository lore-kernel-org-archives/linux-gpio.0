From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [Question] How to implement GPIO driver for sparse hw numbers?
Date: Wed, 15 Jul 2015 00:04:32 +0200
Message-ID: <CACRpkdYU62-2VV0FoJAO6-YA587w3wQ7ZpPXDEYTM9DdN51rUw@mail.gmail.com>
References: <CAK7LNARNUqjwcOvTwjsq8ck=hPgn83Gk=1vikkmq5KUxmYSjnQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:34361 "EHLO
	mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752175AbbGNWEd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jul 2015 18:04:33 -0400
Received: by oiab3 with SMTP id b3so16137321oia.1
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2015 15:04:32 -0700 (PDT)
In-Reply-To: <CAK7LNARNUqjwcOvTwjsq8ck=hPgn83Gk=1vikkmq5KUxmYSjnQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Jun 19, 2015 at 5:27 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> In my understanding, the GPIO driver framework requires that
> the hw numbers should be contiguous within each GPIO chip.

Yes but noone says that .request() to the driver has to succeed
on every GPIO so just cover all GPIOs from 0 to 307 with
your GPIO chip and then implement your "holes" in the GPIO
range from 0 to 307 by letting .request() fail.

Yours,
Linus Walleij
