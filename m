Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6E0CC433F5
	for <linux-gpio@archiver.kernel.org>; Mon, 14 Feb 2022 11:16:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350532AbiBNLRA (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 14 Feb 2022 06:17:00 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:48372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350541AbiBNLQu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Feb 2022 06:16:50 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B892A74628
        for <linux-gpio@vger.kernel.org>; Mon, 14 Feb 2022 02:47:21 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id j4so10197692plj.8
        for <linux-gpio@vger.kernel.org>; Mon, 14 Feb 2022 02:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=f6tdSlJeXe/1IN6nf0GGeLX0PqBAatpqqkKLywQfYL8=;
        b=DTAYKnaOh94BOPUawcuMPqT2RtCL2lomNlC1d/wO/grleI08J2rWXGpteVuHo9JBgX
         1Wdsy46fiASLwylBNNfSGyAMBHwNueomFw1spqp7E29g6W7puEPUcPZ2L5CZizbCgLl1
         9xqJQTl+mbTYHmnCatLCGXE2xQTTrPsuXTbaDe0hBG3Y26iRx4H5pKtQj8EtuQQJTOwx
         ebiPPAsgy70pP2GKnLGypj5xhQ1tIh8cW41nnUcRWq00enQBJ09oKP/rtPu7RfdDyjz5
         NddJbf4zhbkP0ne7veMj3Zc8iaCaqc6fx0WzL2PnWD1z+b31Nx0GLQ/YjvUSiBFctNMb
         uaGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=f6tdSlJeXe/1IN6nf0GGeLX0PqBAatpqqkKLywQfYL8=;
        b=0lNROUuHvfh33Z847ti2W+6MVqMZOAxFR/onSVd1qVWxWUulfZog2jnfkCGrnSScGd
         foZs3cxeac2TdQD1jj40uUW1K5ovQ+rf+5wHyuLIEZfAqeErQh1g4zL7kA3FH3i8ig9F
         LElzvXTIbhWZhKj20JVKQ9GUfp+ZOh8NEFEUAQLayCHhZ4Zo6D8CJCWZCCGzfCjWl2Fu
         qBfB9/vedzXSOB0EnvgU8erF+Nt+Jv2JJppAGPq386fY3TWW4Taqy4kBM0KaxlV5yPDF
         s6jxUSDShMgMsUPRSzn+cZdzdWryfH7IEmgAevKQePrvChdZ9EtFuINQykt2pEgAVva0
         gUrw==
X-Gm-Message-State: AOAM530cAA/KfL6o1Ff+Qb7J7d4+58nu2TuxTofDu8yPPwNEgEoiGJch
        0H1XMV40pZlarUseASOkbVbzW27ZjHpc4A==
X-Google-Smtp-Source: ABdhPJzQTPusYaBLdSphWOQZjRSRGGjdHal8Pare5BrSAOmhDMUcSEbYWOtDFOp31nQ/LiEL67sxwA==
X-Received: by 2002:a17:902:f691:: with SMTP id l17mr11420259plg.72.1644835641111;
        Mon, 14 Feb 2022 02:47:21 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id e3sm26664610pgc.41.2022.02.14.02.47.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Feb 2022 02:47:20 -0800 (PST)
Date:   Mon, 14 Feb 2022 18:47:14 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: qcm2290: Add GPIO wakeirq map
Message-ID: <20220214104713.GA31965@dragon>
References: <20211122080938.20623-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211122080938.20623-1-shawn.guo@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 22, 2021 at 04:09:38PM +0800, Shawn Guo wrote:
> It adds the map of wakeup capable GPIOs and the pins at MPM wake
> controller on QCM2290, so that these GPIOs can wake up the SoC from
> vlow/vmin low power mode.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>

Any comments on this patch?

Shawn

> ---
>  drivers/pinctrl/qcom/pinctrl-qcm2290.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-qcm2290.c b/drivers/pinctrl/qcom/pinctrl-qcm2290.c
> index 3f05c0a24b79..aa9325f333fb 100644
> --- a/drivers/pinctrl/qcom/pinctrl-qcm2290.c
> +++ b/drivers/pinctrl/qcom/pinctrl-qcm2290.c
> @@ -1083,6 +1083,16 @@ static const struct msm_pingroup qcm2290_groups[] = {
>  	[133] = SDC_QDSD_PINGROUP(sdc2_data, 0x86000, 9, 0),
>  };
>  
> +static const struct msm_gpio_wakeirq_map qcm2290_mpm_map[] = {
> +	{ 0, 84 }, { 3, 75 }, { 4, 16 }, { 6, 59 }, { 8, 63 }, { 11, 17 },
> +	{ 13, 18 }, { 14, 51 }, { 17, 20 }, { 18, 52 }, { 19, 53 }, { 24, 6 },
> +	{ 25, 71 }, { 27, 73 }, { 28, 41 }, { 31, 27 }, { 32, 54 }, { 33, 55 },
> +	{ 34, 56 }, { 35, 57 }, { 36, 58 }, { 39, 28 }, { 46, 29 }, { 62, 60 },
> +	{ 63, 61 }, { 64, 62 }, { 69, 33 }, { 70, 34 }, { 72, 72 }, { 75, 35 },
> +	{ 79, 36 }, { 80, 21 }, { 81, 38 }, { 86, 19 }, { 87, 42 }, { 88, 43 },
> +	{ 89, 45 }, { 91, 74 }, { 94, 47 }, { 95, 48 }, { 96, 49 }, { 97, 50 },
> +};
> +
>  static const struct msm_pinctrl_soc_data qcm2290_pinctrl = {
>  	.pins = qcm2290_pins,
>  	.npins = ARRAY_SIZE(qcm2290_pins),
> @@ -1091,6 +1101,8 @@ static const struct msm_pinctrl_soc_data qcm2290_pinctrl = {
>  	.groups = qcm2290_groups,
>  	.ngroups = ARRAY_SIZE(qcm2290_groups),
>  	.ngpios = 127,
> +	.wakeirq_map = qcm2290_mpm_map,
> +	.nwakeirq_map = ARRAY_SIZE(qcm2290_mpm_map),
>  };
>  
>  static int qcm2290_pinctrl_probe(struct platform_device *pdev)
> -- 
> 2.17.1
> 
