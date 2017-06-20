From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 01/29] pinctrl.txt: standardize document format
Date: Tue, 20 Jun 2017 13:12:12 +0200
Message-ID: <CACRpkdbJop=1uhww1C69yMRPKD17fo1==Y6T6MNdebMctsfS5A@mail.gmail.com>
References: <cover.1495157082.git.mchehab@s-opensource.com>
 <d16c41b5f7022add66672d43b5d595af74a1db34.1495157082.git.mchehab@s-opensource.com>
 <CACRpkdaDZQQ7fprGkSvXiUHfqdM_zGkPe4_T3R-p55asCDeQCw@mail.gmail.com> <20170617120301.057229bc@vento.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f180.google.com ([209.85.223.180]:34128 "EHLO
        mail-io0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751038AbdFTLMO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Jun 2017 07:12:14 -0400
Received: by mail-io0-f180.google.com with SMTP id i7so82192862ioe.1
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jun 2017 04:12:14 -0700 (PDT)
In-Reply-To: <20170617120301.057229bc@vento.lan>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sat, Jun 17, 2017 at 5:03 PM, Mauro Carvalho Chehab
<mchehab@s-opensource.com> wrote:
> Linus Walleij <linus.walleij@linaro.org> escreveu:

>> Should the file be renamed pinctrl.rst now?
>
> If you just rename it, Sphinx will complain because it doesn't
> belong to any index.rst file. As this is part of drivers/, I guess
> the right thing is to add it to driver-api book.
>
> The enclosed patch should be doing it (it is based on linux-next).

Hey it just applies, so I tossed in this patch too, thanks a lot!

Yours,
Linus Walleij
