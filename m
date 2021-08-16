Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D9E0C4338F
	for <linux-gpio@archiver.kernel.org>; Mon, 16 Aug 2021 23:05:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 05E0060EFF
	for <linux-gpio@archiver.kernel.org>; Mon, 16 Aug 2021 23:05:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232672AbhHPXFd (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 16 Aug 2021 19:05:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232618AbhHPXFc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Aug 2021 19:05:32 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D34EC0613C1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Aug 2021 16:05:00 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id n7so29893407ljq.0
        for <linux-gpio@vger.kernel.org>; Mon, 16 Aug 2021 16:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Lj2dLqJ9pyYOjsECo/lSTtBJ835kttkCZJ43TYZ23RQ=;
        b=QZ0ArbXT9/B+Kg7FSkdPaBvXoC1IXNemdZn9zn5hHGl8DBDLJiJeKzGqjnMHcq31kU
         amRu+f2bG50wNYadysjF9juYcloVrnTx23n7jEpNqX79hDf1hrFb2pzMZfVmD7Ee/iJ8
         o9S5EhBOL0qHFgU+EOi/dw81a7+WhfZ2ZIJP1gdSTcP3PdbHPqNpHFJmH1VP03xNRJg4
         bdo3sctrvoPWc8pCiu2dqFPwEDJmRCPbjVXIrqDO+zz1Ke3/hx3Z31L1vWVR8C13gPNP
         JfIpw8k3EPNTTBQHLBw8xSFARDTNfzlnZx+vsrzXv2k2ZbZFN/Z7RIUvcDlrBC1mhz9/
         hDog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Lj2dLqJ9pyYOjsECo/lSTtBJ835kttkCZJ43TYZ23RQ=;
        b=s+4UTZCZz29DiZYDze2vQ6IDJBjbqHaYR6YQXl0a54BLS1iPnHz1XaC4am0yk40A3/
         GHcpLvWSmur+Ln28+1eH6naGufY6RDBdBNjrEogbtMJjLJc7NFhJDOip2qQu8J9AU8Fq
         loqajwN6eXMa/HkNIIs4SKBnSFDutukEkuuQClxOaJ49O92P6qFXH4JyG8X8nCgmlagP
         ALOM4ALHp4yXAt48az4U9WCge33EZMp+au34EPPRlIdNzGjFtZY1Mfqbr0jdsqu3FcRh
         O/jr7VEoMKRwEP/Xfp5FsVG5iPut48Xa5DnkZJlFKrBVNTOMg0MzGaH5R59Xddotqx60
         Av7g==
X-Gm-Message-State: AOAM533EBOvsUaGM3j1c+SgdUgEnR8dOnJLqz3lDeRq50ruR/ldmVjgm
        nDFN0kLv03VWeaGyc90U1YRNfWv+2NpTa3wf/Q1FqQ==
X-Google-Smtp-Source: ABdhPJxpngVDILQkYsQuzskdLl1PgOfY9XcdWYa9WAFWHXbDYqBy4QG/NrpOSQl08X4uPllHJTi0bYwlx4bzggm47vk=
X-Received: by 2002:a2e:88ce:: with SMTP id a14mr465713ljk.467.1629155098850;
 Mon, 16 Aug 2021 16:04:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210816011948.1118959-1-jay.xu@rock-chips.com>
In-Reply-To: <20210816011948.1118959-1-jay.xu@rock-chips.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 17 Aug 2021 01:04:47 +0200
Message-ID: <CACRpkdaVJn9UosC5VwkQ5fTdrymtHpajc1h8HMomVS-R6vggbw@mail.gmail.com>
Subject: Re: [PATCH v8 0/9] gpio-rockchip driver
To:     Jianqun Xu <jay.xu@rock-chips.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 16, 2021 at 3:19 AM Jianqun Xu <jay.xu@rock-chips.com> wrote:

> Separate gpio driver from pinctrl driver, and support gpio v2 controller.

I merged this into an immutable branch here:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=ib-rockchip

Then I merged that into my devel branch for v5.15.

Bartosz: pull this into the GPIO tree if you need it, e.g. if you want
to fix stuff on top.

Yours,
Linus Walleij
