Return-Path: <SRS0=WyK8=WB=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F6FC0650F
	for <linux-gpio@archiver.kernel.org>; Mon,  5 Aug 2019 09:43:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C369D20B1F
	for <linux-gpio@archiver.kernel.org>; Mon,  5 Aug 2019 09:43:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XhPLeDT+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727158AbfHEJny (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 5 Aug 2019 05:43:54 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:43904 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726880AbfHEJny (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Aug 2019 05:43:54 -0400
Received: by mail-lj1-f195.google.com with SMTP id y17so54182584ljk.10
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2019 02:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r7GWnzw8LLVSbBo+yy3iG6e6CAQ2PpDK741XOujQ55U=;
        b=XhPLeDT+zHhTq3wftYlI0u9/rfYrLAVXjYCV6goakFAT3jS5JWRrclcMa2aphQPWS0
         C2lpOSdbQPsTMaLdCZAHqmocQfbAQFoWlYwIbh+6NrbHsEDw6RNpepTxt4QE4bCzpXw/
         HNlNnF2xM/IfOIxDsPTn9ML6Ts8LZ+/YHaxnxc8lDX2NuOPsAGxsnr2eiPdE7/bGDb0/
         Mvj8pbZ8OyzaX1bR8vsKC5tFSR7L32bSWKz8PN7yga2kiqdnfSd6DpI7i5+dsP/w5Rry
         HhFamrqqBcevCU+nEZIPZmF3b+D1CjtQUJKeEDd2ne27oPgX8v6hlMxB0oUYosqMvmxk
         mgzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r7GWnzw8LLVSbBo+yy3iG6e6CAQ2PpDK741XOujQ55U=;
        b=JbaLzqyisy6aij1XKw4ZTjElzZH+KPqCcm2CSIasy1zLcOnwR386BQyTQPfOXx7U8j
         GbtcSTREWFaqUKUd790Tik7y1G4AIS2wnw0smxA2dEjwXfqXYx7zYbFGIjJkI7jrcaTr
         vwuThxtRp9Ud7Rk2uUf/QxOZdaZmspmJYMA5oZOBfqqtxVd1HshXLyaGAUrGMWfqpUDA
         OTdhSLhTT5JcLZp8KnW7wmC9MmhH38QJ4jl0AXhUrg4BGTtzaZDrCo5L0hq8aZsWkkyu
         Km39LB5/ygSZdtDilA7AFRfBPcdHWsaqJhmbdrr+u1MtD4BvsVWOYzQ2kHruo9Lohz40
         fo7g==
X-Gm-Message-State: APjAAAWgaSubjmyFz9asPcvomTRIVZrtf8NA7SZrF28ZIvGEVBgMwJXv
        vSFSxPq5htlIXEuI9odrMRNuVxGov2QmEf/CXXKd3v27
X-Google-Smtp-Source: APXvYqwLCOcsNHaxqsbSppRvlyOWSSW2VVINEPQ39TXSXONERUtwZ9rDOiykdKQHftCohXA0T3BVXvnOXryvW0Rw1FI=
X-Received: by 2002:a2e:8756:: with SMTP id q22mr79176242ljj.108.1564998232343;
 Mon, 05 Aug 2019 02:43:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190722090748.20807-1-ckeepax@opensource.cirrus.com> <20190722090748.20807-2-ckeepax@opensource.cirrus.com>
In-Reply-To: <20190722090748.20807-2-ckeepax@opensource.cirrus.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 11:43:41 +0200
Message-ID: <CACRpkdYQ8EZWADSeHg+Eh09MciXbJhYBfn_1pPnqzg_G=yHfiw@mail.gmail.com>
Subject: Re: [PATCH 2/4] gpio: madera: Use local copy of pdata
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 22, 2019 at 11:07 AM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:

> A local copy of the pdata exists and it should be used rather than
> pulling a fresh copy.
>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Patch applied.

Yours,
Linus Walleij
