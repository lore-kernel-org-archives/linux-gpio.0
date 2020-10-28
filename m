Return-Path: <SRS0=Je6w=EE=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4501C388F7
	for <linux-gpio@archiver.kernel.org>; Thu, 29 Oct 2020 00:28:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 05826207DE
	for <linux-gpio@archiver.kernel.org>; Thu, 29 Oct 2020 00:27:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b="d7uJKM2k"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388805AbgJ2A1y (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 28 Oct 2020 20:27:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388807AbgJ2A1u (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Oct 2020 20:27:50 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB58FC0613CF;
        Wed, 28 Oct 2020 17:27:49 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id g21so611443vsp.0;
        Wed, 28 Oct 2020 17:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RQ2kvUyYd4YE/aOcmy2TWcR3YaKz9JiRyVflCfdu5Ag=;
        b=d7uJKM2kvc8QuY02CcO5eBrxbPT8YUiaUU1yfWyy96kwPlqHgSJbuzyw5TzPhu6q1i
         Mx3BMKt0rJCXGELn+j98YQOuRL9N/PNF1OAh+5sMfmimXwb1nO1iOOgc1D9Z9NrdDut5
         12Cjvu4k6cSwBpskqjLRgkmjbm/U3Vf2VSKf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RQ2kvUyYd4YE/aOcmy2TWcR3YaKz9JiRyVflCfdu5Ag=;
        b=NQx+tDArWavrF+TYS2ZkPFmUzcIfiHr/N6hE3xmWwa0mmqKeOs4KxECjF5LgEDtPHs
         kI4VBlvT6h2C48V43jpLPoRvwwWJsN4OOuzEGEZUtl7+glqSdb72v/ODsaZo+h9suP18
         WtdMw7KdCXd6DRxgqFMAU09vrvLhCgr3JLqTXnShas+pyfz8Cxs5g7UyEt+G6zeVkmtS
         ENFvKrfxnz9r8vNDuI0SF1R/dHJ60f/ZqS8qkPEeitMI3XdF4msZOPglaGuwiFBWrtBE
         Dnemxie09XzAVJRluMOAs8ydWjO0niRr6zgbz+SfESuAOC0jHm7vV3Rx9ux7BddEGl/D
         VzUg==
X-Gm-Message-State: AOAM530I8E71AKAM724D7nPG+RxOdjUrM+gkSml5B9xg3TgpafLcJp7K
        rBRoFAX2EtcMP8MWx63d3iujYw4e+DtqlmaeIX5UjAOwixFQ9hY1
X-Google-Smtp-Source: ABdhPJxQgUH7wxrvz7ZLyzad/HO2Oih626XOaAtn0H/+hBkJgVlw0Lkex5XUeHspPJHS77UwlY99ZTN9QT3BiEhy5OQ=
X-Received: by 2002:ad4:5387:: with SMTP id i7mr5777139qvv.43.1603861987985;
 Tue, 27 Oct 2020 22:13:07 -0700 (PDT)
MIME-Version: 1.0
References: <20201012033150.21056-1-billy_tsai@aspeedtech.com>
 <20201012033150.21056-2-billy_tsai@aspeedtech.com> <49ef1445-ddb5-41fb-b9f5-f885a1784e77@www.fastmail.com>
In-Reply-To: <49ef1445-ddb5-41fb-b9f5-f885a1784e77@www.fastmail.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Wed, 28 Oct 2020 05:12:56 +0000
Message-ID: <CACPK8Xc-rFMkv6_VVizF0F8uqQQC=rko=P_LhC0CphJH+_VFYA@mail.gmail.com>
Subject: Re: [PATCH 1/3] Arm: dts: aspeed-g6: Fix the register range of gpio
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     Billy Tsai <billy_tsai@aspeedtech.com>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        BMC-SW <BMC-SW@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 26 Oct 2020 at 01:05, Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Mon, 12 Oct 2020, at 14:01, Billy Tsai wrote:
> > This patch is used to fix the memory range of gpio0
> >
> > Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

I've applied this with:

Fixes: 8dbcb5b709b9 ("ARM: dts: aspeed-g6: Add gpio devices")

Cheers,

Joel
