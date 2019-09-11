Return-Path: <SRS0=tTco=XG=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDFDBC49ED6
	for <linux-gpio@archiver.kernel.org>; Wed, 11 Sep 2019 10:19:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 85C4F207FC
	for <linux-gpio@archiver.kernel.org>; Wed, 11 Sep 2019 10:19:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gbl/3eu/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727513AbfIKKTl (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 11 Sep 2019 06:19:41 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:43748 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727432AbfIKKTl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Sep 2019 06:19:41 -0400
Received: by mail-lj1-f194.google.com with SMTP id d5so19435688lja.10
        for <linux-gpio@vger.kernel.org>; Wed, 11 Sep 2019 03:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y3147zBZhw/UX51VlglkVVRHJRKcmU6+Mh2CpbRNH1Q=;
        b=Gbl/3eu/vRbHPX5XNV0bq9/xamdbVPSy6srUKEYj9dLP0KlXQermQi/0BhYAMKVK7D
         FwgtjLbYFvTB8hOlFy9jp5ewb8DxvFcq0yCsfUb1lkbDFhkNrZ7s0gG6xY+dPT/avqnk
         JUQLntIlCF0fyPJUnyZGFpKXEH93uEKlGdEIXxUZPhVEEUI7frf2VgPkX8NK7YlfNlnF
         n212L19y0FiO12PVM/Lba/WgNePOhgz9m0dD2X/TkPlLYtR1qo1N2TPWq61wdn9LJAzR
         ip83lhH+KsS3/Mkt+AxXfhqt4Eayu16KARqRVKfChpoGPHxIpFIqswRIErt6af19j/LZ
         aaWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y3147zBZhw/UX51VlglkVVRHJRKcmU6+Mh2CpbRNH1Q=;
        b=ejoBll87JYM5fhZaDEgJBCsZD+nkJbohiR4qaPqMPmuD+0m+1OgX8yBJHgC5svC85M
         eEEKKx3fHOsgQPmsgreXuIs//aKz+Yd+7zuocriacpO2vPS+8+higZ7Q7he1CZBXG7xL
         pSvB7xhU75dyeHUOmKYNs1m909ZWDsUrhPK/I6l4GLE989R4cQF2GuzL+sMOFMkPN00F
         dscO43O4owCyQFiPGfqW99wakmT+L9oB3b4omq8RtPoItfojivs7bvLFnhXMxXUvGJdY
         zZoNx+o+NgNDgS2q46g1prqL4cJ5NCSTbuHH6SqUgwWLLGbG/w0gekBQD2OLFEVwcxD1
         LZUg==
X-Gm-Message-State: APjAAAVopqboqszHUXMkNWil4lU2aP3QEz9822rK7f44iiNiqRa+3FL5
        REPtvR5K7Tx43f+Ee3Xj1R6waWXvhibGWXITccJIFA==
X-Google-Smtp-Source: APXvYqzB5BVgv6AQnPfWAutofN/bDoNRjMTME5RBOuMqvBevxj/0paBL/L/Gw6RJVZRAhcMdHPv5ejElCDlE9+NqdtA=
X-Received: by 2002:a2e:654a:: with SMTP id z71mr22927335ljb.37.1568197178805;
 Wed, 11 Sep 2019 03:19:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190829181203.2660-1-ilina@codeaurora.org> <20190829181203.2660-10-ilina@codeaurora.org>
In-Reply-To: <20190829181203.2660-10-ilina@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Sep 2019 11:19:27 +0100
Message-ID: <CACRpkdbhNY8N=LMG6wwYw9bAnL4HmAqj8WMpsLsqvh8PvaQ52A@mail.gmail.com>
Subject: Re: [PATCH RFC 09/14] drivers: pinctrl: msm: fix use of deprecated
 gpiolib APIs
To:     Lina Iyer <ilina@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        mkshah@codeaurora.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 29, 2019 at 7:35 PM Lina Iyer <ilina@codeaurora.org> wrote:

> Replace gpiochip_irqchip_add() and gpiochip_set_chained_irqchip() calls
> by populating the gpio_irq_chip data structures instead.
>
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>

This is mostly fixed upstream I think, but:

> +       chip->irq.fwnode = pctrl->dev->fwnode;

This fwnode assignment is missing though.

Sorry for the constant churn and required rebasing...

Yours,
Linus Walleij
