Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF22C4708F
	for <linux-gpio@archiver.kernel.org>; Wed,  2 Jun 2021 19:05:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 73D8E613E7
	for <linux-gpio@archiver.kernel.org>; Wed,  2 Jun 2021 19:05:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbhFBTHC (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 2 Jun 2021 15:07:02 -0400
Received: from mail-ot1-f49.google.com ([209.85.210.49]:39827 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbhFBTGv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Jun 2021 15:06:51 -0400
Received: by mail-ot1-f49.google.com with SMTP id 5-20020a9d01050000b02903c700c45721so2355754otu.6;
        Wed, 02 Jun 2021 12:05:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XTd1+1XMqhMrHa7fM4NJ/msyMW1m4BDVtFV2Bk70Qcw=;
        b=Kw+qqR90/oVpM+P3tmO+CRywahen2i6NtAoqtrYITAp9FFdx+mOmuQtE3gZVtnePDz
         tB7+sHFpZvRQQVXF+zoXgeNaCYZoad+331IJ82UOVwigg/0H/ClaRbtyWq/v85mrwZkH
         NDVty8Ykrp+LD0gEI6fQe3Jkl+f1i0oIa/1Ip2XdZz7jkQHMAZETVp8kURNa+of6hWN8
         az1wb2fSsFPc5kDs1O8ulghGn9IUjZMGOpzKNAkNBfxo38t3fCDywdo2ZoW/bxHkP2No
         SoHH6yxoT3CX4+y2TnH5RcwtMZeGEl4y1lN457UeM6Ftm+ibipL7n3ujNhRoCsskw84w
         cU3Q==
X-Gm-Message-State: AOAM5313DOgARKazfb0MHBvc6KHCVt8GQj4QgjfauGZxvCeWhtMv7ePv
        DBofdBTNbN2wh8f2oCFl8w==
X-Google-Smtp-Source: ABdhPJyNxmMkB4xFVEH+C+raEBK7tJthMajdTd255TExpMg2W/cjtnPqK8qbho/BRBUxNAtNtiWyDg==
X-Received: by 2002:a05:6830:905:: with SMTP id v5mr26832227ott.214.1622660707200;
        Wed, 02 Jun 2021 12:05:07 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x65sm176359otb.59.2021.06.02.12.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 12:05:06 -0700 (PDT)
Received: (nullmailer pid 3790704 invoked by uid 1000);
        Wed, 02 Jun 2021 19:05:05 -0000
Date:   Wed, 2 Jun 2021 14:05:05 -0500
From:   Rob Herring <robh@kernel.org>
To:     Aswath Govindraju <a-govindraju@ti.com>
Cc:     Sekhar Nori <nsekhar@ti.com>, linux-gpio@vger.kernel.org,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Rob Herring <robh+dt@kernel.org>, Keerthy <j-keerthy@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        David Lechner <david@lechnology.com>,
        linux-kernel@vger.kernel.org,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH v3 2/2] dt-bindings: gpio: gpio-davinci: Convert to
 json-schema
Message-ID: <20210602190505.GA3790655@robh.at.kernel.org>
References: <20210524151955.8008-1-a-govindraju@ti.com>
 <20210524151955.8008-3-a-govindraju@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210524151955.8008-3-a-govindraju@ti.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 24 May 2021 20:49:54 +0530, Aswath Govindraju wrote:
> Convert gpio-davinci dt-binding documentation from txt to yaml format.
> 
> Signed-off-by: Aswath Govindraju <a-govindraju@ti.com>
> ---
>  .../devicetree/bindings/gpio/gpio-davinci.txt | 167 ----------------
>  .../bindings/gpio/gpio-davinci.yaml           | 186 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 187 insertions(+), 168 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-davinci.txt
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-davinci.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
