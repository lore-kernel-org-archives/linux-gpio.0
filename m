Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A8A8C4361B
	for <linux-gpio@archiver.kernel.org>; Mon, 14 Dec 2020 09:13:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C497207AE
	for <linux-gpio@archiver.kernel.org>; Mon, 14 Dec 2020 09:13:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439609AbgLNJNe (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 14 Dec 2020 04:13:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439626AbgLNJNc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Dec 2020 04:13:32 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94408C0613CF
        for <linux-gpio@vger.kernel.org>; Mon, 14 Dec 2020 01:12:38 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id l11so28324746lfg.0
        for <linux-gpio@vger.kernel.org>; Mon, 14 Dec 2020 01:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xTDh2buLaKgi2yPQinQGtaYvv2xqGHa+Au5l4AlQoj0=;
        b=hXesH1qK635+28r8wsbTwtUeSi4Ffe4e8z1VoKsA+lH2bLRjzka7u4AjfoAuOpY4Tq
         Gr0FAOygaZXlN35fz2z6jUSxsnKgBG53oPMfZTo/3gBbelxRKax5B2vcfWHDz7Ve0jhx
         7TEGr13379CuQ5JE6spcgMppkny1M4KzwkkBlH4ud53p89TNIpZpfB/tm/N1wiw/KjMt
         HmFSZyrSocmS14krLw7DzvctsTzopdnO+pWj9HjLEqHP5Kc2yR3LQw/dRTJ5YIpuyeYs
         F2WwG19hjajTg60ucAwG1l3DxNP3PX29ED3hB0yfm8qxx9+8JToYeyq80+1IZUJPUkuQ
         kp1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xTDh2buLaKgi2yPQinQGtaYvv2xqGHa+Au5l4AlQoj0=;
        b=hzdNMMTKu5oH626K8Aq9MQLCGIYtpjLCMX7dlIGx/3vkydB4xgeaDoEYwI5i4Sb3E7
         NKIbmRR4FDJ33QOzzZogJe2TEJMvUHKRqs5X0JVP5Agt+pzmwRm64uaWDDhX7odmDLeB
         WeWNg9A3yCgnpGvHIKjzVjsCQl5A5Xj1k68jjTq5N/BhER50/ogSkbt2tGI1x1b1+qO9
         /7ktCPj8MNZhJ+Ovu9eTbvmU4wQuuE6QDsqYH1PFkCJCrsdZXI09jDJ0HD/U8dJrR9kc
         ezg87PebtZdIE1IPe2PlyojyBDKBNRbo/4uJdxY7FfCWg2Dmpej2TE5eUa4QPo+kyOsO
         oHuw==
X-Gm-Message-State: AOAM531NzY0QY65qU0/Haop9AeW8wtUIzAu5wgZnvRhZYi3RrxKdmfpG
        j546TxRKv6GkeVylSAfXsQAhb2GSN2XCntJJwOSAbw==
X-Google-Smtp-Source: ABdhPJx+wdjqd0B+LtuOADpGbMDCd//6cNgHU1JpvzZWHjNCVpOZQdZPvl4xqBtadQZAEMsHtgrH6EP/SYkrKLG0CbI=
X-Received: by 2002:a05:6512:3f3:: with SMTP id n19mr1259183lfq.586.1607937157073;
 Mon, 14 Dec 2020 01:12:37 -0800 (PST)
MIME-Version: 1.0
References: <1607934255-52544-1-git-send-email-luojiaxing@huawei.com> <1607934255-52544-4-git-send-email-luojiaxing@huawei.com>
In-Reply-To: <1607934255-52544-4-git-send-email-luojiaxing@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 14 Dec 2020 10:12:26 +0100
Message-ID: <CACRpkdb6uk9UWYxL-n1z3hRLAn2-fbQ_zBg9dZp0VL0oJiLd4g@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: defconfig: enable GPIO_HISI
To:     Luo Jiaxing <luojiaxing@huawei.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        John Garry <john.garry@huawei.com>,
        Linuxarm <linuxarm@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 14, 2020 at 9:24 AM Luo Jiaxing <luojiaxing@huawei.com> wrote:

> Enable GPIO controller for HiSilicon's ARM SoC.
>
> GPIO is common driver for HiSilicon's ARM SoC and it provide support for
> some function of I2C and SPI.
>
> Signed-off-by: Luo Jiaxing <luojiaxing@huawei.com>

Looks good, take this through the SoC tree with other platform support.

Yours,
Linus Walleij
