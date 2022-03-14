Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC65C433FE
	for <linux-gpio@archiver.kernel.org>; Mon, 14 Mar 2022 15:55:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242798AbiCNP4b (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 14 Mar 2022 11:56:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242605AbiCNP4a (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Mar 2022 11:56:30 -0400
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EF4E3ED3E;
        Mon, 14 Mar 2022 08:55:19 -0700 (PDT)
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id CF79C2222E;
        Mon, 14 Mar 2022 16:55:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1647273317;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bESQLLsW9UA6Y/GBZonv6IQcBfHiM3XWrdn1bAk3zJM=;
        b=ufRCp9RjbPdcTjoSyh7FiO1rs4CJiG0W0oAlrdrAN3rY9R80dZqjzva0a8TIibYhHmTi6V
        0tu/SFedIcGQD1gXbGr6tzo+w8mMQ/zHw7/wpbtR2mGSOPobA5KROdsO9JzKTx4/SJBWId
        dsXQsC+PCF5GzyJEMPvGUMVBHcFXLmk=
From:   Michael Walle <michael@walle.cc>
To:     marcelo.jimenez@gmail.com
Cc:     achant@google.com, brgl@bgdev.pl, edmondchung@google.com,
        geert@linux-m68k.org, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, regressions@lists.linux.dev,
        sfr@canb.auug.org.au, stable@vger.kernel.org,
        tanzilli@acmesystems.it, treding@nvidia.com, vidyas@nvidia.com,
        willmcvicker@google.com,
        Horatiu Vultur <horatiu.vultur@microchip.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Michael Walle <michael@walle.cc>
Subject: Re: [PATCH] gpio: Revert regression in sysfs-gpio (gpiolib.c)
Date:   Mon, 14 Mar 2022 16:55:09 +0100
Message-Id: <20220314155509.552218-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211217153555.9413-1-marcelo.jimenez@gmail.com>
References: <20211217153555.9413-1-marcelo.jimenez@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

> Some GPIO lines have stopped working after the patch
> commit 2ab73c6d8323f ("gpio: Support GPIO controllers without pin-ranges")
> 
> And this has supposedly been fixed in the following patches
> commit 89ad556b7f96a ("gpio: Avoid using pin ranges with !PINCTRL")
> commit 6dbbf84603961 ("gpiolib: Don't free if pin ranges are not defined")
> 
> But an erratic behavior where some GPIO lines work while others do not work
> has been introduced.
> 
> This patch reverts those changes so that the sysfs-gpio interface works
> properly again.
> 
> Signed-off-by: Marcelo Roberto Jimenez <marcelo.jimenez@gmail.com>

This breaks the pinctrl-microchip-sgpio driver as far as I can see.

I tried to debug it and this is what I have discovered so far:
 (1) the sgpio driver will use the gpio_stub_drv for its child nodes.
     Looks like a workaround, see [1].
 (2) these will have an empty gpio range
 (3) with the changes of this patch, pinctrl_gpio_request() will now
     be called and will fail with -EPROBE_DEFER.

I'm not exactly sure what to do here. Saravana Kannan once suggested
to use devm_of_platform_populate() to probe the child nodes [2]. But
I haven't found any other driver doing that.

Also, I'm not sure if there are any other other driver which get
broken by this. I.e. ones falling into the gpio_stub_drv category.

[1] https://lore.kernel.org/lkml/20210122193600.1415639-1-saravanak@google.com/
[2] https://lore.kernel.org/lkml/CAGETcx9PiX==mLxB9PO8Myyk6u2vhPVwTMsA5NkD-ywH5xhusw@mail.gmail.com/

-michael

NB. this patch doesn't contain a Fixes tag. Was this on purpose?
