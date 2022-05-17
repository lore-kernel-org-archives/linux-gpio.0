Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 681D0C433F5
	for <linux-gpio@archiver.kernel.org>; Tue, 17 May 2022 00:30:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238834AbiEQAaQ (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 16 May 2022 20:30:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230283AbiEQAaP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 May 2022 20:30:15 -0400
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A25F40A1D;
        Mon, 16 May 2022 17:30:15 -0700 (PDT)
Received: by mail-oi1-f176.google.com with SMTP id v66so20646367oib.3;
        Mon, 16 May 2022 17:30:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YYZ9P6JoTLhKizGObZkJgYrG6pnr1ZQ7jT3oo1ocLpY=;
        b=nSw+4DG11xG6kcFB1RWoV4abbjuQyyd0yswdPonRqJd1dxx3NfsrxZRrPvwcDqpIi4
         FAV5ZhTeDlipkgkGUckQDx++X0LtPSAzk+5TinXBNW+0U1uwHMt3XbSzmCU3PZpyT+Oj
         fmcamsIrgN1ktiyD3BKQ8Fb0SdLh3tgrpjAITF66+92U/gE76ADBNF4VHqp7RCdlr8oo
         MVaYI5hsXLSLWrEVOI3XwwrnZJSEBZclZllRqt6kVqB4V5dTlAbvG94ScRZG15EHPG8U
         oqB7kvT5DANWn67ECgtkQle0zuUKHhJ5kv2XTzLClZ4CQBlVLS3pNAuVX7GgeVG8XctC
         Bhog==
X-Gm-Message-State: AOAM533KnSXLa6mOVRyIva3aS8JkaTxNCQe7rGp52SRqCw5ET+7tsxrd
        VGZpiQ2TA3cIVZY0KzKT6w==
X-Google-Smtp-Source: ABdhPJxsYFrgbzwlYqcoH92/HrrcbohAC6umxvccBvqgRDnmgl+giRrQrQGF0e5cdlAXIGqG8F8ftQ==
X-Received: by 2002:a05:6808:1a20:b0:326:9023:f7b1 with SMTP id bk32-20020a0568081a2000b003269023f7b1mr8747224oib.171.1652747414400;
        Mon, 16 May 2022 17:30:14 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id n1-20020a056870e40100b000e686d1388csm5951201oag.38.2022.05.16.17.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 17:30:13 -0700 (PDT)
Received: (nullmailer pid 3654143 invoked by uid 1000);
        Tue, 17 May 2022 00:30:12 -0000
Date:   Mon, 16 May 2022 19:30:12 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Stephen Boyd <sboyd@codeaurora.org>, Luca Weiss <luca@z3ntu.xyz>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH 03/11] dt-bindings: pinctrl: qcom,pmic-gpio: describe
 gpio-line-names
Message-ID: <20220517003012.GA3654086-robh@kernel.org>
References: <20220507194913.261121-1-krzysztof.kozlowski@linaro.org>
 <20220507194913.261121-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220507194913.261121-4-krzysztof.kozlowski@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, 07 May 2022 21:49:05 +0200, Krzysztof Kozlowski wrote:
> Add missing 'gpio-line-names' property and describe its constraints for
> all models except PM8226 (which seems not really used).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/pinctrl/qcom,pmic-gpio.yaml      | 221 ++++++++++++++++++
>  1 file changed, 221 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
