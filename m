Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B99C433E0
	for <linux-gpio@archiver.kernel.org>; Sat, 13 Feb 2021 10:22:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB5A164DB1
	for <linux-gpio@archiver.kernel.org>; Sat, 13 Feb 2021 10:22:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbhBMKWC (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sat, 13 Feb 2021 05:22:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:44310 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229775AbhBMKVT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 13 Feb 2021 05:21:19 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2FFD364DEB;
        Sat, 13 Feb 2021 10:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1613211633;
        bh=iOW7kDW6aYzoAq4c6WkgPgMclHLiOOlKEEtknn6ZDD8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IGqeuOPTO01u08cdeiuNNPhN9pN/QLmJej2DNHfpTQ+gYu3ox4+yKsXPZJwfVvmOj
         vJ1/eyA3EWT/fxFBVbOZmGQBedSLc/F4Fm7Empj9qwVA/Hh8wPrg01z7QdYcS+3Zgs
         4M6OTvPujx6AVWrYjnBDxTw9+isU37pAG4B/zqlQ=
Date:   Sat, 13 Feb 2021 11:20:30 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     linux-kernel@vger.kernel.org, rafael@kernel.org,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, frowand.list@gmail.com,
        pantelis.antoniou@konsulko.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [RFC PATCH 09/12] drivers: base: reintroduce find_bus()
Message-ID: <YCen7uHqFJQ/U/5p@kroah.com>
References: <20210208222203.22335-1-info@metux.net>
 <20210208222203.22335-10-info@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210208222203.22335-10-info@metux.net>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 08, 2021 at 11:22:00PM +0100, Enrico Weigelt, metux IT consult wrote:
> ---
>  drivers/base/bus.c         | 14 ++++++++++----
>  include/linux/device/bus.h |  2 ++
>  2 files changed, 12 insertions(+), 4 deletions(-)

Um, no.
