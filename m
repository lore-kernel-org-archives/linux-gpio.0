Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 371C9C433EF
	for <linux-gpio@archiver.kernel.org>; Wed, 22 Sep 2021 10:17:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1DA32608FB
	for <linux-gpio@archiver.kernel.org>; Wed, 22 Sep 2021 10:17:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234720AbhIVKS3 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 22 Sep 2021 06:18:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234719AbhIVKSZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Sep 2021 06:18:25 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E500C061756
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 03:16:55 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id q81so4174613qke.5
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 03:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q7fvXndN10Ipglqr4AHb8oRIhQA/vreSOhtihIaad+U=;
        b=48Mw+XRsurH8oTh8wtDj9/25h/FB6GX1MdkEq7POsBngKQ/neYNIrVTt33Afxv1KB0
         q3P+k/l+tqUjaEXm5jbPCUjRVVmNzQ83MNydgZi11iA9GaudMP/W7zWKHGA0XWahv0O+
         O8V9OrtN9ugcfwzJFrhAGCe6Xr52L7/Svqq20XZWGymgDQq2l42yqjPfxf4mrUdbjqes
         PuXncSvIltr5gzWIuw1yM8P0cNUkOm2QC3eDyXXBE1krmm+z8vcSiS+BBUoQfFPvaANa
         DJtD8o0jRwvqHlJlOwLUl+AZfucfNBGuMhUT0tAG9Czp2MCa7z/yrzrtUASMd2l2Fanu
         PrBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q7fvXndN10Ipglqr4AHb8oRIhQA/vreSOhtihIaad+U=;
        b=n2Yv4p/GEcAbH757utkWtzLBqV87MD5ELj3s5AWBVvrd20eQwZwNrhNT0x1TyDJFAs
         o8LaEXT282InuRoihuqKSlJWqWzQZuHEMr1xTSl9hJ6cbDWdazOF1T755UfrI03UOIlj
         qagDhSQuyFFtNOhPnnuW/3bYDPxRPJ3d2LVIsDZRRR8yCpsNnCsuQfVOWPpOv/ep6MDw
         M9W5sU2kJNN70e/ob8apnat9SqIjXedkJqHpN/kwWXXrWKMKGIMmPlkk6VrbdUKutG7q
         hr4szplab8OmSgiVm+TsHYHJ4cVSYZFxS1oIhcALYTl9mgob/F9wBU9doXMEsDNCuWxX
         2LnA==
X-Gm-Message-State: AOAM533JxW3ypuT5YeWAkwv3FJz+dJUj7yma19FcbBfczLuqfduZU1qX
        R0b9izrszEnCTXVTs/eI6JWf94xVoGXZs0o2fu7RNg==
X-Google-Smtp-Source: ABdhPJww9MgeiCCpnhZiXnuJ5lQQX46bvMr/qfds4aQ5sHanvBoArj2RMHPXYJGbXPzSv2RH0zmy5lFz9MGvj5ru+vk=
X-Received: by 2002:a25:cbc3:: with SMTP id b186mr42843421ybg.199.1632305814753;
 Wed, 22 Sep 2021 03:16:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210716221744.5445-1-robert.marko@sartura.hr> <20210716221744.5445-2-robert.marko@sartura.hr>
In-Reply-To: <20210716221744.5445-2-robert.marko@sartura.hr>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 22 Sep 2021 12:16:44 +0200
Message-ID: <CAMpxmJWbGM8=S3Dimq33T3vnAnP5kkgNHu3m8oTAO6=LttRzxw@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: gpio: tn48m: document TN4810M support
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jul 17, 2021 at 12:17 AM Robert Marko <robert.marko@sartura.hr> wrote:
>
> Delta TN4810M expands the existing TN48M drivers, so lets
> document the new compatibles.
>
> Note that this patch depends on the following series:
> https://patchwork.ozlabs.org/project/linux-gpio/list/?series=247538
>
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
>  Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml b/Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml
> index aca646aecb12..d729c5dbed65 100644
> --- a/Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml
> @@ -24,6 +24,10 @@ properties:
>        - delta,tn48m-gpio-sfp-tx-disable
>        - delta,tn48m-gpio-sfp-present
>        - delta,tn48m-gpio-sfp-los
> +      - delta,tn4810m-gpio-sfp-tx-disable
> +      - delta,tn4810m-gpio-sfp-tx-fault
> +      - delta,tn4810m-gpio-sfp-present
> +      - delta,tn4810m-gpio-sfp-los
>
>    reg:
>      maxItems: 1
> --
> 2.31.1
>

This series is still not upstream - what happened to it?

Bart
