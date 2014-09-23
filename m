From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/2] gpio: Increase ARCH_NR_GPIOs to 512
Date: Tue, 23 Sep 2014 17:23:14 +0200
Message-ID: <CACRpkdZ_-LY=RC48KB1aOGkqjeF1U24ddfvwef4pLarw_oN69w@mail.gmail.com>
References: <1410790185-31101-1-git-send-email-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f176.google.com ([209.85.223.176]:40035 "EHLO
	mail-ie0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753708AbaIWPXP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Sep 2014 11:23:15 -0400
Received: by mail-ie0-f176.google.com with SMTP id ar1so9260752iec.7
        for <linux-gpio@vger.kernel.org>; Tue, 23 Sep 2014 08:23:14 -0700 (PDT)
In-Reply-To: <1410790185-31101-1-git-send-email-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Alan Cox <alan@linux.intel.com>, Ning Li <ning.li@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Sep 15, 2014 at 4:09 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> Some newer Intel SoCs, like Braswell already have more than 256 GPIOs
> available so the default limit is exceeded. Instead of adding more
> architecture specific gpio.h files with custom ARCH_NR_GPIOs we increase
> the gpiolib default limit to be twice the current.
>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Patch applied with the extended blurb in the commit message.

Yours,
Linus Walleij
