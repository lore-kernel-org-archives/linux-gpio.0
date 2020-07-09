Return-Path: <SRS0=qO6b=AU=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02295C433E1
	for <linux-gpio@archiver.kernel.org>; Thu,  9 Jul 2020 10:06:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CA3CA20663
	for <linux-gpio@archiver.kernel.org>; Thu,  9 Jul 2020 10:06:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="JssfrsI9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbgGIKGg (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 9 Jul 2020 06:06:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726302AbgGIKGf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jul 2020 06:06:35 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B34DEC08C5CE
        for <linux-gpio@vger.kernel.org>; Thu,  9 Jul 2020 03:06:34 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id d27so1207174qtg.4
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jul 2020 03:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QYZh0HDct7EvWrh08V2VUFBZGUG8j1YW7X9xdQQstqg=;
        b=JssfrsI9q4a9e/ZI7loh1iE1EJ89c+4Jo4Vznfaao/PSuhSZ9w59Vea2lkPHoQ1nYy
         V8yDOr4iTZIkyjgAv9UqD7EZthgTxcTrCXvDv/J85BkD8XAxKPh+Qknl3sG4gfRty+3D
         Ble9sHQeIfzv27PeL06xqDQbNJt4DT//GJAxwKJBivVfAwY8IueNqVKkaSXU1dfPKjSP
         0TaPUE/sCknBUPPuYKYUwVq5HKQ78QWoJg0Zii5AdXcXZ938sfGSNPblu0PCMgj+Im2K
         c1E1xnVG/QSDkJa7j/jm1I89QhJ9Hg5QW0VMhFg3niRinw9sgF55+XKBZKvYdwN+K5RQ
         akFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QYZh0HDct7EvWrh08V2VUFBZGUG8j1YW7X9xdQQstqg=;
        b=Q+1T+GGn8uXDoCPc8CceEdvRmczQq6pR1gj2oXGq8Cwb3gyBBqj+Ws+1lhl9ZhFivY
         ktJZzfVn+kRVa6mWh9DtY9BRq8MnsDmWmtkOceqOrY7DjZg3SaTpXtbjsNanFz3TjgEX
         J6F7YZ6TNjgcEWPKjHwQowv4jE98evFQnxTUwludkEdoRjWikX5Lvo2lK98Ll1Mzmpgo
         u/cm9U12vHgcMjTN0W/O8WRdD8pIUgFENCsia553lw1RzjXDF33BhjZmSaucuH4oVWrS
         HlgegIhSJnsnAUxTGc6bqLQ/N5OBmKagb4p4Gv2Mo08kLqsJtrD5VdQQ+pEAVN9+vHRG
         utNA==
X-Gm-Message-State: AOAM533sEJ64qOm86OTxXrnHhrY6BQVwvGaV7d4mEKbRU6GRYOl9z5Yl
        rY77b2Akn6t/iw0DmJ0GSMDFy6ncP5/tD7VKEE3Nxw==
X-Google-Smtp-Source: ABdhPJzF1XdYKoYcEH2fBYYgsSptyJ+OeZOdaCdGgxgRYXL/oYNVmi9EN0IelvN/YIe700361hL2bl0v7rxTcpS7Hy4=
X-Received: by 2002:aed:21da:: with SMTP id m26mr45842495qtc.197.1594289193967;
 Thu, 09 Jul 2020 03:06:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200708041600.768775-1-warthog618@gmail.com> <20200708041600.768775-9-warthog618@gmail.com>
In-Reply-To: <20200708041600.768775-9-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 9 Jul 2020 12:06:23 +0200
Message-ID: <CAMpxmJUbd6tFp12q7+iEW5DUEvLdDKhnNMRChatRUUzvshC=iw@mail.gmail.com>
Subject: Re: [PATCH 08/17] gpiolib: cdev: use blocking notifier call chain
 instead of atomic
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 8, 2020 at 6:19 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> Replace usage of atomic_notifier_call_chain with
> blocking_notifier_call_chain as the notifier function,
> lineinfo_changed_notify, calls gpio_desc_to_lineinfo,
> which calls pinctrl_gpio_can_use_line, which can sleep.
>
> The chain isn't being called from an atomic context so the
> the blocking notifier is a suitable substitute.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>

In the back of my mind I still think I chose atomic notifiers for a
reason but I can't remember it now. Anyway, we can apply it and see if
anything bad happens and potentially just revert it.

Bart
