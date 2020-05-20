Return-Path: <SRS0=is5H=7C=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4974FC433E0
	for <linux-gpio@archiver.kernel.org>; Wed, 20 May 2020 08:51:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 14652207ED
	for <linux-gpio@archiver.kernel.org>; Wed, 20 May 2020 08:51:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N2PxVTmq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726688AbgETIvq (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 20 May 2020 04:51:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726224AbgETIvq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 May 2020 04:51:46 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B490C061A0F
        for <linux-gpio@vger.kernel.org>; Wed, 20 May 2020 01:51:46 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id j5so2316574wrq.2
        for <linux-gpio@vger.kernel.org>; Wed, 20 May 2020 01:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=RfZdfcc2DeqiyN9D4GMHPVwfFuLz1SqPHKWyIxBlRQE=;
        b=N2PxVTmqc0PIilXf0tfgDq12qP6BuoYEi5jE083XOptOZ4MHgfU8BkVb4Grwgl4NIn
         fBU6HygqUt0Y7EayYWPUa2VQAXhsfWczsuBjBeatxRBzQqZ4c809mi0qNqhqXbfgz2cs
         6VkUVcngrKD1QpnKRDvaJyLXNS9LuPKXZsoKRGOPFkFO/fGiLaNKuvdP/ygjFmYfSi+W
         MPXTMQf5CjoEoYddICmiqJZRujH6+tgZCw/lQSvnA5ravJ9Xb/OJqU0cjm5bOqbn4ySD
         ytarfMarVW50RynUWKK0VjneG9HpAqs2QYT0NEXaq9tLXm+rrE68QzFKDAQdDnxD3+vN
         FMKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=RfZdfcc2DeqiyN9D4GMHPVwfFuLz1SqPHKWyIxBlRQE=;
        b=ejYFXDajE/qJ2a9FcBg2VHDxr17KjLQP2Q0d7+m4PdwjKzqe8sUHgaT8YCjy+Gbdae
         qR790b6NUps4SlH5SbGMZ5sXopVV5u8JveyNKCOso6eKpa9gYimFi8yHnTvcwuB/lnT0
         6UjCKrdvWoANcGBclxTYbg5hrhRBhp4aNlhYXFsXKI1PY4yZzJR/xRx1dicwHjX77Utp
         OnnrSWI6GpOIv95tEIEGJThk5dRb7UlSo0o0Rx3x1fM18pZIDXbUnbCsfyj7/C4jeqqR
         75OwmAuy0Hn93oQzdGIa8Ror1WB4WcwKYXJCzaCCP1WAYYsUAheDvPI6JzBSr6TS7Wj1
         Te9g==
X-Gm-Message-State: AOAM5307o8mlJnJE6azgOkO7p21k2mGNQttlGTT1e/IE2bHiPBg8X13d
        BPwMGn+C8lEM4quVfCWlYIP2DA==
X-Google-Smtp-Source: ABdhPJy7vTQHZlsjHOUjjA1fY46F7xY4npimGLDwSi4Dq1QjAtAOE3tBVQxTxOSuaD03VnTeasE/QA==
X-Received: by 2002:adf:ee87:: with SMTP id b7mr3292204wro.104.1589964704775;
        Wed, 20 May 2020 01:51:44 -0700 (PDT)
Received: from dell ([95.149.164.102])
        by smtp.gmail.com with ESMTPSA id l9sm984089wrv.32.2020.05.20.01.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 01:51:44 -0700 (PDT)
Date:   Wed, 20 May 2020 09:51:42 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Benjamin Gaignard <benjamin.gaignard@st.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.co, alexandre.torgue@st.com,
        linus.walleij@linaro.org, amelie.delaunay@st.com,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: mfd: Convert stmfx bindings to
 json-schema
Message-ID: <20200520085142.GD271301@dell>
References: <20200220162246.8334-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200220162246.8334-1-benjamin.gaignard@st.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 20 Feb 2020, Benjamin Gaignard wrote:

> Convert stmfx bindings to json-schema
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  .../devicetree/bindings/mfd/st,stmfx.yaml          | 124 +++++++++++++++++++++
>  Documentation/devicetree/bindings/mfd/stmfx.txt    |  28 -----

>  .../devicetree/bindings/pinctrl/pinctrl-stmfx.txt  | 116 -------------------

Linus, anything from you?

>  3 files changed, 124 insertions(+), 144 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/st,stmfx.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mfd/stmfx.txt
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-stmfx.txt

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
