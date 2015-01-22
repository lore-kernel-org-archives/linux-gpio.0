From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: mcp23s08: create default gpio base if neither
 device node nor platform data is defined
Date: Thu, 22 Jan 2015 12:15:58 +0900
Message-ID: <CAAVeFuJem7XCnCRYL3h-LCF5bTZ0-KYp=3ov6Tc0B2GpGAxnVw@mail.gmail.com>
References: <1421744408-8837-1-git-send-email-sonic.adi@gmail.com> <CACRpkdZP4DNph-Wivv7pUSaujhRtQQ7TmTinoD23D8z_dZtZnw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f174.google.com ([209.85.213.174]:36517 "EHLO
	mail-ig0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752249AbbAVDQT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Jan 2015 22:16:19 -0500
Received: by mail-ig0-f174.google.com with SMTP id b16so19104810igk.1
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2015 19:16:19 -0800 (PST)
In-Reply-To: <CACRpkdZP4DNph-Wivv7pUSaujhRtQQ7TmTinoD23D8z_dZtZnw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sonic Zhang <sonic.adi@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, =?UTF-8?Q?Antonio_Fiol_Bonn=C3=ADn?= <antonio@fiol.es>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, adi-buildroot-devel@lists.sourceforge.net, Sonic Zhang <sonic.zhang@analog.com>

On Thu, Jan 22, 2015 at 1:53 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Jan 20, 2015 at 10:00 AM, Sonic Zhang <sonic.adi@gmail.com> wrote:
>
>> From: Sonic Zhang <sonic.zhang@analog.com>
>>
>> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
>
> Patch applied for fixes with the ACK and Tested-by tags.

This was a very nice example of how bug reports should go: a clear and
detailed initial report, quick answer from involved parties, and the
fix applied, all in 5 days. Wish we could see more resolutions like
this - thanks to everyone involved.
