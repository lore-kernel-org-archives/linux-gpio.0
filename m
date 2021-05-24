Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72289C47084
	for <linux-gpio@archiver.kernel.org>; Mon, 24 May 2021 16:30:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D9A3613FC
	for <linux-gpio@archiver.kernel.org>; Mon, 24 May 2021 16:30:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233594AbhEXQbx (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 24 May 2021 12:31:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232906AbhEXQbi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 May 2021 12:31:38 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1CFAC06138A
        for <linux-gpio@vger.kernel.org>; Mon, 24 May 2021 09:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=pchEXEUChsu5CYTn4xZRpNNPneD54VujTXFqYqCaiqE=; b=n501uAf3fG+LKv07+PB/fuANho
        fjkEFCyx7rOsbBOM9pJ4b4fuKlOGx72/INcF+sdiTdyGwW/2PoJHAgZDSS8MzB/Ql5bwYZxnLvkWC
        DwfW6sDbS13NW8WWBSbSZqRVUAZzt1OtrcLkUyoXLEi/Z4+cOTuCX9XxM3Xdnk5dt8poOJiaHEajg
        wkOF/3puNdCwAymwTAMk2HHavvoznzzXn+hRhRxayW0pZenJ2c01KyJr3Hei1bjpBX1pHPL36p0z5
        PYdpePWrAifZXlv4YFq1lxeVOokFhwczKDEbSBk4bzUL3QOsH9a4pU/jWKwFbv9XfPQufRDC+kj2q
        QcZUC0Uw==;
Received: from 164-105-191-90.dyn.estpak.ee ([90.191.105.164] helo=ubuntu)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <sandberg@mailfence.com>)
        id 1llDSP-0005m8-RJ; Mon, 24 May 2021 19:29:34 +0300
Received: by ubuntu (sSMTP sendmail emulation); Mon, 24 May 2021 19:29:29 +0300
From:   Mauri Sandberg <sandberg@mailfence.com>
To:     linux-gpio@vger.kernel.org
Cc:     bgolaszewski@baylibre.com
Subject: RESEND PATCH v3
Date:   Mon, 24 May 2021 19:29:04 +0300
Message-Id: <20210524162906.30784-1-sandberg@mailfence.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210325122832.119147-1-sandberg@mailfence.com>
References: <20210325122832.119147-1-sandberg@mailfence.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 90.191.105.164
X-SA-Exim-Mail-From: sandberg@mailfence.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

For some reason Bart did not get the patches with the previous email. So
resending.

-- Mauri


