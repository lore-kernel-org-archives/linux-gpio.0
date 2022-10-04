Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C786C433F5
	for <linux-gpio@archiver.kernel.org>; Tue,  4 Oct 2022 07:40:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbiJDHkJ (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 4 Oct 2022 03:40:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbiJDHj7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Oct 2022 03:39:59 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5489FAE42
        for <linux-gpio@vger.kernel.org>; Tue,  4 Oct 2022 00:39:57 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id lt21so1722010ejb.0
        for <linux-gpio@vger.kernel.org>; Tue, 04 Oct 2022 00:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Fk5FV2H6ZJpEudEsox/aZJe1w4XcUuZjMAKJn5zlRW4=;
        b=jfnyM7OV4TLl7OLN//Y0iqw0ZawSOoHt4RAP9xc4xGc5mNMa+YjtNg/40y+jOTHMdh
         vkJ2L5YgjrM2dhA8OUq4NI2lzNf4R4/hW8S1mG+t+G771PUhrJ2xiQCWLFDtW3VYKqi/
         OeSpxUsE+ZFTLRtzV17vJNw4knl68OwQlbfNqurWHiCzcwqPme6cP4eHhAhu/62Sqyhn
         azmlGUvGcCAbG+krZf3hAvvkiMuN6K+mh2GFvpAMpUVzvQLPLZ/bcTN1ymRJiPyrN62E
         gtdkq678+73eEHg46J+72o085XmFkHsKKbHqTEk9540JdahTv1Jrkyjhp7QgM/+N2o1Y
         agFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Fk5FV2H6ZJpEudEsox/aZJe1w4XcUuZjMAKJn5zlRW4=;
        b=L2w6v9NqjsVlrsRKgWJ/kuT/kwwvmK7A9xSPH5LVZYO/RL30N2sew5ThzPiUTkZ1ZU
         q+x0+4G75a1Ke/sYS5ApqLlqPZh+sTXiHCZuptQytk2Cu8wl2XwvgtG4i6EGmyZZuTqb
         xarzT1Y8YuSeV3hHl4DGrTmvWuheb4kZvTKwt+D3aaO6z87EK0OMDTWjNVrHj/biD1Dd
         Q2D81OKhN0/LFcJ7khWn48dVspGXhZFNtD/i5GiFJAWY3wHk5AU6+J3iSdmmgIBxIPPj
         9IN7UWJeLzDRkoSm6MqWRxZLClp2z6E1CR8hRWR6OreLShT/XuI0AL8fLVTU7fOseeVL
         4mQA==
X-Gm-Message-State: ACrzQf1Oaa88QKOl29oAK9DR1dOr8Wn7cuBOufrmL6WtQA/2CmuNl7NS
        zSLh6H0xciOl64PFfJvCKEhWIlroljtLNZI0wCbMkYqYxqU=
X-Google-Smtp-Source: AMsMyM7I3ncyX6Y3v9qE+1nNnP4hl6GDl1x4XnefAi78LF+Z1tPcPzzfrm0p1KZOTqCCv5UCJYMJ2NZTPNhBm1AuhAM=
X-Received: by 2002:a17:906:9b86:b0:73d:72cf:72af with SMTP id
 dd6-20020a1709069b8600b0073d72cf72afmr18109222ejc.440.1664869195927; Tue, 04
 Oct 2022 00:39:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220927133926.103943-1-yuancan@huawei.com>
In-Reply-To: <20220927133926.103943-1-yuancan@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 4 Oct 2022 09:39:45 +0200
Message-ID: <CACRpkdZCM4ieJWOJFf6FZfZrfJndy3vkQ5cB4QJoq=DeiODY=Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: bcm: Remove unused struct bcm6328_pingroup
To:     Yuan Can <yuancan@huawei.com>
Cc:     andriy.shevchenko@linux.intel.com, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 27, 2022 at 3:42 PM Yuan Can <yuancan@huawei.com> wrote:

> After commit 0e3db16300fb("pinctrl: bcm: Convert drivers to use struct pingroup
> and PINCTRL_PINGROUP()"), no one use struct bcm6328_pingroup, so remove it.
>
> Signed-off-by: Yuan Can <yuancan@huawei.com>

Patch applied!

Yours,
Linus Walleij
