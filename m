Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D805C63798
	for <linux-gpio@archiver.kernel.org>; Tue, 24 Nov 2020 17:53:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C38B720679
	for <linux-gpio@archiver.kernel.org>; Tue, 24 Nov 2020 17:53:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="X2o/ZcxE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404202AbgKXRxM (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 24 Nov 2020 12:53:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404208AbgKXRxL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Nov 2020 12:53:11 -0500
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com [IPv6:2607:f8b0:4864:20::a43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8512C0613D6
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2020 09:53:11 -0800 (PST)
Received: by mail-vk1-xa43.google.com with SMTP id v185so1757021vkf.8
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2020 09:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mep5g3jd3Wcro6wz5b9PghU5nLpdZLWg1PGCxkgwp3w=;
        b=X2o/ZcxEs4KlhZZWqNX+HZCTnBf5x/L6fV9FDjTOY/GFMTeC+8Ky9wvb/Nf8OfWUWI
         hqlAD2iIwvxuYcsVOVzC23Hu6ysGeREOWXyQma6bRhUTAt9XN6W82Jrk4tDsydvNjL+p
         VHKttUI7lJMGgp4LeK0pDdNbUPOqLnMWglorA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mep5g3jd3Wcro6wz5b9PghU5nLpdZLWg1PGCxkgwp3w=;
        b=r1UNvV3Gq89wCHPVwjb68n7KCM90yypRLnTvDlU6o8HAfAj5LjM4ZYuFn1L7Ux+pkn
         qb2y8agTxhPyhG0gXeX+mVjobFxELxirtNhcXF2sjltP8ZTqooJu8tYE9oDEB5h29xgO
         2opuH70eJ0/g9GctFKVIBwIuWI5Fnm6z0BOoXeev8gh9gY37gqV1BTCCAZPctBVTsthH
         zKRkb3CoychKfb5yvLBALr5faJOZBz70hhgeigyntOfTHUkx8/bV7JnfFLA9MTQKv4V/
         9uDy+4fSU0xXU2hpwlbOiTRzkCWNe4b24napwjN33CANFT+cy5cggVFs/t1GvY7g1UBi
         twNg==
X-Gm-Message-State: AOAM531cjc39vAF9tKXa6wXdLOLEdREbbs4zLtRkHDCy29ifiGgekB6p
        9z6s6CHhtvbBrxTOz8sW5IJHUE84FAfInQ==
X-Google-Smtp-Source: ABdhPJwF4ZsB1CDguY4o8zGY7pO4SxjeaYL7jjOGwq5VJmP+gbqsqkzHZmli1oNsh8s76Jr1Vjq/0w==
X-Received: by 2002:ac5:cc66:: with SMTP id w6mr5126742vkm.8.1606240390803;
        Tue, 24 Nov 2020 09:53:10 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 36sm1666501uaq.9.2020.11.24.09.53.10
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2020 09:53:10 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id u24so11525562vsl.9
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2020 09:53:10 -0800 (PST)
X-Received: by 2002:a05:6102:309a:: with SMTP id l26mr4989655vsb.4.1606239971784;
 Tue, 24 Nov 2020 09:46:11 -0800 (PST)
MIME-Version: 1.0
References: <20201123160139.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
 <CACRpkdamdXCqZa4=qb5MsJtQMw1v53z5HZVv5SHJv84dtVACqQ@mail.gmail.com>
 <CAD=FV=W9+Wa=0d-Y+kxhqsRVM4TOofTC-C519cLkYOsLSBRZ4A@mail.gmail.com> <603c691f-3614-d87b-075a-0889e9ffc453@codeaurora.org>
In-Reply-To: <603c691f-3614-d87b-075a-0889e9ffc453@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 24 Nov 2020 09:46:00 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UdExXYaf3K6jbyr8tR3_NEib+BaYtxk1xQzS7-DuLC-g@mail.gmail.com>
Message-ID: <CAD=FV=UdExXYaf3K6jbyr8tR3_NEib+BaYtxk1xQzS7-DuLC-g@mail.gmail.com>
Subject: Re: [PATCH 1/3] irqchip: qcom-pdc: Fix phantom irq when changing
 between rising/falling
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Srinivas Ramana <sramana@codeaurora.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Tue, Nov 24, 2020 at 9:42 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> Hi Linus,
>
> +        * When we change types the PDC can give a phantom interrupt.
> +        * Clear it.  Specifically the phantom shows up if a line is already
> +        * high and we change to rising or if a line is already low and we
> +        * change to falling but let's be consistent and clear it always.
> +        *
>
> Can you please hold this change. I am checking with HW folks if above
> commented behaviour is expected/is valid case to set the irq type rising
> edge when the line is already high.
>
> Will keep posting update here.
>
> Thanks,
> Maulik

Thanks for the update.  I'm still going to post a v2 because I think
patch #1 in the series should land and it seems nice to keep them
together.  I'll add a note to the patch indicating your request to
wait for an ack before landing.

-Doug
