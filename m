Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7034CECAAA1
	for <linux-gpio@archiver.kernel.org>; Mon,  5 Sep 2022 22:30:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231551AbiIEWay (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 5 Sep 2022 18:30:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229762AbiIEWax (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2022 18:30:53 -0400
X-Greylist: delayed 364 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 05 Sep 2022 15:30:53 PDT
Received: from mail.3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 164AB5721D
        for <linux-gpio@vger.kernel.org>; Mon,  5 Sep 2022 15:30:52 -0700 (PDT)
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.3ffe.de (Postfix) with ESMTPSA id A29BA1272;
        Tue,  6 Sep 2022 00:24:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
        t=1662416683;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dOe8jPTKzzR6NB+CPpTCTcs7fzAc/wUD0hvNTkIAjx4=;
        b=l0wd3KRnAaq/djXMKKkNH0O5+fxVQbAM6isQbfJx02bKb6H0WWeNycly19Qra7IDqGGXSo
        5rpDuiHuzKsJdHvJ9h4c/0MPrOh+0X9JjDSeh9FR6MvufA1Fujt9J47vmKi5wmpClqGd6b
        VXCRDtAXZdlYgHzWwkj0KspGAJsPrlR6zg1iDdWifJHtPcITABg/aXwsA4OCDGjkVr9PFh
        uAN0qQ8zIqhPne35J5lLounzVAwPD6QGg7G2/vm61AqAzYOco8nQapVgcMm/xqJwVaj+Lw
        aoKhNlGJBP+YYv790DyaB3gL9jmtwkUtfc41T4YYey+na7PkHmKH2GD5ueu5wQ==
MIME-Version: 1.0
Date:   Tue, 06 Sep 2022 00:24:43 +0200
From:   Michael Walle <michael@walle.cc>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        UNGLinuxDriver@microchip.com
Subject: Re: [PATCH v1 1/1] pinctr: microchip-sgpio: Correct the
 fwnode_irq_get() return value check
In-Reply-To: <20220905190849.73194-1-andriy.shevchenko@linux.intel.com>
References: <20220905190849.73194-1-andriy.shevchenko@linux.intel.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <21f2241f19003a1210bd475883ee077b@walle.cc>
X-Sender: michael@walle.cc
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 2022-09-05 21:08, schrieb Andy Shevchenko:
> fwnode_irq_get() may return all possible signed values, such as Linux
> error code. Fix the code to handle this properly.
> 
> Fixes: be2dc859abd4 ("pinctrl: pinctrl-microchip-sgpio: Add irq
> support (for sparx5)")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Michael Walle <michael@walle.cc>

Btw. do we care about EPROBE_DEFER?

-michael
