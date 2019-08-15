Return-Path: <SRS0=dqG7=WL=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 597EBC3A589
	for <linux-gpio@archiver.kernel.org>; Thu, 15 Aug 2019 18:16:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 234332086C
	for <linux-gpio@archiver.kernel.org>; Thu, 15 Aug 2019 18:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565892977;
	bh=WyTD5HUwsPXRsvpVUmb4nWNvdp0pXgPLILgtTn453Sg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=1vVWpsAk5uvbsKrfOkPNsNMQt1RI5BXuQTNpBC+bWfuuRmLRaiG1VpFpIwFl6APYa
	 RFrdftvoZR+80rsrJuYpwE8LgSAsxNuOttiA30tp0p/YWsfgOzrfhEX29+9Dn9HZZx
	 SxjnW6ZYi3L4byl55+oFprTY9dpMNqxawSHGO4/g=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732381AbfHOSQQ (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 15 Aug 2019 14:16:16 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40116 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726001AbfHOSQQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Aug 2019 14:16:16 -0400
Received: by mail-wm1-f65.google.com with SMTP id v19so2009640wmj.5;
        Thu, 15 Aug 2019 11:16:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=j/uimJg+O6SijUYzhLFT7/gbnIejb3KfXF48Pa4SOJ4=;
        b=bizN/MZr5+4uebhfhfXVJkOcaGxnSdNb8i0kOyOLUOlam4vX9xRxHY0khlepr/oSv1
         6koYsVK+LuY2ZSyXmkVEYH8AmxX2SFUZFdnBJdjLvOA8BlERrTFmzLWj89wP9Wlb5hjn
         2IG5R6uqA53ZI6gE64Reo7yEfUzKQ0aQQ426Ge154oO1GyuX8xAdzUqZgahBKu79aSyj
         rc9fvAzgSPgPZpiO+NXwPRMpbftISxwfSDM700x86D16NDeMLDGvC/8nlVCDJPfXET88
         Il/VKbF51Wj3qbDL/AHMeL3JyEkajGZeeMktrj7hmS4avIMgswn2HXmHpTvlVPixfeys
         0SdA==
X-Gm-Message-State: APjAAAWz4UTfM0bpO74mxIjbCXVlh8lE5+GQoUDF7FZL1y+TajmUOcLJ
        cUbESPSdsmArkJeR+p1h8P4=
X-Google-Smtp-Source: APXvYqyNO1pzYsJNJHBIxyOo0AgrtnpByKQS31ntMRjNZSVwifIZNdbtMHJJwiSMW+wbjQfY1Mtrmw==
X-Received: by 2002:a1c:f101:: with SMTP id p1mr3876277wmh.62.1565892974825;
        Thu, 15 Aug 2019 11:16:14 -0700 (PDT)
Received: from kozik-lap ([194.230.155.124])
        by smtp.googlemail.com with ESMTPSA id n12sm1688814wmc.24.2019.08.15.11.16.13
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Aug 2019 11:16:14 -0700 (PDT)
Date:   Thu, 15 Aug 2019 20:16:12 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kukjin Kim <kgene@kernel.org>,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH] ARM: plat-samsung: Include GPIO driver header
Message-ID: <20190815181612.GA14360@kozik-lap>
References: <20190814075244.8726-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190814075244.8726-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 14, 2019 at 09:52:44AM +0200, Linus Walleij wrote:
> This file is using struct gpio_chip and needs to include
> <linux/gpio/driver.h> to get that.
> 
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: linux-samsung-soc@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Thanks, applied.

Best regards,
Krzysztof

