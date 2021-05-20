Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83D8CC43460
	for <linux-gpio@archiver.kernel.org>; Thu, 20 May 2021 01:43:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 53E086023C
	for <linux-gpio@archiver.kernel.org>; Thu, 20 May 2021 01:43:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229808AbhETBoa (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 19 May 2021 21:44:30 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:3607 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbhETBoa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 May 2021 21:44:30 -0400
Received: from dggems703-chm.china.huawei.com (unknown [172.30.72.58])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Flsrg6k7XzmXNR;
        Thu, 20 May 2021 09:40:51 +0800 (CST)
Received: from dggpemm500004.china.huawei.com (7.185.36.219) by
 dggems703-chm.china.huawei.com (10.3.19.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 20 May 2021 09:43:04 +0800
Received: from [10.174.177.91] (10.174.177.91) by
 dggpemm500004.china.huawei.com (7.185.36.219) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 20 May 2021 09:43:04 +0800
Subject: Re: [PATCH -next] pinctrl: equilibrium: Add missing
 MODULE_DEVICE_TABLE
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
References: <20210508031502.53637-1-cuibixuan@huawei.com>
 <CACRpkdY_npXMDE6ks6mAeMOpmdUVY3XzhZqvKceZH0Wg+xiJdg@mail.gmail.com>
From:   Bixuan Cui <cuibixuan@huawei.com>
Message-ID: <0f603f2d-0f93-77b5-6141-ed63235e0648@huawei.com>
Date:   Thu, 20 May 2021 09:43:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CACRpkdY_npXMDE6ks6mAeMOpmdUVY3XzhZqvKceZH0Wg+xiJdg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500004.china.huawei.com (7.185.36.219)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 2021/5/20 7:00, Linus Walleij wrote:
> Patch applied.
Thanks

Bixuan Cui
> 
> Yours,
> Linus Walleij
