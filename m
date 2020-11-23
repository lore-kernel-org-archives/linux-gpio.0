Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73127C6379D
	for <linux-gpio@archiver.kernel.org>; Mon, 23 Nov 2020 11:38:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 201172072C
	for <linux-gpio@archiver.kernel.org>; Mon, 23 Nov 2020 11:38:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="GP6m8RyI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729073AbgKWLiT (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 23 Nov 2020 06:38:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729065AbgKWLiR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Nov 2020 06:38:17 -0500
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97C39C0613CF
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2020 03:38:15 -0800 (PST)
Received: by mail-io1-xd42.google.com with SMTP id r1so17722941iob.13
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2020 03:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sEIHaRLdY4svcO0dyu5eHM/rtedUHkcmJRMa0FJMPJ4=;
        b=GP6m8RyIlIMmZWhzQpFvb5uqltAbBrJIWzbigUfPD/CoTvEfIbJUved+YUui+XamxY
         k5QVhcO/me59EEhzByCglAbrUOUOGk98xLwY7/bImqoCc8qdH2hrlHubzkgM8PwKbKm4
         zNuZV84srSen76EKhGMTd29pdnTEkKYqLXTS/A86ZZuXmRcwMRmGqKaOUuzll6u5Tuqh
         kiNtxCysEvymxxuqzORRu+no96GgOtLJ0F3skW9e4+oJgyVTF4bolmPY4HguK1d2yfbU
         P6+sXExhA0tZM7zScpKtlkSiD2acEjI1gf1aqfdXBN/aEgRZJRQ0TgeO8TRA/iC7Zaec
         6Z/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sEIHaRLdY4svcO0dyu5eHM/rtedUHkcmJRMa0FJMPJ4=;
        b=nEJCKpgfQ8x1OkvOmGay4ybPCCSTQqTKNeFyv37vSZR/wxGMHZVsSHqG8caFGo+VOi
         Z44bibCNG0QPvLWJdwZSGGa5ILQdNLHL/VSI3LWjbc6qyIPhOAh2YoUke+XntB4Nn+G2
         +xrlwmkceUudnILvLlb8fKqvcVbULF87XLRqF6ja/U2eelcQnR+VGihsXcXgcVnYVGDl
         V5yt36S2cIHlRWe9Xq3sifOwFB0XI6skq49ceHqGNdCkGPqr8NTLjjThDLPrvZfpYnia
         qcqJDfYLUelnle7qFBpVqdUDgyeqxUKGjaY9Oa2pQ/ge5YjjxTGQTmadezBnDzjwApY0
         uR/g==
X-Gm-Message-State: AOAM533JEE4YhIJ2+UZ7MdZKq5MpZir+CBQxhFFBiC8O0iz2bIC56KFg
        8xjNGL1qHVGm0BEU1kdL5mX1/eHpRaj2OX4FdifR0xpah0s=
X-Google-Smtp-Source: ABdhPJwVWjnYz+DgMBvZLuctxMME863ELoTZlJt0e3QGm9tmGD80Gw3gBjJBbEg2Uy/5yLtDkdjEqNDARU2M0VxgukY=
X-Received: by 2002:a02:65cf:: with SMTP id u198mr28286999jab.24.1606131495039;
 Mon, 23 Nov 2020 03:38:15 -0800 (PST)
MIME-Version: 1.0
References: <20201116104242.19907-1-brgl@bgdev.pl>
In-Reply-To: <20201116104242.19907-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 23 Nov 2020 12:38:04 +0100
Message-ID: <CAMRc=Mdkr+65Nu7ddjtMHTbedpNf22w1bE97vipKSdXBYm8=fw@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] gpio: exar: refactor the driver
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        David Laight <David.Laight@aculab.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 16, 2020 at 11:42 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> I just wanted to convert the driver to using simpler IDA API but ended up
> quickly converting it to using regmap. Unfortunately I don't have the HW
> to test it so marking the patches that introduce functional change as RFT
> and Cc'ing the original author.
>

Hi Jan!

Could you give this last version a final spin before I merge it?

Bartosz
