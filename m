Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E5C1C0032E
	for <linux-gpio@archiver.kernel.org>; Thu, 26 Oct 2023 01:52:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232850AbjJZBwG (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 25 Oct 2023 21:52:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229954AbjJZBwG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Oct 2023 21:52:06 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8997ABD;
        Wed, 25 Oct 2023 18:52:04 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16ECBC433C7;
        Thu, 26 Oct 2023 01:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698285124;
        bh=uc68CtG1/PmB2c3+G1qYkLU0G3yZyhKP0af8C+0vViw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lxmqelvna5njSYvzoA0nLw61ngRwVaDSkKEMmQ31gysV354IuujhdYvsfxgjZQRtf
         rQlsRWasYHtpjz1feinFQgQQGMzFv59do8v+sZGdHUjZJDQlyDQDLD4zdxmSAwYy0a
         gmHmJaN7WuqWWVSLu4BIsRWvG6Grvp+2URDHBTsrcPbbcJnYRuWe3TnBPnrSfdDkfw
         VEFT7ueeYf6/o5ln6/chIw8khcNno85bjI+0oTCoTfdcnA3/Gv6CEToqIOYdjo8XD8
         fVRimjDudHv3U5/qZyjupXEi72XJh4aSjE7k9CmN3HvAbOY3O8/X9oykpCeet0SK8Z
         NNcn8qoXT4WnQ==
Date:   Wed, 25 Oct 2023 18:56:21 -0700
From:   Bjorn Andersson <andersson@kernel.org>
To:     Sibi Sankar <quic_sibis@quicinc.com>
Cc:     konrad.dybcio@linaro.org, linus.walleij@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        agross@kernel.org, conor+dt@kernel.org, quic_rjendra@quicinc.com,
        abel.vesa@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, quic_tsoni@quicinc.com,
        neil.armstrong@linaro.org
Subject: Re: [PATCH 0/2] pinctrl: qcom: Introduce Pinctrl/GPIO for SC8380XP
Message-ID: <faddmpsixivh3rfbsyvwpkt3mjaempkfdzqws2xjxlyhs5m5pm@7ss2k77rlryk>
References: <20231025135058.11268-1-quic_sibis@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025135058.11268-1-quic_sibis@quicinc.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 25, 2023 at 07:20:56PM +0530, Sibi Sankar wrote:
> This series adds pinctrl/gpio support for the Qualcomm SC8380XP platform, aka Snapdragon X Elite.
> 
> Release Link: https://www.qualcomm.com/news/releases/2023/10/qualcomm-unleashes-snapdragon-x-elite--the-ai-super-charged-plat
> 

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> Rajendra Nayak (2):
>   dt-bindings: pinctrl: qcom: Add SC8380XP pinctrl
>   pinctrl: qcom: Add SC8380XP pinctrl driver
> 
>  .../bindings/pinctrl/qcom,sc8380xp-tlmm.yaml  |  143 ++
>  drivers/pinctrl/qcom/Kconfig.msm              |   10 +
>  drivers/pinctrl/qcom/Makefile                 |    1 +
>  drivers/pinctrl/qcom/pinctrl-sc8380xp.c       | 1876 +++++++++++++++++
>  4 files changed, 2030 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sc8380xp-tlmm.yaml
>  create mode 100644 drivers/pinctrl/qcom/pinctrl-sc8380xp.c
> 
> -- 
> 2.17.1
> 
