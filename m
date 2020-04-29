Return-Path: <SRS0=NTAR=6N=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A5C2C83007
	for <linux-gpio@archiver.kernel.org>; Wed, 29 Apr 2020 12:16:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 32873217D8
	for <linux-gpio@archiver.kernel.org>; Wed, 29 Apr 2020 12:16:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jVQ5osqf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbgD2MQV (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 29 Apr 2020 08:16:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726524AbgD2MQU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 29 Apr 2020 08:16:20 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4A63C03C1AE
        for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2020 05:16:18 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id y4so2339089ljn.7
        for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2020 05:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l4hDIJCDKgb4QJRH77lrv/BKKESfMFPpw/eu45ndVLk=;
        b=jVQ5osqfPhLb6kqXlke+Yq5O5jpAUgnjip18N6tStX3o84+RcoTxisglPe4PdlIC42
         YsygTr5CONv4uSYE44kUtuerR+Zz/kyRN3uGKGmUBUvigC9t5umI4z5T44PBdVtR+AVx
         PGoCNKCQ92iEaFj44zvVjG9i+DQK0lsFDK1Ggv0J6e2qZUbG9ZsKqbe7eEKtCLIM85Bv
         bkDNlR+QiEj8SXBiWDEfclrL2PGfRrgP3jZ0sC2yuX7AFttD/xdJirC0qaq+oF2aYukF
         moWBReBCc/T734CNF89iyQnZ3TB69Q09w2FyCmBbD+37GZ+U5HMQFvfC1cewRuraY73n
         a7mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l4hDIJCDKgb4QJRH77lrv/BKKESfMFPpw/eu45ndVLk=;
        b=pqF4HSUkHysFNxv1so5Cm2xaPcSB9/To8yZX2MFTVu22OcpBTiyMzDMUOelnuwjNam
         w7+gspsBW896AlQ8jKa7PxLmeyPSOOP4I4f72ZukM1HEqP8KIyGsEh0rPCozDkoWuR0I
         /6ZLP9mdZJWPewZbKWob3YpNCTrnT5HljPv3UQHF9LVwAytq7TQQyeb3TW2pJ/x5Xfs9
         IOLX2k7owXjA6u6kvqY3pul8MseRXadURAAC9efN8P2ZY1ueBU95puz1frvbPNsSQ6kH
         Ewz0aFYc38epT3y3zsD7GSphjA7TiDwrNYgOOXKGjLwH0CBkAUtAB0cRnDM7X8cbu0Pk
         mdhg==
X-Gm-Message-State: AGi0PuaHUPEFk24LvHDqzxT9oxl4TMG6dv+pY8c9qV+eYPiQo4QeX1hz
        KAc/ZuwpcolLZV4sotbZ6HhyAe3uqH2U+vOyiWVFeAhJ
X-Google-Smtp-Source: APiQypIGpYmRMV8dUpi/6uObL1nzzISH+8h5QWHeAlSd8ihzU1MAcUwAWx4wnOAGosmYDQxx8rxVeYSPGbyBjrReLSg=
X-Received: by 2002:a2e:b6cf:: with SMTP id m15mr20188195ljo.168.1588162577327;
 Wed, 29 Apr 2020 05:16:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200428172322.1.I396f351e364f3c09df7c7606e79abefb8682c092@changeid>
In-Reply-To: <20200428172322.1.I396f351e364f3c09df7c7606e79abefb8682c092@changeid>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 29 Apr 2020 14:16:05 +0200
Message-ID: <CACRpkdbHAFiarn8Gn618cuMZpyEkPBkzDZO4-xR4hYd_jNXKdQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: Document proper return value for gpio drivers
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 29, 2020 at 2:24 AM Douglas Anderson <dianders@chromium.org> wrote:

> The legacy defines GPIOF_DIR_XXX are only for consumers. Document the
> proper ones.  Also: don't use "_XXX" since that's harder to find with
> "git grep".  Just list both of the values.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Patch applied! Sorry for the historical confusion.

Yours,
Linus Walleij
