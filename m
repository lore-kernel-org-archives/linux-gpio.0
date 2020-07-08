Return-Path: <SRS0=2f2S=AT=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92A59C433E1
	for <linux-gpio@archiver.kernel.org>; Wed,  8 Jul 2020 07:20:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6AF6220786
	for <linux-gpio@archiver.kernel.org>; Wed,  8 Jul 2020 07:20:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ld9zTaPA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730223AbgGHHU2 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 8 Jul 2020 03:20:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730388AbgGHHUW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 03:20:22 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2006CC08C5DC
        for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2020 00:20:22 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id z24so28046965ljn.8
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2020 00:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=SqcGE0kJwdQW0MaumCMD2Mj12V83G3gfirZKPTfcKM8=;
        b=Ld9zTaPAOzICRq5QA2zVtoPXWoqr4A8Rquyj9l6aZJ8/GSs0ijfw1CxdKDLxwPuipQ
         J7eCr3rsrPY2BYv3TcNS/RZZQTyMF76DT3aA+hEa1qLuEvhlTzss4AcfS3KCZuzBQLcJ
         lqVWRr4uBKlAf3WEl3/uUKIvlRzOJhTtG7B6Vz5GSSAXNLSoc32rxxBp111ShD12xPFc
         A15XhhZYxGCdkkNPBIZDb/+WWVNfaEa/VqpCO9W0VFIUWojDuTT/3ovqeDlXWVDlE/uw
         jh/x1mzUa2gLj1goSHaS8UHmOGR8VrBfly66MlDBNFMJegFwAp6p0myqnMe5fMH8R25F
         c+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SqcGE0kJwdQW0MaumCMD2Mj12V83G3gfirZKPTfcKM8=;
        b=N3FsQf7X+nwzVkPqWyyLLCZw/EjGXzWXgPBMU4+DJwmY1eHJKtfLWdlKNcXvECm8ft
         zeXr6bnPPInJ3DteHTHrT47j3EnpptPAc+dvrQczmKZAyk2Wg0pnlFdXInHWJH+vsca0
         2mkbLRJ82v2EbSIurnNmaAlrgggHBdinLWoiphBKJuQVbFs2eO//0iDQsXlZN8f8aTwm
         duYvH2nmkoh6yPeloa3Dz6wvQIoB5jguPXYYdgFaistWUN3Pn4mKrfLQapKFypB6HFeV
         JEFaQNATrr08GjOtL/ZxEP3U2wrltBnsg4bsxZAiZVFrLBk7URmwo5w8NMAg0sYg1F8y
         TUiQ==
X-Gm-Message-State: AOAM530QrvmywTtBX11l+qUw+e0rcMxz6/Bg1ShMIaJIP0LeCQQB6yOC
        kFPybFjbSw3bwdohIGEh7KJJKOaA6lLVKxGkKLGZkw==
X-Google-Smtp-Source: ABdhPJzcU7X5ZIS5gNc4O3Ld+YSNcrmkC8WbKsbyCxTWNcAfHGiwwcrB2f/EhMeP3LQ6BIPEaYlypAuxNNX6D5NZlno=
X-Received: by 2002:a05:651c:1291:: with SMTP id 17mr31551028ljc.286.1594192820602;
 Wed, 08 Jul 2020 00:20:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200630133345.2232932-1-lee.jones@linaro.org> <20200630133345.2232932-9-lee.jones@linaro.org>
In-Reply-To: <20200630133345.2232932-9-lee.jones@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 8 Jul 2020 09:20:09 +0200
Message-ID: <CACRpkdb3hjK6CC4LTRX_S0X+AVSA6hZctuV6XF67Qn_UcrihWQ@mail.gmail.com>
Subject: Re: [PATCH 08/10] gpio: gpio-mlxbf: Tell the compiler that ACPI
 functions may not be used
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Shravan Kumar Ramani <sramani@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 30, 2020 at 3:33 PM Lee Jones <lee.jones@linaro.org> wrote:

> ... as is the case when !CONFIG_ACPI.
>
> Fixes the following W=3D1 kernel build warning:
>
>  drivers/gpio/gpio-mlxbf.c:130:36: warning: =E2=80=98mlxbf_gpio_acpi_matc=
h=E2=80=99 defined but not used [-Wunused-const-variable=3D]
>  130 | static const struct acpi_device_id mlxbf_gpio_acpi_match[] =3D {
>  | ^~~~~~~~~~~~~~~~~~~~~
>
> Cc: Shravan Kumar Ramani <sramani@mellanox.com>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Patch applied!

Yours,
Linus Walleij
