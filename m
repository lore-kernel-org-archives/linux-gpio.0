Return-Path: <SRS0=m41j=ZF=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90DB0C43331
	for <linux-gpio@archiver.kernel.org>; Wed, 13 Nov 2019 09:54:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 667D1222D0
	for <linux-gpio@archiver.kernel.org>; Wed, 13 Nov 2019 09:54:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h+iOJ/lm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727325AbfKMJym (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 13 Nov 2019 04:54:42 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:43081 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726598AbfKMJym (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Nov 2019 04:54:42 -0500
Received: by mail-lf1-f65.google.com with SMTP id q5so1404096lfo.10
        for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2019 01:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NjW+IedaOCXAkyJO80s66UdolTisPSVRQNrhxqL8/tI=;
        b=h+iOJ/lmBaYMUiakQH+OhBK5S6dC19GqPLB5z/c4vRvYSgDYoTphjJwx4S9kWLJqzF
         UHkNxl0mQQ7uXT9DtPoqDb6d23Ul5FcH7JY69VRMcyOlsYd1I580sxY9whhEs0wB15gV
         d1iXV8fGxxTwrapFdBCTT9DfhkG5LjkRzRdvZpNeI/3efyGLNDLc+n1QGDoaWKwc0w1r
         d9Y62XXifEO2jN+sTWEdKiTDt+N2zCZjW9kEFg8YL8TWhatfZyCUeBGeyJFQVwQFwlSW
         hnZURbviopDz8yce9pOqFLsXchdtuOqei7EIajAyWLn3tuy89OrLF0joZKqXLxu2g/aj
         WuOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NjW+IedaOCXAkyJO80s66UdolTisPSVRQNrhxqL8/tI=;
        b=Jgllhn/1CNGuiWPz/J908LUhCtbyaOS1BIw3DtiMD3MTWc3xU2NO+Tmu/YBUlC/zUE
         eb/IuD4Pra24O4mLN+Octfc9D97U2RKxB+FrI4BSe+n4wcgXlfVFvm2dB5H8zb+4G3zL
         zQ+m9YBigfF9IMD5IuuowX+v+l6OwupeVz/Ip08qixHHFyYU0dxbu3FqW7q4rT0YC1Mx
         136RnYNz5hK5grzWe20m2weToEeulUws4K2+CsvGqmzPVCgenXz4/Ait07NJ8KUwAea7
         pSDAYdD3ryBb6yb/NKlp++Ow6kfAQ93Hdko1w4vtZxiTX5IsLOoKrOIv5imCZYZRJGpi
         4pXg==
X-Gm-Message-State: APjAAAVDQjvjaEf7mJ3iy/IPmlHnfe8/BRrEKKx4uV0pthjmfFv/Uv7w
        SEBKIfKxUZTQQWN5mVZT6oKo6Grm8SasgUHk66AcnFVYEjk=
X-Google-Smtp-Source: APXvYqyamtJXMe2f4s/In9JRpXnh6uGxtcHeWja7ExhCCCc+QJn0pv+jtpSP6fMfb3dhw93RAvUARXDyzWbgPZTSrkM=
X-Received: by 2002:a19:651b:: with SMTP id z27mr1991102lfb.117.1573638880545;
 Wed, 13 Nov 2019 01:54:40 -0800 (PST)
MIME-Version: 1.0
References: <20191106144829.32275-1-andriy.shevchenko@linux.intel.com> <20191106144829.32275-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20191106144829.32275-2-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 13 Nov 2019 10:54:28 +0100
Message-ID: <CACRpkdYGBk_S4kF2DfZ9abMOj5oH=1rRQ_VBuO3pK_PPbxCUSg@mail.gmail.com>
Subject: Re: [PATCH v1 1/8] pinctrl: lynxpoint: Move GPIO driver to pin
 controller folder
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 6, 2019 at 3:48 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

This Kconfig symbol goes away:

> -config GPIO_LYNXPOINT

This one appears:

> +config PINCTRL_LYNXPOINT

As long as you're certain this will not cause any problems it's
fine by me (thinking people who have old configs etc).

Yours,
Linus Walleij
