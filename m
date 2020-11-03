Return-Path: <SRS0=FMmw=EJ=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC45C2D0A3
	for <linux-gpio@archiver.kernel.org>; Tue,  3 Nov 2020 08:35:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3DF7F22264
	for <linux-gpio@archiver.kernel.org>; Tue,  3 Nov 2020 08:35:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JRtWlLfl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725982AbgKCIfx (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 3 Nov 2020 03:35:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725968AbgKCIfx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Nov 2020 03:35:53 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20C92C0613D1
        for <linux-gpio@vger.kernel.org>; Tue,  3 Nov 2020 00:35:53 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id i7so11184050pgh.6
        for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2020 00:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xXjBZzkYsQ/dScCzfPYq2N6uSJfnRp0wFjY4Xlshz0g=;
        b=JRtWlLflaWssmnGuQwJ08R/E2KG+DrZC5+cjfN1nrhewuPIaZdDxq+sR6frY8qV6uw
         YaPBg8ai6SVoQby9xH/K8x14mVWIIQidHbG5N3QL2SvR2BL7XDX6pwmrmMJThGKAtuJq
         5Vzg6B5217/ZhtHfaeDEnENwW7n4v0O+ZP9uV5LUnnRG7cNAOCkTTbP8kBwMceTZdcFd
         EDh7unVgSZUes/SBIZRXIz3b8614pLaUM7bc3xHkdVRvbmpPro4Y5sgaLhODatIcD1bq
         TWxoawug/0lfO3bhO5ub5RUjzUg3rbhWEyOjTDPKiApK+tWbNWpmPp/M6s1krbJ66VYh
         utjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xXjBZzkYsQ/dScCzfPYq2N6uSJfnRp0wFjY4Xlshz0g=;
        b=K+7Cz5eRnyTkPyE+v2ZvgwK8haDjgjRavIiDtbPNZETzVtrG0H6UX8KZXLUEuo6pqW
         Aj8YF1TrBpuz5zxc4vMRbnMMououV5W3Jy1ohRzILF3/RsTVoq3WxKOqeibCCTdzZbxk
         gI+iGkbZtERpZc5bUSfwrKoS2E9HbzFq8jB9qjr1T3U/FHPEhtPje3qnlS4Tps3SsVJo
         ElrPiB0uCqVHYBm3R5WZfQsCbIXNnNCfCpoanAmeOOkzNE8lZLrU9xQyZube99XocYf/
         Z9cvXH2AXxMgIaX1m4VXJSeHQXDkItPq8vBSQSYHo7Z04/pvGyjAEXtnnR0dZ+swQzmK
         KB7g==
X-Gm-Message-State: AOAM531eQ4eAi55BJQqRbHULu0h9SSswMzA4t205Ueudx7bcSQENJTWT
        +wEydTfrCSg5GxjOSsu54fyU+KUMQeQoYGfjXnI=
X-Google-Smtp-Source: ABdhPJyfsdt1j+2VN7PzuFPr9AcgkwAYwqRrU3Vv6SuiJhBiFiAbKAmOjnQKxXTcSRuWjKObobu2Wp0EepvbCUZVUJ0=
X-Received: by 2002:a63:31ce:: with SMTP id x197mr4293280pgx.74.1604392552760;
 Tue, 03 Nov 2020 00:35:52 -0800 (PST)
MIME-Version: 1.0
References: <20201022165847.56153-1-andriy.shevchenko@linux.intel.com>
 <20201022170319.GJ4077@smile.fi.intel.com> <CAHp75VfqQ97oLfRe03pkAbmoS6hq3P7ZScS7Jr1Y=ZAYgWmP7w@mail.gmail.com>
 <20201102165132.GR4077@smile.fi.intel.com>
In-Reply-To: <20201102165132.GR4077@smile.fi.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 3 Nov 2020 10:35:36 +0200
Message-ID: <CAHp75VfS+=moRT-Z9i02p-pt3Sh495qzr5XAqtbzfoeTFQiyuA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] gpiolib: acpi: Respect bias settings for GpioInt() resource
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Jamie McClymont <jamie@kwiius.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 2, 2020 at 6:51 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Mon, Oct 26, 2020 at 04:41:14PM +0200, Andy Shevchenko wrote:
...

> Linus, Bart, what do you think about this series?
>
> (Linus, the patch 3/3 has been already applied by Bart as it's independent to ACPI anyway)

I have sent a v3

-- 
With Best Regards,
Andy Shevchenko
