Return-Path: <SRS0=9k7y=DP=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B98B3C433DF
	for <linux-gpio@archiver.kernel.org>; Thu,  8 Oct 2020 21:45:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F40722242
	for <linux-gpio@archiver.kernel.org>; Thu,  8 Oct 2020 21:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602193536;
	bh=acPOXKWxQK71x24n0bkPFRaychK49IqbjS5n1k657kw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=NBWhQnXDm5jkKgC/6cDC4S7uMUAeLGHEFD5ScNUG3WKwY/2GpgG5zsNqgjGup8qHb
	 oxTzqbt1dmqC4VQh1+Pt9dWW9nVVhXShg6oFzoy8Dt6boUAcPFZnX7Y12JdeNb3nD+
	 z0zrZAcLjz/EIviMZUHIVNSFUHxd1WRo270WYwD8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726694AbgJHVpd (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 8 Oct 2020 17:45:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:48208 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726115AbgJHVpc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 8 Oct 2020 17:45:32 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8BBB522242;
        Thu,  8 Oct 2020 21:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602193531;
        bh=acPOXKWxQK71x24n0bkPFRaychK49IqbjS5n1k657kw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=jf5UvwT1xBndSzwHStjafcOQgXmyJ1Sv4BUGIrEtDj6x//IFU56u4p/pB0MndwRVZ
         u16hA9qXSWsJU4D2hh5ycBuUOMAvV/i4SBm9UGds1FG/SuzAqEJtK6en3yQ5BqOKpg
         dSXS9Yj1pY4x6oJPoR1x0aLZN3Z0IuC1Ne8iPJdw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1596115816-11758-4-git-send-email-hanks.chen@mediatek.com>
References: <1596115816-11758-1-git-send-email-hanks.chen@mediatek.com> <1596115816-11758-4-git-send-email-hanks.chen@mediatek.com>
Subject: Re: [PATCH v10 3/3] clk: mediatek: add UART0 clock support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mtk01761 <wendell.lin@mediatek.com>,
        YueHaibing <yuehaibing@huawei.com>,
        Andy Teng <andy.teng@mediatek.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>,
        Hanks Chen <hanks.chen@mediatek.com>
To:     Hanks Chen <hanks.chen@mediatek.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Thu, 08 Oct 2020 14:45:30 -0700
Message-ID: <160219353021.310579.9991189060182082188@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Hanks Chen (2020-07-30 06:30:16)
> Add MT6779 UART0 clock support.
>=20
> Fixes: 710774e04861 ("clk: mediatek: Add MT6779 clock support")
> Signed-off-by: Wendell Lin <wendell.lin@mediatek.com>
> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---

Applied to clk-next
