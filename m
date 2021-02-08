Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0A4EC433E6
	for <linux-gpio@archiver.kernel.org>; Mon,  8 Feb 2021 22:25:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 69EB364E7B
	for <linux-gpio@archiver.kernel.org>; Mon,  8 Feb 2021 22:25:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231434AbhBHWY6 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 8 Feb 2021 17:24:58 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:46091 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231194AbhBHWYy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Feb 2021 17:24:54 -0500
Received: from orion.localdomain ([95.115.15.83]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MFslN-1l8MNn1nEV-00HQRS; Mon, 08 Feb 2021 23:22:12 +0100
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     rafael@kernel.org, info@metux.net, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, robh+dt@kernel.org,
        frowand.list@gmail.com, pantelis.antoniou@konsulko.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: [RFC PATCH 01/12] of: base: improve error message in of_phandle_iterator_next()
Date:   Mon,  8 Feb 2021 23:21:52 +0100
Message-Id: <20210208222203.22335-2-info@metux.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210208222203.22335-1-info@metux.net>
References: <20210208222203.22335-1-info@metux.net>
X-Provags-ID: V03:K1:StHwu6XV//m6RRcLywFyUHvKNrRov/gvJTl5SbpmNL78cQ82VgA
 gMBLVnnSz5vwUqWv7NIq021AIJYvyIawbNpv7OqnBSUTIZT8gWhEw/xY1C2HX0fp1+Zjkpq
 bKUXCHBTco8CJ6YBRO2kXsvzdxfpXRwGP21FM+5Q+95/rd0x1FLyr2jWzp7QTshBM+rjaKs
 CKv88AY48zy3drrYg8bBA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:I6bLjPej9cM=:SHPhq4kKOgXVRSliHDROYW
 BlaL5EeJ9U9u/fv45try5TZqLZCeEtnA/f2SgNO37cn53FF0xdIArwoV87YwzazAL7Z3mj8M+
 RaK1YkDhXJF2BYN6byjojTbwslnT+9LtkbU+30dZSd7NHmqPq5K6XhRa5B5Ol2wbvsrDGXXhB
 5C2cija0WXQl8EoGrGksCTqzUTUz0aPjNuPPHUSc27TmOSaoSmZBBKNLTdDk9Jixvj/ASAQZL
 hGKpJaWhFbW8/r1tLcG/31jzyDG5Wrnl+30DeTkMjdt2YNmJUoLrrg/egVblWK8VY2uxl+nvD
 XWPlsI5PZt1UNw/4Z0AXBLKzWdt5c1/fnMZE599zoyczQ8GeV0uy+3H/eoBU1TcxU6LD+UdZX
 GI2INH6/d3E8Ytny5QT7L7snp2/UUGvgY5+jg28tPrhqV/W+3xbgkxF8jOy6U
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Also print out the phandle ID on error message, as a debug aid.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 drivers/of/base.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 161a23631472..8a348f0d3c5e 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1297,8 +1297,8 @@ int of_phandle_iterator_next(struct of_phandle_iterator *it)
 
 		if (it->cells_name) {
 			if (!it->node) {
-				pr_err("%pOF: could not find phandle\n",
-				       it->parent);
+				pr_err("%pOF: could not find phandle %d\n",
+				       it->parent, it->phandle);
 				goto err;
 			}
 
-- 
2.11.0

