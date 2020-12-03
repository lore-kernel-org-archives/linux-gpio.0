Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7E4BC4361A
	for <linux-gpio@archiver.kernel.org>; Thu,  3 Dec 2020 19:04:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 87924217BA
	for <linux-gpio@archiver.kernel.org>; Thu,  3 Dec 2020 19:04:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbgLCTDu (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 3 Dec 2020 14:03:50 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:52359 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725885AbgLCTDu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Dec 2020 14:03:50 -0500
Received: from [192.168.1.155] ([95.118.71.13]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MrhHm-1kQ59R2orc-00nlJT; Thu, 03 Dec 2020 20:01:13 +0100
Subject: Re: [PATCH] drivers: gpio: add virtio-gpio guest driver
To:     Randy Dunlap <rdunlap@infradead.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        mst@redhat.com, jasowang@redhat.com, linux-gpio@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-riscv@lists.infradead.org
References: <20201127183003.2849-1-info@metux.net>
 <ba756539-2435-3587-3aeb-31e7ce95aad7@infradead.org>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <7aa911af-ea41-d496-cce8-54c7ae671076@metux.net>
Date:   Thu, 3 Dec 2020 20:01:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <ba756539-2435-3587-3aeb-31e7ce95aad7@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ss5/B/vJ/twWN/pOXDCDEl0QrmSL4O1RoPAdX1RwHOs6rEAO0W+
 RepNDCaUv1d1gAbZ5WV1FIfHJROxwr73HClcCPGmzk0+HYap4AMJyBhT6OQI7mhAwftTtI8
 pNb5EhfWxRttNPn8oPBdg9eQG9sZoCCmJGyc56I2xA3lVtIOVpgziCFnDpd+q5GEAOu6rEF
 SMyTC26gFmRbrFklsuQ2Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MUwloyMoVlE=:xGbnPFFtYuJqN1gKfsdHJI
 2olyfpX41JPC6+KWNGgDc+gKpqThJCWLJwWp6hjqJJCWQTdoswqlUPZDDhqoa483E0/yCZpOG
 iCl4qcW2FdKbej/YNrddOuT8PmjQYD3qWuLPojfXXnLzsmcc7yaw0kGdwUHAzXTvkyCPEUYNO
 MulSgEdHe1hhd3x4OQWHyKRUrgjyG1/2h3bVEKGBnK/TWzvba/5BeYusex34LjerUtaVPiEc9
 YYoMVsf3wQ85Lz36lnHK8/TZ4rOQphMFwek+KsWTmZ4FQgNJwQF43hkaHdS0Ai/ix/dZAy1Bd
 uZSLj6emDBtfjILOWld9QbKbifVN3YdqFnfvwfIsRDYvn0WioF9WnaieVpoYNN8KK/N9/Fe3j
 w8s5cNdg5fZc7HDj/8GvxSEfLZ+1uAZjTAM2lg4ROBwLMVI1hE/jpL6ptpS7V
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 27.11.20 19:45, Randy Dunlap wrote:
> On 11/27/20 10:30 AM, Enrico Weigelt, metux IT consult wrote:
>> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
>> index 5d4de5cd6759..e8414d82cf75 100644
>> --- a/drivers/gpio/Kconfig
>> +++ b/drivers/gpio/Kconfig
>> @@ -1613,4 +1613,13 @@ config GPIO_MOCKUP
>>  	  tools/testing/selftests/gpio/gpio-mockup.sh. Reference the usage in
>>  	  it.
>>  
>> +config GPIO_VIRTIO
>> +	tristate "VirtIO GPIO support"
>> +	depends on VIRTIO
>> +	help
>> +	  Say Y here to enable guest support for virtio based GPIOs.
> 
> 	                                         virtio-based
> 
>> +
>> +	  These virtual gpios can be routed to real GPIOs or attached to
> 
> 	                GPIOs

thx. fixed in v2.


> 
>> +	  simulators on the host (qemu).
>> +
>>  endif
> 
> 

-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
