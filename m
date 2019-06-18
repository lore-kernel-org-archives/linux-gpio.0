Return-Path: <SRS0=ToIH=UR=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 196FCC31E5B
	for <linux-gpio@archiver.kernel.org>; Tue, 18 Jun 2019 16:11:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AF97520B1F
	for <linux-gpio@archiver.kernel.org>; Tue, 18 Jun 2019 16:11:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="M+MUYr2L"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729414AbfFRQLE (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 18 Jun 2019 12:11:04 -0400
Received: from ssl.serverraum.org ([176.9.125.105]:41253 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729308AbfFRQLE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jun 2019 12:11:04 -0400
X-Greylist: delayed 534 seconds by postgrey-1.27 at vger.kernel.org; Tue, 18 Jun 2019 12:11:03 EDT
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 24CF922EEB;
        Tue, 18 Jun 2019 18:02:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
        s=mail2016061301; t=1560873728;
        bh=IpVDsuBcLKMByzS+9jM10o6ARdsu4mYewMxUsA8XDYw=;
        h=Date:From:To:Subject:From;
        b=M+MUYr2LvqdVFlXqnTBxIPmKoh9W0chouZOaaJBWFP7ODii5odFpev7jTsy77+okv
         tWsvSU+Q9bytxM58f4cR0bW1QlOTUDHZGHelCfMIBpkWhY84An/yKpJSlRyvXzANCO
         +LoudOBbQYB+k17IKhFhscZHrL2HthEl4ajnnBAY=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 18 Jun 2019 18:02:08 +0200
From:   Michael Walle <michael@walle.cc>
To:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: generic gpio-syscon
Message-ID: <9e977d86db99153e413dc9099f3a70f4@walle.cc>
X-Sender: michael@walle.cc
User-Agent: Roundcube Webmail/1.2.3
X-Virus-Scanned: clamav-milter 0.100.3 at web
X-Virus-Status: Clean
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi all, Hi Linus,

Linus, I've especially added you because you've expressed some concerns 
about using bits and offsets in the device-tree [1].

I'd like to disuss adding a generic gpio-syscon (eg. compatible = 
"gpio-syscon"). At the moment, if you have a board which could use the 
gpio-syscon out-of-the-box, you still have to submit a patch to add 
support to the gpio-syscon driver. Wouldn't it be easier to let the 
user/board manufacturer configure the parameters through the dtb? I 
understand your reasoning to have the information in two different 
places, but isn't that alwas the case for any non trivial device tree 
binding? On the other hand, if you'd have a generic gpio-syscon and the 
actual hardware is compatible with it, all you have to do is to add the 
devicetree fragment. You don't have to wait until your patch is approved 
by the kernel maintainers, you don't have to wait until the kernel with 
your patch actually makes it into the distributions, etc.

I have thought about something like:
    gpio0 {
        compatible = "gpio-syscon";
        syscon = <&syscon>;
        gpio-controller;
        flags = <GPIO_SYSCON_FEAT_IN | GPIO_SYSCON_FEAT_OUT | 
GPIO_SYSCON_FEAT_DIR>;
        offsets = <0 0 1>;
        io-width = <4>;
        mask = <0x0000ffff>;
    };

Where offsets is a tuple of (input register offset, output register 
offset, direction register offset) and the driver would expose 16 GPIOs.

For the flags there might be something like:

#define GPIO_SYSCON_GPIO (GPIO_SYSCON_FEAT_IN | GPIO_SYSCON_FEAT_OUT | 
GPIO_SYSCON_FEAT_DIR)
#define GPIO_SYSCON_GPI  (GPIO_SYSCON_FEAT_IN)
#define GPIO_SYSCON_GPO  (GPIO_SYSCON_FEAT_OUT)


TBH, I'm a newbie at what should be in the dts and what should be in the 
driver, but I've seen the syscon-poweroff driver which can be used for 
most use cases out-of-the-box.

-michael

[1] 
https://www.mail-archive.com/linux-gpio@vger.kernel.org/msg01660.html
