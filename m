Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE2B33F371;
	Mon, 23 Feb 2026 18:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771870149; cv=none; b=j9jdCUGMvELeWmgUQmzjIZnwh965Iqh/ECkXXeCuHb+3C37mfk9CKZpRPL13DBt2r0ktWbf8IjDG5GKMc1ggoy2b8JBJOUMrgfDiGziagWUmukOQEwq0XBNVW9b/+ruOD449SJqClCX9x2cyYcr63ljGTpS/w/MNMC7yReuU/Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771870149; c=relaxed/simple;
	bh=GnCEAgfXe/6YcH+5eY7mUfjQLT+Zjz/ERVUf0MC9iBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LnYbn6fwd+fyJqHr+p6G1xuQlZwwKkQnpkmvheQLYnHIzQmWjDF2D7Up4GP3Ur/oL/jzfRbu+m08NfXlZIb/ONDO1W0zU7pkBTL60OibH37lJJOzxX1JWXVSmb6iTW6vA0mXWGos7otZ/ZZS5wqWugScTemnAdUp359Jjj+pTBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KZxFdR7E; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KZxFdR7E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771870148; x=1803406148;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GnCEAgfXe/6YcH+5eY7mUfjQLT+Zjz/ERVUf0MC9iBI=;
  b=KZxFdR7Evb4SAgJgywrywGRXiFTwsHMPfqynsjt+Z5ezosl7650e2Q1n
   s7oky3o5/i+41zV/Whr9ThY/q8B+JJ+n+b5zft3K1UJt0x3TQk8m5OKXx
   WT14neiCXJPDfaZaNVBgp47pUF1iWfEZRWYd1z2UmaHF7CsTrnSrjebrt
   LB39mGjeEDYOcSuu0GFn4tS3poOV4O5aW+EXThhNs6BBNja0y/Z66VGyj
   PIclEu05HVSZJwLW5YqpvCEUT/I9qguk/1qNJf7M1wLVimjLHMSYKDFGv
   qa7FaP1JJDkKIhzJcyRyxMzpb7RTwjx48frf1UPTBVxSqtA9FOaC2oU5M
   A==;
X-CSE-ConnectionGUID: S9OWSNzKQxW4/5VvVH4SnQ==
X-CSE-MsgGUID: 0W4Uj9icSG2/hysn/asQVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="76737710"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="76737710"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 10:09:05 -0800
X-CSE-ConnectionGUID: SCTE6zLYTLKMLSSMCHA7pA==
X-CSE-MsgGUID: PNJwIFP9QeehAicR2hWw5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="253369517"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 23 Feb 2026 10:09:04 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 3F503A4; Mon, 23 Feb 2026 19:09:01 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v1 7/8] =?UTF-8?q?pinctrl:=20cy8c95x0:=20Eliminate=20fragi?= =?UTF-8?q?le=20use=20of=20I=C2=B2C=20ID=20table?=
Date: Mon, 23 Feb 2026 19:06:57 +0100
Message-ID: <20260223180859.2845261-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260223180859.2845261-1-andriy.shevchenko@linux.intel.com>
References: <20260223180859.2845261-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The I²C ID table is a subject to new entries that may potentially
break the order of the existing ones. Avoid this by using string
literals for the chip naming. Note, linker will deduplicate same
string literals and use only a single copy, hence it won't be the
change in size in data section.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index 0bcc9ac19696..1d3e0617b235 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -1369,13 +1369,13 @@ static int cy8c95x0_detect(struct i2c_client *client,
 		return ret;
 	switch (ret & GENMASK(7, 4)) {
 	case 0x20:
-		name = cy8c95x0_id[0].name;
+		name = "cy8c9520";
 		break;
 	case 0x40:
-		name = cy8c95x0_id[1].name;
+		name = "cy8c9540";
 		break;
 	case 0x60:
-		name = cy8c95x0_id[2].name;
+		name = "cy8c9560";
 		break;
 	default:
 		return -ENODEV;
-- 
2.50.1

