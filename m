Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE944C49EAB
	for <linux-gpio@archiver.kernel.org>; Sun, 27 Jun 2021 23:38:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CED5E61C43
	for <linux-gpio@archiver.kernel.org>; Sun, 27 Jun 2021 23:38:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231726AbhF0XlP (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sun, 27 Jun 2021 19:41:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:52116 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231491AbhF0XlP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 27 Jun 2021 19:41:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 92AAE6161E;
        Sun, 27 Jun 2021 23:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624837130;
        bh=lenqMCekltDX+AqjNhd4JqLUZdEG+Ux+jyQjI5v5huI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=jaZVw/TjdAeOh/2jAk4WhKHFhMjAGvUf86jBRnDRkR/jEDNzTsK77UOyarfX89h4V
         X9DqNoC0n5e35VsFbj8h3BKLdtB93RQSzqOC3Iu+hYohijhD9K9YduwCS0hn/QEIKM
         6qh876xSLr4e5mPDIM9UfvSzm77vfH+nwcgQEICFGQ2S8vKcqq4ZWmx+feItoTkdNQ
         XiUNPCQzH/GxiXqJGJB8gOIovctHeWIWy6DOw22pDm/aYvYt2wOydWsgc3brAXU4vr
         iPJOMG5SVhiW8idUi6G0sfbaLOlbwPv/O5iOwNA4gce9I5Ju19Q14+jRRb+3Q+15KG
         gTBbmljy7GgoA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210627045631.2882-4-jiaxun.yang@flygoat.com>
References: <20210627045631.2882-1-jiaxun.yang@flygoat.com> <20210627045631.2882-4-jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 3/9] clk: pistachio: Make it selectable for generic MIPS kernel
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        daniel.lezcano@linaro.org, linus.walleij@linaro.org,
        vkoul@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org
Date:   Sun, 27 Jun 2021 16:38:49 -0700
Message-ID: <162483712923.3259633.15640278024587375157@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Jiaxun Yang (2021-06-26 21:56:25)
> diff --git a/drivers/clk/pistachio/Kconfig b/drivers/clk/pistachio/Kconfig
> new file mode 100644
> index 000000000000..efb7a7f45259
> --- /dev/null
> +++ b/drivers/clk/pistachio/Kconfig
> @@ -0,0 +1,8 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +config COMMON_CLK_PISTACHIO
> +       bool "Support for IMG Pistachio SoC clock controllers"
> +       depends on MIPS

Is anything MIPS specific? Or can this be=20

	depends on MIPS || COMPILE_TEST


> +       help
> +         Support for the IMG Pistachio SoC clock controller.
> +         Say Y if you want to include clock support.
> \ No newline at end of file
> --=20
> 2.32.0
>
