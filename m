Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3DA0C2B9F4
	for <linux-gpio@archiver.kernel.org>; Mon, 14 Jun 2021 16:13:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8E2E2613DC
	for <linux-gpio@archiver.kernel.org>; Mon, 14 Jun 2021 16:13:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234511AbhFNQPK (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 14 Jun 2021 12:15:10 -0400
Received: from mail-ot1-f54.google.com ([209.85.210.54]:46702 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234572AbhFNQPK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Jun 2021 12:15:10 -0400
Received: by mail-ot1-f54.google.com with SMTP id 66-20020a9d02c80000b02903615edf7c1aso11291757otl.13
        for <linux-gpio@vger.kernel.org>; Mon, 14 Jun 2021 09:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0oFGZgzuK+wfWh3twXvjozyyp5mnxr4qBNBCoc1c4Vc=;
        b=KUPJUELSmJyV98B+X/+cIUvTZ9qK865mR0u/qVLuiNlLxllgdbUkS1OgK1WWN8/0kn
         x9IeyyK96IFCf+pp2n7uJTJbA03oqfpIATr4nejMBzhmXeE0pOm4+LiivxUGbVtaUQF3
         X5eVUd+D4KsSpnrGANeTmogrhhw1E58moJ4SOLyRwJXDzjRKe6VXSz7u3WgbvnNc7E+G
         1RPQaSat1SPzCxVRywkPZVvHD3ePFkSgeCwM1N996tTgRpSK1Hd0VIC8GnBarTFe0AHE
         WhnkRJFalxBEMZjd2v/xgboeVWnpVkHmWlgTfHqq/MyavGE9TF/D+TpQf2kRHjdxdnnx
         DzwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0oFGZgzuK+wfWh3twXvjozyyp5mnxr4qBNBCoc1c4Vc=;
        b=JDih6+V8eXXXiZNERm9WB6Jp1KIEnyu65uem+D1E5ukekqECBaSKC0Gb3f4pbM+jfh
         +GzeKrG9RCdXsafdHQLBWEZ5uvYmauNTEo8ie9Xjam/w+Jf92K+Y4bPz8D8avQje3My/
         gOY1UBETtmZcOUQZcD+QyFN2WKF468QET+15Hk8GOjFXE3zvpu9Phvzjw0AguBV98R9h
         AUUCrMpjbu07QyDwBca6xgGeNzEzg2ly+CS7r8PT/9gMrgkvgUTbyEQaQw+yzZpMS4rh
         Emli/jIRO5x3r8K15trTYhWMk80cZLznxO6Q23/Oo1bS9VsvEDyJrsOwBJASH3Xo7uNL
         kDNQ==
X-Gm-Message-State: AOAM532k0dslX0ucLetAiK0EoxDL3wWRykaHWQNunWz9XusAGpo+Wn/y
        zY9b2HsJX3Ts1pbybLkVoYS9bg==
X-Google-Smtp-Source: ABdhPJwHmnrT1SOKWGo7+pc9rThKvmW9tBakGXsNBZEVxmFc0VzMxdN22HDAGcmt5a/aMO3+wDXMFw==
X-Received: by 2002:a9d:3e15:: with SMTP id a21mr14289365otd.366.1623687127068;
        Mon, 14 Jun 2021 09:12:07 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k84sm3033230oia.8.2021.06.14.09.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 09:12:06 -0700 (PDT)
Date:   Mon, 14 Jun 2021 11:12:04 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        bhupesh.linux@gmail.com
Subject: Re: [PATCH 5/8] pinctrl: qcom/pinctrl-spmi-gpio: Add compatibles for
 pmic-gpios on SA8155p-adp
Message-ID: <YMd/1C3oJ41A8g4p@yoga>
References: <20210607113840.15435-1-bhupesh.sharma@linaro.org>
 <20210607113840.15435-6-bhupesh.sharma@linaro.org>
 <YMLR11+6A/6klgqJ@builder.lan>
 <CAH=2Ntwkk4Hw1VQcXu9y08jPHWf99EFmj=7GG0V4uuwbNK7c0A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH=2Ntwkk4Hw1VQcXu9y08jPHWf99EFmj=7GG0V4uuwbNK7c0A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon 14 Jun 03:30 CDT 2021, Bhupesh Sharma wrote:

> Hi Bjorn,
> 
> On Fri, 11 Jun 2021 at 08:30, Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Mon 07 Jun 06:38 CDT 2021, Bhupesh Sharma wrote:
> >
> > > SA8155p-adp PMICs (PMM8155AU_1 and PMM8155AU_2) expose
> > > the following PMIC GPIO blocks:
> > >
> > > - PMM8155AU_1: gpio1-gpio10 (with holes on gpio2, gpio5, gpio7 and gpio8)
> > > - PMM8155AU_2: gpio1-gpio10 (with holes on gpio2, gpio5, gpio7)
> > >
> > > Add support for the same in the pinctrl driver.
> > >
> > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > Cc: Liam Girdwood <lgirdwood@gmail.com>
> > > Cc: Mark Brown <broonie@kernel.org>
> > > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > Cc: Vinod Koul <vkoul@kernel.org>
> > > Cc: Rob Herring <robh+dt@kernel.org>
> > > Cc: Andy Gross <agross@kernel.org>
> > > Cc: devicetree@vger.kernel.org
> > > Cc: linux-kernel@vger.kernel.org
> > > Cc: linux-gpio@vger.kernel.org
> > > Cc: bhupesh.linux@gmail.com
> > > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > > ---
> > >  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> > > index 00870da0c94e..890c44b6e198 100644
> > > --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> > > +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> > > @@ -1127,6 +1127,10 @@ static const struct of_device_id pmic_gpio_of_match[] = {
> > >       { .compatible = "qcom,pm8150b-gpio", .data = (void *) 12 },
> > >       /* pm8150l has 12 GPIOs with holes on 7 */
> > >       { .compatible = "qcom,pm8150l-gpio", .data = (void *) 12 },
> > > +     /* pmm8155au-1 has 10 GPIOs with holes on 2, 5, 7 and 8 */
> > > +     { .compatible = "qcom,pmm8155au-1-gpio", .data = (void *) 10 },
> >
> > As noted in the binding, I think this should be "qcom,pmm8155au-gpio"
> > and please skip the comment about the holes.
> 
> Similar to what I noted in the binding patch review thread, the pmic
> gpio holes seem different as per the downstream dtsi.
> 
> So, please let me know and if required, I can make the suggested change in v2.
> 

As noted in the binding, this really seems like software configuration.
So we should deal with this in DT (e.g. by not referencing the gpios
that Linux shouldn't touch), rather than the driver.

Regards,
Bjorn

> Thanks,
> Bhupesh
> 
> > > +     /* pmm8155au-2 has 10 GPIOs with holes on 2, 5 and 7 */
> > > +     { .compatible = "qcom,pmm8155au-2-gpio", .data = (void *) 10 },
> > >       { .compatible = "qcom,pm8350-gpio", .data = (void *) 10 },
> > >       { .compatible = "qcom,pm8350b-gpio", .data = (void *) 8 },
> > >       { .compatible = "qcom,pm8350c-gpio", .data = (void *) 9 },
> > > --
> > > 2.31.1
> > >
