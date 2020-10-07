Return-Path: <SRS0=pKPn=DO=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77E87C4363C
	for <linux-gpio@archiver.kernel.org>; Wed,  7 Oct 2020 10:00:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1BA7620B1F
	for <linux-gpio@archiver.kernel.org>; Wed,  7 Oct 2020 10:00:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xf/ohE0w"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727103AbgJGKAV (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 7 Oct 2020 06:00:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727068AbgJGKAV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Oct 2020 06:00:21 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0709AC0613D3
        for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2020 03:00:21 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id a23so561257ljp.5
        for <linux-gpio@vger.kernel.org>; Wed, 07 Oct 2020 03:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WN6rPq3Jb2J9s19F4btsXYpY+lL25Qny3tbdIXW+Fas=;
        b=Xf/ohE0wJ/Mz6aWYOKXAuP+EJO8mCAmm7j8DEnLoSRGWBvnOLA4vk3YceEz5Vi6X6k
         CqnOFwimTOxcuGdy7tp0aMTABW9I5RCyx+pNH/XrKcud2SnKG6h0+ZMKht+C+lPdmF60
         sl+j3WYLSp27WqL9pGrgAXC6SNccVFELBqAMTwK3VZYCJLNYqsXQHzg7l8V42NtfJrnJ
         1dy+IAZcsriYaUXE4R9AKT+zknUk2lpARSY7aaZC/oax7zGT5tKgK4OlkeWz0Xv7WbeW
         8eCXKmZHoGpNrhfSFDAvbQyVPV3Sv2ReEH1dJWtRP3AtuZ9Sd6QIbiwrcQSWomrqjCYw
         N7LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WN6rPq3Jb2J9s19F4btsXYpY+lL25Qny3tbdIXW+Fas=;
        b=Tx5i4BnDFovEVkIAGaLbSdHZSq3MlfDA9jllQLCuCbaKCUAUzS8+y26Dd2yF4BGrdI
         B8p8zHbBkOQcrsXY47wFT6/N8a9AXbq/Hl0hFG8UhFv7m3RxQYh0Z34b/1hG1IVefoFM
         uJk9TlreIvm6VWawJsaC94SgLmcNdDiQrbzWLUO0OozSuKrQlQKkL8J6bzoHkPxTKOBl
         NLE/XAEoMbZQkfkNffo8saA8FHZbonC8aggdHQrkLOnQsqZJOQAzST9b8EHSKCObKARs
         IYsrb1RYXwZz9BlUHE0aFtZwiwhzoIq3SzHhWv16DpugguCcNnwEJufhfto3sDP8WGI8
         BmBA==
X-Gm-Message-State: AOAM532b+WBkXWxP4nYSen3TnF6IeMYBvYMORtZtzkf7IOVNx2/H/QRm
        m7+dj96ZzfGrFZkugtudavCeFXh7Q8uh7x9+rXJvWQ==
X-Google-Smtp-Source: ABdhPJykVCxs0SsnjDZ1ywvySwZi3o1buJA52HzDTcMWUwgQKxyxvgYNAvwkzcibJHOwEK9PKpmzsQ6GIxv2xTjik0I=
X-Received: by 2002:a2e:810e:: with SMTP id d14mr1010594ljg.100.1602064819422;
 Wed, 07 Oct 2020 03:00:19 -0700 (PDT)
MIME-Version: 1.0
References: <20201005190939.21016-1-peron.clem@gmail.com>
In-Reply-To: <20201005190939.21016-1-peron.clem@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 7 Oct 2020 12:00:08 +0200
Message-ID: <CACRpkdacfJ5G9Z=cSnQhCj8ccYs+QsbDRPZ3JSSdEMVusYKR0A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: sunxi: Allow pinctrl with more
 interrupt banks
To:     =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc:     Maxime Ripard <mripard@kernel.org>,
        Yangtao Li <frank@allwinnertech.com>,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 5, 2020 at 9:09 PM Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.co=
m> wrote:

> Recently introduced Allwinner A100 pinctrl block has 7 interrupts.
>
> This trig a warning when running dtb_checks:
> sun50i-a100-allwinner-perf1.dt.yaml: pinctrl@300b000: interrupts: [...] i=
s too long
>         From schema: .../allwinner,sun4i-a10-pinctrl.yaml
>
> Fix this by allowing up to 7 interrupts.
>
> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>

Patch applied.

Yours,
Linus Walleij
