Return-Path: <SRS0=is5H=7C=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92C83C433E0
	for <linux-gpio@archiver.kernel.org>; Wed, 20 May 2020 12:23:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 69270207C4
	for <linux-gpio@archiver.kernel.org>; Wed, 20 May 2020 12:23:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbgETMXs (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 20 May 2020 08:23:48 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:58466 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726224AbgETMXs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 May 2020 08:23:48 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 3CE1A8030875;
        Wed, 20 May 2020 12:23:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id m4FEeRfc3BNu; Wed, 20 May 2020 15:23:45 +0300 (MSK)
Date:   Wed, 20 May 2020 15:23:44 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v1] MAINTAINERS: Fix file name for DesignWare GPIO DT
 schema
Message-ID: <20200520122344.ilt5jcfdftbtshun@mobilestation>
References: <20200520120955.68427-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200520120955.68427-1-andriy.shevchenko@linux.intel.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 20, 2020 at 03:09:55PM +0300, Andy Shevchenko wrote:
> The commit 657a06df993c
>   ("dt-bindings: gpio: Convert snps,dw-apb-gpio to DT schema")
> missed MAINTAINERS update.

Thanks.
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

> 
> Fixes: 657a06df993c ("dt-bindings: gpio: Convert snps,dw-apb-gpio to DT schema")
> Cc: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 146dba1e3b53..e372dc9c6e40 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16370,7 +16370,7 @@ M:	Hoan Tran <hoan@os.amperecomputing.com>
>  M:	Serge Semin <fancer.lancer@gmail.com>
>  L:	linux-gpio@vger.kernel.org
>  S:	Maintained
> -F:	Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
> +F:	Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
>  F:	drivers/gpio/gpio-dwapb.c
>  
>  SYNOPSYS DESIGNWARE AXI DMAC DRIVER
> -- 
> 2.26.2
> 
