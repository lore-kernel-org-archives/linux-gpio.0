Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62D82ECAAA1
	for <linux-gpio@archiver.kernel.org>; Tue,  6 Sep 2022 15:51:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234734AbiIFPvO (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 6 Sep 2022 11:51:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234754AbiIFPuo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Sep 2022 11:50:44 -0400
Received: from sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36AA03A0;
        Tue,  6 Sep 2022 08:04:16 -0700 (PDT)
Received: from localhost (bloch.sibelius.xs4all.nl [local])
        by bloch.sibelius.xs4all.nl (OpenSMTPD) with ESMTPA id 81783d33;
        Tue, 6 Sep 2022 16:04:14 +0200 (CEST)
Date:   Tue, 6 Sep 2022 16:04:14 +0200 (CEST)
From:   Mark Kettenis <mark.kettenis@xs4all.nl>
To:     "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc:     arnd@arndb.de, lee@kernel.org, linus.walleij@linaro.org,
        alyssa@rosenzweig.io, andriy.shevchenko@linux.intel.com,
        asahi@lists.linux.dev, brgl@bgdev.pl, devicetree@vger.kernel.org,
        marcan@marcan.st, corbet@lwn.net,
        krzysztof.kozlowski+dt@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-gpio@vger.kernel.org, pmladek@suse.com,
        linux@rasmusvillemoes.dk, robh+dt@kernel.org,
        senozhatsky@chromium.org, rostedt@goodmis.org, sven@svenpeter.dev
In-Reply-To: <E1oVYUD-005Cm5-3Z@rmk-PC.armlinux.org.uk>
        (rmk+kernel@armlinux.org.uk)
Subject: Re: [PATCH 1/7] dt-bindings: mfd: add binding for Apple Mac System
 Management Controller
References: <YxdInl2qzQWM+3bs@shell.armlinux.org.uk> <E1oVYUD-005Cm5-3Z@rmk-PC.armlinux.org.uk>
Message-ID: <d3ced06b04394f98@bloch.sibelius.xs4all.nl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
> Date: Tue, 06 Sep 2022 14:19:29 +0100
> 
> Add a DT binding for the Apple Mac System Management Controller.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Mark Kettenis <kettenis@openbsd.org>

> ---
>  .../devicetree/bindings/mfd/apple,smc.yaml    | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/apple,smc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/apple,smc.yaml b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> new file mode 100644
> index 000000000000..168f237c2962
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/apple,smc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple Mac System Management Controller
> +
> +maintainers:
> +  - Hector Martin <marcan@marcan.st>
> +
> +description:
> +  Apple Mac System Management Controller implements various functions
> +  such as GPIO, RTC, power, reboot.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - apple,t6000-smc
> +          - apple,t8103-smc
> +          - apple,t8112-smc
> +      - const: apple,smc
> +
> +  reg:
> +    items:
> +      - description: SMC area
> +      - description: SRAM area
> +
> +  reg-names:
> +    items:
> +      - const: smc
> +      - const: sram
> +
> +  mboxes:
> +    maxItems: 1
> +    description:
> +      A phandle to the mailbox channel
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - mboxes
> +
> +examples:
> +  - |
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      smc@23e400000 {
> +        compatible = "apple,t8103-smc", "apple,smc";
> +        reg = <0x2 0x3e400000 0x0 0x4000>,
> +               <0x2 0x3fe00000 0x0 0x100000>;
> +        reg-names = "smc", "sram";
> +        mboxes = <&smc_mbox>;
> +      };
> +    };
> -- 
> 2.30.2
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
