Received: from pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.83.148.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7404C3D9524;
	Thu, 17 Sep 2026 07:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.83.148.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789631791; cv=none; b=pb+FQPpR2CBhFtNEAHw4uhmbofe4/SHFmrlCXRdqaRMc2p4RMJ+lmIrf4X9H+PqLneM0bBr/LzX3+R+pHt5rr+5D2OVFkCk5N5gexnKFeKShML9D6XCRzlGouI1ulwGs71oUpmz3PhXpbH1KgC2NJodesZJ18t2xAF/4jyH0E0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789631791; c=relaxed/simple;
	bh=WZ/Bea7rwxOqc5xuRmAqZ9zK/KsMvwZC82BbYSthMfQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kYT/8a9e4fjfVe8Yh0B99wI48Vx8ycugP/OfeFyyS8uNWMMeyOYPJEuFmsu4c9JZN2Qbu7BOfoCS6haYP3VcGt4rUhgE6zDoS01pzaZuI5InbCnan7yxocri5hGV4qAIGw2qjKEWMjBqG7nYE1cN3Sa57o9yVi4827dFSN1pv9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=mcFPhC/r; arc=none smtp.client-ip=35.83.148.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="mcFPhC/r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1789631789; x=1821167789;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xuUW1wDEOR1JTwRDOLRr2wDuGAZXd2rLzI0jO308ljo=;
  b=mcFPhC/rBtrzZKNEtq6n93ksfbQ0mNaI/iSK9btqW1ktnakkt6gvQA2R
   Q1u9UDzs7/iANA9ppHtFniDMFnpwHRPJuyj644t2HExiPqNpoZc583TP5
   ZNqFi191c+0CnGiDUVvXOGDYxgK8NZxhzP/4EAMZCqEiCF8stllduDNIq
   Cdaq0Cm/jn8jf95705jJHtXsEtvq0RPpf3ApALRpSi2Z/DhjFj2hrcl9a
   mt6ux4TOHa543Zjmstjo6GXLJk4Aee8y+UozKXjB2fIhYB4E99iqQdX+v
   dilESKle0qMNqyRT00YBNe59ZajIILFU+Ww+GsDVocUmu3G8NG/z0YO0j
   A==;
X-CSE-ConnectionGUID: cF6XnPu5QNS/g2lzk33Wxw==
X-CSE-MsgGUID: JId47upJT7+bFz+ElLF1Bw==
X-IronPort-AV: E=Sophos;i="6.27,103,1787011200"; 
   d="scan'208";a="28697243"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 07:56:24 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.51:24358]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.16.195:2525] with esmtp (Farcaster)
 id b4cb260b-eb9e-4c95-8112-b1f3dc184fde; Thu, 17 Sep 2026 07:56:24 +0000 (UTC)
X-Farcaster-Flow-ID: b4cb260b-eb9e-4c95-8112-b1f3dc184fde
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46;
 Thu, 17 Sep 2026 07:56:24 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46; Thu, 17 Sep 2026
 07:56:22 +0000
From: Eliav Farber <farbere@amazon.com>
To: Rodolfo Giometti <giometti@enneenne.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Andrew Morton
	<akpm@linux-foundation.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Eliav Farber <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/3] pps: clients: gpio: propagate probe error codes
Date: Thu, 17 Sep 2026 07:56:09 +0000
Message-ID: <20260917075611.47881-2-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917075611.47881-1-farbere@amazon.com>
References: <20260916182641.9768-1-farbere@amazon.com>
 <20260917075611.47881-1-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D036UWB001.ant.amazon.com (10.13.139.133) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

On the two probe error paths that map and request the interrupt, probe
overwrote the error from gpiod_to_irq() and request_threaded_irq() with a
hardcoded -EINVAL, hiding meaningful codes such as -EBUSY, -ENOMEM or
-EPROBE_DEFER from the caller. The request_threaded_irq() failure message
also logged the IRQ number but not the errno.

Return the actual error code from both paths, and add the errno to the
request_threaded_irq() failure message.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
Changes in v3:
- New patch, split out of the pinctrl change: while converting the probe
  error paths to a goto, Takashi Sakamoto noted that the hardcoded -EINVAL
  discards the real gpiod_to_irq()/request_threaded_irq() error, so fix
  that separately first

 drivers/pps/clients/pps-gpio.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pps/clients/pps-gpio.c b/drivers/pps/clients/pps-gpio.c
index 73ec2c7335e5..038c55c5f7d4 100644
--- a/drivers/pps/clients/pps-gpio.c
+++ b/drivers/pps/clients/pps-gpio.c
@@ -165,7 +165,7 @@ static int pps_gpio_probe(struct platform_device *pdev)
 	ret = gpiod_to_irq(data->gpio_pin);
 	if (ret < 0) {
 		dev_err(dev, "failed to map GPIO to IRQ: %d\n", ret);
-		return -EINVAL;
+		return ret;
 	}
 	data->irq = ret;
 
@@ -197,8 +197,8 @@ static int pps_gpio_probe(struct platform_device *pdev)
 			  data->info.name, data);
 	if (ret) {
 		pps_unregister_source(data->pps);
-		dev_err(dev, "failed to acquire IRQ %d\n", data->irq);
-		return -EINVAL;
+		dev_err(dev, "failed to acquire IRQ %d: %d\n", data->irq, ret);
+		return ret;
 	}
 
 	dev_dbg(&data->pps->dev, "Registered IRQ %d as PPS source\n",
-- 
2.47.3

