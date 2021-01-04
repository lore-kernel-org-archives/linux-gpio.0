Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10143C433E6
	for <linux-gpio@archiver.kernel.org>; Mon,  4 Jan 2021 14:59:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D4D2F2242A
	for <linux-gpio@archiver.kernel.org>; Mon,  4 Jan 2021 14:59:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbhADO7k (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 4 Jan 2021 09:59:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727371AbhADO7j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jan 2021 09:59:39 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B53FC061793
        for <linux-gpio@vger.kernel.org>; Mon,  4 Jan 2021 06:58:59 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id b26so64992088lff.9
        for <linux-gpio@vger.kernel.org>; Mon, 04 Jan 2021 06:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xVbg/9337K0Ip60GD15691uF6SSutbUGQce683Uj4qw=;
        b=Iut0KXok5ey0haBtjfeAjjLqNi3G9W1vkeD13A0Ik5vUCWpJ+HDpRm2h1fki5PiFhi
         qKjgYtDkbRXM+C+zRIuFuGHVe7gLvqnkrtJ4xG3Nk682pyE9+YCQ5sEMR1nur8K7hM/t
         yi9/QPy5Kff8O+XucXbToVK0QFvhmc+12oI0LYYrmodZGPm0feYJZiVHFY3y597ctvNl
         rX6yQdJt/dmjoHMHAfzhUKtiDQQNyoS+s2B2SeCuNvY+axOVki4MAJ9EzrLgZKSeWEhv
         RzhNzoNXTd/elglaA7G5kZxiEKtOxkzgHr7C3X/T2v/7U+bjuHLqN2aJPBa26MasquZd
         XIXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xVbg/9337K0Ip60GD15691uF6SSutbUGQce683Uj4qw=;
        b=BSJ2NPtRF1EQQLOn9zwuHVqr35bZnBQVLylCYUKdpaJqikWMNaCdEHwUaxAxCCBPCo
         /2D/YHDFDot7W3qkmekGghFLzLyzM/ATASVP8xDU+/OQm/xG7QaGNnLUV8U73XbAkF7o
         YxH8Pl4/G+Z23b+g/pbf/tBQV6H2SKoWa+uZcLtZPHB8wUzuCWAmc4j6ZAyb/xjqtJNy
         2hb8ON5XPR046rjzcF/35XesYgJTEKIfJdnTu1NK9JY0TYGXTqXBbmuY73RV5o5JmrJb
         zVw2s3bcLtysL8Wzu1EJPbKBrVrAl1EviLAfEqqC9BUdfm1SVdgyGShbZw7J9q51Nm6F
         PrbQ==
X-Gm-Message-State: AOAM532fVndOiKjZYMFCrhfLuPtRfkqRRStbKI+ndJSFA/rqMI0dwD9X
        2LFGDxe1tpck1Rf/PCeC5xn/f4oxB3rkcqBgQTfFzA==
X-Google-Smtp-Source: ABdhPJxCNu35Ylb75XyJViFXGvclq2TO1RTTIwq5yDpbN8VP7zLiKQ8YN0rs9fDqAwYAX6aRjaqTRYp2pEGJDeXHBXw=
X-Received: by 2002:a2e:85d1:: with SMTP id h17mr34000037ljj.438.1609772338002;
 Mon, 04 Jan 2021 06:58:58 -0800 (PST)
MIME-Version: 1.0
References: <20201217144338.3129140-1-nobuhiro1.iwamatsu@toshiba.co.jp> <20201217144338.3129140-3-nobuhiro1.iwamatsu@toshiba.co.jp>
In-Reply-To: <20201217144338.3129140-3-nobuhiro1.iwamatsu@toshiba.co.jp>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 4 Jan 2021 15:58:47 +0100
Message-ID: <CACRpkdZeqqH_tev3USrC5BzX_w1rsjFQA=uGDZLPXZDG6jooKg@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] gpio: visconti: Add Toshiba Visconti GPIO support
To:     Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Punit Agrawal <punit1.agrawal@toshiba.co.jp>,
        yuji2.ishikawa@toshiba.co.jp,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 17, 2020 at 6:45 AM Nobuhiro Iwamatsu
<nobuhiro1.iwamatsu@toshiba.co.jp> wrote:

> Add the GPIO driver for Toshiba Visconti ARM SoCs.
>
> Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> Reviewed-by: Punit Agrawal <punit1.agrawal@toshiba.co.jp>

This version is perfect!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Bartosz: this hits pinctrl but it's fine to merge to the GPIO tree, should
not cause any problems.

Yours,
Linus Walleij
