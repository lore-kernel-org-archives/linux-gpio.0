Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD46FC433FE
	for <linux-gpio@archiver.kernel.org>; Thu, 13 Oct 2022 19:50:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbiJMTuG (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 13 Oct 2022 15:50:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbiJMTuF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Oct 2022 15:50:05 -0400
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2ED03AE40;
        Thu, 13 Oct 2022 12:50:03 -0700 (PDT)
Received: by mail-oi1-f181.google.com with SMTP id g10so2871357oif.10;
        Thu, 13 Oct 2022 12:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZvNjVbW4zowPy3Z/cAsr56lUs0ewtVKh94UUwuwhmA=;
        b=zXuCWNUzjKY5lXlQfE4wGOP5C0Hc0hpRZNhJ392roq/K8ZP0wot0VsWv3q1Rup3OS8
         XsNVtaAwtrO2ivaTYernMmAePHe5x4h3aukZVmejbgVCfFrv2KLjTelZvm4VZNHXr45L
         BuEPQop+EvCrcsPKevgD2SmdptjjECG5eaymNcbs2e0rIQ+3IbTFxMPgPOJEIfl2JKfh
         3tlbbyD/Jaj544gqH4ozALq9+zQor6ep7kJMe07Fv4ks2oQxKfV57JEkHivWD2E7q69/
         oR4IAKnPaBk4GSxBhf3s2J+mEJcbchknvdxpvLVCXKqynlFZj5srrZJ0m3Ks4g3qoRuU
         dYnw==
X-Gm-Message-State: ACrzQf3E5dgcuE+jndXqRyylGx2atqO2IbkUWwH7AdJnJ3S0eaHRL7J7
        K+R9y1C3NhOlDkKedIDdpQ==
X-Google-Smtp-Source: AMsMyM55LbRP2E0YJcAZc7Ufq9gCBsA12TsQGbf58KBfsqxY0ISPmjy8+9HI4HKCzOMeF8uSp7WLww==
X-Received: by 2002:a05:6808:1208:b0:351:9ff:795f with SMTP id a8-20020a056808120800b0035109ff795fmr703115oil.231.1665690603233;
        Thu, 13 Oct 2022 12:50:03 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bb18-20020a056808169200b00354d732ed87sm234339oib.36.2022.10.13.12.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 12:50:02 -0700 (PDT)
Received: (nullmailer pid 150868 invoked by uid 1000);
        Thu, 13 Oct 2022 19:50:03 -0000
Date:   Thu, 13 Oct 2022 14:50:03 -0500
From:   Rob Herring <robh@kernel.org>
To:     Chunyan Zhang <zhang.lyra@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Cixi Geng <cixi.geng1@unisoc.com>, linux-gpio@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH V3 2/3] dt-bindings: gpio: Convert Unisoc EIC controller
 binding to yaml
Message-ID: <166569060298.150817.4539198070843655655.robh@kernel.org>
References: <20221010053338.22580-1-zhang.lyra@gmail.com>
 <20221010053338.22580-3-zhang.lyra@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221010053338.22580-3-zhang.lyra@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 10 Oct 2022 13:33:37 +0800, Chunyan Zhang wrote:
> From: Chunyan Zhang <chunyan.zhang@unisoc.com>
> 
> Convert the Unisoc EIC controller binding to DT schema format.
> Update the maxItems of 'reg' property, since the current gpio-eic-sprd
> driver supports 3 reg items. Also removed a few similar examples.
> 
> Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
> ---
>  .../bindings/gpio/gpio-eic-sprd.txt           |  97 -----------------
>  .../bindings/gpio/sprd,gpio-eic.yaml          | 103 ++++++++++++++++++
>  2 files changed, 103 insertions(+), 97 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-eic-sprd.txt
>  create mode 100644 Documentation/devicetree/bindings/gpio/sprd,gpio-eic.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
