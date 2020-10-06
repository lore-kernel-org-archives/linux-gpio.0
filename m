Return-Path: <SRS0=v8Oc=DN=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C4EFC41604
	for <linux-gpio@archiver.kernel.org>; Tue,  6 Oct 2020 17:21:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E600320789
	for <linux-gpio@archiver.kernel.org>; Tue,  6 Oct 2020 17:21:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=upir.cz header.i=@upir.cz header.b="ooETBOuI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725947AbgJFRVs (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 6 Oct 2020 13:21:48 -0400
Received: from 241-168-195-217.cust.centrio.cz ([217.195.168.241]:52268 "EHLO
        patejl.cela.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725902AbgJFRVs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 6 Oct 2020 13:21:48 -0400
X-Greylist: delayed 329 seconds by postgrey-1.27 at vger.kernel.org; Tue, 06 Oct 2020 13:21:47 EDT
Received: from griffin.upir.cz (mem-185.47.222.164.jmnet.cz [185.47.222.164])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by patejl.cela.cz (Postfix) with ESMTPSA id 238B9A3B6
        for <linux-gpio@vger.kernel.org>; Tue,  6 Oct 2020 19:16:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=upir.cz; s=mail;
        t=1602004573; bh=s/7TXJLqRxrqQLHOoyML9z3Np6FENPrcSelnPAh9yVw=;
        h=From:To:Subject:Date;
        b=ooETBOuIGW7XG7MMwxEt3AQV3LeUcSLKECcRsZ4S1rvb5nNlOXdOREt7MJviQSQVr
         aZmjmRo+yzR/1S1WQLaB+18TQ+vMi8JTsw21NCZYrq49uhR4tS8q1DNA1ByZhTS8nT
         4nbIEGEsCALBQoj7RLwbvRm75WBZ04bGI+SYcsmM=
From:   Jiri Benc <jbenc@upir.cz>
To:     linux-gpio@vger.kernel.org
Subject: [PATCH libgpiod] bindings: python: fix incorrect object size
Date:   Tue,  6 Oct 2020 19:16:02 +0200
Message-Id: <bfe529765a0f1d428c7ce2c222dd3a17aba2e058.1602004154.git.jbenc@upir.cz>
X-Mailer: git-send-email 2.18.1
X-Virus-Scanned: clamav-milter 0.102.2 at patejl
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tp_basicsize is the size of the allocated object, not of the class.

Fixes: 96c524c4951c ("bindings: implement python bindings")
Signed-off-by: Jiri Benc <jbenc@upir.cz>
---
 bindings/python/gpiodmodule.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/python/gpiodmodule.c b/bindings/python/gpiodmodule.c
index e5db26b88954..b3ae2bfebb8a 100644
--- a/bindings/python/gpiodmodule.c
+++ b/bindings/python/gpiodmodule.c
@@ -1874,7 +1874,7 @@ PyDoc_STRVAR(gpiod_LineBulkType_doc,
 static PyTypeObject gpiod_LineBulkType = {
 	PyVarObject_HEAD_INIT(NULL, 0)
 	.tp_name = "gpiod.LineBulk",
-	.tp_basicsize = sizeof(gpiod_LineBulkType),
+	.tp_basicsize = sizeof(gpiod_LineBulkObject),
 	.tp_flags = Py_TPFLAGS_DEFAULT,
 	.tp_doc = gpiod_LineBulkType_doc,
 	.tp_new = PyType_GenericNew,
-- 
2.18.1

