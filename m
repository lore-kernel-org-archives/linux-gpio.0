Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CF7FC433DB
	for <linux-gpio@archiver.kernel.org>; Thu, 21 Jan 2021 17:07:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D0AAC23A58
	for <linux-gpio@archiver.kernel.org>; Thu, 21 Jan 2021 17:07:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388448AbhAURHK (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 21 Jan 2021 12:07:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:39218 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388318AbhAURHC (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 21 Jan 2021 12:07:02 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C448E23A54;
        Thu, 21 Jan 2021 17:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611248781;
        bh=AcrmoB+h/zi8HkyQOGW0ipwVsjuiLu5lEygPUCOSziI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nHwYplwmzmV/RgR+6OYNo7t5ugwqY1LFSFDMmoTsgv9ZzpwgKB/K/O/nNVbn2Y653
         piCZylP722MxqXNb7GrPCno1NAnfpzdK/4+6kp4kRJH7599ZcrmmrUidUMPbOdmE3I
         EvKlcQpbKdhZr47y7YPDuVPspLgfwtWDcyjKPrOn6ZOCt+sG8tCp0EAd4EcmqheOef
         T7Le/hL4SbIjXHV2cZCIPUAIIzBrE6OHE0ZXBicNALu8RkFT3LKuGQr8fncLEjQbPP
         sDAG23r6UJUzh0EAoZOO8a1dpVjeDv0caIiLHqy4ljsYuDJfVp/ZrY2G+b4cVFTJ0o
         zTJZlscreZQ+A==
Date:   Thu, 21 Jan 2021 22:36:17 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: qcom: Define common TLMM
 binding
Message-ID: <20210121170617.GH2771@vkoul-mobl>
References: <20210120222114.1609779-1-bjorn.andersson@linaro.org>
 <20210120222114.1609779-2-bjorn.andersson@linaro.org>
 <CACRpkdY6G_EP8QAp1C-eghdbgcgwQezA1ap=nDtSHPNqjuDF6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdY6G_EP8QAp1C-eghdbgcgwQezA1ap=nDtSHPNqjuDF6Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 21-01-21, 14:20, Linus Walleij wrote:
> On Wed, Jan 20, 2021 at 11:21 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> 
> > Several properties are shared between all TLMM bindings. By providing a
> > common binding to define these properties each platform's binding can be
> > reduced to just listing which of these properties should be checked for
> > - or further specified.
> >
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Vinod Koul <vkoul@kernel.org>

> Overall it looks good, just cutting some slack for reviewers (especially
> DT people) before applying.

Yeah it does clean stuff up. I have rebased on SM8350 series on top of this, will post soon.

> > +description:
> > +  This defines the common properties used to describe all Qualcomm TLMM
> > +  bindings and pinconf/pinmux states for these.
> 
> I vaguely recall asking you in the past what the acronym TLMM actually
> means. This would be a good place to expand the acronym so people
> know what these four letters actually represent.

It is Top Level Mode Multiplexer (TLMM) it is actually used in the
binding doc :)

> 
> (There, I finally gave you an official reason to go and poke Qualcomm
> hardware engineers about this. ;)
> 
> Yours,
> Linus Walleij

-- 
~Vinod
