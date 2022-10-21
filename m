Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52CFCC4332F
	for <linux-gpio@archiver.kernel.org>; Fri, 21 Oct 2022 08:10:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbiJUIKB (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 21 Oct 2022 04:10:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229941AbiJUIKA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Oct 2022 04:10:00 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 160059A2AD
        for <linux-gpio@vger.kernel.org>; Fri, 21 Oct 2022 01:09:56 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id q9so5412297ejd.0
        for <linux-gpio@vger.kernel.org>; Fri, 21 Oct 2022 01:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VHPFgmHGt6vQ1ShPZTuxkB9fjJz+VfCu1DDPt9RZxl0=;
        b=eslRu3OzdDavFh/yjk6FOTqiRv9GtrLojydGZ36GOVjzvV3nBAvntnzi3W9zlDh9pb
         24G5GrI590knZpsx5KUTmoFYT9Kta98aTCl6iwykObQ1qv1RYeC37EM1rVlrgXt7ObEq
         IbLkcfhk73aZMQGx8cTUSdsXJyb+2KizRARlIWuqu0puC2l9VTvat+o1/hy5MI+X/ihl
         wbzwglUBQYdE9XzByh1Fx8btb1Hjev3ByLE8mkvzHtc44tTunkzeVculQHLC2638Kt8f
         fMqKSfFTRbokbe4HRVvkrmXnxSjpyBWZCpALpugZNHIRLxEDqAxJVVIo3+kusMKFLFsD
         /0PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VHPFgmHGt6vQ1ShPZTuxkB9fjJz+VfCu1DDPt9RZxl0=;
        b=rKUpBYlkoUkeX2dz5kiCusDpMV+K730e0GnQeB8t1orlsIGqhx33NIhdXDhUOOTP9b
         +PBYe/KjFZ2Vmi9jC5IKPmQzPxjSuv/1jbBPtZWHVHut8HoIczuFZR1RxdiGk+lI/ksN
         wKXPnCwOgIqLAtcrohyzAJIarfYYm+mye8cgGyjVexuLZfkszq5MJPuj9mmknyZCPRfh
         HTkxaVkEIBQJCoB7mJMa/QS7ts5ovrELEsZkmjtvWOA+gQnidGH6+rmg6AWdPvVeNaAX
         cYSkJcIlMFXR3irofn5EFIfWvTlpNQcJ2R2grxkGuELygKEu/itgIrhwe1f24z84eEQV
         rpDQ==
X-Gm-Message-State: ACrzQf271cIszRIhpNzBwonLSHwgax4I7gB6X3stI3RZzNUNTkXaSyA+
        tSm3Es2e8l2XYttCmNWs37fpqTEhhf+QYL/dpGwneA==
X-Google-Smtp-Source: AMsMyM4He3zpyM3ToJ33ioXWzMnZQ/PXDACMo3hh/u4JU9FPyY68k0VaVpXPQNjuYP/2OMSedbeR+cCWLCt8oKeRfyY=
X-Received: by 2002:a17:907:7606:b0:78e:61d:757e with SMTP id
 jx6-20020a170907760600b0078e061d757emr13629183ejc.690.1666339794570; Fri, 21
 Oct 2022 01:09:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220924081312.15068-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220924081312.15068-1-krzysztof.kozlowski@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Oct 2022 10:09:43 +0200
Message-ID: <CACRpkdbvo5vyqpfP3EJvFRhK1hzq4uH=vzoq-H6q6hwJ0Bkc4w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: qcom,ipq6018: replace maintainer
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Sep 24, 2022 at 10:13 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

>  maintainers:
> -  - Sricharan R <sricharan@codeaurora.org>
> +  - Bjorn Andersson <andersson@kernel.org>

This is fine, but what about adding yourself as co-maintainer on *all*
Qualcomm bindings? I think it would offload Bjorn a bit. Just a suggestion.

Yours,
Linus Walleij
