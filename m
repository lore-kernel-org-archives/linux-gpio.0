Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DFC9C43334
	for <linux-gpio@archiver.kernel.org>; Wed, 15 Jun 2022 13:24:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352075AbiFONYL (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 15 Jun 2022 09:24:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344329AbiFONYK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jun 2022 09:24:10 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9E203EA89
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jun 2022 06:24:09 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id k2so20490044ybj.3
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jun 2022 06:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UJ8iaI1pTv/YM131C86Mnpd2Cs7gpkRb4SNOR9/hNuU=;
        b=WWCVGdRbgpyX4JC60E1knSS/uwhU4ze16f8ZReamCR9o1Dj27V6VmZMuQI0hMSj+0y
         eDBfWai5XlZ5g9HKJQGi9zFmX1Lcf0EnLacnZJ6TWl0+rAOvpYZ5XDVPq9TIYXjNe+gD
         R++DrE91aVAzvH96TpvA5xZsdxzx5ipVAqsl/TlyBQZAkwgGYHerQaBqkkjpNKvGVKmS
         0oKtDdUJrgqGw6Cv5T2Umy7PFz9gFsCxJKLWpKwJ1jwxkYMgK5ScDDRTp0axuRfKkNzh
         ken5dnpzo4+0PznZJYM50eS8aRlVxZZKF00zFbrTkTa+r5LcHNPX9BM8eM2M0I0vZj6I
         gEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UJ8iaI1pTv/YM131C86Mnpd2Cs7gpkRb4SNOR9/hNuU=;
        b=q40vy8orjSIFGDsdiSpH4tL5BuqVKnWBOqyHX3KA1tgs8G41v5qGrrXh6otddGjrOB
         6IzOaxXHkkg9xCV0qsNERlgpZsezV2lhcchk8R4HIOzp08qhjG8xdzWwUNGAcLbcQ8qy
         0KiSNqJR77SEQQGV80IzKNDC6gqXpolo5zyiIV6MDu3uJqPfB13s6lGSmgDZqWIvg98u
         6t57KCRPB+LdNj4b5sKAJk1yNnAsJR5qyEK48v2wmwaXkMITQvbQXYnPBVoUwrGtr51y
         8+OGTyE5sVXdmSz2oNkdIKRx/OgXGseAQeBEoGzQkd03V2DYuGusOfLfFd4+6TWYOMdU
         kzqA==
X-Gm-Message-State: AJIora/fus8ParMahikLHWJbr0Nf8Ieo5Db9BYlkl4Lh3m/Cf2j+n/7o
        yzA9l1eRx+aJ1wTL4WgFGpP9kEPJ6DL88Pfv1/OnQVs6tM8=
X-Google-Smtp-Source: AGRyM1t5vbN1VRN0wQ0bZrJ9w/qnK3EiTQYoQv3YAhndL7v5GPOVjr/01mLr9EMdHOiqE1S1jfQPtZw4XGNv/p3Uo5Y=
X-Received: by 2002:a25:8387:0:b0:664:7589:27b9 with SMTP id
 t7-20020a258387000000b00664758927b9mr10564795ybk.291.1655299449036; Wed, 15
 Jun 2022 06:24:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220530123425.689459-1-fparent@baylibre.com>
In-Reply-To: <20220530123425.689459-1-fparent@baylibre.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 15 Jun 2022 15:23:57 +0200
Message-ID: <CACRpkdYZJUWb4TBJiZVK4SNeA2Njn6341FuDjdYsn-0_yCeRKg@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: mediatek: common: add quirk for broken
 set/clr modes
To:     Fabien Parent <fparent@baylibre.com>
Cc:     Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 30, 2022 at 2:35 PM Fabien Parent <fparent@baylibre.com> wrote:

> On MT8365, the SET/CLR of the mode is broken and some pin modes won't
> be set correctly. Add a quirk for such SoCs, so that instead of using
> the SET/CLR register use the main R/W register
> to read/update/write the modes.
>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

What is the state of this patch set? I see changes are requested by
Angelo, are they being addressed?

Yours,
Linus Walleij
