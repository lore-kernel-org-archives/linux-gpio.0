Return-Path: <SRS0=N38l=EM=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D552CC388F2
	for <linux-gpio@archiver.kernel.org>; Fri,  6 Nov 2020 09:41:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7129B20A8B
	for <linux-gpio@archiver.kernel.org>; Fri,  6 Nov 2020 09:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604655690;
	bh=lYainVRyWQ9DxSBC7xJ5hannolQDt3SIyDJK5dP9HDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=PxjpISHGSJ4VziTy3CFD5P1ZKh3z0RJ3HGcrvNP+5S1bKBAkE8llE6Ic/DNyFOXre
	 dtNKENDIgjZjwf8eT6QXu7qS/4PPrq0ECnb0U6eKkfOr0Mf7q0w143iWpfj5Rtfy+B
	 voWnUa8O5J/UGbb6ozlgloCYOQhVjJhI+1RYpCKA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbgKFJl3 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 6 Nov 2020 04:41:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:58358 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726139AbgKFJl3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 6 Nov 2020 04:41:29 -0500
Received: from localhost (unknown [122.179.17.95])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 189F5208FE;
        Fri,  6 Nov 2020 09:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604655688;
        bh=lYainVRyWQ9DxSBC7xJ5hannolQDt3SIyDJK5dP9HDU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vrN3K/U2lp7P/E3v71uOKZYgVochODY25nBdkBjjmDSFMS4ZT7tBiAiIUGNADsytB
         0jllIDwBe4QwbmrNrbNwVXl1GqsNM8QKZ6qBBv3Kdo+a1KYw+d/NSFn0LgmwSCER9Q
         saa8EjjoN5hc5fRi/735hNgvw+R07TG/qjuTlH8Q=
Date:   Fri, 6 Nov 2020 15:11:19 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jeevan Shriram <jshriram@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: Add SDX55 pincontrol driver
Message-ID: <20201106094119.GG2621@vkoul-mobl>
References: <20201103055801.472736-1-vkoul@kernel.org>
 <20201103055801.472736-2-vkoul@kernel.org>
 <CACRpkdYWC_Sn3k0Mk4Dh_ZkkTr0D5f6RYVj0VjZG_6hmNX6_=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYWC_Sn3k0Mk4Dh_ZkkTr0D5f6RYVj0VjZG_6hmNX6_=Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 05-11-20, 15:14, Linus Walleij wrote:
> On Tue, Nov 3, 2020 at 6:58 AM Vinod Koul <vkoul@kernel.org> wrote:
> 
> > From: Jeevan Shriram <jshriram@codeaurora.org>
> >
> > Add initial Qualcomm SDX55 pinctrl driver to support pin configuration
> > with pinctrl framewor for SDX55 SoC.
> >
> > Signed-off-by: Jeevan Shriram <jshriram@codeaurora.org>
> > [ported from downstream and tidy up]
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> 
> The v2 version looks nice, but Rob's bot is complaining about the YAML
> bindings?
> 
> Please look into it when you have time, apart from this the patch
> set seems complete, include Bjorn's ACKs on reposts please.

Thanks will do, looks like I need to update the tool version I have.
Will post v3 and include changes in each version (somehow missed this
time)

-- 
~Vinod
