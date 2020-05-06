Return-Path: <SRS0=pJLv=6U=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 557DBC38A24
	for <linux-gpio@archiver.kernel.org>; Wed,  6 May 2020 10:51:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3B7CE20747
	for <linux-gpio@archiver.kernel.org>; Wed,  6 May 2020 10:51:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbgEFKve (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 6 May 2020 06:51:34 -0400
Received: from gloria.sntech.de ([185.11.138.130]:40000 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726558AbgEFKve (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 6 May 2020 06:51:34 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1jWHeE-0001gH-I1; Wed, 06 May 2020 12:51:30 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        helen.koike@collabora.com, ezequiel@collabora.com,
        dafna3@gmail.com, kernel@collabora.com, linus.walleij@linaro.org
Subject: Re: [PATCH] pinctrl: rockchip: return ENOMEM instead of EINVAL if allocation fails
Date:   Wed, 06 May 2020 12:51:29 +0200
Message-ID: <2632193.tXVvSI4HnL@diego>
In-Reply-To: <20200506101424.15691-1-dafna.hirschfeld@collabora.com>
References: <20200506101424.15691-1-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am Mittwoch, 6. Mai 2020, 12:14:24 CEST schrieb Dafna Hirschfeld:
> The function rockchip_pinctrl_parse_dt returns -EINVAL if
> allocation fails. Change the return error to -ENOMEM
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


