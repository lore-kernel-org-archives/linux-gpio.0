Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C8A8C433DB
	for <linux-gpio@archiver.kernel.org>; Thu,  7 Jan 2021 10:04:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C761922D75
	for <linux-gpio@archiver.kernel.org>; Thu,  7 Jan 2021 10:04:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726254AbhAGKDw (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 7 Jan 2021 05:03:52 -0500
Received: from smtp.asem.it ([151.1.184.197]:52696 "EHLO smtp.asem.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725974AbhAGKDw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 7 Jan 2021 05:03:52 -0500
Received: from webmail.asem.it
        by asem.it (smtp.asem.it)
        (SecurityGateway 6.5.2)
        with ESMTP id SG000696439.MSG 
        for <linux-gpio@vger.kernel.org>; Thu, 07 Jan 2021 11:03:09 +0100S
Received: from ASAS044.asem.intra (172.16.16.44) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 7 Jan
 2021 11:03:07 +0100
Received: from ASAS044.asem.intra ([::1]) by ASAS044.asem.intra ([::1]) with
 mapi id 15.01.1979.003; Thu, 7 Jan 2021 11:03:07 +0100
From:   Flavio Suligoi <f.suligoi@asem.it>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Johan Hovold <johan@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: R: [PATCH v2] gpiolib: Disallow identical line names in the same chip
Thread-Topic: [PATCH v2] gpiolib: Disallow identical line names in the same
 chip
Thread-Index: AQHW5DC+EYQ7RQ5jYUeg211EwFA6Oaob7+Gg
Date:   Thu, 7 Jan 2021 10:03:07 +0000
Message-ID: <d04ed4ea7bfe4438947e05c86f031ed4@asem.it>
References: <20210105082758.77762-1-linus.walleij@linaro.org>
 <CAHp75VeXC26KxxhrSbtae2_v4Zqnaaia3nV_1sxY07uUEt3U7g@mail.gmail.com>
 <CACRpkdYixhB6rTw=DK7CetExsXSH4czVzysynZas07OTuQi0vA@mail.gmail.com>
 <CAMpxmJUJnhc9HrZnb=qE5fpZ9e0Xo7VP-hTjdK-LHk0w6n3cMQ@mail.gmail.com>
 <CAHp75VcVN5Af3t-OYdO9MOXk14LV+zYQtusqft8twi_u83yZ6g@mail.gmail.com>
In-Reply-To: <CAHp75VcVN5Af3t-OYdO9MOXk14LV+zYQtusqft8twi_u83yZ6g@mail.gmail.com>
Accept-Language: it-IT, en-US
Content-Language: it-IT
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.17.208]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SGHeloLookup-Result: pass smtp.helo=webmail.asem.it (ip=172.16.16.44)
X-SGSPF-Result: none (smtp.asem.it)
X-SGOP-RefID: str=0001.0A782F1D.5FF6DC5C.0040,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0 (_st=1 _vt=0 _iwf=0)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgQW5keSwNCg0KPiBGbGF2aW8sIHBlcmhhcHMgb25lIG1vcmUgcnVsZSB0byB0aGUgZ3Bpby1s
aW5lLW5hbWVzIHByb3BlcnR5IGhhcyB0bw0KPiBiZSBhZGRlZCBpbnRvIGRvY3VtZW50YXRpb24g
KEJhcnQsIHNhbWUgdG8gRFQgZG9jcz8pOg0KPiAgLSBuYW1lcyBpbnNpZGUgb25lIGNoaXAgbXVz
dCBiZSB1bmlxdWUNCg0Kb2ssIEknbGwgYWRkIHRoaXMgcnVsZQ0KDQo+IC0tDQo+IFdpdGggQmVz
dCBSZWdhcmRzLA0KPiBBbmR5IFNoZXZjaGVua28NCg0KQmVzdCByZWdhcmRzLA0KRmxhdmlvIFN1
bGlnb2kNCg==
