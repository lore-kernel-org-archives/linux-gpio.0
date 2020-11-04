Return-Path: <SRS0=FFhp=EK=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53FB4C2D0A3
	for <linux-gpio@archiver.kernel.org>; Wed,  4 Nov 2020 20:35:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC99D20759
	for <linux-gpio@archiver.kernel.org>; Wed,  4 Nov 2020 20:35:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kmqtjFev"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732247AbgKDUfA (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 4 Nov 2020 15:35:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731327AbgKDUfA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2020 15:35:00 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F646C0613D3;
        Wed,  4 Nov 2020 12:35:00 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id b12so10848478plr.4;
        Wed, 04 Nov 2020 12:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0nbZxI2GNfUHVdjomF7wphpVFR/5uKrsBk36HHQSxpY=;
        b=kmqtjFevR8xE0aampV+XQAIJmpgYZ3UPn+fBtdM8PO0vS3HXqFUn9hcet3bbpfhyxS
         riaSI9hPIrUtIvbRkDggoY1TzCNKRxf5Q2aynXMZsA24ZdhgZ10JvNezYnuHQ6PkAMi1
         Yf/UZSTF4444Qug9zHBsmsN6/hqfWVYZmvZ8ZSGhZtgApa0jAuxba3ztmXt8ZE0CKtJl
         w6hYnn27zawtdfiV3lPNN1zlxFEqQj4Q3LUfGYyuLCBk02XZKh44mBVSzuUKqq+lVTv2
         Dn6uRFoDg0X5yOBo3czQ2qI/xqUoEMxRwN77IyeSbUx71l4US+Mzp4eoiW2MBOadXWT5
         Zp0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0nbZxI2GNfUHVdjomF7wphpVFR/5uKrsBk36HHQSxpY=;
        b=uRahaedZJgYlsRcYYWOS/9AmmlW49xywrOt/RSfB5Inw01SYxrhEkQr14G/InSGEaW
         mtzD8Aa8xmJqqKWqG8+K7tu4gO0kz8Hk2U4QCgpCMJFoadtQTW/QlewWL+U2ZWFR4/zW
         VPHUd+CQLzv2sh9F4ngqt7digdCsJARmijGJInxC0MsWCU1hZQp59tbZwBhPPcp6Z4lX
         3lPGnL/knTp3n5gUiDOaH/YdHMvNCFCNmCYzJjMnrzLd3BW38dPF30IAUqhguImtP5hL
         MSLf2NsY/fRv3pqNOGWDyF4OKJLv/+UYTM4ZfCMnprlb5hQlsIN60cRja0XVpAxjhskj
         9tyw==
X-Gm-Message-State: AOAM530pJAZhcPqTwPgQyjNPMsWdOUIw5NDUrFX29IckpEYora39/uy6
        dPw+bK3266cWdd6LFegh6mzduIC8/9LJSp5JujI=
X-Google-Smtp-Source: ABdhPJwm4GnGhthPFmROHaM05TPfdVSf7fLvo4Crl4IDcUaw0SamgUxFn3BtV5UtzaroAFrCBQ8iFSZSAkmmC++cbqI=
X-Received: by 2002:a17:902:6bc8:b029:d6:d9d:f28c with SMTP id
 m8-20020a1709026bc8b02900d60d9df28cmr30546085plt.17.1604522099700; Wed, 04
 Nov 2020 12:34:59 -0800 (PST)
MIME-Version: 1.0
References: <20201104193051.32236-1-brgl@bgdev.pl> <20201104193051.32236-8-brgl@bgdev.pl>
In-Reply-To: <20201104193051.32236-8-brgl@bgdev.pl>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 4 Nov 2020 22:35:48 +0200
Message-ID: <CAHp75Vfd4nsXvDOtbq-2TTcKWzWdwDs28Qm4Kuqa-j7YOR-YbQ@mail.gmail.com>
Subject: Re: [RFT PATCH v2 7/8] gpio: exar: switch to using regmap
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        David Laight <David.Laight@aculab.com>,
        Mark Brown <broonie@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 4, 2020 at 9:34 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

...

> +static const struct regmap_config exar_regmap_config = {
> +       .name           = "exar-gpio",
> +       .reg_bits       = 8,
> +       .val_bits       = 8,
> +};

Looking at gpio-pca953xx regmap conversion I'm wondering shouldn't you
provide a callback to define volatile registers (such as GPIO input
bits)?

-- 
With Best Regards,
Andy Shevchenko
