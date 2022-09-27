Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3498AC54EE9
	for <linux-gpio@archiver.kernel.org>; Tue, 27 Sep 2022 12:38:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232341AbiI0MiF (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 27 Sep 2022 08:38:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231627AbiI0MiE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Sep 2022 08:38:04 -0400
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [IPv6:2001:4b7a:2000:18::168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13D2A14B877
        for <linux-gpio@vger.kernel.org>; Tue, 27 Sep 2022 05:38:02 -0700 (PDT)
Received: from [192.168.1.101] (95.49.29.188.neoplus.adsl.tpnet.pl [95.49.29.188])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 1288F3F358;
        Tue, 27 Sep 2022 14:38:01 +0200 (CEST)
Message-ID: <d3cae3f6-8ae3-7e05-f4d6-bc256422a188@somainline.org>
Date:   Tue, 27 Sep 2022 14:38:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 06/15] arm64: dts: qcom: sc7280-idp-ec-h1: add missing QUP
 GPIO functions
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220925110608.145728-1-krzysztof.kozlowski@linaro.org>
 <20220925110608.145728-7-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220925110608.145728-7-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 25.09.2022 13:05, Krzysztof Kozlowski wrote:
> Add default GPIO function to SPI10 and SPI14 chip-select pins on SC7280
> IDP, as required by bindings.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Konrad
>  arch/arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi
> index b35f3738933c..3cfeb118d379 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi
> @@ -95,11 +95,13 @@ h1_ap_int_odl: h1-ap-int-odl-state {
>  
>  	qup_spi10_cs_gpio_init_high: qup-spi10-cs-gpio-init-high-state {
>  		pins = "gpio43";
> +		function = "gpio";
>  		output-high;
>  	};
>  
>  	qup_spi14_cs_gpio_init_high: qup-spi14-cs-gpio-init-high-state {
>  		pins = "gpio59";
> +		function = "gpio";
>  		output-high;
>  	};
>  };
