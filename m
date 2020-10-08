Return-Path: <SRS0=9k7y=DP=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91B14C4363D
	for <linux-gpio@archiver.kernel.org>; Thu,  8 Oct 2020 02:39:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 35ACA21527
	for <linux-gpio@archiver.kernel.org>; Thu,  8 Oct 2020 02:39:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="QP8HHD/h"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728243AbgJHCjS (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 7 Oct 2020 22:39:18 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:41232 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727253AbgJHCjS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Oct 2020 22:39:18 -0400
X-UUID: e226b603c5de4507be9bddd61be37f3a-20201008
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=mpoi5o7pn88Bf30tloJ48idTmrzVeVxim+3Lb5r6NCI=;
        b=QP8HHD/hqOJK2BMlqTzUSzKuBNuV+8HQ274q87a1he2M3BcCLHgXwTzsCyPvJRfQblHYvsVF5NYTlaKLUw/U01XVqTiUpcuipyi0HeIvdMKv/8EMzk58SdiWFkLxZTTRKnB1XxhW/chTAnolXIPeWbGOB3irphVjn9gbfO0DSm8=;
X-UUID: e226b603c5de4507be9bddd61be37f3a-20201008
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <hanks.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 19265678; Thu, 08 Oct 2020 10:39:14 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Oct 2020 10:39:13 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 8 Oct 2020 10:39:13 +0800
Message-ID: <1602124753.29177.7.camel@mtkswgap22>
Subject: Re: [PATCH v10 3/3] clk: mediatek: add UART0 clock support
From:   Hanks Chen <hanks.chen@mediatek.com>
To:     Stephen Boyd <sboyd@kernel.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        <devicetree@vger.kernel.org>, CC Hwang <cc.hwang@mediatek.com>,
        Andy Teng <andy.teng@mediatek.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        YueHaibing <yuehaibing@huawei.com>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        Loda Chou <loda.chou@mediatek.com>,
        mtk01761 <wendell.lin@mediatek.com>,
        <linux-arm-kernel@lists.infradead.org>
Date:   Thu, 8 Oct 2020 10:39:13 +0800
In-Reply-To: <160212240863.310579.5253840355657757088@swboyd.mtv.corp.google.com>
References: <1596115816-11758-1-git-send-email-hanks.chen@mediatek.com>
         <1596115816-11758-4-git-send-email-hanks.chen@mediatek.com>
         <1599546314.24690.3.camel@mtkswgap22> <1601719607.774.1.camel@mtkswgap22>
         <160212240863.310579.5253840355657757088@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 6B6413CFD2C10AA86898B0C0F25664CFCFEF09CBDE40F37D9A417BA19BDDAEC32000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gV2VkLCAyMDIwLTEwLTA3IGF0IDE5OjAwIC0wNzAwLCBTdGVwaGVuIEJveWQgd3JvdGU6DQo+
IFF1b3RpbmcgSGFua3MgQ2hlbiAoMjAyMC0xMC0wMyAwMzowNjo0NykNCj4gPiBIaSBNaWNoYWVs
ICYgU3RlcGhlbiwNCj4gPiANCj4gPiBQbGVhc2Uga2luZGx5IGxldCBtZSBrbm93IHlvdXIgY29t
bWVudHMgYWJvdXQgdGhpcyBwYXRjaC4NCj4gPiBUaGFua3MNCj4gPiANCj4gDQo+IFdoYXQncyB0
aGUgYmFzZSBmb3IgdGhpcyBwYXRjaD8gSSB0cmllZCBhcHBseWluZyB0byB2NS45LXJjMSBhbmQg
aXQNCj4gZGlkbid0IHdvcmsuDQoNClNvcnJ5LCB3aGF0IGRvZXMgdGhhdCBtZWFuPw0KDQpEbyB5
b3UgaGF2ZSBlbmNvdW50ZXJlZCBhIG1lcmdlZCBjb25mbGljdCBvciBydW4gdGltZSBmYWlsZWQ/
DQoNCkkgYmFzZWQgb24ga2VybmVsLTUuOC1yYzEgdG8gYWRkIGl0IGFuZCBpdCBjYW4gYm9vdCB0
byBrZXJuZWwgc2hlbGwuDQoNClRoYW5rcyENCg0KDQpIYW5rcyBDaGVuDQo=

