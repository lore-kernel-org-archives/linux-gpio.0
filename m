Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4980C30F95F;
	Wed, 11 Mar 2026 13:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773235196; cv=none; b=XARocc9uviauyDUbF7pff6L7xbjrbcqtp13ImWt/rjlPfirgiWLQFq63HAAgQ/GkLcLFdQHmYGfvnTdoeHQLzLcl8FVZ8aqaLq2DoFylw09fCtposazxUP2+RFIYGOoGqvvi3Rr9bB4tamQ8Lzbryp5L3ylfkX9M8ugPVvxwzcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773235196; c=relaxed/simple;
	bh=Okt2O6YUpq0VfhNHSCtAlZVjCVq5e7902aageUcjc0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sp30nYKbSXINqnwu6sGkvLsEcg401ua3XcgiApTcNEpNe6qp8+GDtcAbG+Ehi8l7MZBooEWUCUS4kwuQfIu9zwkhrVJJDRIxgtR7rTH2CCqSOhiugdgFFd/azx23tNOpsdR9rj8/AE5I+SzaHB+iAya4TQDGabQDHBx4vZg2Re0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GaRe8nmG; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GaRe8nmG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773235194; x=1804771194;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Okt2O6YUpq0VfhNHSCtAlZVjCVq5e7902aageUcjc0c=;
  b=GaRe8nmGNbf75jfVeFgA2EkPpuNgr3QryIELOe4/bisTHoIFGmSHl2ec
   3636Wco9q4J+m73XT6UffBJstTkmLVxyBa7oNyafPGKas7ZUlBNVyU6YY
   0tvExSki4xNC7XbFgsnva1xy4MnDfqrFh1V5COiKsVry0qIT64IagsdsQ
   zeftZC6fxSUcnB3Q2DsgESuUXRS4vG7aAt+eyBmfiu69Wnc1WF35qEYYC
   lPxGkhrrsCoKkX8j2SPgRUlEarQI6vkmhIRc5ozZyYwQTKEKLxqb47GNq
   1+OllGYS91pat5WSWe4v09VsyGTWPij9DNeKLDZZRNNvCPgpW7OlZNriL
   A==;
X-CSE-ConnectionGUID: dP3CD6L9Qom+4NsijGqB7Q==
X-CSE-MsgGUID: gnXpYZPmTQ64GPdEuH6jTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74211576"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="74211576"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 06:19:54 -0700
X-CSE-ConnectionGUID: Xc6M+H6XT96jg398WYjrog==
X-CSE-MsgGUID: a4y5Qn3/TuexlxJkeLC4wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="217131243"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO alaakso-DESK.intel.com) ([10.245.246.81])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 06:19:49 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: linux-gpio@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linusw@kernel.org,
	brgl@kernel.org,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	dan.scally@ideasonboard.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	hverkuil+cisco@kernel.org,
	sre@kernel.org,
	hao.yao@intel.com,
	jimmy.su@intel.com,
	miguel.vadillo@intel.com,
	kees@kernel.org,
	ribalda@chromium.org
Subject: [PATCH v2 2/5] media: ipu-bridge: Add ov5675 sensor
Date: Wed, 11 Mar 2026 15:19:07 +0200
Message-ID: <20260311131910.835513-3-antti.laakso@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260311131910.835513-1-antti.laakso@linux.intel.com>
References: <20260311131910.835513-1-antti.laakso@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Omnivision ov5675 is found from MSI prestige
14 AI EVO laptop, for example.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index c895584e25a0..ee070d44d5f1 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -91,6 +91,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
 	/* Omnivision OV2680 */
 	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
+	/* Omnivision OV5675 */
+	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
 	/* Omnivision OV8856 */
 	IPU_SENSOR_CONFIG("OVTI8856", 3, 180000000, 360000000, 720000000),
 	/* Sony IMX471 */
-- 
2.53.0

