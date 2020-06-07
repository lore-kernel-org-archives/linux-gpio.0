Return-Path: <SRS0=gNEi=7U=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B6EEC433E0
	for <linux-gpio@archiver.kernel.org>; Sun,  7 Jun 2020 17:37:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 260EB2073B
	for <linux-gpio@archiver.kernel.org>; Sun,  7 Jun 2020 17:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1591551459;
	bh=oOcO01//CS9tnM/XneW+fePb34efXa3hMnQnSIfmcHg=;
	h=Date:From:To:To:To:Cc:Cc:Cc:Subject:In-Reply-To:References:
	 List-ID:From;
	b=0PEmPzl5oMh23qVQA9CxH01RJQVJHALIAqxpmdlubF1QklOORiS8MgZB9VF119XHE
	 kC8Ku7foaalEUBIve++SMwR9YnJjMJNqIcJgV2001PK+NN6C9X9ykVAPC8fhXa1uEh
	 JsC/jet4NC88ydO+7ORL2InTcR0AXMVH4+rvLRTQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbgFGRhi (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sun, 7 Jun 2020 13:37:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:59858 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726683AbgFGRhi (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 7 Jun 2020 13:37:38 -0400
Received: from localhost (unknown [137.135.114.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B1F2020659;
        Sun,  7 Jun 2020 17:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591551457;
        bh=oOcO01//CS9tnM/XneW+fePb34efXa3hMnQnSIfmcHg=;
        h=Date:From:To:To:To:Cc:Cc:Cc:Subject:In-Reply-To:References:From;
        b=PSYu6HB9e1NkMK+H3x4AMinaVoPBLsmfKi8Iouu2nTCb9Kq2QEr1YbnSqsq7r2lw+
         zcmn+wPT00thBdUG+yIJc8j8wCtRjTr3czeDCmOFgx18TzH5NeC/x8rPBVzqyduQtE
         MCQ8L/ESu77s5dMup0j6EYiW89uHNV3X9ocm9nfc=
Date:   Sun, 07 Jun 2020 17:37:36 +0000
From:   Sasha Levin <sashal@kernel.org>
To:     Sasha Levin <sashal@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-gpio@vger.kernel.org
Cc:     stable@vger.kernel.org
Cc:     stable@vger.kernel.org
Subject: Re: [PATCH v2] pinctrl: baytrail: Fix pin being driven low for a while on gpiod_get(..., GPIOD_OUT_HIGH)
In-Reply-To: <20200606093150.32882-1-hdegoede@redhat.com>
References: <20200606093150.32882-1-hdegoede@redhat.com>
Message-Id: <20200607173737.B1F2020659@mail.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi

[This is an automated email]

This commit has been processed because it contains a "Fixes:" tag
fixing commit: 86e3ef812fe3 ("pinctrl: baytrail: Update gpio chip operations").

The bot has tested the following trees: v5.6.16, v5.4.44, v4.19.126, v4.14.183, v4.9.226.

v5.6.16: Build OK!
v5.4.44: Failed to apply! Possible dependencies:
    e2b74419e5cc ("pinctrl: baytrail: Replace WARN with dev_info_once when setting direct-irq pin to output")

v4.19.126: Failed to apply! Possible dependencies:
    e2b74419e5cc ("pinctrl: baytrail: Replace WARN with dev_info_once when setting direct-irq pin to output")

v4.14.183: Failed to apply! Possible dependencies:
    e2b74419e5cc ("pinctrl: baytrail: Replace WARN with dev_info_once when setting direct-irq pin to output")

v4.9.226: Failed to apply! Possible dependencies:
    e2b74419e5cc ("pinctrl: baytrail: Replace WARN with dev_info_once when setting direct-irq pin to output")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

-- 
Thanks
Sasha
