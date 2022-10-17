Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E41EC4332F
	for <linux-gpio@archiver.kernel.org>; Mon, 17 Oct 2022 22:13:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230172AbiJQWNY (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 17 Oct 2022 18:13:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230159AbiJQWNX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 18:13:23 -0400
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3AF36C96D
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 15:13:21 -0700 (PDT)
Received: by mail-qt1-x835.google.com with SMTP id h24so8327492qta.7
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 15:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DCtI7HpnKLN2RHhMH5+l4CbBXx3g+mkMW6UlFy261fc=;
        b=OU4mKJkhQCZAztADc9v2BTa0rsCpsIXIlNR3wCJIZkUIDHULMp1dwTknBBBWSkC9q5
         cBZ8pe2cNB+AC4WHIFxuV9WIrakeq8p/CLez4o2i6ccGCQubRQlKLHhyRHSzpb1a6+mD
         vsK9AY6fnB7xAZtta8Ieln4FcZoFmbQHg2nOCymLMHPKnYYru00nJDvtsORnFkYUvNdE
         vAS33zc2FIi3nJuLJh4AShyroCJuQcTWXajFsppR1xa58Cgqo9pmmCmmki4vlw0MT3nW
         qOY1H0Lkjc8+/sHDni+DD62uIuJArQtiHaMEERkGuwrZKdQPSs5TF4rO+OoG3VUtFiS2
         Ve7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DCtI7HpnKLN2RHhMH5+l4CbBXx3g+mkMW6UlFy261fc=;
        b=vtSpBWsOrWdQe0StF90+TcZZuJZGl9wmZGTVALtFMFHqK0VzSdbqnEDLl+FImecXaW
         mi/kbX/vnh8opSYF5AXGE2sj6adsJ6HxGe1NhPqUEX7GXF1lHuA7XCs7HMW6eJqq2P5o
         NeF9py//4d1/mw2G0OiQFXM5WwtHt9JDdTHuIoiWUV2TmxC02DcaMSLodCmarjolPCJM
         YJUNbLHut4C4StmM4mhtiOyC4rTU7aHHdMFLvtSgW/GFX2xxICra9juyjFzQ0iFplqVe
         lmRR3qwY7RoKC3zSqmYELJ1yV7VzjZIJW8h+Cfbs1DTG/+8dNSxgWL4v1m84Y8qux7yJ
         lXrg==
X-Gm-Message-State: ACrzQf1n58lKvnE4g6LR+6abngG3IXXmMQBh5N+aTn2I9KZj8fJ8goeN
        dEEKQg5r2qLN6R3qKYM9/DQEZQ==
X-Google-Smtp-Source: AMsMyM5uytjViQrc7YdL7vZ5CO/vsYMTKrcInnLQzLGkBb0PTDgbeiNlLGhIVvhcU93+cxYzHxP/dw==
X-Received: by 2002:ac8:5813:0:b0:39c:d5f0:f1e1 with SMTP id g19-20020ac85813000000b0039cd5f0f1e1mr10645396qtg.453.1666044800983;
        Mon, 17 Oct 2022 15:13:20 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id g19-20020ae9e113000000b006ce3cffa2c8sm735933qkm.43.2022.10.17.15.13.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Oct 2022 15:13:20 -0700 (PDT)
Message-ID: <158acf1d-de37-936b-3dc4-40f62f227af2@linaro.org>
Date:   Mon, 17 Oct 2022 18:13:18 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 3/5] arm: dts: qcom: mdm9615: wp8548-mangoh-green: fix
 sx150xq node names and probe-reset property
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
References: <20221005-mdm9615-pinctrl-yaml-v2-0-639fe67a04be@linaro.org>
 <20221005-mdm9615-pinctrl-yaml-v2-3-639fe67a04be@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221005-mdm9615-pinctrl-yaml-v2-3-639fe67a04be@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 17/10/2022 06:23, Neil Armstrong wrote:
> Fix the sx150xq node names to pinctrl and use the right probe-reset property.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

