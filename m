Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14FADC433EF
	for <linux-gpio@archiver.kernel.org>; Sat, 26 Feb 2022 20:54:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbiBZUy7 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sat, 26 Feb 2022 15:54:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbiBZUy7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 26 Feb 2022 15:54:59 -0500
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F5E223D034;
        Sat, 26 Feb 2022 12:54:24 -0800 (PST)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id BE5422223E;
        Sat, 26 Feb 2022 21:54:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1645908862;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=baGxETKr4EyF+PTNs4Sn3z1hVCPQByp//FE2CcA1b7g=;
        b=D4VnMIECv6YoV/ao41odEWY547ULVDOeHgLD5tsPU9P/o/f9SDgfO0/vEHXMuzSUU33nWN
        qVO+jqmpjIgPC/OcuPmQAKnVp8BjkcqNgOjjGttO+/Ce7HgMUnU1Hc/xQSpx0BdT/9eNmt
        SXY2v2yzQS1/Ba0wKxp+UP4TtA/3QCI=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Sat, 26 Feb 2022 21:54:22 +0100
From:   Michael Walle <michael@walle.cc>
To:     Colin Foster <colin.foster@in-advantage.com>
Cc:     Horatiu Vultur <horatiu.vultur@microchip.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        UNGLinuxDriver@microchip.com, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 5/5] pinctrl: microchip-sgpio: wait until output is
 actually set
In-Reply-To: <20220225165446.GA4704@COLIN-DESKTOP1.localdomain>
References: <20220224161021.2197263-1-michael@walle.cc>
 <20220224161021.2197263-6-michael@walle.cc>
 <20220225092427.jjilv3qo52crsmuw@soft-dev3-1.localhost>
 <2f8a215c67269d639290515931d10b78@walle.cc>
 <20220225165446.GA4704@COLIN-DESKTOP1.localdomain>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <5ab71056170ea00dc0d2ed8f7b9802db@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Colin,

Am 2022-02-25 17:54, schrieb Colin Foster:
> On Fri, Feb 25, 2022 at 12:29:50PM +0100, Michael Walle wrote:
>> 
>> Could you also have a look at the other supported sgpio block,
>> the ocelot and the luton? I don't have any register description
>> of these.
> 
> The current supported Ocelot chips are the VSC7514 (link below) and the
> VSC7513. Chapter 6 of this PDF links a second PDF, and you should be
> able to find the Serial GPIO definitions in DEVCPU_GCB:SIO_CTRL on page
> 79 of that PDF.
> https://ww1.microchip.com/downloads/en/DeviceDoc/VMDS-10491.pdf

Thanks! I've just send a new version with support for these.

> I'm working on support for the VSC7511/7512, so I can run a "does it
> work" test, but I likely won't have a setup to test the corner
> conditions this patch set is addressing with any confidence.

You can time the register polling using ktime_get(), ktime_sub()
and ktime_to_ns(). It should be in the magnitude of the burst gap.
Which will give you at least some confidence. I did the testing
with an oscilloscope and toggling gpios (but also did measure
the timing with ktime_get()).

-michael
