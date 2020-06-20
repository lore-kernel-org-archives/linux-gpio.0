Return-Path: <SRS0=EYic=AB=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 005B0C433E1
	for <linux-gpio@archiver.kernel.org>; Sat, 20 Jun 2020 20:40:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D650B22B4B
	for <linux-gpio@archiver.kernel.org>; Sat, 20 Jun 2020 20:40:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WCCD8G2J"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728802AbgFTUkx (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sat, 20 Jun 2020 16:40:53 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:33565 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728376AbgFTUkw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 20 Jun 2020 16:40:52 -0400
Received: by mail-lj1-f196.google.com with SMTP id s1so15270876ljo.0
        for <linux-gpio@vger.kernel.org>; Sat, 20 Jun 2020 13:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4NmmdrNBIU+TG1OWdFcJDhSqTnm7hEJLZEQZT2jG9cU=;
        b=WCCD8G2JNNtQ+CssTxWzTNoe5WMEYAL4To3tUApgI/ZRhqAglEEeXBoVu0oXvTtrZA
         TOazmNN991nWQpgYFHRQ9mUAwyegqXGTiCdK7L+finpke4+5m2uZzR9hbFY2OD4QeGxF
         dKtGOFpTzzVRFrv1QJc/OyJF1obk22AK4lvBUBYMElRV9DuLkArl2rtT+gqFhrssw0wv
         1wKHhoq42sCs5RiMwv8b3SnkOQa4HVVpxPyBhWJuevzTcuVPDY6D6Fmqb5Kf/GL4WPRq
         3rSa2tEB5SLiAu03RKdiEKCC/dghGkUkGmpcMYnqnRYADfUS8Yzw863AuiMG9pDXyV84
         6krw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4NmmdrNBIU+TG1OWdFcJDhSqTnm7hEJLZEQZT2jG9cU=;
        b=aG3uhLgrG72DJfLw5Bk+mbx/JyiLfIHRLemxt9cPAfdFly0oOUThooG3fzJggrKopo
         S3oTui6WgsPCGV3Q+vaSmFH/0D6ywBAjOO5klah9HoJidrhPysLlG6O84cwvPArkzfWj
         tYlsYukOJDDif/+tB2NqkV4dOe8QShH2V3+rZyVVVlBi6BgnIpLvCIJCMhPWquc/F89k
         8rLURn4rgqmi5loEfeGadNO/mpV4cTlDg6fjvKtv/uDM03c8CRY3pK/RS7ZxgN1QxopR
         SRV0DEu43+2xI1H4UBjM+XeSHHUo47Li8kFmaZK257FWn+RqK6CAoMqA8M/YnhelGTj/
         XZjA==
X-Gm-Message-State: AOAM532wm6Tlbpsb8TY182FoGgTgZK4JMi6gtQenqsgGSmyz48WzQw7F
        midmtCy/6yLEl2oL9g5nNjDJk9EYFVdzaG3ex2bwvA==
X-Google-Smtp-Source: ABdhPJySIZ40RE5xKJfwm81GVAWeTHKp7GQpe60vB8usHEm84H9NuwU/f4UCoPG/npPVnyAn//I88yf+VosHcKrEFok=
X-Received: by 2002:a2e:351a:: with SMTP id z26mr4753254ljz.144.1592685590114;
 Sat, 20 Jun 2020 13:39:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200616093615.5167-1-warthog618@gmail.com>
In-Reply-To: <20200616093615.5167-1-warthog618@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 20 Jun 2020 22:39:39 +0200
Message-ID: <CACRpkdaahnBak=FwSy9PtZpBMBniotHuFMWCrWJo-94u8j_59Q@mail.gmail.com>
Subject: Re: [PATCH v4] gpiolib: split character device into gpiolib-cdev
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 16, 2020 at 11:36 AM Kent Gibson <warthog618@gmail.com> wrote:

> Split the cdev specific functionality out of gpiolib.c and into
> gpiolib-cdev.c. This improves the readability and maintainability of both
> the cdev and core gpiolib code.
>
> Suggested-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>
> Changed in v4:

This v4 version applied for v5.9.

Yours,
Linus Walleij
