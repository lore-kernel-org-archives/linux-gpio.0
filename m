Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85101377EDA;
	Tue, 17 Mar 2026 13:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773752934; cv=none; b=ZSIYACGXkY9b8XsovUwTM/GQLcuzucoxFSvQvPIT8bc7Po9cZ1fjIiI48UyP/ElcBqtMpcas60Qt5nOYygyeWC4OQLpuUv4IY+s3eSDNwErQGJp4OwlDeuUgQ3tLA5iwkWS5KOgFrEJrrxYVUz3PYSYrEE29qBZG/cq97YwKuCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773752934; c=relaxed/simple;
	bh=pxUtop0sNbqmle8A1Fupmv6YrUhPCZz+UtlRMeDYdSY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EGdHiWEpGyX56apnS00QTwPxSSqVXWhgoYoaElVpo6L3+U/1rYgkMB4LRLqdcvRr3+1uEnQYNbQ2XPDvQ+mxA8jZGRePNS2eLR+eib2jAoq0CgUleJjNAlepIQo4CPJNBTaSKtTCiLj3uVu+4e+7MlLb8AAAvbA5A+OYdCcJGQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MmGwOgJs; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MmGwOgJs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773752934; x=1805288934;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pxUtop0sNbqmle8A1Fupmv6YrUhPCZz+UtlRMeDYdSY=;
  b=MmGwOgJsSYR1EIw9gmog+2ZzZTcg5D8rCZ9c7bAurQEebeZ8XSYfW+rs
   TJGYFtyUuH/EFK5242Z/8a+Z3v8ncm/lIaFNICch3jsxyXZ2BcdVAWDxx
   I37gtzH1JK1IyNTLkoWHi4HTZtc38u9K9BdO6qmaB4yls28VGwKNPFgeF
   NW582owCMeIN1mlKRzOn8Q2esGjQQ/0Ap31NMs1nn4EmNtThoPOFJhHI+
   CmM3a+L8MMeG1YPO9syueAIow8YcofOib6Iimn66laYXDiU3ALcm/GZ+P
   Cs19+4MEx+H4ZGQirfcYNCGQeTC/yXcA1L4edXmSPRqFuPkmRT8hWHSH5
   g==;
X-CSE-ConnectionGUID: 7uMtXckZQpeyDxQ+xNIv9w==
X-CSE-MsgGUID: OyBpRgk2Qj2BF8kchaeKXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74669417"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74669417"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:08:53 -0700
X-CSE-ConnectionGUID: S9HUejb5RYiSypeG9mDPwg==
X-CSE-MsgGUID: M4t5Ldg1SkG9Y5PFryH5iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="218407880"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.106])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:08:50 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0B47D121D4E;
	Tue, 17 Mar 2026 15:08:48 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1w2UC0-00000000txr-3S0Z;
	Tue, 17 Mar 2026 15:10:40 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Antti Laakso <antti.laakso@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linusw@kernel.org,
	brgl@kernel.org,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	dan.scally@ideasonboard.com,
	ilpo.jarvinen@linux.intel.com,
	hverkuil+cisco@kernel.org,
	sre@kernel.org,
	hao.yao@intel.com,
	jimmy.su@intel.com,
	miguel.vadillo@intel.com,
	kees@kernel.org,
	ribalda@chromium.org
Subject: [PATCH 1/1] platform: int3472: Drop redundant initialisation to 0 and NULL
Date: Tue, 17 Mar 2026 15:10:40 +0200
Message-ID: <20260317131040.215119-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A few fields in structs containing regulator initialisation data for Dell
laptops are initialised to 0 and NULL. Drop the explicit initialisation as
redundant.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/platform/x86/intel/int3472/tps68470_board_data.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
index 6bec5a910396..c1ddbf9a82c0 100644
--- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
+++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
@@ -151,8 +151,6 @@ static const struct regulator_init_data dell_7212_tps68470_core_reg_init_data =
 		.apply_uV = 1,
 		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
 	},
-	.num_consumer_supplies = 0,
-	.consumer_supplies = NULL,
 };
 
 static const struct regulator_init_data dell_7212_tps68470_ana_reg_init_data = {
@@ -162,8 +160,6 @@ static const struct regulator_init_data dell_7212_tps68470_ana_reg_init_data = {
 		.apply_uV = 1,
 		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
 	},
-	.num_consumer_supplies = 0,
-	.consumer_supplies = NULL,
 };
 
 static const struct regulator_init_data dell_7212_tps68470_vcm_reg_init_data = {
@@ -173,8 +169,6 @@ static const struct regulator_init_data dell_7212_tps68470_vcm_reg_init_data = {
 		.apply_uV = 1,
 		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
 	},
-	.num_consumer_supplies = 0,
-	.consumer_supplies = NULL,
 };
 
 static const struct regulator_init_data dell_7212_tps68470_vio_reg_init_data = {
@@ -184,8 +178,6 @@ static const struct regulator_init_data dell_7212_tps68470_vio_reg_init_data = {
 		.apply_uV = 1,
 		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
 	},
-	.num_consumer_supplies = 0,
-	.consumer_supplies = NULL,
 };
 
 static const struct regulator_init_data dell_7212_tps68470_vsio_reg_init_data = {
-- 
2.47.3

