From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4] gpio: Driver for SYSCON-based GPIOs
Date: Wed, 5 Mar 2014 09:11:54 +0800
Message-ID: <CACRpkdbc5SZYC-1eC=er+HmBxp6a77Nwzr46Vv7BFk882TRLDg@mail.gmail.com>
References: <1389632203-22806-1-git-send-email-shc_work@mail.ru>
	<CACRpkdaVn0iNFYKE3HXWxnb4iCJorF0HSVG4Uvz8Q18SiF5PUQ@mail.gmail.com>
	<20140218232520.GA22492@quad.lixom.net>
	<20140225190923.fdd969463717061aea582551@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f42.google.com ([209.85.219.42]:58965 "EHLO
	mail-oa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754936AbaCEBLz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Mar 2014 20:11:55 -0500
Received: by mail-oa0-f42.google.com with SMTP id i4so359358oah.1
        for <linux-gpio@vger.kernel.org>; Tue, 04 Mar 2014 17:11:55 -0800 (PST)
In-Reply-To: <20140225190923.fdd969463717061aea582551@mail.ru>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Tue, Feb 25, 2014 at 11:09 PM, Alexander Shiyan <shc_work@mail.ru> wrote:
> On Tue, 18 Feb 2014 15:25:20 -0800
> Olof Johansson <olof@lixom.net> wrote:

>> If we have more drivers like these down the road we can make a common shared
>> binding, but until then I don't think there's much point in it.
>
> Is this proposed to remove the generic implementation?
> Linus, what is your opinion on this?

That is better, because it relieves me from the pain about this
driver. (Sorry for slow answers.)

So instead of this:

+- compatible: Should contain one of the following:
+  - "clps711x,syscon-gpio-mctrl": For ARM CLPS711X SYSFLG1 MCTRL GPIOs.

Something more like

"cirrus,clps711x-syscon-gpio"

I guess?

Yours,
Linus Walleij
