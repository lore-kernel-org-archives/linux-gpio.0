Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D2F41BA94
	for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 06:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790232933; cv=none; b=CCHqGbzPRJl+m1SPhZv48pDbhs4Zkr0H0nOpPoiFOqotewDwZwvJqMC5vc//QJtDs+DEK6/Ww9TTg0eLu25ZHaLndYc2PimQiba49BVc2y9HsmSTknTHwCs1r7ve3ieDoQg3a+32OkDpOFzWlsYh28XAquilN/jUZj/dWA4HgoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790232933; c=relaxed/simple;
	bh=ni7djPGe551WBpsNjE4sIwjwAp2hHFtV/81edr309D4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bJxcYYx3AHeVdrtvYBG2KqdCa0/Nilb9vcojPVpMNBjkqejE7n4MpGAvGP53zJMdCw2e8GuKJeFPgCVQdB2sSC3nVMgfFEWnoBzjga94SfvQhkjmn9yEwV7aXSsIXvsxmbDymH+MM6aev0hdO8G4e6kdsoTVqv0T7rMRHy7oIB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BguYgDUC; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BguYgDUC"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e8185e037so9057165e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 23:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790232918; x=1790837718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j67H3MkII5VwRyrYUKsJD5OK0/J8mlXhxptg84+Njcc=;
        b=BguYgDUCbqI/cT7L5gArRygY87z5RES5QHM/eEq9954u9XL20kr6KFU+wA3I2ko6oO
         dwXcQrmbJ1ayF+E3xFgFJ4/moWQ7fWum8cELWLru4R3q4yAOfGL0s8yVRABlcwAtVppF
         JSCqvHo2DvpR5ir8yRAB6UJSbGifSG71+VJBiU/SO9MX4JgwApdt8KNksq9rqcKNPLYe
         bEjWQiopVboLHr1T1q1t/UYWEqYzG2/h7hYQD4AjL6WFneFsVpDwAYx7dPHAD3gA0+cB
         ekLmm1ySZMoxya9+5YotoXKU3sxqqh35yQNKCPTjaRZmSDtEhpT4fa4sNPaxvgLiFUdf
         mRBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790232918; x=1790837718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j67H3MkII5VwRyrYUKsJD5OK0/J8mlXhxptg84+Njcc=;
        b=bcJXSaE0wV/BEry+vg7knSByneREDotKppE79krayev4sWyAMAr5v6yHblbOiSFR2E
         MEMrfnm3/J6i9pOddnIyiY1SNtoSHv92ljEzxsQbWcdsVlBL2wTN/soZ/r+fxdJXdwqH
         vneYiNGNI4M9WOBYBBclr5W4Je/Jy1Knn1fIdNL/wzFPoP8bP7Oz+5u/Xgetqjb+NhJ7
         C73W223W3N/YS29FjEeEsmLbB5Swp6NA3H/kN7IeHvoutDlmxcCrcdAnVZ+NqXvFRN+C
         id9fyyYpvm8Y4HV9Q85dsWwm6rjmPWb21qO506SAIoPJ4OhVKUrazSf43pfxczbgDo9J
         pmKw==
X-Forwarded-Encrypted: i=1; AKwUvBzHkZMHo/6CtQoTihbPFe3ypZPz9HDRZ9ldvUWFAMcWQbQfF7q3eaLhBOYwuWa7I1EcI09AEZQg693H@vger.kernel.org
X-Gm-Message-State: AFuF++k/Skg5rSWveKyOSqWWTM10Mql/oPdPV+RtRmXIT/cEoOPFE/Xn
	bdSwPdt+A2NJWoCMlih6gBZjhNWLW/WVUd1tI9/r7EPQQdcjCMCrvKxz
X-Gm-Gg: AYBFou2JygWRuU5+nSpaBjnh9y5Bw5ANo882Sl3ka56cYES8uZP1QIysAR2dYQQU0j6
	2V5dRej9cYWQ1sY+Pn4KdnqjeT8oHqwl+bUvskjK8SPMa0O4sfS0DBn7dX5nHf1vxTRAY7lIhzY
	FgP3Kr4lJI8GrCo4iP0ypR6JP6Sj/zwzu4e6NzD+nnUlBUu5Ig782Q7w32I1/ZuoxGJdzdL3PYl
	m7miFWmtWMHdMz2gCqW66rT8Nft9xi8MpwqG+aLCxKqwFIZhL9bUPV1mkPqRIPiHQpP2hpAhKkl
	CdWfcxWDfWeZvH/t17pssTG1bF5q4Pnzn2KdVexjO6Q/wYWdyFsJ7CzFKXFP6O8noGHELQQ7LzO
	fx/jMsbpfsQwC7AcYVsmCXpdIDvfZe0uFW64uoHkAkDY2Bh6ECf0NqloKMW79v3AHYTNb0srrjz
	Sv4MQcKHXmFFa4E+bLNfIvyY8Eh+NprC9xoEkWFQyMhjhgLhns60xfaMkSl06xKSe7PJmNdqEYK
	VwU
X-Received: by 2002:a05:600c:8b71:b0:49f:e2fe:c362 with SMTP id 5b1f17b1804b1-49fe6707e26mr18932215e9.33.1790232917539;
        Wed, 23 Sep 2026 23:55:17 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5bae43dsm43552095e9.5.2026.09.23.23.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 23:55:15 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	kernel test robot <lkp@intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: include linux/errno.h in consumer.h for ENOTSUPP
Date: Thu, 24 Sep 2026 08:55:14 +0200
Message-ID: <20260924065514.3678640-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The CONFIG_PINCTRL=n stubs of pinctrl_gpio_get_config() and
pinctrl_gpio_set_config() return -ENOTSUPP, but the header only pulls in
linux/err.h, which provides asm/errno.h and not the kernel-internal
ENOTSUPP from linux/errno.h. A translation unit that includes
pinctrl/consumer.h before anything else fails to build:

  include/linux/pinctrl/consumer.h:110:10: error: use of undeclared identifier 'ENOTSUPP'

Include linux/errno.h explicitly.

Fixes: b44aec87658e ("pinctrl: make the CONFIG_PINCTRL=n gpio config stubs return -ENOTSUPP")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202609240855.U59akHDO-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202609241240.61Hz5rix-lkp@intel.com/
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 include/linux/pinctrl/consumer.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/pinctrl/consumer.h b/include/linux/pinctrl/consumer.h
index 7be49d447426..81e7866bd2e3 100644
--- a/include/linux/pinctrl/consumer.h
+++ b/include/linux/pinctrl/consumer.h
@@ -12,6 +12,7 @@
 #define __LINUX_PINCTRL_CONSUMER_H
 
 #include <linux/err.h>
+#include <linux/errno.h>
 #include <linux/types.h>
 
 #include <linux/pinctrl/pinctrl-state.h>
-- 
2.55.0

