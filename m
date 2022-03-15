Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC541C433EF
	for <linux-gpio@archiver.kernel.org>; Tue, 15 Mar 2022 01:04:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344166AbiCOBGG (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 14 Mar 2022 21:06:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344152AbiCOBGF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Mar 2022 21:06:05 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0E503878D
        for <linux-gpio@vger.kernel.org>; Mon, 14 Mar 2022 18:04:54 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id t11so2594742ybi.6
        for <linux-gpio@vger.kernel.org>; Mon, 14 Mar 2022 18:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yAm5OvhWANM70n2iXAUODUmXPNizY/Wk3oobwqvI5vY=;
        b=XvgktuOwcdRbBdtoKoel2yPRVXVFwM+IWd2UW9qUYwDjWfzWWN9R8DmmJC1KiUj+gE
         bjAHWY0QxnGZv2MK54CisIBwTlUqNZnZ0p0QeZfJOCDulcicLR2Wfo5H+XmoS0uappZN
         YKR1N61LTv4GblaJTPOe2mZLMi6jcVgSbMYtTvJPD92xhsHsg905kUInBP+vjFjot9BR
         6NuZGmWYCww0juYpEGJFx+W+vixcbOtqCt6jPVc/CMB5yIxVEDbMk6kSJo453fKGYlva
         7NJTs2J8o0BIB4rZBb+4VkLXi16fNORKOhDGK2HtwPHJFyDI3dI0FXxfFug7o01j2WcB
         THqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yAm5OvhWANM70n2iXAUODUmXPNizY/Wk3oobwqvI5vY=;
        b=W2ksAWNsJ0S2KcHVU5N5jXnDhtSA+YqJ9KLOVR/qqfBZ90mbtwtiWop7NnxsbjOR7R
         gJFyKstoniUpYpqLXWMajsX9ntEeBUP8MR66kCpO1t7ojtSGTCkj71xfv1BTEjoxvDPh
         Wc/epd+hIwqkniKSLBfHOCBngOrA1st8FRbTzD8QlBQiGyiCv+ohN77kTRPhRXsw8833
         IJI9MKzEe8priHCxgLIFXqNxx1yTG7LtDv4xzbUq22FcPFEGz2Ua05UjIZOKALWBkNI9
         4tX5xnt17rvcA8zliCA5iFRxBvpTC12GZpVa/W5GpJ0hlQz5F5Vs9cGBF+DnhliuqUq3
         fwLw==
X-Gm-Message-State: AOAM531LWzBEFbIJm4335UIPCxayExBEgo0GszO/5ZU7fIBiFX680/ER
        kAGwnEfDDQsdc5Ig0s7UzSAm3fbD4RNmkoCCZEazBKY4Tp0=
X-Google-Smtp-Source: ABdhPJwCTLgZvR10g8cOkgwnXUV0ru758i4gMC9avP243uwHJ9kOV3Y2hDoDgVxvAL3bYPi/kFB2JF8ViT9JoQcu10A=
X-Received: by 2002:a5b:dc5:0:b0:624:f16d:7069 with SMTP id
 t5-20020a5b0dc5000000b00624f16d7069mr19980767ybr.295.1647306294150; Mon, 14
 Mar 2022 18:04:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220308221132.1423218-1-bjorn.andersson@linaro.org> <20220308221132.1423218-2-bjorn.andersson@linaro.org>
In-Reply-To: <20220308221132.1423218-2-bjorn.andersson@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 15 Mar 2022 02:04:43 +0100
Message-ID: <CACRpkdbvW0MVdhgFiVCcz+NDJu+mJc=4AgHC3AYnjZy+OOm2qA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: Introduce sc8280xp TLMM driver
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 8, 2022 at 11:09 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:

> The SC8280XP comes, like all other Qualcomm platforms, with a TLMM
> block, so add a driver for it.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Patch applied!

Yours,
Linus Walleij
