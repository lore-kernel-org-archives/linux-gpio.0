Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358434078C1;
	Tue, 13 Oct 2026 09:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884663; cv=none; b=biQZL76ioNrfVS15KzK5D8SgLspYAulqXbqls/LruVaT1F7Sahldhzy7Npwha3r1gx3iy4W+RKujdhivjIQFKSaX7VeosYsgm6ywrdlbzE9GzbgQ3pQrVjwtXLOz8F1cdoGU9wXxm5C/7oLnRM4QHzijCV8RvhYu/Za82ljPJ2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884663; c=relaxed/simple;
	bh=PA557b9FgSWoKUFTpah05tJEQ/RR3TM1v7v/HWiizfY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sGvArqf7rVRjsZ7K5x1/+AlwGYd/5DlBeODlsyPKL4tCFKpcjj0AVSv3N1rWNlkR5/L3WR0+W1lXsBDdt8Z+lcwSxUwEqr4XT4fi5TjIQqHG9RhgsYhtrtJ5fT6bWuUiVI/J0qYFpuCKQSOGCgwCD6PCaXpFMsz8FgTW2ZEvJkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kd5A6s14; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kd5A6s14"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791884661; x=1823420661;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PA557b9FgSWoKUFTpah05tJEQ/RR3TM1v7v/HWiizfY=;
  b=kd5A6s14hd5gVnX2mvrUPCAffu+1C5C3j5cYlFW9mkWuA60oFGsAYruV
   rSvFPZHZj6cvoqKH5Xg2dCax105EDSjGPEN2qrM+qwh6PST8yUMegYLJE
   X1tGZtydPI5uyTYecSt5ypnUaA50Z1XkpmzUvcSePDb1+nCocdyrZKmX7
   yeatiq9U6RMSmX13hneZO969uhKawO5E6hzBK49LFuieGkANXJtAHebDC
   /oY8d+vydUx/YvacN5LdKHi1APzNrjf7GFXfVllWnRSee3iHX3yHlx1vn
   VFQrci0qYvl1UJlvom/y38kYchwUYeP7+0/vsrIgU1yvFJHgY3wwQT+Ng
   w==;
X-CSE-ConnectionGUID: /SVEZO3tRqKN/QpqUHAtUA==
X-CSE-MsgGUID: ohfL3mEhT1asqGVyMgixuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="502648"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="502648"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 02:44:20 -0700
X-CSE-ConnectionGUID: uZUKsXKaS96/TS8bvh3UbA==
X-CSE-MsgGUID: OGtE7D/dSu+nEKffZ6cwwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1445296"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 13 Oct 2026 02:44:19 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 1600D99; Tue, 13 Oct 2026 11:44:18 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] gpiolib: shared: Don't define variable in the middle of the code
Date: Tue, 13 Oct 2026 11:44:12 +0200
Message-ID: <20261013094412.945609-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While the C11 allows us to define variables in the code, we do not
do this style (see more at [1]). Move the declaration to the top of
the function.

Link: https://lore.kernel.org/lkml/58fd478f408a34b578ee8d949c5c4b4da4d4f41d.camel@HansenPartnership.com/ [1]
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib-shared.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 5f9623e40b0f..40c08f1ae5f0 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -196,6 +196,7 @@ static int gpio_shared_of_traverse(struct device_node *curr)
 		for (i = 0; i < count; i++) {
 			struct device_node *np __free(device_node) = NULL;
 			char *con_id __free(kfree) = NULL;
+			struct fwnode_handle *curr_fwnode;
 
 			ret = of_parse_phandle_with_args(curr, prop->name,
 							 "#gpio-cells", i,
@@ -261,8 +262,7 @@ static int gpio_shared_of_traverse(struct device_node *curr)
 				con_id[con_id_len - suffix_len] = '\0';
 			}
 
-			struct fwnode_handle *curr_fwnode =
-				fwnode_handle_get(of_fwnode_handle(curr));
+			curr_fwnode = fwnode_handle_get(of_fwnode_handle(curr));
 			ref = gpio_shared_make_ref(curr_fwnode, con_id, args.args[1]);
 			if (!ref) {
 				fwnode_handle_put(curr_fwnode);
-- 
2.50.1

