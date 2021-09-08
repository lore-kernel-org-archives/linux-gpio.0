Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3733C433EF
	for <linux-gpio@archiver.kernel.org>; Wed,  8 Sep 2021 14:27:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9343A60E94
	for <linux-gpio@archiver.kernel.org>; Wed,  8 Sep 2021 14:27:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351834AbhIHO2T (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 8 Sep 2021 10:28:19 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:44422 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbhIHO2T (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Sep 2021 10:28:19 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 188ER9Z3075603;
        Wed, 8 Sep 2021 09:27:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1631111229;
        bh=UrsCmpckMKXrSZHknp+ZYButYz6Xg/aXScF9HIgwYSo=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=ftImQ6QkcsyGv1RnFRTRqqkiBg3DUDgp3M433NNJJvmCcd6NRP0HliE7Y/Qow4Ats
         98sQwM7ehArDSPmoWuMjKow8dXlVgxm3VW20EKRj43/3eNjx9NJWZKWyg2LMJ6gnam
         iGJGA90gXf+RrDOsDe+roeRSLWDhSL7ZzvVhFTAI=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 188ER9YH009404
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 8 Sep 2021 09:27:09 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 8
 Sep 2021 09:27:09 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 8 Sep 2021 09:27:09 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 188ER68u045101;
        Wed, 8 Sep 2021 09:27:07 -0500
Subject: Re: [PATCH RESEND] dt-bindings: gpio: Convert TI TPIC2810 GPIO
 Controller bindings to yaml
To:     Aparna M <a-m1@ti.com>, <linus.walleij@linaro.org>,
        <robh+dt@kernel.org>, <bgolaszewski@baylibre.com>,
        <vigneshr@ti.com>
CC:     <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>
References: <20210906083020.6038-1-a-m1@ti.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <422f7ccd-348b-8023-37db-803339684054@ti.com>
Date:   Wed, 8 Sep 2021 17:27:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210906083020.6038-1-a-m1@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 06/09/2021 11:30, Aparna M wrote:
> * Convert gpio-tpic2810 bindings to yaml format
> * Remove outdated gpio-tpic2810 bindings in .txt format
> 
> Signed-off-by: Aparna M <a-m1@ti.com>
> ---
>   .../bindings/gpio/gpio-tpic2810.txt           | 16 --------
>   .../bindings/gpio/gpio-tpic2810.yaml          | 41 +++++++++++++++++++
>   2 files changed, 41 insertions(+), 16 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-tpic2810.txt
>   create mode 100644 Documentation/devicetree/bindings/gpio/gpio-tpic2810.yaml

Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>

-- 
Best regards,
grygorii
