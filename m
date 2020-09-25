Return-Path: <SRS0=uYQT=DC=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A33B4C4741F
	for <linux-gpio@archiver.kernel.org>; Fri, 25 Sep 2020 15:48:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 68B9C21741
	for <linux-gpio@archiver.kernel.org>; Fri, 25 Sep 2020 15:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601048898;
	bh=LZI3R7X8nN4CcB6MS3uhfC9n4b5Jqujs2f4JEI50j70=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=J8AcbqsoH3kzGoiIWNhMVSrJR72e9NxX6dq/4nyiY+Ai55gsPaNosbdqTaFe7but3
	 mHhbzRhO3jy/akveCr9c79IKKjGQNsBGZkUI9yLWq5nkovLEYgZK2akrqKLcZ0JMrt
	 TIcBz2q3Uv1gc58l3acAWfx+N+IMP8/R5EhB+4HU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729374AbgIYPsM (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 25 Sep 2020 11:48:12 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42534 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728333AbgIYPsM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Sep 2020 11:48:12 -0400
Received: by mail-wr1-f68.google.com with SMTP id c18so4087588wrm.9;
        Fri, 25 Sep 2020 08:48:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7Qh5+ZRjYoXTfTyMdsphNx4+wbs2iln0Dg7bJktrLac=;
        b=TVeaCTXCpTsuVU0OtUUElmJo/fpDul1xq0BoKSat8xsthvyVRg3tvKSo9BDvXekHGs
         nVMqvWqW2vDFwcKum10rq+V2w4RGf0Cbu4GkgPDlQ70SCIrY75oW3A8tvEVZ72/uj+BR
         4EbsAekEwNtwoAc1kWoEQOvx8Y6MK0luteQWvJdUqrb31OnLBXKf4kSf6ewiSu4+Ht9/
         WRh3LafUlWtpbwAaotcanO4mWtDq5aA5KJbY/3zBTbP98+v8CpwfiTqnpkwdUuH9XqNZ
         IYgvZ5oXua9CSn4kvt2ZeDcdMZ9AORrztspYXytjv/MZiKPE6Q6dhPOQRLB/HCw3fCTb
         QYOA==
X-Gm-Message-State: AOAM530jZ7cH+UMdZuiOzssXlOROiVnnPDzz/OVL+TIcaLz6izOfYlGs
        F+7Qk5sFmybwRzI9dgKATms=
X-Google-Smtp-Source: ABdhPJw0NxnpCAb54EdTsCUv1oA2JhAAx01jYuFmqouNOz5V/9GWfo7kcmF2Z8f+IMYVxGIHsAi2tA==
X-Received: by 2002:adf:f082:: with SMTP id n2mr5158088wro.35.1601048889557;
        Fri, 25 Sep 2020 08:48:09 -0700 (PDT)
Received: from kozik-lap ([194.230.155.132])
        by smtp.googlemail.com with ESMTPSA id k8sm3477035wma.16.2020.09.25.08.48.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Sep 2020 08:48:08 -0700 (PDT)
Date:   Fri, 25 Sep 2020 17:48:04 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 01/15] dt-bindings: gpio: convert bindings for NXP
 PCA953x family to dtschema
Message-ID: <20200925154804.GB16392@kozik-lap>
References: <20200916155715.21009-1-krzk@kernel.org>
 <20200916155715.21009-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200916155715.21009-2-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 16, 2020 at 05:57:01PM +0200, Krzysztof Kozlowski wrote:
> Convert the NXP PCA953x family of GPIO expanders bindings to device tree
> schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> ---
> 
> Changes since v2:
> 1. Add Rob's review tag
> 
> Changes since v1:
> 1. Use additionalProperties.
> 2. Add wakeup-source.
> 3. Add hogs.
> 4. Extend example with hogs.
> ---
>  .../devicetree/bindings/gpio/gpio-pca953x.txt |  90 ----------
>  .../bindings/gpio/gpio-pca95xx.yaml           | 166 ++++++++++++++++++
>  .../devicetree/bindings/trivial-devices.yaml  |   4 -
>  3 files changed, 166 insertions(+), 94 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml

Hi Linus,

The first two patches (bindings) have Rob's ack/review. Could you pick
them via GPIO tree?

Best regards,
Krzysztof

