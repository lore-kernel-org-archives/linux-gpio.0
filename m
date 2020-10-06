Return-Path: <SRS0=v8Oc=DN=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 530F5C41604
	for <linux-gpio@archiver.kernel.org>; Tue,  6 Oct 2020 17:26:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AFB81206F7
	for <linux-gpio@archiver.kernel.org>; Tue,  6 Oct 2020 17:26:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=upir.cz header.i=@upir.cz header.b="jZvO5uAa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726235AbgJFR0s (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 6 Oct 2020 13:26:48 -0400
Received: from 241-168-195-217.cust.centrio.cz ([217.195.168.241]:52282 "EHLO
        patejl.cela.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725902AbgJFR0s (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 6 Oct 2020 13:26:48 -0400
Received: from griffin.upir.cz (mem-185.47.222.164.jmnet.cz [185.47.222.164])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by patejl.cela.cz (Postfix) with ESMTPSA id 915CEA494
        for <linux-gpio@vger.kernel.org>; Tue,  6 Oct 2020 19:17:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=upir.cz; s=mail;
        t=1602004639; bh=7C7A4oBNsbEMnPiDzH83fn8o5VJcaboO6lTOMH0Vdbc=;
        h=From:To:Subject:Date;
        b=jZvO5uAabi+1aSt0ry6L4NnePr1qy7SQGVx5mANls7C0A+FHLZ5/7cBg0tezXhElH
         ToeqiRu6jw2hETmxwI6UDz1O7wVqsNuSyVf2JArd/3TXPRcHuY3g5E4rFcWf10XwP2
         nMVuINE4O6nSEKTYZNL2GI296tN45B1N28CXpyFM=
From:   Jiri Benc <jbenc@upir.cz>
To:     linux-gpio@vger.kernel.org
Subject: [PATCH libgpiod] bindings: python: fix Line.request() crashing
Date:   Tue,  6 Oct 2020 19:17:08 +0200
Message-Id: <38eff7ebd01efd34df3037ba485d61ff7291fb5e.1602004585.git.jbenc@upir.cz>
X-Mailer: git-send-email 2.18.1
X-Virus-Scanned: clamav-milter 0.102.2 at patejl
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On an attempt to call the 'request' method of a Line object, the program
crashes with this exception:

> SystemError: ../Objects/dictobject.c:2606: bad argument to internal function
>
> The above exception was the direct cause of the following exception:
>
> Traceback (most recent call last):
>   File "<stdin>", line 1, in <module>
> SystemError: <class 'gpiod.LineBulk'> returned a result with an error set

The problem is that keyword args are NULL (rather than an empty dict) if
they are not present. However, PyDict_Size sets an exception if it gets
NULL.

Fixes: 02a3d0a2ab5e ("bindings: python: fix segfault when calling Line.request()")
Signed-off-by: Jiri Benc <jbenc@upir.cz>
---
 bindings/python/gpiodmodule.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/python/gpiodmodule.c b/bindings/python/gpiodmodule.c
index b3ae2bfebb8a..fee4c32406fa 100644
--- a/bindings/python/gpiodmodule.c
+++ b/bindings/python/gpiodmodule.c
@@ -472,7 +472,7 @@ static PyObject *gpiod_Line_request(gpiod_LineObject *self,
 	gpiod_LineBulkObject *bulk_obj;
 	int rv;
 
-	if (PyDict_Size(kwds) > 0) {
+	if (kwds && PyDict_Size(kwds) > 0) {
 		def_val = PyDict_GetItemString(kwds, "default_val");
 		def_vals = PyDict_GetItemString(kwds, "default_vals");
 	} else {
-- 
2.18.1

