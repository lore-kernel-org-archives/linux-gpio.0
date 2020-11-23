Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58211C2D0E4
	for <linux-gpio@archiver.kernel.org>; Mon, 23 Nov 2020 14:31:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 070A920758
	for <linux-gpio@archiver.kernel.org>; Mon, 23 Nov 2020 14:31:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lO+ZSMaj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388919AbgKWObE (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 23 Nov 2020 09:31:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731451AbgKWObD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Nov 2020 09:31:03 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36AD5C061A4E
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2020 06:31:03 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id v14so1850201lfo.3
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2020 06:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GE6v8E2ojBT8gyIKpzNyRNdjMuQFL5/ViCcNT+Rjg/Y=;
        b=lO+ZSMajGkyqdB+ed1LvkbDiWTdMQ5lpQrmd+cYlUO6ZUMTJgs7EZPvj17uhGlPNo9
         BDoyL1p0Y8v+j/qlZ/6k92qK6LRPnc9gtLEfewLqoeMY9FKuxaEs5zJb81yzSnEmebFw
         GMy6FqbmkfDcI7Ug75EoxBORformeKkrHQinFOD/B6wLIwThTPPqJAyMr1BktKbrLFdk
         6yJKzysU6FPNILBdRutTAFNCljRwgswHMQjSRZrBKxVyTZISXg4tYiKFYShL88H2NAEu
         HjYGTPA4XabQHMe7eE19/J9fXT1+A8phcgzHCr0xWSAdOxaErty1158Sdbp0w7NIw7SZ
         fZZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GE6v8E2ojBT8gyIKpzNyRNdjMuQFL5/ViCcNT+Rjg/Y=;
        b=JPuFF/IzbO5mh/Bc8frb1yKmxbh9ymtTpPLdWx6wzH/zOvSNa7JXzH5mkSCknnj1WM
         0aivIeG4KPqNKO40YvcbiyVhJ8JmAlbnifxlCDrMnaYn5LIimwL1ssRGAjq/BM9sh6t0
         1d6g9biWRJeF0qPvvBJp/AlZYWtSLDdcV4h0Aj9S4mG5S6drFVGaw+asGx2lBTfTrzzI
         +8+4e7mmjd2UIel84niJhf4GVNy4tlcykAOCIPm8VWEGUSTyLcD5IMq1FRrH5N6Tf3uS
         fi3DJuFrQVOFex3EAyOMxnj4Pic3kAUlN9EayFU4oGN4BgxGvGU2etPGhXes/7CTGuje
         4NZg==
X-Gm-Message-State: AOAM531/WQOicpKP0M8Bw+TbPnDYbkWPEs5recUQdmX1Cj8GO83Hgnf3
        PyfHOCZHHAFxUIEvDLPGtYFQCtYdmDYcxBMtCWH/Cg==
X-Google-Smtp-Source: ABdhPJyZJqXr+dLHqStiKgw3ORarJdbm/HNFkaqvJjCidCi/ORD+fr97rDZI555wKcii44p9glt8qeYLc/ezHvDZTxs=
X-Received: by 2002:a19:8d8:: with SMTP id 207mr829367lfi.441.1606141861442;
 Mon, 23 Nov 2020 06:31:01 -0800 (PST)
MIME-Version: 1.0
References: <20201113145151.68900-1-lars.povlsen@microchip.com>
In-Reply-To: <20201113145151.68900-1-lars.povlsen@microchip.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 23 Nov 2020 15:30:50 +0100
Message-ID: <CACRpkdZAc2yKFpngBHCdxjFBpc0XCVAYWyEERMSHX+7sL7Fgrg@mail.gmail.com>
Subject: Re: [PATCH v10 0/3] Adding support for Microchip/Microsemi serial
 GPIO controller
To:     Lars Povlsen <lars.povlsen@microchip.com>
Cc:     Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 13, 2020 at 3:52 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:

> The series add support for the serial GPIO controller used by
> Microchip Sparx5, as well as (MSCC) ocelot/jaguar2 SoCs.
>
> v10 changes - anniversary edition (from Andy):
>  - Fixed "Author" comment
>  - Added missing "break;" in default switch case
>  - Return -EINVAL when requesting pin disabled in bitstream
>  - Change bank consistency check to return -ERANGE if failed (-EINVAL
>    previously)

Patches 1 & 2 applied to the GPIO tree!

Patch 3 needs to go to the SoC tree.

Thanks for your hard work!

Yours,
Linus Walleij
