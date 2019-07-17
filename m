Return-Path: <SRS0=rXeK=VO=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3947C76186
	for <linux-gpio@archiver.kernel.org>; Wed, 17 Jul 2019 11:05:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A923521882
	for <linux-gpio@archiver.kernel.org>; Wed, 17 Jul 2019 11:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1563361539;
	bh=rAC9BjeG81qOOQKCcEcfp+/LrsTLEJ80ohVdui6gXhU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=pF++D1qxE8h/Qry1jWQ0B9Q0gvPDjc5Xte+rGHbVpf+EZfQLpra8QiAvHgp3NsYPm
	 ijxNaaMyI5rMWXQHdGWSfyBgLXBybCEsvCBonS/c/H5wwHk5FC0pIM22plvvpihxTc
	 NmorRAf0apTdl1XXvmNudP+v6XQ8JL7oHriH/yIs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726824AbfGQLFj (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 17 Jul 2019 07:05:39 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:47066 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726343AbfGQLFi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Jul 2019 07:05:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=LzmNjpjSX9Wly7eBTDbvTM1R7YMU15H5jVWtYA+bPfE=; b=jbYmQDsqaasdDhtAMvrJ+hrX54
        Vy/3bf57PQRpePPJGbuIVpPy2NBxOFRPrOWea/c0CZea4nz7Ua1ZJL/B78V0tr24BIz3eLNtWzQcl
        L4mIffvZzLzeshSP54j3QJiBRZjZrbLKIkVk879TBdcaXsgJ2limtqvv8lRFzzshHVs2B7EThfjqj
        bIcyh2qlc2WuKrikbB5PEHE5sACO8m5xzff/jzHcJ4mbkWnAYOaajYdmEgqO0YNIcKaPCPOqBMqjT
        qkiORojZpaK6ZXqGigPfF3iSg2+b8J6PrPFp6iRa3uyn+6KFA3hm3boNUlPcl8vSCCJ0Qnt+5vbQt
        bQLUxpSw==;
Received: from [191.33.154.161] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hnhke-00054T-Sw; Wed, 17 Jul 2019 11:05:36 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hnhkc-0003A9-Un; Wed, 17 Jul 2019 08:05:34 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     gregkh@linuxfoundation.org
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-gpio@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH v3 18/20] docs: ABI: don't escape ReST-incompatible chars from obsolete and removed
Date:   Wed, 17 Jul 2019 08:05:31 -0300
Message-Id: <07b6de638cb80767dd3ea2fdec8b19ee3ceb60a7.1563360659.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1563360659.git.mchehab+samsung@kernel.org>
References: <cover.1563360659.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

With just a single fix, the contents there can be parsed properly
without the need to escape any ReST incompatible stuff.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/ABI/obsolete/sysfs-gpio      | 2 ++
 Documentation/admin-guide/abi-obsolete.rst | 1 +
 Documentation/admin-guide/abi-removed.rst  | 1 +
 3 files changed, 4 insertions(+)

diff --git a/Documentation/ABI/obsolete/sysfs-gpio b/Documentation/ABI/obsolete/sysfs-gpio
index e0d4e5e2dd90..b8b0fd341c17 100644
--- a/Documentation/ABI/obsolete/sysfs-gpio
+++ b/Documentation/ABI/obsolete/sysfs-gpio
@@ -13,6 +13,8 @@ Description:
   GPIOs are identified as they are inside the kernel, using integers in
   the range 0..INT_MAX.  See Documentation/admin-guide/gpio for more information.
 
+  ::
+
     /sys/class/gpio
 	/export ... asks the kernel to export a GPIO to userspace
 	/unexport ... to return a GPIO to the kernel
diff --git a/Documentation/admin-guide/abi-obsolete.rst b/Documentation/admin-guide/abi-obsolete.rst
index cda9168445a5..d095867899c5 100644
--- a/Documentation/admin-guide/abi-obsolete.rst
+++ b/Documentation/admin-guide/abi-obsolete.rst
@@ -8,3 +8,4 @@ The description of the interface will document the reason why it is
 obsolete and when it can be expected to be removed.
 
 .. kernel-abi:: $srctree/Documentation/ABI/obsolete
+   :rst:
diff --git a/Documentation/admin-guide/abi-removed.rst b/Documentation/admin-guide/abi-removed.rst
index 497978fc9632..f7e9e43023c1 100644
--- a/Documentation/admin-guide/abi-removed.rst
+++ b/Documentation/admin-guide/abi-removed.rst
@@ -2,3 +2,4 @@ ABI removed symbols
 ===================
 
 .. kernel-abi:: $srctree/Documentation/ABI/removed
+   :rst:
-- 
2.21.0

