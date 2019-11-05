Return-Path: <SRS0=+xOq=Y5=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94986C17461
	for <linux-gpio@archiver.kernel.org>; Tue,  5 Nov 2019 12:49:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5E02021882
	for <linux-gpio@archiver.kernel.org>; Tue,  5 Nov 2019 12:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572958171;
	bh=EnmHDJpRlHAWfn8bqOB3/vB3RWRtJ46RJfln9RLbDB0=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=wGRHi5AUyeUmJj2OCDZC0/IxD1cX2pAhXWK5P4e1wZTL8r3AebiPFGwRbXZ+RNHlB
	 1EAFaV0HRr8+nyAk7c2+1yRIWbjxU9hu24kD+Yi1mx30mpJdtDIP1DedI13uX+MQRU
	 biMyf1nVhB/BPVi2zx8Oii+i5kED5AcLqyitd7MU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388649AbfKEMtb (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 5 Nov 2019 07:49:31 -0500
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:42644 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388222AbfKEMta (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 07:49:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=YF0SPqtJlZ9yO+HjEI8KHZXAGRkZZ0lJis6FsY1blfY=; b=odaFo7CtTrXVALVT+A9AmK2rw
        ab2bAvH1DMgSuC3Uj8rz+KMiDbgwqwRRZ9855XdWSypUMRyUVfGhCanvuESRTPFjWKey2GvQJBsWw
        forbrOvTwgMOlo1Il91xPnPW9wNmeIEaOAyzFgHP75ryeqJkQu37Y+UjvBee+KrRovfbQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iRyGx-0006Zf-EF; Tue, 05 Nov 2019 12:49:23 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 982D5274301E; Tue,  5 Nov 2019 12:49:22 +0000 (GMT)
From:   Mark Brown <broonie@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Mark Brown <broonie@kernel.org>
Subject: [PATCH] gpio: xgs-iproc: Fix section mismatch on device tree match table
Date:   Tue,  5 Nov 2019 12:49:15 +0000
Message-Id: <20191105124915.34100-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The table of devicetree identifiers is annotated as __initconst
indicating that it can be discarded after kernel boot but it is
referenced from the driver struct which has no init annotation leading
to a linker warning:

WARNING: vmlinux.o(.data+0x82d58): Section mismatch in reference from the variable bcm_iproc_gpio_driver to the variable .init.rodata:bcm_iproc_gpio_of_match
The variable bcm_iproc_gpio_driver references
the variable __initconst bcm_iproc_gpio_of_match

Since drivers can be probed after init the lack of annotation on the
driver struct is correct so remove the annotation from the match table.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/gpio/gpio-xgs-iproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-xgs-iproc.c b/drivers/gpio/gpio-xgs-iproc.c
index a3fdd95cc9e6..bb183f584d92 100644
--- a/drivers/gpio/gpio-xgs-iproc.c
+++ b/drivers/gpio/gpio-xgs-iproc.c
@@ -299,7 +299,7 @@ static int __exit iproc_gpio_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct of_device_id bcm_iproc_gpio_of_match[] __initconst = {
+static const struct of_device_id bcm_iproc_gpio_of_match[] = {
 	{ .compatible = "brcm,iproc-gpio-cca" },
 	{}
 };
-- 
2.20.1

