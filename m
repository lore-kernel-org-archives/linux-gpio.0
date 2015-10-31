From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: group port-mapped I/O drivers in a menu
Date: Sat, 31 Oct 2015 22:11:13 +0100
Message-ID: <CACRpkdYOGCD7D98kBeKmJXA31KEpYR+HPQiDep1QFz60F2v9rQ@mail.gmail.com>
References: <1446197896-5383-1-git-send-email-linus.walleij@linaro.org>
	<20151030154645.GA1156@ketchup.mtl.sfl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:35087 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750920AbbJaVLO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 31 Oct 2015 17:11:14 -0400
Received: by obctp1 with SMTP id tp1so68752619obc.2
        for <linux-gpio@vger.kernel.org>; Sat, 31 Oct 2015 14:11:14 -0700 (PDT)
In-Reply-To: <20151030154645.GA1156@ketchup.mtl.sfl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, William Breathitt Gray <vilhelm.gray@gmail.com>, Andreas Bofjall <andreas@gazonk.org>, Simon Guinot <simon.guinot@sequanux.org>, =?UTF-8?Q?Diego_Elio_Petten=C3=B2?= <flameeyes@flameeyes.eu>, Daniel Krueger <daniel.krueger@systec-electronic.com>, Bruno Randolf <br1@einfach.org>

On Fri, Oct 30, 2015 at 4:46 PM, Vivien Didelot
<vivien.didelot@savoirfairelinux.com> wrote:

>> +menu "Port-mapped I/O GPIO drivers"
>> +     depends on X86
>> +
>> +config GPIO_104_IDIO_16
>> +     tristate "ACCES 104-IDIO-16 GPIO support"
>> +     depends on X86
>
> Since the menu depends on X86, shouldn't we remove the "depends on X86"
> of its drivers?

Maybe. I'm scared of KConfig.

Will be a separate patch anyways.

Yours,
Linus Walleij
