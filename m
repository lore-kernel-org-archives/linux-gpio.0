Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BBD4C678D4
	for <linux-gpio@archiver.kernel.org>; Mon,  6 Mar 2023 08:55:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229661AbjCFIzr (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 6 Mar 2023 03:55:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbjCFIzp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Mar 2023 03:55:45 -0500
X-Greylist: delayed 928 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 06 Mar 2023 00:55:44 PST
Received: from mail11.truemail.it (mail11.truemail.it [IPv6:2001:4b7e:0:8::81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BB0A1D922;
        Mon,  6 Mar 2023 00:55:44 -0800 (PST)
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
        by mail11.truemail.it (Postfix) with ESMTPA id DA75F20BA7;
        Mon,  6 Mar 2023 09:55:42 +0100 (CET)
Date:   Mon, 6 Mar 2023 09:55:39 +0100
From:   Francesco Dolcini <francesco@dolcini.it>
To:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] gpio: fxl6408: add I2C GPIO expander driver
Message-ID: <ZAWqiw2gTgqg6qgk@francesco-nb.int.toradex.com>
References: <20230306083446.41082-1-francesco@dolcini.it>
 <20230306083446.41082-3-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230306083446.41082-3-francesco@dolcini.it>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 06, 2023 at 09:34:46AM +0100, Francesco Dolcini wrote:
> From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> 
> Support Fairchild (now ON Semiconductor) fxl6408 which has 8 GPIO lines
> and is controlled by I2C bus.
> 
> Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Whoops. As already noticed by Krzysztof in patch 1/2 I forgot my SoB,
will fix in v2.

Francesco

