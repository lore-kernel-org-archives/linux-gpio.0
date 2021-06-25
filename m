Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 556D1C49EA7
	for <linux-gpio@archiver.kernel.org>; Fri, 25 Jun 2021 23:39:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3448A6194C
	for <linux-gpio@archiver.kernel.org>; Fri, 25 Jun 2021 23:39:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229853AbhFYXmB (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 25 Jun 2021 19:42:01 -0400
Received: from relay05.th.seeweb.it ([5.144.164.166]:33791 "EHLO
        relay05.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229826AbhFYXmA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Jun 2021 19:42:00 -0400
Received: from [192.168.1.101] (83.6.168.10.neoplus.adsl.tpnet.pl [83.6.168.10])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id BC7F73E81C;
        Sat, 26 Jun 2021 01:39:36 +0200 (CEST)
Subject: Re: [PATCH v4 2/2] drivers: qcom: pinctrl: Add pinctrl driver for
 sm6115
To:     Iskren Chernev <iskren.chernev@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20210625102147.51162-1-iskren.chernev@gmail.com>
 <20210625102147.51162-3-iskren.chernev@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <7d5d0ed5-bf5b-2a10-b6ad-fc6d16791ea8@somainline.org>
Date:   Sat, 26 Jun 2021 01:39:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625102147.51162-3-iskren.chernev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


> +
> +static const struct of_device_id sm6115_tlmm_of_match[] = {
> +	{ .compatible = "qcom,sm4250-tlmm", },
> +	{ .compatible = "qcom,sm6115-tlmm", },
> +	{ }
> +};
>
Please do not add separate compatibles for 2 speedbins of the otherwise same SoC.


Otherwise, the driver looks very good.


Konrad

