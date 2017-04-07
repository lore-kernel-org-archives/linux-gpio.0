From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: f7188x: Add F71889A GPIO support.
Date: Fri, 7 Apr 2017 12:27:10 +0200
Message-ID: <CACRpkdbkkA6uJEgcBWj19DB6TLimie50pZoj_J+i8mt2BkQ_RA@mail.gmail.com>
References: <20170407004205.45btnkgk7k5jv3td@tha-monstah.mydomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f173.google.com ([209.85.223.173]:34090 "EHLO
        mail-io0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932632AbdDGK1L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Apr 2017 06:27:11 -0400
Received: by mail-io0-f173.google.com with SMTP id b140so46842463iof.1
        for <linux-gpio@vger.kernel.org>; Fri, 07 Apr 2017 03:27:11 -0700 (PDT)
In-Reply-To: <20170407004205.45btnkgk7k5jv3td@tha-monstah.mydomain>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Marty Plummer <netz.kernel@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Fri, Apr 7, 2017 at 2:42 AM, Marty Plummer <netz.kernel@gmail.com> wrote:

> Add F71889A GPIO support.
>
> Fintek F71889A is a SuperIO. It contains HWMON/GPIO/Serial Ports.
>
> Datasheet:
> http://www.alldatasheet.com/datasheet-pdf/pdf/459076/FINTEK/F71889A.html
>
> Its virtually identical to the F71889F superio as far as gpios go.
> One oddity is GPIO2 at index 0xD0; the datasheet only lists gpio's 7-5,
> but it logically seems that it should continue down to 0. I'm not sure
> if the driver can handle gpios that are shifted away from index 0 as it
> currently stands.
>
> Signed-off-by: Marty Plummer <netz.kernel@gmail.com>

Patch applied.

Yours,
Linus Walleij
