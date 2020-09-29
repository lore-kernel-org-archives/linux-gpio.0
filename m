Return-Path: <SRS0=mvGR=DG=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2768AC47425
	for <linux-gpio@archiver.kernel.org>; Tue, 29 Sep 2020 11:59:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C3DC9206DB
	for <linux-gpio@archiver.kernel.org>; Tue, 29 Sep 2020 11:59:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hxvPb4ws"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729326AbgI2L7G (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 29 Sep 2020 07:59:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728319AbgI2Lle (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Sep 2020 07:41:34 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10EBAC0613D0
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 04:41:34 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id u8so5144150lff.1
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 04:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7yUi2yZO1JToQf86+jzuyZtTsQBg0fhODHWBw1uE2ug=;
        b=hxvPb4wsntq8f1TozsHHAe8F6NpCZehFeBwWrQDDr8XeKp8P0KXQFNAt3uCtOm0F6g
         kb5e+2PFEc/GjHUpSygttTklh5ua4d7GRab1nmYawJdnPwfdfFfQa/7fAOANxHAoe14X
         iPsxYnQPFQ8WdGOZTh8UXT5C08rksHFpkK2yNR5/7C9ryF32yuCEDyjqWYw6UvW8FM9R
         XiBMPOWhivr4QYFBN5vvMY/Oh6TTk/jmPlNSnYzjnKnqY7+h8INN+evH3kwPqg02P7qw
         IWL2B3Atrp06p14pJ6cEwW7R/y5Ib4ow63Jsr33As7mHECneopEriTkve+q5oNxWSu4Z
         4+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7yUi2yZO1JToQf86+jzuyZtTsQBg0fhODHWBw1uE2ug=;
        b=S/4dO6aqcxE1RcxZeV3pszmpHCF0Ij5kocyqOFf0UxMYuoustxGwJiAxxaLu0FQQiQ
         hAk81bBV8roGctX9ay94DY8GahhO3aVw/4LUxR1hJh2kABfN7XVmnXruyNhLsLblxueu
         vvBp/hGEkJHJ49JNUYvFbQHSmD5+19T2TYDJZml+BgD9WorXUOGidCihpZbNs2bofAym
         TRwvlqLTNwKOY4FEWK9q/cU6HtKrcG/bPkGFYAEgZKwuM9loqRDU9CWpZsCYxmr7ptm1
         muiTdxOSLpAhB+MDYgYUH4bA8bT7FAu89zl9qNB0UhC1LWQt2Oppwn/lT9TFujvP9nqI
         /RzQ==
X-Gm-Message-State: AOAM532lLpzKhrQ2JRaSDhaz8Nf/eWvUngPbyI9dxYcRwPFrSk7RnPRW
        zJdz1o8zEcfn1OTx6oNc3iimUbFOkNrLAlDyVwpym5f3kcDTFg==
X-Google-Smtp-Source: ABdhPJx2a69rtwzz/VT8YPh/IF4tgKZKCvs7fz8pocEc0bko1EuqhqqmarKpSx0C8+dSfOoAWnFCdISdsByrXoeYqQs=
X-Received: by 2002:a19:6419:: with SMTP id y25mr993479lfb.333.1601379692256;
 Tue, 29 Sep 2020 04:41:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200925134943.12169-1-brgl@bgdev.pl>
In-Reply-To: <20200925134943.12169-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 29 Sep 2020 13:41:21 +0200
Message-ID: <CACRpkdYkk4Yt983NttG7kFZMkuwz=D4EjP_K8+t8qX5B-OSigA@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: fixes for v5.9-rc7
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 25, 2020 at 3:49 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> Here's another batch of fixes for this release cycle. Please pull.

Pulled in, sorry for not being quicker and not even getting the first
batch of fixes to Torvalds.

Yours,
Linus Walleij
