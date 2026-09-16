Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5694EC674
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 10:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789555783; cv=none; b=G68TRpxPlLQyxcUjuxArtSkG15rq45AQWtIjMWYhxQLpkHde/rlgDxR6DKPHSjQhosf4Sj+h0Kut9FdfstkRi/CalfYqfVExc4hjSn74GPZ0riE8bpnIV50aZrJarelUIP/eLwRCI8cCtym+emQ3mRwspuJAAL8Qi5PS2cgXzfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789555783; c=relaxed/simple;
	bh=srp3ADG1b1oZGPE/2ZFZo640T4qzsA76NYnMKoCWgn0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fIGDYBoAB9gBFwW2SZgcn1aK4UpugUJwgUv6xuIlYwFLjHzt16Zv9I5l2dJ66Z5FMj7fgcLgzMleHkc1rwvj3HjblvbKJvUlpmBBfkDUsXDHzrAzYsVZGjyRokn/31r7Rx3PTwGCmyeeTF09CAEQ5DiC2rNf9qmAQY3eN7w5uU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za; spf=none smtp.mailfrom=ffroot.co.za; dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b=tCOOCu9+; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b="tCOOCu9+"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so4693815e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 03:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1789555765; x=1790160565; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lPrmKt6fjdtzKQMfjHOce8MoH8Mwpyf4BPOVo+W5EYI=;
        b=tCOOCu9+ZnksjUB4LpWPRNhpcKunYzj9FHBdc2MJcWFDA6eGqyHSjPChu88/GSAzxQ
         oS4qoHurJQYh/tiHcO6zqk5lhdDXNFl2cTmvezZVk3MHeWqCoaFg1mXA5of0wz6SIcFy
         t0X0KCs8R7ttSXm0t/tcauCGP05+PEeQ2Nlq3SGGPH/a8NnhX9qTwarRe35fo8XjFZ4X
         dvypzwfSaL9KshmEbFt00LVO427/Obkz9ddgW3PZtutm5MgZLdMvboBuBK7NVUCevWCn
         x8d1jUNCC+acNoPwLbleSBvIGHqEMS5GC/iarkOuTVAFtyQfcVU5YXd/JDugoLDgXRHu
         r1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789555765; x=1790160565;
        h=content-type:mime-version:message-id:date:user-agent:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lPrmKt6fjdtzKQMfjHOce8MoH8Mwpyf4BPOVo+W5EYI=;
        b=ohCAwpH1wLyUODLQchZCYh5pIFEmOYuplmMrZ8iYL9jWVWcid4QVC0jACrkK34zY1a
         IZKytUjF3JkXBNzwugbjFfWkQi+CiJbfjnIZ4ydRMnfNMXRUX/jYtcOjV/oHbIQY0a+m
         Xwptzr8DsePVQlFuoP+L/WEhPl6k0Er0ixWV3u3vTO/emUT3DkyVmuf7oc8TwdBtupMA
         nn97tn3MFDNGodrcE3oYFK3Aej16Y/xlv722uasz0tII31qWpP/ktLUgs2edZ8jAIIAH
         UGJHSjgw0c3GvvGUwRsWHeAD+z8HzNRrVAyeR4NzsRSp29dMYkbNY2o8KrRA9rPshWRX
         Z2WQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWkCwneI1/+/M7aEfbQmJSzt4F9DGbI7xW9+NgFK2l3Cb8i9q0SEMSFVpsr4UB4U9jePlJBFiekoF5@vger.kernel.org
X-Gm-Message-State: AFuF++mGWJjda7ZYoOnvk3/lNanGjaPDP/+JJN1j7NvIGmn/3DgyYtk3
	U4PpeEBkX7C85negzc40ypKhvBsMTqZfPjob2BRMsjlXu5qzYboGKUJRkDl9xLXCOiM=
X-Gm-Gg: AYBFou0Md52YuCgJUFc7qWhqyUsknBxf/z5m8DudFKe5VU3F6evINUxirLWXAylsZRC
	puDNDvyN0Ru7bxpmuIgbRL4j52gEU+Z77UW/8Lf/vo7XuCD4MYwnmfQQzT3sZojZZdf9Sz2zQAs
	qbZspiWczLa7G9OliWwfnpDfTQ3h7Xd8eIbyslb6QpOVRmrCPZMieDwXQa8sLgHfUjVZp8uR4/J
	Aie1VGB+mVuVYKRzv8uOh1zv03ldt9pVxwbtrUlLd+FHoGNpbPvaQz9wVpP/ifCw3HSTAKfUP5y
	ocJKmNzeHUaG3qwCwagVQDtUglcduHnUsqwfmQwFexM2dA54Ta25E55MLg4YmZFABmLyj46eCTe
	QocoJdJkBSFBDzfJ596JHyYahdNL/W3+RDRbPrvXcyQzwQh44E8B7QNzH+XOCJFJlAWprd13X05
	hlugCuW0SbqQZXuGlzeYKPkSuwuFrjNzAthfkzLopJFvL7+XIrlDbtfMWoqRx4CnWavWDXSrnna
	uc7QPCJVtkwuJI=
X-Received: by 2002:a05:600c:46ce:b0:49c:dca4:94c with SMTP id 5b1f17b1804b1-49eb7339895mr43206945e9.13.1789555765101;
        Wed, 16 Sep 2026 03:49:25 -0700 (PDT)
Received: from dev-ag ([102.33.165.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bef766dsm6157208f8f.4.2026.09.16.03.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:49:24 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux@armlinux.org.uk, dvorkin@tibbo.com, wellslutw@gmail.com,
 linusw@kernel.org
Cc: arnd@arndb.de, afd@ti.com, aaro.koskinen@iki.fi,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] pinctrl: fix PINCTRL_SPPCTL=m
User-Agent: mu4e 1.12.14; emacs 30.2
Date: Wed, 16 Sep 2026 12:49:19 +0200
Message-ID: <sa6bj9x31zk.fsf@dev-ag>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

The PINCTRL_SPPCTL option is defined as a tristate in Kconfig, and the
help text suggests that the user can build it as a module by setting to
'm'.

However, it cannot currently be set to 'm', because SOC_SP7021, the only
platform that supports it, is a bool option that uses 'select' on it.
Also, the SP7021 requires this driver to be built in, in order to boot.

Change the tristate to bool and fix the help text.

Tested on linux-next-2026-09-14 on a LTPP3G2 board.

This impossible tristate was detected by kconfirm, a static analysis tool
for Kconfig, by Julian Braha <julianbraha@gmail.com>.

Fixes: aa74c44be19c ("pinctrl: Add driver for Sunplus SP7021")
Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
---
 drivers/pinctrl/sunplus/Kconfig | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/sunplus/Kconfig b/drivers/pinctrl/sunplus/Kconfig
index 69f82590f6d2..aa9435d023d8 100644
--- a/drivers/pinctrl/sunplus/Kconfig
+++ b/drivers/pinctrl/sunplus/Kconfig
@@ -4,8 +4,8 @@
 #
 
 config PINCTRL_SPPCTL
-	tristate "Sunplus SP7021 PinMux and GPIO driver"
-	depends on SOC_SP7021
+	bool "Sunplus SP7021 PinMux and GPIO driver"
+	depends on SOC_SP7021 || COMPILE_TEST
 	depends on OF && HAS_IOMEM
 	select GENERIC_PINCTRL_GROUPS
 	select GENERIC_PINMUX_FUNCTIONS
@@ -16,6 +16,4 @@ config PINCTRL_SPPCTL
 	help
 	  Say Y here to support Sunplus SP7021 pinmux controller.
 	  This driver requires the pinctrl framework.
-	  GPIO is provided by the same driver.
-	  To compile this driver as a module, choose M here.
-	  The module will be called sppinctrl.
+	  This driver also provides GPIO.
