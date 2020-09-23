Return-Path: <SRS0=iP7n=DA=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1FD8C2D0A8
	for <linux-gpio@archiver.kernel.org>; Wed, 23 Sep 2020 21:09:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 42D9F2388A
	for <linux-gpio@archiver.kernel.org>; Wed, 23 Sep 2020 21:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600895347;
	bh=ew/mn1sT/8E6GD2A0Rse/6kQ2lZo0ubqKPSfsjcxmvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=X6ho8NgRmiwxjUqYV0oekVPQTPDksRJVG6V52/JNO4mgwaYLiqRAj2rlqdkc9E3dc
	 uIqdU2SJoEmQgg7C5Anoqt1coi5yekgerijdZYFQ03mYDDSZffx6ymUV3vIUKIaoeX
	 ndTmpm7mGhmVxYm6Bz8DG6Q1t//FJ44AC5aeFmsI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726732AbgIWVJG (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 23 Sep 2020 17:09:06 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:43524 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726562AbgIWVJG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Sep 2020 17:09:06 -0400
Received: by mail-io1-f65.google.com with SMTP id z25so983796iol.10;
        Wed, 23 Sep 2020 14:09:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ofc8Uf8vX6HYj+yzwCeK/wH2vGs3V2iAMN76I9foEns=;
        b=LyXcW2q9G9Eb9NWyqp2FZGn/FEHedA7aDzYbdQrJFVxIFRPy0Qu6Wmh9W7elr0P00M
         QqAEAz77a2cLrE0VCmieOR0ZLve9eRVWYKSwp6Z4YkBZwWAKn4DHZMywiPdai7Jbv6Y3
         4z821Eb6GE1MCd2lfMJbbDOEuUSlRGtHc/0ICc91RSVrcvHYg1xGtROdVNrozHPhMDgu
         pg1z+JKsgTXLB2TT7IMpncJBDRGB0bEe+kQfyiUrzgSeg9lIppLLqKrCkQhac1SKa/fp
         bomv5CXsnkZgm1bo9REYq1mg6qCWvEjIdXtlJmi5erx2c0PVRtN9NxVplCO6Ta3T1XCn
         WYCQ==
X-Gm-Message-State: AOAM530MSQuYymyBuaLaW7O8Bxp9EUTbo54jRjMwgF86FlK3IJR0GE0w
        nnBthYsRTPY7ww0Y97NBzQ==
X-Google-Smtp-Source: ABdhPJxgj8CW4iD2hYjlW12G1nxhLdqPEZWa0g4WQq69yvbC2eDAp4izySPBdQB232PZqOqPsrIyfA==
X-Received: by 2002:a6b:db1a:: with SMTP id t26mr1137187ioc.152.1600895345518;
        Wed, 23 Sep 2020 14:09:05 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id e14sm456086iow.16.2020.09.23.14.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 14:09:05 -0700 (PDT)
Received: (nullmailer pid 1314012 invoked by uid 1000);
        Wed, 23 Sep 2020 21:09:04 -0000
Date:   Wed, 23 Sep 2020 15:09:04 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     NXP Linux Team <linux-imx@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Stefan Agner <stefan@agner.ch>, linux-kernel@vger.kernel.org,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Anson Huang <Anson.Huang@nxp.com>
Subject: Re: [PATCH v3 4/4] dt-bindings: gpio: gpio-vf610: fix iMX 7ULP
 compatible matching
Message-ID: <20200923210904.GA1313958@bogus>
References: <20200920195848.27075-1-krzk@kernel.org>
 <20200920195848.27075-4-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200920195848.27075-4-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, 20 Sep 2020 21:58:48 +0200, Krzysztof Kozlowski wrote:
> The i.MX 7ULP DTSes use two compatibles so update the binding to fix
> dtbs_check warnings like:
> 
>   arch/arm/boot/dts/imx7ulp-com.dt.yaml: gpio@40ae0000:
>     compatible: ['fsl,imx7ulp-gpio', 'fsl,vf610-gpio'] is too long
> 
>   arch/arm/boot/dts/imx7ulp-com.dt.yaml: gpio@40ae0000:
>     compatible: Additional items are not allowed ('fsl,vf610-gpio' was unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v2:
> 1. None, split from previous patchset using common GPIO schema
> 
> Changes since v1:
> 1. New patch
> ---
>  Documentation/devicetree/bindings/gpio/gpio-vf610.yaml | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
