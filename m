Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 229F1C4338F
	for <linux-gpio@archiver.kernel.org>; Wed, 11 Aug 2021 13:04:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE07F600CD
	for <linux-gpio@archiver.kernel.org>; Wed, 11 Aug 2021 13:04:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229811AbhHKNFS (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 11 Aug 2021 09:05:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229737AbhHKNFS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Aug 2021 09:05:18 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9662C061765
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 06:04:54 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id y7so4474609ljp.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 06:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QLDwaiNtrdg29GwlWr7lrkTXMN4ehqouExtTXW9KE7A=;
        b=DzHl8arDswpD32LuoSsTVQ8dfUL4SwtSbHg32XMF53+nuymbBHknpqjmK/zpjW6Gpx
         pGxNxI74qw4nJygP/CyAsSPMU7E+xIP0iA3N7TU8k2qGQygZj4d6yJ/NickXs/0ZF0Z9
         gQIo4Y//QP2pnz0A8UHTcyodTUfGCmZRUOJTdFpSoXdVRF9QqhSv3sOUHgvr9H2atyNC
         jRkA5b73YdAGun7UEsUWleovZLQCbTg/GYKCqVBllW9sZTTxTBnKMpttdUeG4tKWNLq9
         ax31VcRGle3ZH+dV7l8BDDj9OcgQMZ/T+rc0J4isruz1p+6nJfxsl7utbFQeWgb/eaUf
         me2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QLDwaiNtrdg29GwlWr7lrkTXMN4ehqouExtTXW9KE7A=;
        b=Ewc5qVd1EludaN1Z5b0PB88dEf44yiTMHM9dBjr9+E8aCjqFnffy/Rgq6LlTZOLnc3
         4JDfHiBPQCiCLs1coxX0+y+ALmlPhLPit5LX5gkxwZ8i4zMm6bpJ8OnstbjMFawul+iA
         xXLEX4MspDD1UCd7Evl6MLKoEE3PxFhsf6oeFEYmN6GMtFkq0KKHX0Amzh4ianA+Jl+L
         yH6DawJ7dmZBu7NcYvyhDQfLBOgGSqkCNMjqKXo8NMxyjRm8lEffvGFkI4vYur18gxQ5
         mK3H38CjxsgTOLPuw3ZQQK+81QVgOcy2MquvMDtaI/3JI6wXI0KZpAeYPt7MYhYQnCdP
         x4EA==
X-Gm-Message-State: AOAM5336dxM7m6vtP7CO/dPmVe9ti/eaJeQl4hF2TQ2dIDbNPvAhm1oM
        EhSgMS/2s+Bp5H+zFNMlUkO0v7/u7WyHOpGhFx1DOKRiido=
X-Google-Smtp-Source: ABdhPJzxGVKcz5RrbFhvlL00FbbubB29/GhukwkN+sX/bMnB+khyTQWHaAFlKNl+CRHEBa8Gpse4zXGm9UEH+0EB4Ao=
X-Received: by 2002:a2e:9a4b:: with SMTP id k11mr12754854ljj.368.1628687092725;
 Wed, 11 Aug 2021 06:04:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210806004311.52859-1-damien.lemoal@wdc.com>
In-Reply-To: <20210806004311.52859-1-damien.lemoal@wdc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Aug 2021 15:04:41 +0200
Message-ID: <CACRpkdafkWv1amgxhVCQsS9kRT5zsJ0wwU_sJy0Ztmqx0b-87A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: k210: Fix k210_fpioa_probe()
To:     Damien Le Moal <damien.lemoal@wdc.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 6, 2021 at 2:43 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:

> In k210_fpioa_probe(), add missing calls to clk_disable_unprepare() in
> case of error after cenabling the clk and pclk clocks. Also add missing
> error handling when enabling pclk.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Fixes: d4c34d09ab03 ("pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA driver")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>

Patch applied for fixes!

Yours,
Linus Walleij
