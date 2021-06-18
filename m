Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42BF7C48BDF
	for <linux-gpio@archiver.kernel.org>; Fri, 18 Jun 2021 09:56:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 21C4D60C3E
	for <linux-gpio@archiver.kernel.org>; Fri, 18 Jun 2021 09:56:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230399AbhFRJ6t (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 18 Jun 2021 05:58:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231144AbhFRJ6t (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Jun 2021 05:58:49 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4C5DC06175F
        for <linux-gpio@vger.kernel.org>; Fri, 18 Jun 2021 02:56:39 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id c13so9913350oib.13
        for <linux-gpio@vger.kernel.org>; Fri, 18 Jun 2021 02:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3ESriv+BzmXOkRTYrjf9wsQQexiAaPvNBaBUE5zTSZM=;
        b=jF25nJkUeJ9QStXUBdEeBhpXpaPX8cBL8SshMX14Syxq6CIdV7tqJMoa7kqfHvVBXm
         HDlCyGkFcv6Gepf1Iml4MFAvqBTY/s2nar0638Fv76A8JrlZRZu8squz1R3h9jUN+X1e
         C/fFMM4AOVOFZHl4OawyZ3kJkFKr9yKK7MckodG29/cOIgwABsOakurGDnKTk2KCXilW
         9kj+w4IA74F2MHo95ltu5e8KM9czSVuVhWtGFU4vaMYqJy+5Z31M1pL01pQSdv4sNIzI
         FbzVRbto0GWxaMZ9R4n2SU2s91WJgu1UWUIA1stu7LWKq/9tE0eeP0Zm4Kx+n/98C/0q
         7wVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3ESriv+BzmXOkRTYrjf9wsQQexiAaPvNBaBUE5zTSZM=;
        b=HRnNiUX56aTBjmF6Ed2Pta5yDSglN/dHLYpW0aVts4koW4ou4TpO7fknzW8cBEt7mo
         INxNNDWfqba9oQNrIw//Jq+RYBL3Ez6wteqiBJ0u8F+5D1RhDeL/Devo0vPwtPVA4Amp
         n/jNpAV9bzyqjda9S2fwpVvW1LcB4Ng4bQTnB7kTctBNS6TZX913ewXoyb50Ganvmois
         pDdmhcTnvclE/Irx9OBRsQXnOjWnkQuc23PGGTGthXIDn6nxB9uJ0F8SZRnX6CKjh2pX
         dfdhvYyh/WXgYnCvyGEzz2iDvhX18HeuZlGyu1NYyd0UaYtfgUztL2n1Q5G5zLFyXRUo
         HDnw==
X-Gm-Message-State: AOAM533Tp1dXkCSE+smUEMejeTGtl5P0xrvVccdjmZbgmLKHvuLUdu7W
        U/FaAL6hd8Dfol3nio+Q+Esx7m+K9wpUTEQ1cbj6RQ==
X-Google-Smtp-Source: ABdhPJyOo/2I3BzPuOnIRa60RHmRe06cImeJ3nXbmgRiP8BTWRq3sIf5QNYlhansECa5hTf/zpLp1at1PK6Fm/TqpDI=
X-Received: by 2002:a54:438e:: with SMTP id u14mr14176319oiv.126.1624010198986;
 Fri, 18 Jun 2021 02:56:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210617054548.353293-1-bhupesh.sharma@linaro.org>
 <20210617054548.353293-6-bhupesh.sharma@linaro.org> <017932d3-ad1d-976c-2be4-f2beab7df1bd@somainline.org>
In-Reply-To: <017932d3-ad1d-976c-2be4-f2beab7df1bd@somainline.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Fri, 18 Jun 2021 15:26:27 +0530
Message-ID: <CAH=2Ntw840QbRAcXJddDxRFs5nOiVZcqLeJmL7u_Hx2fn8ue1g@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: sa8155p-adp: Add base dts file
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, bhupesh.linux@gmail.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Thanks Konrad for the review.

On Fri, 18 Jun 2021 at 03:56, Konrad Dybcio
<konrad.dybcio@somainline.org> wrote:
>
>
> On 17.06.2021 07:45, Bhupesh Sharma wrote:
> > Add base DTS file for SA8155p Automotive Development Platform.
> > It enables boot to console, adds tlmm reserved range and ufs flash.
> > It also includes pmic file.
> >
> > SA8155p-adp board is based on sa8155p Qualcomm Snapdragon SoC.
> > SA8155p platform is similar to the SM8150, so use this as base
> > for now.
> >
> > Cc: Vinod Koul <vkoul@kernel.org>
> > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
>
> > +
> > +&qupv3_id_1 {
> > +     status = "okay";
> > +};
> >
> This tiny reference is unsorted,
>
>
> besides that:
>
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Hi Bjorn,

Please let me know if I should send another version to fix this
comment, or can you sort the same while applying the patches.

Thanks,
Bhupesh
