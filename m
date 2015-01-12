From: Arnaud Patard (Rtp) <arnaud.patard@rtp-net.org>
Subject: Re: [PATCH v1 3/5] gpio: iop: convert to use basic mmio gpio library
Date: Mon, 12 Jan 2015 14:39:45 +0100
Message-ID: <87387g5d9a.fsf@lebrac.rtp-net.org>
References: <1417435778-21879-1-git-send-email-kamlakant.patel@linaro.org>
	<1417435778-21879-4-git-send-email-kamlakant.patel@linaro.org>
	<CACRpkdYb0abvdSeU0A7UzrkhoADtV6X2QrxtV1h2pPg+HqP=1g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from lebrac.rtp-net.org ([195.154.106.105]:59519 "EHLO
	lebrac.rtp-net.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751675AbbALNsM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Jan 2015 08:48:12 -0500
In-Reply-To: <CACRpkdYb0abvdSeU0A7UzrkhoADtV6X2QrxtV1h2pPg+HqP=1g@mail.gmail.com>
	(Linus Walleij's message of "Fri, 9 Jan 2015 10:19:11 +0100")
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Kamlakant Patel <kamlakant.patel@linaro.org>, Lennert Buytenhek <kernel@wantstofly.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Dan Williams <dan.j.williams@intel.com>, Mikael Pettersson <mikpe@it.uu.se>

Linus Walleij <linus.walleij@linaro.org> writes:


Hi,

> Lennert/Arnaud: is any one of you guys still maintaining and testing
> IOP stuff so you can say something about this patch?

I'm still using my iop(80219) system to do backups. So, on the good side, I
still care about it, but on the bad side, it's not easy for me to test
kernels on it.

>
> Or should I just apply it?

I would prefer that some testing is done before applying. I just don't know when
I'll be able to do. Maybe it's easier for Lennert to test it ?

Arnaud
