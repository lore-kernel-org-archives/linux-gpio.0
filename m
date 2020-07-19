Return-Path: <SRS0=Wf+k=A6=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2897CC433E1
	for <linux-gpio@archiver.kernel.org>; Sun, 19 Jul 2020 10:13:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 02E43208DB
	for <linux-gpio@archiver.kernel.org>; Sun, 19 Jul 2020 10:13:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MghnsEpb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726021AbgGSKNO (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sun, 19 Jul 2020 06:13:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbgGSKNO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 19 Jul 2020 06:13:14 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38F42C0619D2
        for <linux-gpio@vger.kernel.org>; Sun, 19 Jul 2020 03:13:14 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id k5so8486010pjg.3
        for <linux-gpio@vger.kernel.org>; Sun, 19 Jul 2020 03:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d9fJzhOTvhNEns/hzardq5QHeFxBstkkjDsLALyfOW8=;
        b=MghnsEpbpeKj0AEeUb9dpERonPubVt4Hs4LkF+CjLoLjzzTE6ElbeF/M/rwEg1JNNv
         OeeWeccbktelQnB1n4LyO48Ql6el3sBHhT5rznAcl5B8cbNELDOy0jqE1MW0I5/WFJrB
         HHDhy+crNcie4POzcsQ6EnjJkMvb/a26CtdV8SO3s903vHL37UhCrcsn813IGXpBY9nh
         1B82PtOstIJF94HBoHKBwYCVxoUBvBbCfDe4IfRzSh+1Xsr+7uU4nB8Al51a+FrdVt1y
         vyHliAk0xm6IYq+HOfcXnjiOlEWI4bdlVpyyY5yM2odH+7MiTiuB7tnZokalLH3PLDBg
         HuHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d9fJzhOTvhNEns/hzardq5QHeFxBstkkjDsLALyfOW8=;
        b=gUZYeWYvXYp92nNhVJUk012DE5nXnIAg1xJcTAu20IfkeGovNQNy6B+sMGc0iRFO/L
         BwuofSFP7y471DsG/0R7A4/4HT7xdB13SKSdlljj1GnC+bx7p1QbQhmMGbAXvCB93FAV
         qjpO4gG63FLisC0wpnMAYqPrQo1weq6VaB/gQr12He/brmykNpRQ8LFpXZw6zUxGwo2v
         iZ6/FmXIp7vwoOa0bY6tgv0CBcy39af2SVDYqh3nfBifldYbsSEXBs3uZUbU9Mk6T7bf
         btFHDem71suUDvI62JGZ6oDsuLLnJ2H4VEfyaHwAiyyRfFK40I+PqblMpatRB0IE8w+6
         /SFA==
X-Gm-Message-State: AOAM530pI1pTLnUsf6fm/cC3ll1o93i/52ZT9sFQuZAr5I9tuxxgHXJq
        3SjFYEkay3uvnnyMumngtJ3iN9ZwMjELVXKVUIg=
X-Google-Smtp-Source: ABdhPJxpDge9AOzxBoGhEpR86N9E9mcEQDPF9YdBN78pnNHuCzSke3BYrGYFvGcwaYaXL+sFZEixbZve1gmAzZYX4KA=
X-Received: by 2002:a17:902:b098:: with SMTP id p24mr3341046plr.18.1595153593663;
 Sun, 19 Jul 2020 03:13:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200718212608.65328-1-andriy.shevchenko@linux.intel.com> <20200718212608.65328-4-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200718212608.65328-4-andriy.shevchenko@linux.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 19 Jul 2020 13:12:57 +0300
Message-ID: <CAHp75VfSZVYK2yzmdjG=v+XyjtDzyQ-6VEU4_5rUXG-kZn3BhA@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] gpio: aggregator: Assign name and offsets only
 once in a loop
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jul 19, 2020 at 12:26 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> The for-loop looks a bit hard to read when we extract two arguments
> per iteration. The 'do {} while (true)' makes it easier to read
> despite being infinite loop.

This is not gonna work.
Please, discard this patch from the series.

-- 
With Best Regards,
Andy Shevchenko
