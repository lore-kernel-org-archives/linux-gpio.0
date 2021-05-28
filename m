Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63F4AC47089
	for <linux-gpio@archiver.kernel.org>; Fri, 28 May 2021 00:23:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 315DB613BE
	for <linux-gpio@archiver.kernel.org>; Fri, 28 May 2021 00:23:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbhE1AZL (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 27 May 2021 20:25:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229760AbhE1AZK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 May 2021 20:25:10 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56B18C061574
        for <linux-gpio@vger.kernel.org>; Thu, 27 May 2021 17:23:36 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id c15so3091904ljr.7
        for <linux-gpio@vger.kernel.org>; Thu, 27 May 2021 17:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fQ8K8hJ588LkHR6tCv8Mkq36x5bXr3IVcY7yCuXy/Kw=;
        b=xSR4XLKSEXHNIFQBbMA4PgyCihbXnCcmj+bKm0fnH8hwtuucOePkYZR6b0nHb0C7Wd
         BcNDuo4Dl1js60oIYD0gRtWtB69u++NHsDF7aaa32VJVMBYjfMbTFZ2GQm9N/fDu+5Bs
         zkVzpcteKxkNAwT6T1fLdSQUsKVZ1Sijd+T4t1rY4rxb4IezSgoqnPkKZzj7am0cNKMd
         5HPLdXDkIXRFw20JS6QuUd92T+vsRhbQRi3epsX4aIKzJdnA//QBD0OScGeWD8ZEtq7K
         D8yiadIThTvL/Uy7g4/pqBfZLRwUT1FPPMmN5RP2WwB5ugO2b6fRqHPLvCU0FmSx81gJ
         /IPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fQ8K8hJ588LkHR6tCv8Mkq36x5bXr3IVcY7yCuXy/Kw=;
        b=qOEnjmj9jiVtUE20E7ARF1nTIXuvQ7feRbprHkRJRSuREpeoyIzgB9MloaDonSQjjh
         muAXZKDgZVMDpdHoX7SN849zQ+sD/HiimQtpCxXLshzbzDyqoAt7AnlRaiI8Qr0rxTMx
         p9P8OC/dnWNUdmuYUMw8PVN5AO8PpXp/d52I3/bIt/PlBLuBF2stxwgpN/aiygbZx0Jt
         B0rvl5lZVR/2J5whj3pylNsQMZzdE179qXwk6JXdOWSR7Y60bx7t8rLuLq95hWTu9lw0
         ZmqBWOOxjE7cf91eMdJczFzv/pZxMivY0zMtpUVQWj3CG5kV7eSUOHQYBwJi2q1Vjumt
         oq5Q==
X-Gm-Message-State: AOAM533Nh/wXiZeXuhNRrqD5VHjxT2VDckP53iBht4enRs04fOP+CbxM
        +sKl9enbGa86pSMMaXCAOry6F3tcvT7WSHOk51Rjwg==
X-Google-Smtp-Source: ABdhPJzlK0bHwuJmklUdp/G99p+kNtQBJP0yPobbBHxkx8HxgNbaX3XMvPVVY6U7GQJn3Sx5SywTDE6hRUCI+nSmFtI=
X-Received: by 2002:a05:651c:1049:: with SMTP id x9mr4421003ljm.467.1622161413876;
 Thu, 27 May 2021 17:23:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210325122832.119147-1-sandberg@mailfence.com>
 <20210517165847.206316-1-sandberg@mailfence.com> <20210517221343.GA2936462@x1>
In-Reply-To: <20210517221343.GA2936462@x1>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 May 2021 02:23:23 +0200
Message-ID: <CACRpkdaSESz7UFUKoRwpVFfyE8Vjz=zszh2NyPGf9khiJGQKmg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] gpio: add generic gpio input multiplexer
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Mauri Sandberg <sandberg@mailfence.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I can't see the mails in this RFC series but it looks interesting and quite
useful.

Looking forward to the next posting.

Yours,
Linus Walleij
