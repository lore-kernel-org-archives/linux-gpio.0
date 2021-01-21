Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 333FCC433DB
	for <linux-gpio@archiver.kernel.org>; Thu, 21 Jan 2021 12:20:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D68F72399A
	for <linux-gpio@archiver.kernel.org>; Thu, 21 Jan 2021 12:20:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728846AbhAUMU1 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 21 Jan 2021 07:20:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730963AbhAUMOj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Jan 2021 07:14:39 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B3BCC0613CF
        for <linux-gpio@vger.kernel.org>; Thu, 21 Jan 2021 04:13:54 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id h7so2197101lfc.6
        for <linux-gpio@vger.kernel.org>; Thu, 21 Jan 2021 04:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Myx5eVNR3ui/ZOjCm1kbNmJ8TPZ/ps+O2zKImwlnNDw=;
        b=PptR/y8axGlQYN9TjYXCbMoAG0s9YFu7WBRrSDpGtB4PxYHLcMVlk118pM5qfOWW5v
         cdsHHzq+NzVA64vjIHoOaI2pG6eW0HyXMNYzJYXP6uQco7rmyZcHEkwoT8jjWFlhYlqQ
         nipubU0tuAlSnFeEwTuF8RA75WkX9zhciNVZ4PsafyU0QOwCNiU415fObnn5VMdigI8L
         NcM4rsveU9bue68MPHVSzYNsfivoQ1vUVpip0p7Mzt1t+VH33AwCo1h133ny0FjMzsBC
         Xvjb0PjGMSD8YoQdRLpTuH+hy/ssqyzVR8IrtRmcQTCI9W3sRRXbwgF+lXfp0h0a1Tu1
         j/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Myx5eVNR3ui/ZOjCm1kbNmJ8TPZ/ps+O2zKImwlnNDw=;
        b=fbgD6XHIos4jxV/PjWk59it7D+KkI2mcjM2Etc0+o1OSR8cAWdUSG0iJ3xQsORUB1e
         VH+38nJ1qXxM5tbyCoDWGlR/iLL1l4kPHs1cpqLOpM0IKNumqZ8769WWUnt5uTEjrwiT
         XrI/MB89BYeePmaLCVBYnScu+ldj1O9H50rO34lsJv00ayPJ1OUSR+nal0e6t4MsQ8Rt
         bPV50qbwGUMWuiHE63VIV/uc5ywDfjhEN1ipEtgcfk7WbzZIVF2thx9SjtRxOddt4Ghp
         xmFQ2oLbrqB8oUxmFGA5vNv6hiZ25/Mq3iZi+SzcYwsRdLID5LyYiJY04tFC4vDKJeqC
         ddYA==
X-Gm-Message-State: AOAM530bqpwQ3ds7zAFFAKB9hOvEyqQzD8rpsJLc9jmpePZ0G488HSO7
        BkgHLoNS5yC5bHgBS61onpT3Hoex5n68T9QQyUWTVw==
X-Google-Smtp-Source: ABdhPJy4ogC8cUFfatEuWax8vy3nRxBHlsEqavCD4L8Eh8EmBpIGmwwKufkZvlfvqgQZlGAbFOE1QSnK8tLR9sU608M=
X-Received: by 2002:a19:8bc6:: with SMTP id n189mr6311874lfd.291.1611231233107;
 Thu, 21 Jan 2021 04:13:53 -0800 (PST)
MIME-Version: 1.0
References: <20210120132045.2127659-1-arnd@kernel.org> <20210120132045.2127659-3-arnd@kernel.org>
In-Reply-To: <20210120132045.2127659-3-arnd@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Jan 2021 13:13:42 +0100
Message-ID: <CACRpkdZWtGzLUnDg5G4CUnyc9NpSZoTu3Cf2qE-rNCNw6HXqag@mail.gmail.com>
Subject: Re: [PATCH 2/5] pinctrl: remove zte zx driver
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>, Jun Nie <jun.nie@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 20, 2021 at 2:20 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The zte zx platform is getting removed, so this driver is no
> longer needed.
>
> Cc: Jun Nie <jun.nie@linaro.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied.

Yours,
Linus Walleij
