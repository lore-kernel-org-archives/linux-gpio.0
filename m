Return-Path: <SRS0=XsiZ=XF=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE90C3A5A2
	for <linux-gpio@archiver.kernel.org>; Tue, 10 Sep 2019 10:22:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E2F12206A5
	for <linux-gpio@archiver.kernel.org>; Tue, 10 Sep 2019 10:22:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vK1D15dW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728989AbfIJKWl (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 10 Sep 2019 06:22:41 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38302 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726509AbfIJKWl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Sep 2019 06:22:41 -0400
Received: by mail-lj1-f193.google.com with SMTP id y23so15508938ljn.5
        for <linux-gpio@vger.kernel.org>; Tue, 10 Sep 2019 03:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/RnO7aDpzX5C5EyL4y2IfgyW41OmQo4u8v7lMN7YHKQ=;
        b=vK1D15dW6aK1jvV0nmXA12AyrRJ4vLk03n2a23yq0lZRGq48xLdY0RhJGf/oVx3ddU
         BUAjXvFBI/R3XlUEEH3n9JnN/c8UDxlRqcZ0ljT/0fp2iSi9QNFMbGUQ1uNvvf/pHRBf
         yY68Kq2lxaiYmbOSRv4PDu75QITFpvy/hmgAYMpzQ4dWeFI7almhAIwEc7t5+FspOqdW
         RCKI6Rw+pO36dveGJhF4K3kXhysgPyGbM8rk1Ptjz4PRpFBDezeBWpCpFOHSXJjUnNaQ
         CgVPB0tp5Gh/UsxejI6EgLuWO/WSB1of8qF1yn/BDTBwMYqJmaoxG9DlUKZtw5/EGyMd
         dnPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/RnO7aDpzX5C5EyL4y2IfgyW41OmQo4u8v7lMN7YHKQ=;
        b=sb3xXnbnM2QM5tItotSqKtxKYJLaamVqStVgA6Tr+VwmZsZwxVmntcTM8QUq1+Eztr
         XMvIPMTiz1QEX7n3ba24chehzTM6p8UiUP6HpMM9eXGMWrsdzuYcwO8rQtrucz7JGzTN
         7lID4B153UMEYlT0kQObj6dJ4jU8BIFS1qHqrGN4bDt8OCutxV4UB7dqLSkbvdFuSupZ
         TN0h1GaZ74lX31sOxMJ52zmq2dXh6shnFnG7yaba2NmOKXwYU3SdJZKtOPEXYpIQ9F+U
         xaeGDR3Z+n/EeOv7tbKen1xAnhQnhjYGelfHVbwOJrPRDgCusAT5f/oQPx0kFCsMm0Fz
         LDOA==
X-Gm-Message-State: APjAAAW5ZNOvtnG7Re/SwFrxzSV3z4SldyDD+nokpUrHIPsTCkw795zD
        3GMYg/6IoDLGWWdehR3xg4Ojo/scaaZU855vvQBc5g==
X-Google-Smtp-Source: APXvYqxTmNO1MGnu8vYhnE2IUmvw4ev8RpQUmIyLWCAtSHO9mqRjl78UFY8OZp8Ndh+gq+efvNad6aAMm/6X66YLAJ8=
X-Received: by 2002:a2e:8056:: with SMTP id p22mr14060234ljg.69.1568110959123;
 Tue, 10 Sep 2019 03:22:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190906084539.21838-1-geert+renesas@glider.be>
In-Reply-To: <20190906084539.21838-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Sep 2019 11:22:27 +0100
Message-ID: <CACRpkdax+KYuB9Gs4V-9wnFu=DPu0MNCmOupeNkUEa-pNdSZig@mail.gmail.com>
Subject: Re: [PATCH 0/4] gpio: API boundary cleanups
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 6, 2019 at 9:45 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> This patch series contains various API boundary cleanups for gpiolib:
>   - The first two patches make two functions private,
>   - The last two patches switch the remaining gpiolib exported functions
>     from EXPORT_SYMBOL() to EXPORT_SYMBOL_GPL().

Good stuff, let's merge for early v5.4 (possibly rebasing if necessary).

> After this there is only a single GPIO driver function exported with
> EXPORT_SYMBOL();
>
>     drivers/gpio/gpio-htc-egpio.c:EXPORT_SYMBOL(htc_egpio_get_wakeup_irq);

Kill it. People using this platform should step up if they need it.
The outoftree code was at handhelds.org and that web site is
even down. There is a copy of their git tree on github
somewhere but it is definately not maintained.

Yours,
Linus Walleij
