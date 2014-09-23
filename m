From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib:change to use irq_alloc_descs_from to alloc virqs
Date: Tue, 23 Sep 2014 12:17:48 +0200
Message-ID: <CACRpkdZRmaUESyVrwD80GujR8BZ0YkqB6=K_mK_RzbmmcgdULQ@mail.gmail.com>
References: <35FD53F367049845BC99AC72306C23D103CDBFBFB017@CNBJMBX05.corpusers.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f170.google.com ([209.85.223.170]:60955 "EHLO
	mail-ie0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754825AbaIWKRt (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Sep 2014 06:17:49 -0400
Received: by mail-ie0-f170.google.com with SMTP id x19so6226835ier.29
        for <linux-gpio@vger.kernel.org>; Tue, 23 Sep 2014 03:17:48 -0700 (PDT)
In-Reply-To: <35FD53F367049845BC99AC72306C23D103CDBFBFB017@CNBJMBX05.corpusers.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Wang, Yalin" <Yalin.Wang@sonymobile.com>
Cc: "gnurou@gmail.com" <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>

On Tue, Sep 9, 2014 at 9:12 AM, Wang, Yalin <Yalin.Wang@sonymobile.com> wrote:

> this patch change use from irq_create_mapping to irq_alloc_descs_from,
> use irq_create_mapping to alloc virq one by one is not safe,
> it can't promise the allcated virqs are continuous,
> in stead, we use irq_alloc_descs_from() to alloc virqs in one time,
> so that the allocated virqs are in continuous bitmaps.
>
> Signed-off-by: Yalin Wang <yalin.wang@sonymobile.com>

OK makes sense, patch applied. The patch was BASE64-mangled
though. Fixed it up and applied.

Yours,
Linus Walleij
