From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] pinctrl: dt: at91: new binding
Date: Sun, 29 Mar 2015 13:55:09 -0700
Message-ID: <CAOesGMgsyEwuF95FFe81Li8nXO0MhHF0ZHPVV91MEH-JGO43tA@mail.gmail.com>
References: <1424943294-8805-1-git-send-email-plagnioj@jcrosoft.com>
	<CACRpkdbNLE+VjhvSgsU4oqAc03ieCNyiLkUzbjEiu_LFof-Unw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:35110 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752487AbbC2UzK (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 29 Mar 2015 16:55:10 -0400
Received: by oiag65 with SMTP id g65so112631604oia.2
        for <linux-gpio@vger.kernel.org>; Sun, 29 Mar 2015 13:55:09 -0700 (PDT)
In-Reply-To: <CACRpkdbNLE+VjhvSgsU4oqAc03ieCNyiLkUzbjEiu_LFof-Unw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Stephen Warren <swarren@wwwdotorg.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "arm@kernel.org" <arm@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>

On Tue, Mar 17, 2015 at 5:07 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Thu, Feb 26, 2015 at 10:34 AM, Jean-Christophe PLAGNIOL-VILLARD
> <plagnioj@jcrosoft.com> wrote:
>
>> +For each peripheral/bank we will descibe in a u32 if a pin can be
>> +configured in it by putting 1 to the pin bit (1 << pin)
>
> This seems to be describing driver intrinsics in the device tree, like
> how the hardware is routed on the inside and what it can do.
>
> IMO that is driver territory, the driver should know these limitations
> and protest if you try to do something illegal.
>
> Anyway as the AT91 maintainers seem to disagree I will allow some
> more time for discussion before merging the patch.
>
> I can't really have one AT91 maintainer NACKing another, it doesn't
> matter that this is a separate driver, in my book the MAINTAINERS
> entry for AT91 as a whole overrides that so can you please find an
> agreement on how to handle this or I will stall the patch until
> you're in agreement.

Nicolas has been the de-facto maintainer of AT91 for quite a while
now, even though more of them are listed on the maintainers entry. It
would be inappropriate to merge something that he disagreed with on
that platform.

> ARM SoC maintainers input would be welcomed.

It seems appropriate to ask the at91 folks to come back with a
solution that everybody is OK with, and until then hold off merging
this.


-Olof
