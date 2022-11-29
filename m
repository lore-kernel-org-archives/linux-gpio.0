Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8684FC4321E
	for <linux-gpio@archiver.kernel.org>; Tue, 29 Nov 2022 12:18:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233646AbiK2MSS (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 29 Nov 2022 07:18:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232290AbiK2MSR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Nov 2022 07:18:17 -0500
X-Greylist: delayed 365 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 29 Nov 2022 04:18:15 PST
Received: from 3.mo560.mail-out.ovh.net (3.mo560.mail-out.ovh.net [46.105.58.226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E57FA490B0
        for <linux-gpio@vger.kernel.org>; Tue, 29 Nov 2022 04:18:15 -0800 (PST)
Received: from player760.ha.ovh.net (unknown [10.110.208.203])
        by mo560.mail-out.ovh.net (Postfix) with ESMTP id 3742324FF4
        for <linux-gpio@vger.kernel.org>; Tue, 29 Nov 2022 12:12:09 +0000 (UTC)
Received: from RCM-web10.webmail.mail.ovh.net (ip-194-187-74-233.konfederacka.maverick.com.pl [194.187.74.233])
        (Authenticated sender: rafal@milecki.pl)
        by player760.ha.ovh.net (Postfix) with ESMTPSA id F3629313F3233;
        Tue, 29 Nov 2022 12:12:04 +0000 (UTC)
MIME-Version: 1.0
Date:   Tue, 29 Nov 2022 13:12:04 +0100
From:   =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To:     Gaosheng Cui <cuigaosheng1@huawei.com>
Cc:     lakshmi.sowjanya.d@intel.com, linus.walleij@linaro.org,
        kiran.kumar1.s@intel.com, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3] pinctrl: thunderbay: fix possible memory leak in
 thunderbay_build_functions()
In-Reply-To: <20221129120126.1567338-1-cuigaosheng1@huawei.com>
References: <20221129120126.1567338-1-cuigaosheng1@huawei.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <825137e19400d1460fe183249a856d55@milecki.pl>
X-Sender: rafal@milecki.pl
X-Originating-IP: 194.187.74.233
X-Webmail-UserID: rafal@milecki.pl
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 17805262601995070377
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrtddtgddtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeggfffhvfevufgjfhgfkfigihgtgfesthekjhdttderjeenucfhrhhomheptfgrfhgrlhcuofhilhgvtghkihcuoehrrghfrghlsehmihhlvggtkhhirdhplheqnecuggftrfgrthhtvghrnhepjedvlefguedthfefleehgeeftdeludeluedvgfeffeevhfevtdehteejteefheegnecukfhppeduvdejrddtrddtrddupdduleegrddukeejrdejgedrvdeffeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehrrghfrghlsehmihhlvggtkhhirdhplheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehiedtpdhmohguvgepshhmthhpohhuth
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2022-11-29 13:01, Gaosheng Cui wrote:
> The thunderbay_add_functions() will free memory of thunderbay_funcs
> when everything is ok, but thunderbay_funcs will not be freed when
> thunderbay_add_functions() fails, then there will be a memory leak,
> so we need to add kfree() when thunderbay_add_functions() fails to
> fix it.
> 
> In addition, doing some cleaner works, moving kfree(funcs) from
> thunderbay_add_functions() to thunderbay_build_functions().
> 
> Fixes: 12422af8194d ("pinctrl: Add Intel Thunder Bay pinctrl driver")
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>

FWIW:
Reviewed-by: Rafał Miłecki <rafal@milecki.pl>

(not sure about pinctrl-thunderbay.c removal plans)
