Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FSL_HELO_FAKE,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 280AAC4338F
	for <linux-gpio@archiver.kernel.org>; Mon, 16 Aug 2021 13:02:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0BC1E6328D
	for <linux-gpio@archiver.kernel.org>; Mon, 16 Aug 2021 13:02:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234035AbhHPNCm (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 16 Aug 2021 09:02:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbhHPNCk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Aug 2021 09:02:40 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E613C0613C1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Aug 2021 06:02:08 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id q11so23491465wrr.9
        for <linux-gpio@vger.kernel.org>; Mon, 16 Aug 2021 06:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=KPWJKOlPjeyDb3fAxtx2j5zqy1mEAS/aOviHwpLJkcw=;
        b=Uca2Z73AvdyZDUWygjav7haKMpo2uqKqIJSEdzOCgL5ZvJi1IYo9hDqMisZsn+DYUX
         OvhNwcIo4JyRpndvv/VIgwnBdgkGZf75RvUDw1Ambl9wOhYy52XL7k+XqBdCEf7DXqWA
         P2JYKMR2Ig8tL4bhV5hJrmdFZfUthlagIo4yC35Fg8BvYPzuP5qU+KtJ9uFJLEmfnWoC
         6FUcS8xriYqdwLb/vsUBR7vpm6p5wjjzTiFI0T5j7yFs8F5y1uerM9+J7Zakw+lMiqDP
         kXZhaszKkxr76yckcr3/YvEUmJzRRuryPXbdMhVP8hp1bROZZpw2DNz8IUxtlz2N+DEH
         PGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=KPWJKOlPjeyDb3fAxtx2j5zqy1mEAS/aOviHwpLJkcw=;
        b=DrsveLG3Q+aZyFjjihxZJMvBR2AAtCtJHuHTwCTNUlZhk/BzCqzAc9tEQ9UMW4/wou
         dvalcFNhbrgK7gjgSZcTwRMrmC3hxk3o3VgiYq3xJoLiZk/bMq+dvZR1G9WhokwMtrlW
         Y158T2X7COC2K7isudb9qTvz2zKBOnK5b+DvV4dHnrrrAql/ajMrczSC7KMWWXOWMFlF
         GNSK4a1i0W/27Eq4Io/d2SOXuv1WwNYYn7KTQ7hVnGv4/yv1NiTtJ6y489t7KDcC3rJm
         TwUOdiJayXjwsHNwHnPdQ528FbmhK8S0cco1rADQg0K4afnNMERYGMrkondW/e9ST5Ki
         4+sA==
X-Gm-Message-State: AOAM532cOVGd2vOEnjF9R2VIEW4RHq9syYbMJKBrJkXcA2doAEd+pIXo
        T+/pwYdUErtQaytD6mfhJtsf2Q==
X-Google-Smtp-Source: ABdhPJxSgWHeofgzUT5bmY8er3BPAleO269o7f3LswxczjcO/nrL+ntqLN/L386GSXtCXFgIcqZLuw==
X-Received: by 2002:a5d:688c:: with SMTP id h12mr18495280wru.313.1629118926997;
        Mon, 16 Aug 2021 06:02:06 -0700 (PDT)
Received: from google.com ([2.31.167.59])
        by smtp.gmail.com with ESMTPSA id i8sm10389918wma.7.2021.08.16.06.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 06:02:06 -0700 (PDT)
Date:   Mon, 16 Aug 2021 14:02:04 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/7] TQMx86: TQMx110EB and TQMxE40x MFD/GPIO support
Message-ID: <YRphzEn8T1HxE3I8@google.com>
References: <cover.1626429286.git.matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1626429286.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 16 Jul 2021, Matthias Schiffer wrote:

> v3:
> - Removed Fixes tag from patch 3 again
> 
> v2: 
> - A number of new patches (more hardware support and a few fixes)
> - Patches 1-3 have gained Fixes tags
> - Patch 2 depends on 1, so maybe we can push the GPIO patch through the
>   MFD tree to keep them together?
> - The change in patch 7 was somewhat controversial. I've added a
>   warning, but it is the last patch of the series, so it doesn't affect
>   the rest of the series if it is rejected.
> 
> Matthias Schiffer (7):
>   gpio: tqmx86: really make IRQ optional

>   mfd: tqmx86: clear GPIO IRQ resource when no IRQ is set
>   mfd: tqmx86: remove incorrect TQMx90UC board ID
>   mfd: tqmx86: fix typo in "platform"
>   mfd: tqmx86: add support for TQMx110EB and TQMxE40x
>   mfd: tqmx86: add support for TQ-Systems DMI IDs
>   mfd: tqmx86: assume 24MHz LPC clock for unknown boards

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
