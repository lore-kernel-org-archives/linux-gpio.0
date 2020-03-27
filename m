Return-Path: <SRS0=HDci=5M=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99ABBC43331
	for <linux-gpio@archiver.kernel.org>; Fri, 27 Mar 2020 10:37:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6AC2420714
	for <linux-gpio@archiver.kernel.org>; Fri, 27 Mar 2020 10:37:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kuh6tIjT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726400AbgC0KhX (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 27 Mar 2020 06:37:23 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:41632 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726165AbgC0KhW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Mar 2020 06:37:22 -0400
Received: by mail-lf1-f65.google.com with SMTP id z23so7432885lfh.8
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2020 03:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4Vut7VTM7zs8ysH2B780ttrV051MkOP9F58aRnk6Cy4=;
        b=Kuh6tIjTFFoRTadz8ATz0SFS70JETusKnlolh2hu3umOXxgAaqXAG22Jz0eGeJvuSv
         Py8+njw29WvZ0Mjz7rC76QpmsfhRwfOulZsHidLIPPHKU270HX6SYTbuwkamkVOdM+qs
         Yuv7GQ9/MwN8JX6PsMBwUv6vVFiy28fBwPVc87KzVRNtHV/U6q9v6pIyBDEqRiMGCy4w
         OjgWcrarThtJYwB7cCz0nBYWmHXenzaVyiGZSENgdj4gKqmtzpbH+6IKEQtMTw049iRA
         /vvmVT17EcX610ymkNOegvRb3H7kRZOELLBzB+8Hp1i4uMQCAZohq/qpqqmMtDogmQXL
         Qq8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4Vut7VTM7zs8ysH2B780ttrV051MkOP9F58aRnk6Cy4=;
        b=qAByapVpn3vy5+LIVQ7BaF1IqJ92EYmP06sxiNodvyzWKWcFJMAGWOY4Zk7aC5cORb
         YSaeKCrtOw/6tk/+to4MOK5LNWucU7lP7LdLqAQvUVbKN2Wh6v3Qod2CHBBTwqCPVyKU
         4LiYR6ANOJDEBuz2Eiufkzn1/ty8D6ZnmV0tWV/97C9yfNsE0dOjqpr518X+1R1xbMuo
         vZ64UofwlgdXltX21/ujuvy0j8DJ6AEggmeGaeoTOXSKtKWcAGpJ4yOq7Q8Jo/hyt2ln
         4/hn7zkRzaHpMC9QPyPNSsOQBs7T2WCkg5IWrVDiphS1MPSaAmwHzrffgTpPHjOLxoAW
         B6Kw==
X-Gm-Message-State: AGi0PuaTmvsAOPXUew84bKWHIioUYybd4rnEI5LsAX8fWfvmwKkdyXQI
        nVqIIlcmNs9yOMVOcNkzFohwcADMs5utDySS1QvTUA==
X-Google-Smtp-Source: APiQypIR2wA4g/0jaaOBlxu9E5xNVvbe/zDIM3SSAhpl1yLArRSZKVGdzEd6rwtgYKagGojPKD3FAt7LUBSldz2ZbJg=
X-Received: by 2002:a19:be92:: with SMTP id o140mr711841lff.217.1585305438741;
 Fri, 27 Mar 2020 03:37:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200319122737.3063291-1-thierry.reding@gmail.com> <20200319122737.3063291-2-thierry.reding@gmail.com>
In-Reply-To: <20200319122737.3063291-2-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Mar 2020 11:37:07 +0100
Message-ID: <CACRpkda5M4NPvMBBLg+_2BJw7ZmryrgN72JZL_XAFQ137s0OLA@mail.gmail.com>
Subject: Re: [PATCH 1/9] gpio: Support GPIO controllers without pin-ranges
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 19, 2020 at 1:27 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> Wake gpiochip_generic_request() call into the pinctrl helpers only if a
> GPIO controller had any pin-ranges assigned to it. This allows a driver
> to unconditionally use this helper if it supports multiple devices of
> which only a subset have pin-ranges assigned to them.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Patch applied.

We have some drivers like this:
drivers/gpio/gpio-pl061.c:

        if (of_property_read_bool(dev->of_node, "gpio-ranges")) {
                pl061->gc.request = gpiochip_generic_request;
                pl061->gc.free = gpiochip_generic_free;
        }

Should we just make a patch assigning these callbacks
unconditionally as a follow-up?

Yours,
Linus Walleij
