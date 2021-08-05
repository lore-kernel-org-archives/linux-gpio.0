Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FSL_HELO_FAKE,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50A99C4338F
	for <linux-gpio@archiver.kernel.org>; Thu,  5 Aug 2021 13:31:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3643F60F43
	for <linux-gpio@archiver.kernel.org>; Thu,  5 Aug 2021 13:31:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241075AbhHENbe (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 5 Aug 2021 09:31:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241044AbhHENbd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Aug 2021 09:31:33 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1195C061765
        for <linux-gpio@vger.kernel.org>; Thu,  5 Aug 2021 06:31:18 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id l4-20020a05600c1d04b02902506f89ad2dso5523403wms.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Aug 2021 06:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=zs+Z1KlvhHEW9OY5xJG2JR+/SH7cHwYmUg91uA47VDU=;
        b=Kl5dsNC2zDDGoySUkNYlbcc93SIM93mVI+ajJXWI2zMKUj/2ZYQhwx3nfvX6Kwvtm1
         qufZuTDcLFUI7vM0MuuwSeiSJcwtmmhMwyfKLSl/9wull3p7Fmc1SSYR5DYnA80lmdmU
         UPHtF1VW8pBRjLswW51iq+lVOFvyTluXAO5+kVms/dQ9bVImq0RBra/jCyqiartXxf7J
         YCuFIA2UiGGiOkhvCmOc8MAW9eLHnuNM6a4QZqYXPXwCX/bJIdKcH+IoTAzpeOqVSIAh
         4Gzq1SIOd9tjf4WHJ0vU3pzpQEocsISGfcIH9G4GzjQRsW2M3jMkviYgqvlXsrbTAPxp
         EgNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=zs+Z1KlvhHEW9OY5xJG2JR+/SH7cHwYmUg91uA47VDU=;
        b=VgH4ioadd2WnscUMvyKOXFyuri03eJMDzcp+joVJv73CxhzHxEqAQ230Odr/TKyYLX
         lSj5a/X6+EKVfE+h+g679y3TP9sDO6BLK02rjpji7KBzVUvZwSqlk1eBnJwwC7bTWqzS
         K+ctyZfcG30uvvmyPj+KUV71ZmkEeUoPxY874AkqwmPnUt6Gj8QK3T0+Sj/nLrXlcaa6
         UQV8pR+bHX05MbQ5qPsVQXb6nx1pkPmlYCHxbUlCLw1E9vpqw2c7eT5bj76l3vlr5OGj
         yS6v5jdHvGSm4IXbQp29nDRAOeyQ8/p4isX2GPA7RaDDxhPbQRjkX2l4k2LVS6C9LFZz
         AXTQ==
X-Gm-Message-State: AOAM5301ANeXkA63jAAufl2HKqj7H26JiDa1jx7ICzkujuLrSxB33QVJ
        8k8iC/i1t9l5h4MsMBs0Uc31yw==
X-Google-Smtp-Source: ABdhPJxHMBhwxopjuu/lU4IUKdR1Y2ZaCLba2PO1PDGFOr6TIPBGJXbymC1x8UIlVO6dIoZJUAK2EA==
X-Received: by 2002:a7b:c441:: with SMTP id l1mr5126255wmi.69.1628170277551;
        Thu, 05 Aug 2021 06:31:17 -0700 (PDT)
Received: from google.com ([109.180.115.228])
        by smtp.gmail.com with ESMTPSA id u23sm8921636wmc.24.2021.08.05.06.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 06:31:16 -0700 (PDT)
Date:   Thu, 5 Aug 2021 14:31:15 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/7] mfd: tqmx86: remove incorrect TQMx90UC board ID
Message-ID: <YQvoI74FeFiAHsae@google.com>
References: <cover.1626429286.git.matthias.schiffer@ew.tq-group.com>
 <5bb8c96ee6a755f18d82375927515ad504869b9e.1626429286.git.matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5bb8c96ee6a755f18d82375927515ad504869b9e.1626429286.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 16 Jul 2021, Matthias Schiffer wrote:

> No TQMx90UC exists at the moment, and it is undecided whether ID 10 will
> be used eventually (and if it is, how that SoM will be named).
> 
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> ---
> 
> v2: new patch
> v3: remove Fixes line
> 
>  drivers/mfd/tqmx86.c | 4 ----
>  1 file changed, 4 deletions(-)

For my own reference (apply this as-is to your sign-off block):

  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
