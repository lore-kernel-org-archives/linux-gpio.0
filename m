From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/8] IOP GPIO refactoring
Date: Fri, 13 Sep 2013 10:15:58 +0200
Message-ID: <CACRpkdYbHTF0XGu-wLAeaw-nnSTEPh-ej9iizMbojmB8gzvb=Q@mail.gmail.com>
References: <1378741198-12847-1-git-send-email-linus.walleij@linaro.org>
	<20130910141434.GD3379@blackmetal.musicnaut.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f44.google.com ([209.85.219.44]:32853 "EHLO
	mail-oa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754845Ab3IMIP7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Sep 2013 04:15:59 -0400
Received: by mail-oa0-f44.google.com with SMTP id l17so872174oag.3
        for <linux-gpio@vger.kernel.org>; Fri, 13 Sep 2013 01:15:58 -0700 (PDT)
In-Reply-To: <20130910141434.GD3379@blackmetal.musicnaut.iki.fi>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Lennert Buytenhek <kernel@wantstofly.org>, Dan Williams <dan.j.williams@intel.com>, Mikael Pettersson <mikpe@it.uu.se>, Alexandre Courbot <acourbot@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Tue, Sep 10, 2013 at 4:14 PM, Aaro Koskinen <aaro.koskinen@iki.fi> wrote:

> With patch 6 it starts to crash on first gpio_get_value(), I guess
> because gpio-iop platform device is not registered on N2100...?

I think I've fixed this with the v2 versions of patches 1-3, you can
pull in and test the entire stack on Torvalds HEAD from here:

git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git iop-cleanup

Yours,
Linus Walleij
