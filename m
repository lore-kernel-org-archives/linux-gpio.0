Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4884EC433DB
	for <linux-gpio@archiver.kernel.org>; Tue,  9 Feb 2021 15:16:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0AF8364EBA
	for <linux-gpio@archiver.kernel.org>; Tue,  9 Feb 2021 15:16:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232134AbhBIPQK (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 9 Feb 2021 10:16:10 -0500
Received: from m12-14.163.com ([220.181.12.14]:55559 "EHLO m12-14.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231682AbhBIPQK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Feb 2021 10:16:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=LlShF
        b2fSb2NOGUMw55RoD2ItAjMgTWh0BuqH5OEWqo=; b=qAAWi7Y/bXWN4HmZfD5xX
        VYDwi3hQdr2eGgQ+oFBuLQH266FPZ08cwrDfyDyDV17Vu9KM7XztIzLOkAPwmn56
        TS/pqd8KfAPSqqCiJsFhcSdqiZ45KVJHAn8/XQiVEaL6znMDRTEAvGE37gZXLuR6
        d6IzuTCYwty147HxfplmZs=
Received: from [192.168.31.187] (unknown [223.87.231.49])
        by smtp10 (Coremail) with SMTP id DsCowAAXvPh+myJgpQbxkA--.3568S2;
        Tue, 09 Feb 2021 22:26:08 +0800 (CST)
Subject: Re: [PATCH] pinctrl: renesas:fix possible null pointer dereference
 struct pinmux_range *
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Zhang Kun <zhangkun@cdjrlc.com>
References: <20210207150736.24382-1-alex_luca@163.com>
 <CAMuHMdV445RaAydwgd=Sx6Y+jLJ-PpPSut8wi=Mj-qznYWi84g@mail.gmail.com>
From:   Alex <alex_luca@163.com>
Message-ID: <b2642624-f7d9-3e50-1880-1115988343a8@163.com>
Date:   Tue, 9 Feb 2021 22:26:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdV445RaAydwgd=Sx6Y+jLJ-PpPSut8wi=Mj-qznYWi84g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: DsCowAAXvPh+myJgpQbxkA--.3568S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKw15uryDCF1kKw1UZryrWFg_yoW3XrX_u3
        98Kry7C3W5C3W3C3Zxur1FvrnrJan5uFWkX3ykJ393tr9aqFsxJF1kWr18A3yfGrW8Gw4q
        kayFvr4jqrW7ZjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnEfO7UUUUU==
X-Originating-IP: [223.87.231.49]
X-CM-SenderInfo: xdoh5spoxftqqrwthudrp/1tbiHgk0ylSIsv9QawABsC
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2/9/21 10:12 PM, Geert Uytterhoeven wrote:
> Hi Alex,
> 
> Thanks for your patch!
> 
> On Sun, Feb 7, 2021 at 4:08 PM <alex_luca@163.com> wrote:
>> From: Zhang Kun <zhangkun@cdjrlc.com>
>>
>> The parameters of  sh_pfc_enum_in_range() pinmux_range *r should be checked
>> first for possible null ponter, especially when PINMUX_TYPE_FUNCTION as the
>> pinmux_type was passed by sh_pfc_config_mux().
> 
> If pinmux_type in sh_pfc_config_mux() is PINMUX_TYPE_FUNCTION or
> PINMUX_TYPE_GPIO, range is indeed NULL.
> But as the call
> 
>     in_range = sh_pfc_enum_in_range(enum_id, range);
> 
> is not done in case of these pinmux types, I don't see where the
> problem is.  What am I missing?
> 

Oh, you are right. I think I know what I missed.
Thank you.

Alex

