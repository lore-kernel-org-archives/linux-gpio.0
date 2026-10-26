Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792987365;
	b=XDQRJF+OxyjY2KvuRYCvzy0Y9w1Ex5/bkKMf039lanh2CRxSNcpDTa9M4wtrwCIBmTgY
	 qz9uBKmU5MQ3BBAwhJEGJY4tBdzzhnRppnXWqtj/GFS37NgMRVp8/DAbCL+LcRUYerG30
	 ChmiBjC29I3rjIihD+6Z3CFzitKjRernOn0mHzGo0Aax03dNYnXwSxfAvSaA90GZy5hbt
	 eAy5hPDAQ3mRxXlyVmoigc7/8xueyF9PR2ISXLOehNjA+Sg/UpojnSQJYZ0O8ZP0EkuUU
	 hLGmlQIFKhgzvgsvqIwdD6jlew5Hh8LPKMsc0Zh2wPXB0lmR3di/fcmasIuyHtuvfhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792987365;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=K2jKhwM+YQiKdSr1TcQzqEzMoQpUEpx9bgQiDQX0OfY=;
	b=CxNuDh45Q5Yu77mfhosliLvAhZXd4dCTHqtBZUohJaqB2EcN1N9DFLib5tVnLWJIjRj1
	 vCjf0ufgQsarr5aIv0QmgvGUfzAYYoaRXG7eHEF53S2+f5vn5qm4BIpPxB6fXHsFWZvgt
	 7o2mdNR87l3rggfTfDNSI3pvuIozP7hu+vbZz+DlKpB41WEhB+iF3LQXD08lpcR4j4gFZ
	 FVEJNuaFdYww4DPRmFutmJcSncvJLNf0nIWXOD10R4hwM5V3fu9NaYazhJXH5tNGeUdaX
	 BSJYmaBnNUXQET35IiA5PD6SgE4soB6jm/FM7xnO03MELI/2Iz7G5JOp3XNO9Wy1GGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ayyPxwWM;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60688606A31E
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 04:02:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60688606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ayyPxwWM
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e985106c0cso21670175ad.2
        for <linux-gpio@vger.kernel.org>; Sun, 25 Oct 2026 21:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792987365; x=1793592165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K2jKhwM+YQiKdSr1TcQzqEzMoQpUEpx9bgQiDQX0OfY=;
        b=ayyPxwWM/lb+H5VABRhht0PR6vZEeUivf9sh2Rgba0uC+hcvHTu/6mrShgE43B9ZT/
         kMs218fUY4beR83h7cZSyjRDyrIsJUF70dAmMY77n2GZ7zShdhLZofVUAk4UCxtWJFnO
         x0vswuv9993aAFPfzJM9bDcFhz8jw8VEIr3g32fettpVMclgL0mMHLxjWO0iv6YiGhmu
         RtvYkwSdBW0zd0sZeheju6ID8IAOSSf8yfkDe8DJCalQFyrQ39ydaP4S5yjQ7P/6aHa9
         nAVcmEqSej2jmssIaA28ZVHJTo47vL332VCVpSHKoNrOMFGVtzVQsfrrEGpE0x/yAu9P
         lnRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792987365; x=1793592165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K2jKhwM+YQiKdSr1TcQzqEzMoQpUEpx9bgQiDQX0OfY=;
        b=RKy+sB7qw+NFSa6yd4X3kC+p+Kn3gosGLNUuXvrNYn6D8GkcORuybpbmv+2qXa9Cst
         tx9ROEVZn8UNcPu/EhV8qvzOeIoalWM2q1rKEIRIlqnuqcrazaYnDo6M1ssSSQDtjllg
         dRRwX6KQd7CBIdRkIOn9F6FbTfjRu0eyR94+gcHArU+jUDnObPlPhHQ4vSdswC1FsqAq
         Z/4UYV9j1/0/y94oGph5hlOscDT8R/C8mBKmARjyK4UJdTdT/FjK65QzziAIUOShg/zJ
         xEPJtmWvgai5QhfgqMQZQazP0ugH2RqECPwpwr1JUXasXKcRHNPaEoVXHba154GDguSX
         9ZSw==
X-Gm-Message-State: AFq9FYJbV7YRUhUTrYZ19MaUrAJdVYwYltC2aqR4k6/+XHxTIxRMsFWi
	xNaJ1Xu0vHePI6oGVP9xQE3K19V4W1a9USDKRBBeM+WbZ+zFKmEpQKES
X-Gm-Gg: AYBFou1SlQ5MdaQ7zAHKxCNOqX0Lmsb5HwYo+4dTfw/0Dqh6bVHqbaV+R+6Tlhvoed7
	LlVhBZTuC2ri85s0fcgCLlhLhIZ3LHJn/Kp+4yKunwFG7z8h/bQsKS7RGJYB5R7MoS7t+Z6LU3d
	08IOUJI7hMQpAQ0BnzTQOYZ4dvyyQLN7kMCeIN6gEYWEKevtJf7QKo0B5JJGxj7JkrGTgyAJCRL
	WElkLm2cY8lsmCQBnDeD8K3EnARk/WfWqytV30nrYi4xvyJmWj/2YIC9ZfYDBUxnODi7m0iXDnv
	Gxa6pKLAt2V2hz2fZlBkVOVWOLHT9KPs0Ds4WmVV0J3qJ/0J4HUQu64mbEdDjrLg0YwbjnKLP/Z
	/Pd56FA6Hz+CrV/ecL+tIBMQjic34ChpOVld1r2RaNSZIne8i2Qkia1j3ZWOFLGjw1O9C9g6Sv8
	BmZ7LKb325yqeNIhstgXCqXCjX6R4YK9fdH693xnIFnp1iLHHn1ZA7RSMvzOx4gV7Uxq/z4EgXQ
	EsFYMk+3kW16JjC/gKNrpqGyUtpZA7jAR+M0+ccjBEME6HG6fhIaa3jh79vM0v4vuvjzbNgU9SY
	2l6735hha/sttvFRMYU=
X-Received: by 2002:a17:902:cf12:b0:2e9:73db:3c78 with SMTP id d9443c01a7336-2ea9c63efcamr46730195ad.17.1792987364597;
        Sun, 25 Oct 2026 21:02:44 -0700 (PDT)
Received: from xiaolei-VMware-Virtual-Platform ([219.142.21.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b22416bsm10626705ad.72.2026.10.25.21.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 21:02:43 -0700 (PDT)
From: Xiaolei Wang <xiaoleiwangxiaolei@gmail.com>
To: aisheng.dong@nxp.com,
	festevam@gmail.com,
	Frank.Li@nxp.com,
	ping.bai@nxp.com,
	kernel@pengutronix.de,
	s32@nxp.com,
	linusw@kernel.org,
	s.hauer@pengutronix.de,
	sudeep.holla@kernel.org,
	cristian.marussi@arm.com,
	peng.fan@nxp.com,
	xiaoleiwangxiaolei@gmail.com
Cc: linux-gpio@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] pinctrl: imx: scmi: replace custom dt_free_map with pinctrl_utils_free_map
Date: Mon, 26 Oct 2026 12:02:30 +0800
Message-ID: <20261026040230.22338-1-xiaoleiwangxiaolei@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wang Xiaolei <xiaoleiwangxiaolei@gmail.com>

pinctrl_scmi_imx_dt_node_to_map() kmemdup_array()s the pinctrl configs
of every pin into map[i].data.configs.configs, but the driver's own
pinctrl_scmi_imx_dt_free_map() only frees the map array itself. The
pinctrl core releases maps through pinctrl_dt_free_maps(), which calls
dt_free_map(); the duplicated configs are therefore never freed and leak
every time the DT node is parsed, e.g. on each (deferred) probe attempt.

Replace the custom dt_free_map with the core helper
pinctrl_utils_free_map(), which frees the configs of each
PIN_MAP_TYPE_CONFIGS_* map before freeing the map itself. Its
signature matches pinctrl_ops.dt_free_map(), so the driver-specific
implementation can be dropped entirely.

Detected with kmemleak on an i.MX95 board (FRDM-IMX95).

Fixes: b755521fd6eb ("pinctrl: imx: support SCMI pinctrl protocol for i.MX95")
Cc: stable@vger.kernel.org
Signed-off-by: Wang Xiaolei <xiaoleiwangxiaolei@gmail.com>
---
 drivers/pinctrl/freescale/pinctrl-imx-scmi.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx-scmi.c b/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
index 613552e35070..8cbd66950848 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
@@ -153,18 +153,12 @@ static int pinctrl_scmi_imx_dt_node_to_map(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-static void pinctrl_scmi_imx_dt_free_map(struct pinctrl_dev *pctldev,
-					 struct pinctrl_map *map, unsigned int num_maps)
-{
-	kfree(map);
-}
-
 static const struct pinctrl_ops pinctrl_scmi_imx_pinctrl_ops = {
 	.get_groups_count = pinctrl_generic_get_group_count,
 	.get_group_name = pinctrl_generic_get_group_name,
 	.get_group_pins = pinctrl_generic_get_group_pins,
 	.dt_node_to_map = pinctrl_scmi_imx_dt_node_to_map,
-	.dt_free_map = pinctrl_scmi_imx_dt_free_map,
+	.dt_free_map = pinctrl_utils_free_map,
 };
 
 static int pinctrl_scmi_imx_func_set_mux(struct pinctrl_dev *pctldev,
-- 
2.34.1

