Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEBC7C48BDF
	for <linux-gpio@archiver.kernel.org>; Sun, 20 Jun 2021 07:30:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AE90B61001
	for <linux-gpio@archiver.kernel.org>; Sun, 20 Jun 2021 07:30:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbhFTHcW (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sun, 20 Jun 2021 03:32:22 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:35742 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbhFTHcW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 20 Jun 2021 03:32:22 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15K7TGOW128776;
        Sun, 20 Jun 2021 02:29:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1624174156;
        bh=h9LqqfdxaQYb6zdSSB63yS3PBHdKaqQkJWOXyEZFk8k=;
        h=Subject:CC:References:To:From:Date:In-Reply-To;
        b=V5pfwoVMejHdKvAsTtQIPaBQQ+lrePpYVXjr8H5FtpuJNBqLLQuC1pmJXkqsR/KZM
         rz9670cw/5aDYb7CQGgi/nDjB2XLdyHb4434V5DeujqX716vmC12ZnT5NMbx8Jj2Iv
         QENE+Y0vJ1/34q7Ag5ssLndwIWpPfyKgIiOwmlEo=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15K7TGSF079823
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sun, 20 Jun 2021 02:29:16 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Sun, 20
 Jun 2021 02:29:15 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Sun, 20 Jun 2021 02:29:15 -0500
Received: from [10.250.235.117] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15K7T8wO082125;
        Sun, 20 Jun 2021 02:29:09 -0500
Subject: Re: [PATCH v3 0/2] dt-bindings: gpio: davinci: Convert to json-schema
CC:     Lokesh Vutla <lokeshvutla@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Rob Herring <robh+dt@kernel.org>, Keerthy <j-keerthy@ti.com>,
        David Lechner <david@lechnology.com>,
        Sekhar Nori <nsekhar@ti.com>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20210524151955.8008-1-a-govindraju@ti.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
From:   Aswath Govindraju <a-govindraju@ti.com>
Message-ID: <f011d613-0fe6-e921-91e9-79367f185284@ti.com>
Date:   Sun, 20 Jun 2021 12:59:07 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210524151955.8008-1-a-govindraju@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bart, Linus,

On 24/05/21 8:49 pm, Aswath Govindraju wrote:
> Convert the davinci GPIO device tree binding documentation to json-schema.
> The GPIO hog node names are defined to end with a 'hog' suffix.
> 
> All existing GPIO hogs are fixed to follow above naming convention
> before changing the binding to avoid dtbs_check warnings.
> 
> changes since v2:
> - Used gpio-hog.yaml for gpio-hog property
> - Added constraints on gpio-hog node name
> - Corrected the gpio hog dt node names to align
>   with the dt-schema
> 

May I know if the following series is okay to be merged ?

Thanks,
Aswath

> changes since v1:
> - combined the individual compatible properties into one enum
> - added maxItems and minItems properties for gpio-line-names and
>   interrupts
> - updated the description of interrupts property
> - removed the description for properties that are general
> - updated the pattern property for gpio hog to indicate any sort
>   node name based on its usage
> - corrected the example wakeup gpio node name
> 
> Aswath Govindraju (2):
>   ARM: dts: da850-lego-ev3: align GPIO hog names with dt-schema
>   dt-bindings: gpio: gpio-davinci: Convert to json-schema
> 
>  .../devicetree/bindings/gpio/gpio-davinci.txt | 167 ----------------
>  .../bindings/gpio/gpio-davinci.yaml           | 186 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  arch/arm/boot/dts/da850-lego-ev3.dts          |  10 +-
>  4 files changed, 192 insertions(+), 173 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-davinci.txt
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-davinci.yaml
> 

