Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6067C433FE
	for <linux-gpio@archiver.kernel.org>; Fri, 17 Sep 2021 22:32:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C1CA56112E
	for <linux-gpio@archiver.kernel.org>; Fri, 17 Sep 2021 22:32:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236791AbhIQWdf (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 17 Sep 2021 18:33:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236595AbhIQWde (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Sep 2021 18:33:34 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EEF0C061574
        for <linux-gpio@vger.kernel.org>; Fri, 17 Sep 2021 15:32:12 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id t10so32565253lfd.8
        for <linux-gpio@vger.kernel.org>; Fri, 17 Sep 2021 15:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bMlZupJaaOmfM5kF68bTasQo1i9K/JwY+k5KTnrWPMo=;
        b=pWYIgc9VNNCeJNC1e9/VkHmZBez2EDmS2PcdErOeXRN4xgp6uos4SYg+4oTI+xm4MT
         o/zG4Kp2V6OwWmQfKNejC4Jp4UFf49i52/KggwAVAp3nSgnXUBl3OimLMYRR8N+Guuu+
         YyqT5xOg/JsSu2Am/ua1o2bTQe+Jo4AAwrA9lE2cUlD31Zmavd3W+qdmu93lAXZ+vEVq
         Rn06xp31zNd/5lLFgCKFqj+TJ2dInOCeO2IDIlvety25M+zxpby7VCL883/l+GHal/rQ
         Uc7nsN2PIFsRJSNa0fwlGcrkG3oiyyEkBG5R812ndCQAXpeZwZczo6ecra3yLoYZYD2g
         1q3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bMlZupJaaOmfM5kF68bTasQo1i9K/JwY+k5KTnrWPMo=;
        b=4AhtYYhYZzZu4yF4nwBZlglGZNKD3h6QWYQFOGIc7eUWhue5nLGXJWnsPpDAwzNRVi
         BsO+MKSz4Y8pHWl73kaDU4LNmVuA6yNNgP2CTFFQAVSn5jkgTEPXrEWCjzb6b1xwaS7W
         dWUkXfypqYJhoWgLU6wi17jWBVryG8tMFqZfb2KKVsnAaZIsFyUdikGoTLq3SsZjm7eN
         1Z6tdFIRjM4hiw2Quv9XxKJ9lZPJAHV+cyU7RCX2MjIlNqIc07+Dwh6Ne1vA5UtHQ7Ua
         uFRLpRumnCcjKruawyMhUhfBUN3zIU0mFcmc41r+6p4Nqq9PtcgEJJ4Wh8CCYqfT4oXf
         afsw==
X-Gm-Message-State: AOAM530lwB1EY9JRIj+JKkSkE35FIbgGaduqP5VVpC7dQpvGfaPxoP0E
        OvWGcUGWgxb0oBuXdTNYkJ7GKH584/pBeY5SXdx93Tun5fg=
X-Google-Smtp-Source: ABdhPJxiLoB+28Pv7LKUWwQryIaYhXX8k0rQZhkj/JY1U969yvs0oB5ymnY+t7DiPA5DrZOSoyLVccmJ69BS74kuhkQ=
X-Received: by 2002:ac2:4651:: with SMTP id s17mr4952713lfo.584.1631917929456;
 Fri, 17 Sep 2021 15:32:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210911232707.259615-1-luca@z3ntu.xyz> <20210911232707.259615-2-luca@z3ntu.xyz>
In-Reply-To: <20210911232707.259615-2-luca@z3ntu.xyz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 18 Sep 2021 00:31:58 +0200
Message-ID: <CACRpkda0Jm=JwxpsmU63m94hFsL1Lhuk3mfjgFuXLNJ3RjdUnA@mail.gmail.com>
Subject: Re: [PATCH 1/8] pinctrl: qcom: msm8226: fill in more functions
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
        <devicetree@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy
        Shevchenko <andy.shevchenko@gmail.com>," 
        <~postmarketos/upstreaming@lists.sr.ht>,
        Bartosz Dudziak <bartosz.dudziak@snejp.pl>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Sep 12, 2021 at 1:28 AM Luca Weiss <luca@z3ntu.xyz> wrote:

> Add the functions for QUP4 (spi, uart, uim & i2c), sdc3 and audio_pcm as
> derived from the downstream gpiomux configuration.
>
> Also sort the functions alphabetically, while we're at it.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

This patch applied to the pinctrl tree for v5.16.

Yours,
Linus Walleij
