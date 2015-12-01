From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH] ARM: pxa: make more mach/*.h files local
Date: Tue, 01 Dec 2015 08:22:34 +0100
Message-ID: <87a8pu7hvp.fsf@belgarion.home>
References: <1905725.SU2iekYqHg@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp04.smtpout.orange.fr ([80.12.242.126]:41363 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755173AbbLAHWi (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Dec 2015 02:22:38 -0500
In-Reply-To: <1905725.SU2iekYqHg@wuerfel> (Arnd Bergmann's message of "Mon, 30
	Nov 2015 15:53:01 +0100")
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Arnd Bergmann <arnd@arndb.de> writes:

> Lots of header files are never included outside of a mach-pxa
> directory and do not need to be made visible in include/mach,
> so let's just move them all down one level.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> I've been carrying patches like this one in my multiplatform series
> for a while, the PXA one is the largest.
>
> I'd like to merge that for 4.5, any objections?
No, I like this very much.
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

> Do you want to take it into a PXA branch to avoid conflicts, or should
> I put it into arm-soc directly?
I don't have any patch so far queued for v4.5, so please take it, I think I'll
skip v4.5 pull.

Cheers.

--
Robert
