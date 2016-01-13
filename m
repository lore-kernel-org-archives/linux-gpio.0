From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: [PATCH] pinctrl: mvebu: add 98dx1135-pinctrl
Date: Wed, 13 Jan 2016 20:12:40 +0000
Message-ID: <5d134b2f14dc4374baca0155455c6c49@svr-chch-ex1.atlnz.lc>
References: <1449794673-9461-1-git-send-email-chris.packham@alliedtelesis.co.nz>
 <cca7142e25a5417e82495e25e54eb01f@svr-chch-ex1.atlnz.lc>
 <CACRpkdaXWaXYW86E+Qr1VgPz0LGNGha7AXUZUqOjK=7c9K=--Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:60173 "EHLO
	gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758457AbcAMUMy convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Jan 2016 15:12:54 -0500
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 0CD9C806F4
	for <linux-gpio@vger.kernel.org>; Thu, 14 Jan 2016 09:12:49 +1300 (NZDT)
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "maxime.coquelin@st.com" <maxime.coquelin@st.com>, "plagnioj@jcrosoft.com" <plagnioj@jcrosoft.com>, "hongzhou.yang@mediatek.com" <hongzhou.yang@mediatek.com>, "patrice.chotard@st.com" <patrice.chotard@st.com>, "fabf@skynet.be" <fabf@skynet.be>, "valentin.longchamp@keymile.com" <valentin.longchamp@keymile.com>

On 01/14/2016 04:03 AM, Linus Walleij wrote:
> On Sun, Jan 10, 2016 at 8:50 PM, Chris Packham
> <Chris.Packham@alliedtelesis.co.nz> wrote:
>>
>> Ping?
>
> I didn't see this because I was on the CC not TO line in the mail.

Noted. I'm used to projects with To: List Cc: Maintainer policies. I'll 
make sure to flip my send-email defaults

> Will look at it after the merge window. Do you have ACKs from the
> mvebu driver maintainers?

No ACKs yet, probably for the same reason you missed it plus the holiday 
season.

I was hoping someone would have some suggestions to tackling the long 
V(...) lines. The armada-xp pinctrl driver has some additional macros 
that group common variants together. pinctrl-kirkwood.c has about a 
dozen V() variants so it should be possible to do something similar if 
we could come up with some sensible names (as we all know naming things 
is an NP-hard problem).

Thanks,
Chris
