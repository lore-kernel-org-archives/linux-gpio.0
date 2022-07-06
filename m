Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1FCDC433EF
	for <linux-gpio@archiver.kernel.org>; Wed,  6 Jul 2022 12:51:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233710AbiGFMvz (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 6 Jul 2022 08:51:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232771AbiGFMvy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jul 2022 08:51:54 -0400
Received: from m1564.mail.126.com (m1564.mail.126.com [220.181.15.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8DDFD2125E
        for <linux-gpio@vger.kernel.org>; Wed,  6 Jul 2022 05:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=BTPe1
        Tia7gwG3s/PaBwOv8zi5Mq1d6gWt9si7zhNr/4=; b=P+Yej7RLVXvioaPNAj7mO
        JbVmVzPAVN+dhUZDLqMMK5AozVi/KPerp2vUQL2uoQpz1DCFw4Jo1J29qWdk46yT
        2MeJ32FTRi3CG/EULEkCFiTmf7ybeoTdcfnQ5AcBhdolrUTApP/1Af6cdsDo1jzt
        jHLG7pGIkEaVJjHWup5gLE=
Received: from windhl$126.com ( [124.16.139.61] ) by ajax-webmail-wmsvr64
 (Coremail) ; Wed, 6 Jul 2022 20:51:36 +0800 (CST)
X-Originating-IP: [124.16.139.61]
Date:   Wed, 6 Jul 2022 20:51:36 +0800 (CST)
From:   "Liang He" <windhl@126.com>
To:     "Andy Shevchenko" <andy.shevchenko@gmail.com>
Cc:     "Linus Walleij" <linus.walleij@linaro.org>,
        "Bartosz Golaszewski" <brgl@bgdev.pl>,
        =?GBK?Q?Heiko_St=A8=B9bner?= <heiko@sntech.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re:Re: [PATCH] gpio: rockchip: Fix missing of_node_put() in
 rockchip_gpio_probe() and rockchip_gpiolib_register()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <CAHp75VdWBx2hMyu6902exeist24cm5NnO3z9aKjhV=H5tb8y9g@mail.gmail.com>
References: <20220706060222.302051-1-windhl@126.com>
 <CAHp75VdWBx2hMyu6902exeist24cm5NnO3z9aKjhV=H5tb8y9g@mail.gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <10b8f377.75ee.181d390dfe0.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: QMqowABXX3NZhcViGMlGAA--.57102W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbizgE2F18RPcbEfgACsj
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

CgpBdCAyMDIyLTA3LTA2IDIwOjI3OjQxLCAiQW5keSBTaGV2Y2hlbmtvIiA8YW5keS5zaGV2Y2hl
bmtvQGdtYWlsLmNvbT4gd3JvdGU6Cj5PbiBXZWQsIEp1bCA2LCAyMDIyIGF0IDg6MjkgQU0gTGlh
bmcgSGUgPHdpbmRobEAxMjYuY29tPiB3cm90ZToKPj4KPj4gV2Ugc2hvdWxkIGNhbGwgb2Zfbm9k
ZV9wdXQoKSBmb3IgdGhlIHJlZmVyZW5jZSByZXR1cm5lZCBieQo+PiBvZl9nZXRfcGFyZW50KCkg
d2hpY2ggd2lsbCBpbmNyZWFzZSB0aGUgcmVmY291bnQuCj4KPklzIGl0IHN1Z2dlc3RlZCBieSB0
aGUgc28tY2FsbGVkIEh1bGsgUm9ib3Q/IElmIHNvLCBpdCdzIG5vdCB0aGUgZmlyc3QKPnRpbWUg
SSBzZWUgdGhhdCBwZW9wbGUgZG9uJ3QgdGhpbmsgYWJvdXQsIGFuZCBqdXN0IHJlcGVhdCBhcyBy
b2JvdHMKPmRvLiBIYXZlIHlvdSByZWFkIHRoZSBjb2RlPyBIYXZlIHlvdSB0cmllZCB0byB1bmRl
cnN0YW5kIHdoYXQgbWF5Cj5oYXBwZW4gd2hlbiB5b3UgcHV0IGFuIE9GIG5vZGU/IFdoYXQgd291
bGQgYmUgcG9zc2libGUgY29uc2VxdWVuY2VzIHRvCj50aGUgcmVzdCBvZiB0aGUgY29kZT8KPgo+
VGhlIGFib3ZlIHNlbnRlbmNlIGlzIGNvcnJlY3QsIGltcGxlbWVudGF0aW9uIGlzIG5vdCB0aG91
Z2h0IHRocm91Z2guCj5JdCBtaWdodCBiZSBhIGNvcnJlY3QgZml4LCBidXQgdGhlIGNvbW1pdCBt
ZXNzYWdlIGRvZXNuJ3Qgc2hvdyB0aGF0Cj55b3UgcmVhbGx5IHNwZW50IHRpbWUgb24gdGhlIGNo
YW5nZS4KPgo+UC5TPiBJIHdvdWxkIHBlcnNvbmFsbHkgcHV0IGFsbCB0aG9zZSBIdWxrIFJvYm90
IGJsYS1ibGEtYmxhIHdpdGgKPmxvd2VzdCBwcmlvcml0eSB0byBjb25zaWRlciwgdG9vIG1hbnkg
YnJva2VuIHN1Ym1pc3Npb25zLi4uCj4KPi0tIAo+V2l0aCBCZXN0IFJlZ2FyZHMsCj5BbmR5IFNo
ZXZjaGVua28KCkhpLCBBbmR5LAoKVGhhbmtzIHZlcnkgbXVjaCBmb3IgeW91IHRvIHJldmlldyBt
eSBhbm90aGVyIHBhdGNoIGNvZGUuCgpGaXJzdCBvZiBhbGwsIGFsbCBvZiBteSBjb21taXRzIGFy
ZSBub3QgZnJvbSBIdWxrIFJvYm90IGFuZCBJIGFtIHNvcnJ5IHRoYXQgeW91IGhhdmUgc3BlbnQg
bG90cyBvZiB0aW1lCmZvciB0aG9zZSBicm9rZW4gc3VibWlzc2lvbnMuCgpTZWNvbmQsIGZvciB0
aGlzIGJ1Zywgd2hpbGUgdGhlIG9mX2dldF9wYXJlbnQoKSBpcyBvbmx5IDMtNCBsaW5lcyBhYm92
ZSB0aGUgYWRkaW5nIG9mX25vZGVfcHV0KCksIAppdCBpcyBteSBmYXVsdCB0byB3cml0ZSBzbyBz
aG9ydCBjb21taXQgbG9nLiAKCgpUaGFua3MgYWdhaW4sCgpMaWFuZwoKCgoKCgoK
