Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28C0CC7EE23
	for <linux-gpio@archiver.kernel.org>; Wed, 10 May 2023 14:19:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237380AbjEJOTg (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 10 May 2023 10:19:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237120AbjEJOTf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 May 2023 10:19:35 -0400
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E8F835BD
        for <linux-gpio@vger.kernel.org>; Wed, 10 May 2023 07:19:33 -0700 (PDT)
Received: from localhost (88-113-26-95.elisa-laajakaista.fi [88.113.26.95])
        by fgw20.mail.saunalahti.fi (Halon) with ESMTP
        id ada8b924-ef3d-11ed-b3cf-005056bd6ce9;
        Wed, 10 May 2023 17:19:30 +0300 (EEST)
From:   andy.shevchenko@gmail.com
Date:   Wed, 10 May 2023 17:19:30 +0300
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc:     andy.shevchenko@gmail.com, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, linus.walleij@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        richardcochran@gmail.com, manivannan.sadhasivam@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH v6 4/4] pinctrl: qcom: Add SDX75 pincontrol driver
Message-ID: <ZFun8m5y-r0yUHhq@surfacebook>
References: <1683718725-14869-1-git-send-email-quic_rohiagar@quicinc.com>
 <1683718725-14869-5-git-send-email-quic_rohiagar@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1683718725-14869-5-git-send-email-quic_rohiagar@quicinc.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Wed, May 10, 2023 at 05:08:45PM +0530, Rohit Agarwal kirjoitti:
> Add initial Qualcomm SDX75 pinctrl driver to support pin configuration
> with pinctrl framework for SDX75 SoC.
> While at it, reordering the SDX65 entry.

...

> +#define FUNCTION(n)							\
> +	[msm_mux_##n] = {						\
> +			.func = PINCTRL_PINFUNCTION(#n,			\
> +					n##_groups,			\
> +					ARRAY_SIZE(n##_groups))		\
> +			}

But don't you now have MSM_PIN_FUNCTION() macro?

-- 
With Best Regards,
Andy Shevchenko


