Return-Path: <SRS0=9k7y=DP=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD75C433DF
	for <linux-gpio@archiver.kernel.org>; Thu,  8 Oct 2020 18:44:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 65EFF221FF
	for <linux-gpio@archiver.kernel.org>; Thu,  8 Oct 2020 18:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602182652;
	bh=uksYZG5GgvsQqQ3DMtXlIw9pWYsmwrTsXkkYK+w127Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=MC+jVpUIhAYRF7lYu6ievLz6+NQ7VkeFpQWKKPHIhOgOzBZLec8AipIiSBSF9uKie
	 3Gbf4hfN3YCLVeSU7jAKZ2AoZlF08SM4lHQhVGhmkAet8tZNf+5+ocst1e7eME/REb
	 LlIjjpNZ6IyUO3M/+idrtdWQpXR59WnOuVCOhRHE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729317AbgJHSoJ (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 8 Oct 2020 14:44:09 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:34086 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729235AbgJHSoJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Oct 2020 14:44:09 -0400
Received: by mail-ot1-f65.google.com with SMTP id d28so6550742ote.1;
        Thu, 08 Oct 2020 11:44:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Dfq2sGqijPhMmZV4xu4BQATJrQhJ6uOb1d7bXXraUjo=;
        b=cieOfm61XvvGWBST5EDyVY9TRIgTvoHss1Y6qYk7BzJjx7ncR2+EAxaRbMLg2Nnk/E
         QVI9ZJeTyIGCz1f+TLCy6ipuk63fDk5PCPy/6A7QX5XpSq9lvrc9JnmpETjKoB2QbhE9
         mVAgF1MeDIvKdkOAEYqMUyUVSytbN/6cX7IDCf/Knk7OrMq7N0Dh7NkZR3+xdHDtBGLI
         ts5c7y4PpncRhaQ6JAtNYK6Z6xDf7N6fOtadXZHVcSC6BHHDr8NU37lvsM6zluVgMAGT
         IXiIZtCo1dsD2WaFKeXOITei87nG9xKeMXBF68bsv0zfNSD5mhvVPXrRS/lJAgssG0qn
         eSBw==
X-Gm-Message-State: AOAM530u1kj4X4t6ZfgfIPk1CImbAFfMPBFCVNwAnpQ8j4F3/lB+uTbu
        UUfwji9ALjpxG+BCevtcRA==
X-Google-Smtp-Source: ABdhPJxaGQ2Eo3bxP5Cbv7Q+1bIjeuwRxe0qRPralUDX4xFmi2l8TJd0Fq5sJDzXHBDqa9loEzDtJQ==
X-Received: by 2002:a9d:1e86:: with SMTP id n6mr6255632otn.94.1602182646825;
        Thu, 08 Oct 2020 11:44:06 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l1sm6071854ooe.20.2020.10.08.11.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 11:44:05 -0700 (PDT)
Received: (nullmailer pid 2425046 invoked by uid 1000);
        Thu, 08 Oct 2020 18:44:04 -0000
Date:   Thu, 8 Oct 2020 13:44:04 -0500
From:   Rob Herring <robh@kernel.org>
To:     Naoki Hayama <naoki.hayama@lineo.co.jp>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/6] dt-bindings: pinctrl: qcom: Fix typo abitrary
Message-ID: <20201008184404.GA2424974@bogus>
References: <7d1856e2-84c7-ab19-863d-2d500569d58c@lineo.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d1856e2-84c7-ab19-863d-2d500569d58c@lineo.co.jp>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 08 Oct 2020 17:47:35 +0900, Naoki Hayama wrote:
> Fix comment typo.
> s/abitrary/arbitrary/
> 
> Signed-off-by: Naoki Hayama <naoki.hayama@lineo.co.jp>
> ---
>  .../devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.txt        | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!
