Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2026C4332F
	for <linux-gpio@archiver.kernel.org>; Fri, 11 Nov 2022 07:04:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233131AbiKKHEk (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 11 Nov 2022 02:04:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232471AbiKKHEk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Nov 2022 02:04:40 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 554D677226
        for <linux-gpio@vger.kernel.org>; Thu, 10 Nov 2022 23:04:39 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 11C42B822DE
        for <linux-gpio@vger.kernel.org>; Fri, 11 Nov 2022 07:04:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8C65C433D6;
        Fri, 11 Nov 2022 07:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668150276;
        bh=bOMlmUjxndaWMJzjbs2XBXLFFtToChjLoJFHwOiOQAw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PE8dOnUkOfQoWWwlzlkLi//8c0KtTKInrexklCoTcqig7LxSIjJialPYCqZvyZ3Dn
         L9DuLU2+36Z9aZLlLhO/TrHyy4EI4KA3RNb1CdrNLBrxqqmUpO4w2ZxDLR4mtYiPSU
         +2Uz/8QBppnqPw9kB75VaDnRUOtDhewKKtkTY96l0qSnwVQI/iLV2X7Xgrd+OgqqmB
         nQQLMlbU27wOC7y7J2b2Zw+Kr+lszt/PkJCrZmcOXrcphZGsqr5cl9eqX9B4nU1eAL
         2Z9ci33uH6wcey6Vm4Pw1AGkNt+hV0TVJ8Cq0JFN7rMqmmzySrPNF/2UL/h+lAyFZR
         XrI1IZX3GpZgQ==
Date:   Fri, 11 Nov 2022 15:04:29 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW@KARO-electronics.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] ARM: mxs: Remove unneeded #include
 <linux/pinctrl/consumer.h>
Message-ID: <20221111070429.GO2649582@dragon>
References: <1c4709e2bd678e7f57f6b523ce5ae54686ec1e5b.1668000823.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c4709e2bd678e7f57f6b523ce5ae54686ec1e5b.1668000823.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 09, 2022 at 02:35:16PM +0100, Geert Uytterhoeven wrote:
> Commit 7705b5ed8adccd92 ("ARM: mxs: remove obsolete startup code for
> TX28") removed the last user of the pinctrl consumer API.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied, thanks!
