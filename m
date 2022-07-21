Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2517C43334
	for <linux-gpio@archiver.kernel.org>; Thu, 21 Jul 2022 10:03:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232939AbiGUKDn (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 21 Jul 2022 06:03:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230412AbiGUKDm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Jul 2022 06:03:42 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3989DF9A
        for <linux-gpio@vger.kernel.org>; Thu, 21 Jul 2022 03:03:41 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id z13so803502ljj.6
        for <linux-gpio@vger.kernel.org>; Thu, 21 Jul 2022 03:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ud+C26ftZa8Rjz2cAIccHjrt/I9qI0gljR2yYnoWRkQ=;
        b=ZCTvTZvRn0VmeOXuCxr1aekjZ9egVJ37VVbflZ/+7uPXHfd//QVDshqRxWteSpAohk
         kztzMWMxyarvNzTNImqHPcuYrXBqOJrais30YJEMEPNUAaboPWk6sCrVRYykmRuP5T/3
         c+jMJv/1uBrLaeXl9AxiDfvkK7xRsh61QjAJ7yNgxHi7vdTuEB3cWBUuUwPB3qsZev/E
         s8QF3xJpMMBw0wW7/gu5ysMSqlwIGJW67C8VreBm/qzb4GnFb2jhbdKNdoYdhn6FIEgJ
         C9OI9NHvDkSo2J8So913fOF/oRRFiVhUSSW1LhVxeo94w89EOK2oogomVwodkxaOtDsY
         1qSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ud+C26ftZa8Rjz2cAIccHjrt/I9qI0gljR2yYnoWRkQ=;
        b=aJneYjhr7sYJipU2vis+6DbKgunlfuDZfnp80bpn7HtBwrsGbwU70f3sQYAR7sXQlS
         DZvMZ+vj2MZzk0rBXr7m/lFw5tcwQqzrdTxBUEq2d99zo6qVmR8e6hrPv3VEcX7mpriP
         0bKx7+yl4FCyK1Q1ZPPRY3jinc4mzd8DhK4E9e2fkZGH1Sv17ZaZmkI75yXOHX1aqJMC
         YDZTksfO74bRM4qTAigpYokGIVz62OOGa0JLmHTuMDju9+tsumugRY0bPyog/lB1OiLW
         uXmio3wHtY82qmTahNo44n3238o/j2rrvmOVtVzUT5Ep4Ov9WVp8dGVM28tCs8Ss4q5a
         F3Cg==
X-Gm-Message-State: AJIora9PhnHeBdlczQfoS8WT4W7EFpySX8WiO6Q21GvzO08VkVouv/8v
        vp4LHKJ1L05CiPVb1JFwtvOgkQ==
X-Google-Smtp-Source: AGRyM1sAtAw6jE5W/RlytvzZwARbxPwr67MRRb7HkXSh2iwahMPMd+mQxDNtQB8+L9mH/jg0RrKsAg==
X-Received: by 2002:a05:651c:109:b0:25d:5889:cfe6 with SMTP id a9-20020a05651c010900b0025d5889cfe6mr17777290ljb.184.1658397820158;
        Thu, 21 Jul 2022 03:03:40 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id k1-20020ac257c1000000b0047255d211c7sm339564lfo.246.2022.07.21.03.03.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 03:03:39 -0700 (PDT)
Message-ID: <9448dcb4-7eac-7efa-0062-bcc1797fa09d@linaro.org>
Date:   Thu, 21 Jul 2022 12:03:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] dt-bindings: gpio: fairchild,74hc595: add
 strobe-gpios property
Content-Language: en-US
To:     Marcus Folkesson <marcus.folkesson@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Maxime Ripard <mripard@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220721093422.2173982-1-marcus.folkesson@gmail.com>
 <20220721093422.2173982-2-marcus.folkesson@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220721093422.2173982-2-marcus.folkesson@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 21/07/2022 11:34, Marcus Folkesson wrote:
> Some shift registers (74hc4094 for example) has a strobe signal to latch
> data from the serial input to the parallel output.
> 
> Add an optional strobe-gpios property to support those chips.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  .../devicetree/bindings/gpio/fairchild,74hc595.yaml         | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
> index a99e7842ca17..9893df9ae22c 100644
> --- a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
> +++ b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
> @@ -14,6 +14,8 @@ properties:
>      enum:
>        - fairchild,74hc595
>        - nxp,74lvc594
> +      - ti,cd54hc4094
> +      - ti,cd74hc4094
>  
>    reg:
>      maxItems: 1
> @@ -33,6 +35,10 @@ properties:
>      description: GPIO connected to the OE (Output Enable) pin.
>      maxItems: 1
>  
> +  strobe-gpios:
> +    description: GPIO connected to the STROBE pin
> +    maxItems: 1

This should be disallowed (in allOf:if:then) for variants which do not
support it (or do not have even STROBE pin).


Best regards,
Krzysztof
