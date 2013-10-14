From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: nomadik: mark GPIO lines used for IRQ
Date: Mon, 14 Oct 2013 10:13:25 +0200
Message-ID: <CACRpkdZdsMpiRzdOmpVZ08iOQ+oPf=vr43nr9zSDzzkEWzc4mw@mail.gmail.com>
References: <1381483949-12208-1-git-send-email-linus.walleij@linaro.org>
	<52584EB6.7020604@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f182.google.com ([209.85.223.182]:42965 "EHLO
	mail-ie0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751102Ab3JNINZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Oct 2013 04:13:25 -0400
Received: by mail-ie0-f182.google.com with SMTP id as1so10553620iec.27
        for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2013 01:13:25 -0700 (PDT)
In-Reply-To: <52584EB6.7020604@wwwdotorg.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Enric Balletbo i Serra <eballetbo@gmail.com>, Grant Likely <grant.likely@linaro.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

On Fri, Oct 11, 2013 at 9:17 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:
> On 10/11/2013 03:32 AM, Linus Walleij wrote:
>> When an IRQ is started on a GPIO line, mark this GPIO as IRQ in
>> the gpiolib so we can keep track of the usage centrally.
>
> Are you planning on converting all GPIO+IRQ drivers, or should others
> port this fix?

Hm I think I will post patches for "my" GPIO drivers that I can test, and
try to set a good example. If nothing happens I guess I have to go in and try
to enforce it.

A tested patch to gpio-tegra.c would be appreciated :-)

My "devel" branch should be out today for those who want a
baseline to test against.

Yours,
Linus Walleij
