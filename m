From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: add driver for MEN 16Z127 GPIO controller
Date: Wed, 9 Mar 2016 09:45:42 +0700
Message-ID: <CACRpkdZrSTiQd2BQS-ErtLtsT5gmyL5gCxo=gcMQ5wy0xaxpiQ@mail.gmail.com>
References: <cover.1456771093.git.andy@wernerandy.de>
	<8adb885e10c3b375d451830ba2612bfea09dd011.1456771093.git.andy@wernerandy.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:34424 "EHLO
	mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750863AbcCICpn (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Mar 2016 21:45:43 -0500
Received: by mail-oi0-f50.google.com with SMTP id m82so25714643oif.1
        for <linux-gpio@vger.kernel.org>; Tue, 08 Mar 2016 18:45:43 -0800 (PST)
In-Reply-To: <8adb885e10c3b375d451830ba2612bfea09dd011.1456771093.git.andy@wernerandy.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andreas Werner <andy@wernerandy.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johannes Thumshirn <morbidrsa@gmail.com>, Andreas Werner <andreas.werner@men.de>

On Tue, Mar 1, 2016 at 1:44 AM, Andreas Werner <andy@wernerandy.de> wrote:

> The 16Z127 is a 32bit GPIO controller on a MCB FPGA.
> Every single line can be configured as input and output.
>
> Push pull and open drain are supported as well as setting
> a debounce value for the input lines.
>
> Signed-off-by: Andreas Werner <andy@wernerandy.de>

Looks good.
Patch applied!

Yours,
Linus Walleij
