Return-Path: <SRS0=rtYV=D2=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA5FAC433DF
	for <linux-gpio@archiver.kernel.org>; Mon, 19 Oct 2020 13:29:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 45B54222C3
	for <linux-gpio@archiver.kernel.org>; Mon, 19 Oct 2020 13:29:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PixNjo8/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728290AbgJSN3Z (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 19 Oct 2020 09:29:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727297AbgJSN3Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Oct 2020 09:29:24 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E84AC0613CE
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2020 06:29:23 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id c141so14193448lfg.5
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2020 06:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JZZ9Nyx1nFQWbYDU88sxEsWn7NvcieGMLP7bzV7jBIQ=;
        b=PixNjo8/mMu2adN6Zg/XxEoSsNoFBCKQIeypmSPBDYogD5DA+5rAnOzNFrWoWLT2NE
         03Rz9f8ec07x+uUFyq5dj4ekBPichzmbRhjS83UKi3iZpZRQJz4ERGT+fTJslgz9LP34
         mxtqtUx+plcRUbConeAtRyGjK8X+NCgwR2EgSWWIzazV42TS0o9bLX+IEJtocEOP4h2G
         TkoS3gc5Mh56o0lX7a5+ms4qfGmbRXKdIwKcCamWPj5SYBqX9z8lKP6JBaCfKMitOGR0
         yi1RtpaHDdGFgTyxP7ZGNJt7a31GLDE1sFLhhVf6XuLOXQY5dQoQ/Cek8wcblctGRhY9
         fPGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JZZ9Nyx1nFQWbYDU88sxEsWn7NvcieGMLP7bzV7jBIQ=;
        b=tBCPs0+yjqLKWhqs6RzH+PYi1Z9IohDx11zlU/hoDAqHgvXfrDn544UjlBNlRQuNd0
         3qM23bl3TyUnLhI2MzvclHybmcb00hFiOxVyVDDGe5HNCoJHVS+S8DZoqp1H/MOUhNoi
         l1x/xPmsmPJUfKu4gFJ/i9WZGlNIKEC5ZY7HFBuNvJdTpGrER5zhLPxDnA4do36Wi5my
         7EBltmOpKgkYiKa7qgQoZx0AP27LWD5OL7Bt8lObJAzygxt9IkPIekqP37yqggfPCvLM
         D+zf9OkQtOY3BOXnNmRbuLkLe1VxPFJ1D5ec3hT8EruCrhuaVGToqB9ikLXKiXtjumJE
         jwkg==
X-Gm-Message-State: AOAM532mibpzWjxtHlIXi9FsfeNIgnRe4jj4AI3RaLl61ChkJDBXHM+H
        5OPrTi/ItC5qA7kdSH1b0PqOQ2MGyKCLlAcgygTFAQ==
X-Google-Smtp-Source: ABdhPJy04oJSTJxt4acSKZSoyG9Q/xmrWFzBty9/ZSwnh0SFfn8xMyzkgdquPWmtrRTR9kZe0d3DlJXPS2l72mcCAvM=
X-Received: by 2002:a19:e55:: with SMTP id 82mr5426510lfo.571.1603114161558;
 Mon, 19 Oct 2020 06:29:21 -0700 (PDT)
MIME-Version: 1.0
References: <20201009184359.16427-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20201009184359.16427-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 19 Oct 2020 15:29:10 +0200
Message-ID: <CACRpkdaiCszu=BduQe3QUh1tuotTvTXUA70jB-=YCcd782q8Aw@mail.gmail.com>
Subject: Re: [PATCH v1] gpiolib: Use proper type for bias enumerator in gpio_set_bias()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 9, 2020 at 8:44 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> First of all, bias has a special type as being a part of enum pin_config_param.
> Second, 0 is also defined bias which is equivalent to BUS_HOLD.
>
> Taking into account above, change type of bias variable and refactor
> gpio_set_bias() in a way that it doesn't use BUS_HOLD as a place holder.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied.

Yours,
Linus Walleij
