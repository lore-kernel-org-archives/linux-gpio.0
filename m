Return-Path: <SRS0=pJLv=6U=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2E8BC28CBC
	for <linux-gpio@archiver.kernel.org>; Wed,  6 May 2020 10:57:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B9E59206B8
	for <linux-gpio@archiver.kernel.org>; Wed,  6 May 2020 10:57:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727798AbgEFK5n (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 6 May 2020 06:57:43 -0400
Received: from gloria.sntech.de ([185.11.138.130]:40060 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725882AbgEFK5n (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 6 May 2020 06:57:43 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1jWHkD-0001j5-JN; Wed, 06 May 2020 12:57:41 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        helen.koike@collabora.com, ezequiel@collabora.com,
        dafna3@gmail.com, kernel@collabora.com, linus.walleij@linaro.org
Subject: Re: [PATCH] pinctrl: rockchip: fix memleak in rockchip_dt_node_to_map
Date:   Wed, 06 May 2020 12:57:41 +0200
Message-ID: <12037872.zK0gPHFAvL@diego>
In-Reply-To: <20200506100903.15420-1-dafna.hirschfeld@collabora.com>
References: <20200506100903.15420-1-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am Mittwoch, 6. Mai 2020, 12:09:03 CEST schrieb Dafna Hirschfeld:
> In function rockchip_dt_node_to_map, a new_map variable is
> allocated by:
> 
> new_map = devm_kcalloc(pctldev->dev, map_num, sizeof(*new_map),
> 		       GFP_KERNEL);
> 
> This uses devres and attaches new_map to the pinctrl driver.
> This cause a leak since new_map is not released when the probed
> driver is removed. Fix it by using kcalloc to allocate new_map
> and free it in `rockchip_dt_free_map`
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



