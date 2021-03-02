Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07842C4361A
	for <linux-gpio@archiver.kernel.org>; Tue,  2 Mar 2021 21:21:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C84F264F2C
	for <linux-gpio@archiver.kernel.org>; Tue,  2 Mar 2021 21:21:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1447842AbhCBVSu (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 2 Mar 2021 16:18:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1448625AbhCBPH7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 10:07:59 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE424C061A2E
        for <linux-gpio@vger.kernel.org>; Tue,  2 Mar 2021 06:57:53 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id h4so24110938ljl.0
        for <linux-gpio@vger.kernel.org>; Tue, 02 Mar 2021 06:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Im5YPNvUkVcY2oDOFR/SwHL8vc7nQDBtJ/LXMfThDB8=;
        b=zJRw+Yu3R85QSUpo38xDhIvT/Dlbhod/Qk8sxP5xeIFKLrbDE6H+QFkSfE3VIMjfRi
         uUX+UgpxLbkrVNwQav+u2HlrDLdSwkSO0sM7pW+Ns2I8iuW+PK7m9rG3RMN1g8znvgo1
         tX/gr5XA3vHh6KHbkjzdbiPCtOzksTCLXokDqeXps0UpNCDLBBaYZ9AIGFyKEpbLhzdz
         9bOyxGMw+zYHQIW5XE/+h09N7bDyV721lSGKksvaFGKHmv8JtQNPhh1TiJs519AyeRGz
         q0oVha9befOwiwClfUCaLUiW9f4LSe7LFipmeIA6Bg2k6Fhy0tRkbQ51fm7uRQa4mSjo
         mfPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Im5YPNvUkVcY2oDOFR/SwHL8vc7nQDBtJ/LXMfThDB8=;
        b=g3BFF+1xMuMzvyUf+PFQccTqzrS4fok2iERNUzLzbyW10ECUi5YmCD8jADOGfMbiWy
         XeYK9VsacbbgH88k0WlJrxYCcHa7bd1YT+PPR52LcntQ/VUtQQUzTMtviJcmOwJzLsCz
         Ot57GW5olgVO8b71TN+Udm3Z6q5jEtxcrd7ywNkz0BEBxOuHKEVKltSJc/UMU+0ujUrn
         b/L9WMwf04ZNpib+zQZAyq08OCghf270MSjjqQbVc/cHw0TAFoJHLVPRlDbf51+txowT
         wtQBIShzZNX764GJXj9mjl8WGxxrsOZKM71pZmbWeUm2x3LwxWieyMA7X58i611umSZi
         J+ew==
X-Gm-Message-State: AOAM531KFYXp4J32V4hOWnVvyHls0p4S5I7Wk4kJ4C0ohZWsZEPFmupe
        sTv2sAUplvpIIVql//Xjt0aoCAqnXj999+ShuKOduw==
X-Google-Smtp-Source: ABdhPJzwO7KakZJQ6OZLNilczG55ectEq/5Dfn1nJ9yzcfKIZ65wvA2Ybol6f5OZXAB+ObTRsQHYhjyHFwPVhl1ADkM=
X-Received: by 2002:a2e:9041:: with SMTP id n1mr12349532ljg.273.1614697072434;
 Tue, 02 Mar 2021 06:57:52 -0800 (PST)
MIME-Version: 1.0
References: <20210225164216.21124-1-noltari@gmail.com> <20210225164216.21124-2-noltari@gmail.com>
In-Reply-To: <20210225164216.21124-2-noltari@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 2 Mar 2021 15:57:41 +0100
Message-ID: <CACRpkdbjhTfQ4EcjndgE_Y7_uCT2ohadTjj-rrQAFNm+c0whRg@mail.gmail.com>
Subject: Re: [PATCH 01/12] Documentation: add BCM6328 pincontroller binding documentation
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 25, 2021 at 5:42 PM =C3=81lvaro Fern=C3=A1ndez Rojas
<noltari@gmail.com> wrote:

> Add binding documentation for the pincontrol core found in BCM6328 SoCs.
>
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
(...)
> +  interrupts-extended:
> +    description:
> +      One interrupt per each of the 4 GPIO ports supported by the contro=
ller,
> +      sorted by port number ascending order.
> +    minItems: 4
> +    maxItems: 4

I don't know if this is advisable, there are different ways
of specifying interrupts so this may become ambiguous,
I think Rob will know how/if to do this though.

Yours,
Linus Walleij
