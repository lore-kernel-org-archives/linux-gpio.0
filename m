Return-Path: <SRS0=ahNV=24=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEAE8C33C99
	for <linux-gpio@archiver.kernel.org>; Tue,  7 Jan 2020 09:43:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A71122080A
	for <linux-gpio@archiver.kernel.org>; Tue,  7 Jan 2020 09:43:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UrjgJBGy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727084AbgAGJnS (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 7 Jan 2020 04:43:18 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:33129 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726558AbgAGJnS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 04:43:18 -0500
Received: by mail-lf1-f65.google.com with SMTP id n25so38426765lfl.0
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2020 01:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I3KYUHqjbV/la2pQs13q7xW2zW1+aOUSJ/ItOMkEioA=;
        b=UrjgJBGylGsxt2O/37GXsCrU80X3acd5iK9tF8j3b+FFY6/zrEKHNEHxExKwF2XBjo
         Eutk1xAIMJpAuDwWUe66mKIU89kY/4y/G+yYX++jtMSPLmIFPhuBkhTS+cgBPwhRqObf
         EsJA7DVWNM3UW5nR1ALsyiekYnLeNaj2z9l84Sdxr88nXQ5ymB+KH1+s+APM1ihCFHka
         QCY2yelgoalwPQcc1yyFY1Jh1S3ipyxEfNoDmU3Xri6ikRV+tkGtsMZYlneuZ96P8PRi
         AEr9BYeZKPxqSoVNPIDJJnLMPVtH3suNFxg6DazjcZz79CVwmPOG1dXrZCKt9Wud0fcN
         qU/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I3KYUHqjbV/la2pQs13q7xW2zW1+aOUSJ/ItOMkEioA=;
        b=JCwR7O5QAhNoHnQayrLJX0D6YlRnle+KxAyJCH8F9Vn7PvksXMDKyJPTffKU5ox8P/
         imwtVOROYSbbNT9Z+1nXrxmTSL8lv0Gj0+qVuaKFDfREutztrnhuI8a5w0TPT41Ye7T9
         UUQosCUs5l+vt5US6tF+QjvSZgsSYoco+u/g+tNTsw7TtJFFv1WAdFUdrijEutKpM5PD
         lSvkIZSJ6n8o1kC/erEmwWVm3kpt1+vxuFe67cZ4aFrYjoBFRpmN8l0AlTi8w5MJc230
         MFFQhuYIkc5g4KXONY2KAT4Af7rO9XIN+/aoFdbOcfTaCOxFZOjd1dveI7YC1LAs11cp
         RfnA==
X-Gm-Message-State: APjAAAU3oHuWd/7rbQwiIHpzrqU+EccqpI03bvgJwEi+6Bdc7XkFnnw7
        Zxr3XEIJeo3sT4Wj5BtV87bsoUQFz37wZsNPZvS/CQ==
X-Google-Smtp-Source: APXvYqwlnUnUD6Pz4nc1kPRcSvnFa6RimACaHIJvGNUu2qiaTC1sqx9RJ3urXdFSnyhcPkKPss4GSSAD5kvOk3IkGKI=
X-Received: by 2002:a19:8a41:: with SMTP id m62mr58874379lfd.5.1578390196075;
 Tue, 07 Jan 2020 01:43:16 -0800 (PST)
MIME-Version: 1.0
References: <1576723865-111331-1-git-send-email-mafeng.ma@huawei.com>
In-Reply-To: <1576723865-111331-1-git-send-email-mafeng.ma@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 10:43:05 +0100
Message-ID: <CACRpkdakKeOhuOY_amLVbf61jQsMLfxRjWE_J-4Zqr2wrQGuNQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: armada-37xx: Remove unneeded semicolon
To:     Ma Feng <mafeng.ma@huawei.com>
Cc:     Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 19, 2019 at 3:50 AM Ma Feng <mafeng.ma@huawei.com> wrote:

> Fixes coccicheck warning:
>
> drivers/pinctrl/mvebu/pinctrl-armada-37xx.c:736:2-3: Unneeded semicolon
> drivers/pinctrl/mvebu/pinctrl-armada-37xx.c:803:2-3: Unneeded semicolon
>
> Fixes: commit 5715092a458c ("pinctrl: armada-37xx: Add gpio support")
>        commit 2f227605394b ("pinctrl: armada-37xx: Add irqchip support")
>
> Signed-off-by: Ma Feng <mafeng.ma@huawei.com>

Patch applied.

Yours,
Linus Walleij
