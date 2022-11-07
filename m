Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C5E8C4332F
	for <linux-gpio@archiver.kernel.org>; Mon,  7 Nov 2022 03:13:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230404AbiKGDNY (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sun, 6 Nov 2022 22:13:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230466AbiKGDNJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Nov 2022 22:13:09 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1C07EE1F;
        Sun,  6 Nov 2022 19:12:54 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5D9AB60BF0;
        Mon,  7 Nov 2022 03:12:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03236C433C1;
        Mon,  7 Nov 2022 03:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667790773;
        bh=WzS6RQ2dsJBPcoERdITbBvDtDBbxw8GbWNUyXqHYix4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=sykP7Q4vNVyqzCfBTupJhXJDm0HP0PtuBY1+lVEFnCWsZ4GO+UjX0/OLyzaWndfeP
         808dgSAgjTzI10poD8+F6enVzVju14wrElbzAjhLjg+LgOpsKRV2F+dTM6uGFVfjQa
         HmIWIVjxAOIqZaOfd11wKxva+Un1SlkaQx+JlaBXzEI8P1FoDqukeKfIW+yiIwz7Ih
         UE1tOBojjYbnNslpZqtRaZNZrkq/zl9Z3qGQM7IG/CrdBQgJBvv1zuOFtuIPJM8o2P
         H9juGs6tFRe93g4jQQi2QMpI233U+kRRQmL1flQsOO+4HvneDok3KcWlNXJ5RyO3/h
         bBqaDyNy/QBNw==
From:   Bjorn Andersson <andersson@kernel.org>
To:     krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        konrad.dybcio@somainline.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
        Andy Gross <agross@kernel.org>
Subject: Re: (subset) [PATCH 1/2] dt-bindings: pinctrl: qcom,msm8916: convert to dtschema
Date:   Sun,  6 Nov 2022 21:12:11 -0600
Message-Id: <166779074264.500303.12065991812789980547.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221024002356.28261-1-krzysztof.kozlowski@linaro.org>
References: <20221024002356.28261-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, 23 Oct 2022 20:23:55 -0400, Krzysztof Kozlowski wrote:
> Convert Qualcomm MSM8916 pin controller bindings to DT schema.  Keep the
> parsing of pin configuration subnodes consistent with other Qualcomm
> schemas (children named with '-state' suffix, their children with
> '-pins').
> 
> 

Applied, thanks!

[2/2] arm64: dts: qcom: msm8916: align TLMM pin configuration with DT schema
      commit: 8b276ca036377a5baa4fd0692b80608f0de8a260

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
