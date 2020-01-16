Return-Path: <SRS0=pjQz=3F=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D615AC33CB3
	for <linux-gpio@archiver.kernel.org>; Thu, 16 Jan 2020 17:43:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A72D424741
	for <linux-gpio@archiver.kernel.org>; Thu, 16 Jan 2020 17:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579196633;
	bh=7fTI8hxW9dwg7fhTHSQjLr4YTp2ez/T5X8liCvd7LcM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=HWRQW+9i3x65377mzgy1INwxb1XQxFiQI1lYRAydzrA3HKEl/+tUWLdDNrmyFDaxC
	 a75XUn5ss4HpD1gbwjdMw3JYUTRYfvbUdrp5OGxO6eRDw2G7dQQdUwz73dNKYQHb0C
	 uSF0IPTkiW/PlCDb3uFTTwD37AziRnuZ3caBN6AA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394013AbgAPRnv (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 16 Jan 2020 12:43:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:34340 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394009AbgAPRnv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Jan 2020 12:43:51 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9BD8E2473E;
        Thu, 16 Jan 2020 17:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579196630;
        bh=7fTI8hxW9dwg7fhTHSQjLr4YTp2ez/T5X8liCvd7LcM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SOKjCi78kxcX8i1NTJ2k/P5F7JdZtNgJohmPQAx40501dyIwsPPZft4W43NnkStMG
         D6WEccnxTEquQOrAvhYnQ7qa8A4fnQvy6iIb7T7Zq7nTkTjN9PKorqjlVjnXIuzYno
         +M966pTCLwUEHzkX1Euz71klIzHE9gLxWECPywE0=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Sasha Levin <sashal@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 044/174] pinctrl: sh-pfc: sh73a0: Fix fsic_spdif pin groups
Date:   Thu, 16 Jan 2020 12:40:41 -0500
Message-Id: <20200116174251.24326-44-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116174251.24326-1-sashal@kernel.org>
References: <20200116174251.24326-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Geert Uytterhoeven <geert+renesas@glider.be>

[ Upstream commit 0e6e448bdcf896d001a289a6112a704542d51516 ]

There are two pin groups for the FSIC SPDIF signal, but the FSIC pin
group array lists only one, and it refers to a nonexistent group.

Fixes: 2ecd4154c906b7d6 ("sh-pfc: sh73a0: Add FSI pin groups and functions")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/sh-pfc/pfc-sh73a0.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-sh73a0.c b/drivers/pinctrl/sh-pfc/pfc-sh73a0.c
index ea5da5dcad2c..b173bd759ee1 100644
--- a/drivers/pinctrl/sh-pfc/pfc-sh73a0.c
+++ b/drivers/pinctrl/sh-pfc/pfc-sh73a0.c
@@ -2895,7 +2895,8 @@ static const char * const fsic_groups[] = {
 	"fsic_sclk_out",
 	"fsic_data_in",
 	"fsic_data_out",
-	"fsic_spdif",
+	"fsic_spdif_0",
+	"fsic_spdif_1",
 };
 
 static const char * const fsid_groups[] = {
-- 
2.20.1

