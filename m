Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FE327BF93;
	Sat, 18 Jul 2026 18:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784400625; cv=none; b=jurOosEEIMf2a3/jEhcQLbRENi3HoCLjFz5BJJCmbEkn6hA5g3RFufWnxDorudni8buxFtkhj72baFOkkpFbkM/bR+fpXG/QA8WUIHk3G65oDMirnBRixsQNHt2vB5kwJty8cDRubMjxNKGMUVG3gjV93LR9kzOnMh5TCSOx+nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784400625; c=relaxed/simple;
	bh=KX0FaptwyX0fR8xig0zo+7MI0fyiUy3B3tH/sosrbhc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MTJQLdmNr65jaE46cptGMoz7EIQCjvQBgEtKnCczCATUXjhNEUmPy98RZf4NhREIiz5cx8xcE1xRbc9waFmaYCWYGghrCk5cQ+9HZ83X9uQl860zK9eINdrHoHeFgLGqTdBpOsNrXg8hmvy459POZ2dZM98+0C0KsKiIelS6YpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Ipy12Q50; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Ipy12Q50"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=9jEDxHMaQ9g/HTmOHqW3yML6Bi+LCB5FFqij4/H9TTw=; b=Ipy12Q50T1uutQRTfafmQtXMiJ
	FrQHDlPCqjquLiOkHLi6rp4gDZxe+Ysr5h84zkmHukh53bMq0aW9uTgo5Q3JJKAecakK1NpLvnOLV
	RPeuqfm1pYI/+62x9CYUJczgntf7PICoVmjswJoMn5VZnHU03oYQya6P0fwP2X7Vkz/r6Cjz0bMyn
	wCkntP6yUDQwJ8yymNwU6LPtNfSE1n6lkMp/Ttj3zua+sLU3YIo7bSASkj2TeGR4Me49gl7ncCvzf
	ChJazEUN39TSpt+NTQ06ASSUpJ07kOBtVbWQNDWVcaLn0eoNKqozZ0NOc+GINEP6jfRDFevE5Tojs
	sn2WjPhQ==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlA79-00000004SJl-1slF;
	Sat, 18 Jul 2026 18:50:19 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jim Cromie <jim.cromie@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-gpio@vger.kernel.org
Subject: [PATCH] chardev: GPIO common access methods: repair non-kernel-doc comment
Date: Sat, 18 Jul 2026 11:50:18 -0700
Message-ID: <20260718185018.1857536-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change a "/**" non-kernel-doc comment to a plain C comment "/*"
to avoid 21 warnings like these:

Warning: ./include/linux/nsc_gpio.h:2 Cannot find identifier on line:
   nsc_gpio.c
Warning: ./include/linux/nsc_gpio.h:4 Cannot find identifier on line:
   National Semiconductor GPIO common access methods.
Warning: ./include/linux/nsc_gpio.h:6 Cannot find identifier on line:
   struct nsc_gpio_ops abstracts the low-level access

Fixes: fe3a168a2ce1 ("[PATCH] chardev: GPIO for SCx200 & PC-8736x: add gpio-ops vtable")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Jim Cromie <jim.cromie@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-gpio@vger.kernel.org

 include/linux/nsc_gpio.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20260717.orig/include/linux/nsc_gpio.h
+++ linux-next-20260717/include/linux/nsc_gpio.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-/**
+/*
    nsc_gpio.c
 
    National Semiconductor GPIO common access methods.
