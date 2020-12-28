Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FE2EC433E9
	for <linux-gpio@archiver.kernel.org>; Mon, 28 Dec 2020 15:15:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6E31E207A1
	for <linux-gpio@archiver.kernel.org>; Mon, 28 Dec 2020 15:15:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441168AbgL1PP2 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 28 Dec 2020 10:15:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2441165AbgL1PP1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Dec 2020 10:15:27 -0500
Received: from forward501j.mail.yandex.net (forward501j.mail.yandex.net [IPv6:2a02:6b8:0:801:2::111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36E6EC061798;
        Mon, 28 Dec 2020 07:14:47 -0800 (PST)
Received: from sas1-d367461f7756.qloud-c.yandex.net (sas1-d367461f7756.qloud-c.yandex.net [IPv6:2a02:6b8:c08:fe02:0:640:d367:461f])
        by forward501j.mail.yandex.net (Yandex) with ESMTP id 5E6D63380462;
        Mon, 28 Dec 2020 18:14:45 +0300 (MSK)
Received: from localhost (localhost [::1])
        by sas1-d367461f7756.qloud-c.yandex.net (mxback/Yandex) with ESMTP id xPtDGTQQ3Y-EiD4HrWp;
        Mon, 28 Dec 2020 18:14:44 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1609168484;
        bh=eMEvBGrCjyuLCWBpkj/qNdYBm+d+Pb5cjsaFT46jPpA=;
        h=Message-Id:Cc:Subject:In-Reply-To:Date:References:To:From;
        b=QqIiuuM8OM/bLPzzW5TiF7S1fN6O6PaOIX+PVhSqpYdqs1dtnYkicOK/xUPMsC+f5
         EuC5DhAS7+NkEBV1fVHSYESRl4Xfy8PFTo9jn6e21n7NgMDecyppvBhgBzSIL2Bczo
         D7mmvn1Hp9lCr5ERxdKkViiubo99bYIdxC1TIZJ0=
Authentication-Results: sas1-d367461f7756.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by sas1-ffdbcd5f1d77.qloud-c.yandex.net with HTTP;
        Mon, 28 Dec 2020 18:14:44 +0300
From:   nikita.shubin@maquefel.me
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Hartley Sweeten <hsweeten@visionengravers.com>
In-Reply-To: <CACRpkdZ=QBGZ9G97+2xPRk4PTTSHGHL64bTLZGbz5kFsg-NqWg@mail.gmail.com>
References: <20201224112203.7174-1-nikita.shubin@maquefel.me> <CACRpkdZ=QBGZ9G97+2xPRk4PTTSHGHL64bTLZGbz5kFsg-NqWg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] gpio: ep93xx: convert to multi irqchips
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date:   Mon, 28 Dec 2020 18:14:44 +0300
Message-Id: <115071609167990@mail.yandex.ru>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

27.12.2020, 16:55, "Linus Walleij" <linus.walleij@linaro.org>:
> Paging Hartley who I think uses this chip.
>
> On Thu, Dec 24, 2020 at 12:22 PM Nikita Shubin
> <nikita.shubin@maquefel.me> wrote:
>
>>  I was lucky enough to became an owner of some splendid piece's of
>>  antiques called ts7250 based on the top of Cirrus Logic EP9302.
>>
>>  I don't know what fate expects this hardware (it's not EOL it's just Not
>>  recommended for new designs) but i wanted to share fixes in ep93xx gpio area.
>>
>>  It seems ep93xx is deadly broken at current state usage of AB gpiochips
>>  interrupts leads to deadlocks coused by irq_unmask/irq_mask recursions.
>>
>>  Port F is not working at all:
>
> Yeah when I converted this gpio driver I did not have access to a hardware
> which made use of port F :(
>
> I used the SIM.One board but they all died on me, then I acquired another
> EP93xx board that I just didn't have time to test.
>
> The long term plan is to convert these boards to use device tree and
> multiplatform. Interested in the job? ;)
>

I had such a thought, but I was stopped by the delusion that no one is using this 
hardware anymore.

Not promising anything right now - but such a job sounds like a real fun.

> Thanks for fixing up the GPIO chip, let's get the patches in shape and
> merge as fixes. Bartosz is handling the fixes right now, I'll try to review too!

I am glad that this work is interesting not only for me. For this, I'm willing to put in 
a little effort to make the proposed changes look decent.

>
> Yours,
> Linus Walleij
