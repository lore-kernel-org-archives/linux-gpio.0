Return-Path: <SRS0=rtYV=D2=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C747C433E7
	for <linux-gpio@archiver.kernel.org>; Mon, 19 Oct 2020 13:05:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1378F222BA
	for <linux-gpio@archiver.kernel.org>; Mon, 19 Oct 2020 13:05:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SkChLqgH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727332AbgJSNFQ (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 19 Oct 2020 09:05:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbgJSNFQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Oct 2020 09:05:16 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5F55C0613D0
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2020 06:05:15 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id i2so11817963ljg.4
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2020 06:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tX+5XTwgJ+kyl2IgszHJ3j0XXhTXAzAyYtJEsBeELWo=;
        b=SkChLqgHFZsUFZe1d3Y6qNilGLnPyrLxB0GVVCuylcL0YhXqm/f64dLSyilQpJJX2M
         mXj9uiNunyERDuHn7bhjtmgqgXOkzN1rTtOnW+LoinokZfmH52mMk1Msjez2zMQzvpbW
         nfOLSTVuuJDFYP0tKiIdf59N1NFVtEwGmhDBa3zO6EGGeEuifIbbunUKY7sRyAn3bbb4
         fMW15g0lAW3muZAFSnUp3OE5LGTWVG+jGyHV+XZMdydRG6xFGpSb6DORKQ2kw2s8Y/t0
         7s25leXbRrQ7MdoBi1f3hsumcnbySe4oTxD09wOFbu0qd0yhAEWrlpBNCNFWxmws0ef4
         ZOMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tX+5XTwgJ+kyl2IgszHJ3j0XXhTXAzAyYtJEsBeELWo=;
        b=Hbjxpn1XUPcsqwapLvKmOuJNaIl4gw+aidY5/vl9AwdLKlh0swDbaDN9SSZr9jXF4d
         KSVIbIhcFcwIiBlF91CCsmvFiKfFGJ8ZSQjoBpLL/vGSra2gtJ3ItKpNfG8DqcwiQ09r
         n3S936tJ726/KUO4ajdp2ffcVWqKllpzJWHq7dnsGieehbb3wbYUZor141BRHvEl5bAK
         PGWLvtui8OOD+gq664yqu6V3xdhAcQHvkJ6ReitfeFiijkpziZyAjFnYiZS7iplFDjIk
         niHoMhkVbE/XnO7K7DuuTB1zOAbh91ggBRm2wQv6wJDXCgku0sI6UVx9FxvN4+mxU/7I
         mkAQ==
X-Gm-Message-State: AOAM532NelqaVVgpmFQ7jtclF5F+zSoxiQrdAT7OL8gAWZ4Ak2p3NTZ8
        2tS7yIzsKog3HrW1Mb2cxNrag84hw78k9Q6++MQuyQ==
X-Google-Smtp-Source: ABdhPJyMmwgqGRkC/jy1QCndHhfKuaKQcEESqu7SGnD6YohTpsbaEGSjJzwVcU1LC3izvP9QjPHjcFTlwXx5QK0NYfI=
X-Received: by 2002:a2e:80d2:: with SMTP id r18mr7045092ljg.286.1603112713567;
 Mon, 19 Oct 2020 06:05:13 -0700 (PDT)
MIME-Version: 1.0
References: <20201005070329.21055-1-warthog618@gmail.com>
In-Reply-To: <20201005070329.21055-1-warthog618@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 19 Oct 2020 15:05:02 +0200
Message-ID: <CACRpkdZs6oUMM7NyfYyU1bjPbHKUBR+VCX07sYNWE-v7nY2y5A@mail.gmail.com>
Subject: Re: [PATCH 0/5] gpio: uapi: documentation improvements
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 5, 2020 at 9:03 AM Kent Gibson <warthog618@gmail.com> wrote:

> Kent Gibson (5):
>   gpio: uapi: fix kernel-doc warnings
>   gpio: uapi: comment consistency
>   gpio: uapi: kernel-doc formatting improvements
>   gpio: uapi: remove whitespace
>   gpio: uapi: clarify the meaning of 'empty' char arrays

I applied this to my fixes branch now. Thanks!

Yours,
Linus Walleij
