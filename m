Return-Path: <SRS0=ed2u=6P=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7371DC47254
	for <linux-gpio@archiver.kernel.org>; Fri,  1 May 2020 02:55:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 540682173E
	for <linux-gpio@archiver.kernel.org>; Fri,  1 May 2020 02:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588301727;
	bh=X+82tkD7WS4gLNRptPoKjKKckxOGDbUV7V0NwCSyCsc=;
	h=Date:From:To:To:To:Cc:Cc:Cc:Subject:In-Reply-To:References:
	 List-ID:From;
	b=c5F+WHr9Dn8SyHZDzxHo0cN8JH2Pa7acAHHNQ9X8tThlu7fLO+TIT+utWJWdIKmXq
	 iZK0MIIxR5WIbktDVkjLINhR23ttHjSIAcNySOu9sPyLXLjSw8LjYUth5Tw/GvQ3re
	 apGnedUr1oCcYyyfV77zCmPm4CglBjt1KOwFH6Yw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728178AbgEACz1 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 30 Apr 2020 22:55:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:60364 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728173AbgEACz0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 30 Apr 2020 22:55:26 -0400
Received: from localhost (unknown [137.135.114.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 118952137B;
        Fri,  1 May 2020 02:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588301726;
        bh=X+82tkD7WS4gLNRptPoKjKKckxOGDbUV7V0NwCSyCsc=;
        h=Date:From:To:To:To:Cc:Cc:Cc:Subject:In-Reply-To:References:From;
        b=ETTuYkx7aBvHfFXrBHIbnbmz56LE7hL+c8pGJ1ZEdr3pcnb/YcMCDEXbIaqt+8rDa
         7ikH2Yrp4osEVzI0AqhvjIxs6sZeQX4ijQySUr9XsDzKRW56QKlsl+DQqA4xl8RcwT
         CUU69XrIf0xQai28xeCU/dIqNmrRN4vcVrXDf3L0=
Date:   Fri, 01 May 2020 02:55:24 +0000
From:   Sasha Levin <sashal@kernel.org>
To:     Sasha Levin <sashal@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-gpio@vger.kernel.org
Cc:     stable@vger.kernel.org
Cc:     stable@vger.kernel.org
Subject: Re: [PATCH] pinctrl: cherryview: Ensure _REG(ACPI_ADR_SPACE_GPIO, 1) gets called
In-Reply-To: <20200429104651.63643-1-hdegoede@redhat.com>
References: <20200429104651.63643-1-hdegoede@redhat.com>
Message-Id: <20200501025526.118952137B@mail.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi

[This is an automated email]

This commit has been processed because it contains a -stable tag.
The stable tag indicates that it's relevant for the following trees: all

The bot has tested the following trees: v5.6.7, v5.4.35, v4.19.118, v4.14.177, v4.9.220, v4.4.220.

v5.6.7: Build OK!
v5.4.35: Build OK!
v4.19.118: Build OK!
v4.14.177: Build OK!
v4.9.220: Failed to apply! Possible dependencies:
    a0b028597d59 ("pinctrl: cherryview: Add support for GMMR GPIO opregion")

v4.4.220: Build OK!

NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

-- 
Thanks
Sasha
