From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: arm:collie_defconfig broken since commit ff2b135922 ("gpio: make
 the gpiochip a real device")
Date: Thu, 31 Mar 2016 15:26:49 +0200
Message-ID: <CACRpkdZ4P6Sk3__pJtHep91f8Bw4xQWLZ85V_=TEa3OMUze1aw@mail.gmail.com>
References: <56F8BB39.5010708@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:36175 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752473AbcCaN0u (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Mar 2016 09:26:50 -0400
Received: by mail-oi0-f53.google.com with SMTP id r187so59995974oih.3
        for <linux-gpio@vger.kernel.org>; Thu, 31 Mar 2016 06:26:49 -0700 (PDT)
In-Reply-To: <56F8BB39.5010708@roeck-us.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Mar 28, 2016 at 7:03 AM, Guenter Roeck <linux@roeck-us.net> wrote:

> arm:collie_defconfig is broken since commit ff2b135922 ("gpio: make the
> gpiochip a real device").

Oh I was worried that something like this would happen, but
hoped we could find it in linux-next, oh well.

I saw you sent a patch too, I will look at it & also try to
reproduce on my iPAQ.

Yours,
Linus Walleij
