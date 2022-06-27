Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 350EFC43334
	for <linux-gpio@archiver.kernel.org>; Mon, 27 Jun 2022 23:01:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240815AbiF0XBk (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 27 Jun 2022 19:01:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234525AbiF0XBj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jun 2022 19:01:39 -0400
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A05042181F;
        Mon, 27 Jun 2022 16:01:38 -0700 (PDT)
Received: by mail-io1-f45.google.com with SMTP id v185so4514667ioe.11;
        Mon, 27 Jun 2022 16:01:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lpKVkKBL4hwLuytBAWCH0H+6GlA+1TbJjzhCMr6KhnM=;
        b=lzdi83S3S4/QG7FhftVoLiTLGSBQ1e+UXpbTMmwmEhCdMLaW3jK+YnrrXvSs2AIlY7
         lix4wjWVKrjeP50bYSpchu9tEE5YIcJOXa76ARYdlf2SXtevfJoqBbZmNKSc2LzsngzG
         WYr9hVySIX+0x+RXkoYGV9UJR4D85NDzG3SM567AzU/XFIlsses/LDBUK1Han2EEgDt9
         HcPYvnGCJXfobEJ+EBqpVeH/UHRG1CNVsAE+zoDNKGqz5G7u76tyup/S4WFOM3dT7Bwg
         hFoc45ZsL/o4F5y3iuTS0YuiJ0AmFzI8220g0VFVV8eqeC4gz7zqrUe1rwJwsVT5PJiE
         tpfA==
X-Gm-Message-State: AJIora8hbDbI1kio1X3oUrftHbcpI/toM+rI1d5vin4F8TiRkUQKd7FH
        CixBTbI9M/y2kAGlhyi0dQ==
X-Google-Smtp-Source: AGRyM1uUa0kp3OfL68WByh4IyIlz4b3QFVxaqq9Gx50PlJoCdCTSX+FQZUt6SvBeTf2wJ14yT6pdCg==
X-Received: by 2002:a05:6638:210e:b0:33c:953d:5676 with SMTP id n14-20020a056638210e00b0033c953d5676mr5128147jaj.196.1656370897954;
        Mon, 27 Jun 2022 16:01:37 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id f11-20020a02a80b000000b0033c14d2386bsm3428569jaj.75.2022.06.27.16.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 16:01:37 -0700 (PDT)
Received: (nullmailer pid 3128662 invoked by uid 1000);
        Mon, 27 Jun 2022 23:01:35 -0000
Date:   Mon, 27 Jun 2022 17:01:35 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>, git@xilinx.com,
        Michal Simek <michal.simek@xilinx.com>,
        saikrishna12468@gmail.com, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH 2/4] dt-bindings: pinctrl-zynqmp: Add output-enable
 configuration
Message-ID: <20220627230135.GA3128629-robh@kernel.org>
References: <1655462819-28801-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <1655462819-28801-3-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1655462819-28801-3-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 17 Jun 2022 16:16:57 +0530, Sai Krishna Potthuri wrote:
> Add 'output-enable' configuration parameter to the properties list.
> 
> Signed-off-by: Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
> ---
>  .../devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml      | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
