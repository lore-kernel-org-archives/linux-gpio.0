Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35E63C38A2D
	for <linux-gpio@archiver.kernel.org>; Mon, 24 Oct 2022 07:19:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230151AbiJXHTb (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 24 Oct 2022 03:19:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230096AbiJXHTa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Oct 2022 03:19:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 021A6D2E3;
        Mon, 24 Oct 2022 00:19:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 91A5761038;
        Mon, 24 Oct 2022 07:19:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86C5EC433C1;
        Mon, 24 Oct 2022 07:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666595966;
        bh=bJ1Pr5XAjs+U7xa/IYSKa65Wkjl1RkUCPiV+jFXoJ14=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mhmmYD0QCbpgcSTdkxpD5gXHMR6SnlOl7oTjTHRZIXx/KjAMN6W/n75DzBTuRKSHy
         uaS/2ArPad2D2QwNHDEeglCXRLyBLNfL59XNxr0+zA+Y22XEFak65DehI7a4mIqax9
         vyfkQVSHHmcZUos07K7mJEWHwE4bdUwom3mxV9nFHwYeSwEeZ6fkNrcHFEKBIsDHUJ
         oKezVxo2IKTOBVYJQYQzm3/Bl2HwWSiDjVzmvRsueDi9qCoJ/Wrh0YFwwkG8Rm4eP6
         z5XJgwu00yxxZzVEwvzuj9lJF83ylPr6EZuhLdHJP+sTE/zsfsaiuFppZdNMS52v3k
         dmDlM9ZQ1VcvA==
Date:   Mon, 24 Oct 2022 08:19:19 +0100
From:   Lee Jones <lee@kernel.org>
To:     Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 4/5] dt-bindings: soc: qcom: convert non-smd RPM
 bindings to dt-schema
Message-ID: <Y1Y8dwwJSsTGnIg0@google.com>
References: <20221005-mdm9615-pinctrl-yaml-v3-0-e5e045644971@linaro.org>
 <20221005-mdm9615-pinctrl-yaml-v3-4-e5e045644971@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221005-mdm9615-pinctrl-yaml-v3-4-e5e045644971@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 21 Oct 2022, Neil Armstrong wrote:

> Convert the non-SMD RPM node bindings to dt-schema, the old txt bindings
> are now removed since all bindings were converted.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/mfd/qcom-rpm.txt | 283 ---------------------
>  .../devicetree/bindings/soc/qcom/qcom,ipc-rpm.yaml | 101 ++++++++
>  2 files changed, 101 insertions(+), 283 deletions(-)

Acked-by: Lee Jones <lee@kernel.org>

-- 
Lee Jones [李琼斯]
