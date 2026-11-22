Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795354452;
	b=3rc87XOqGcECildxJYeH+8HnKPsOMMeGZwK2xPgdyezWaK6nfLbfryYmgGBdztWBZc6D
	 +Hb5v78SwxybeXA5u7r04QeI1he/U3iVhA9nn6pnCWF3lri05noSIMeyPJJ7rjks8Ai/t
	 mh/3YZ+oZYxFlt9qee89qc0RQF6qeeHU2SZ8+vMLBr04VdU0YaVFZgUbnGn5ZV1Ypiuzw
	 EHdlROxUvVt6zCiJul7oyOxg8bWVWVufEXMcamhfWTqCCquzrRDCsj/L9Sb44Lsm1LHx6
	 woIPCntBBoEszwOfPHwODBb9xp+F9aeCIbduYSMW+ZW8UYEzr/M3IZ2kZV9hZjtSJng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795354452;
	h=Received:From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=d2iXfhsAP2o2d9pxyEzUWRuXQx36XV1ORMOXwKM+vTg=;
	b=qu1ZO7s5ES0RgsK5Akd4++dUaAaEcJEEmrshJIiGFAR/XwAxTO1b+XmRHset50qc7R6L
	 DR/byHFTqfnjHuU2HjScyUb+iMbn+EbQoj/OeJCZgK94tncVYPuDkl/NjLuAz7sQci/8Z
	 AGcQNHlHBhyuRYzaLWuUp8KnbGiHyNtpbRfX9UCNMrBf1trcYoSpE2PaYlOzCNTuMVHEx
	 s42MwratQO+mbQMMkq3aW3KGP6QXis2iBeM4V5EiZU8krc8Y/AItps5QY+z+iqwHn8IG0
	 BWCUk8hm2+KGD/DFFS0Y94ql/KoSxvQdEJ4+ZFCVDvE3zPJTXyDhMSL3NNvHzQz8LoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7130F606A68C;
	Sun, 22 Nov 2026 13:34:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B6C91F000C4;
	Sun, 22 Nov 2026 13:34:11 +0000 (UTC)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/4] pinctrl: qcom: Unify KConfig choices between clk,
 pinctrl and interconnect
Date: Sun, 22 Nov 2026 14:34:03 +0100
Message-Id: <20261122-b4-qcom-kconfig-unify-pinctrl-v1-0-f0068f161636@oss.qualcomm.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2Nyw6CMBAAf4Xs2U1sQVF/hXiw6xbXRwt9GA3h3
 63KcZLJzASRg3CEQzVB4KdE8a6AWlVAl5PrGeVcGPRab5XSCk2DI/kH3sg7Kz1mJ/aNgzhK4Y5
 trWlv2rrZ6Q2UxhDYyuvX745/jtlcmdI3uhiBx1zGadHm+QN9lN2/lgAAAA==
X-Change-ID: 20261121-b4-qcom-kconfig-unify-pinctrl-732c9b734825
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=985;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=sf4lPsw2nAo/P+YhPxV17gp6nPlpxB9qkn1qCU45JiQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBrAu9MJeobv/tTE0LisAi1DPRgj029t3wdcw5oD
 k9XoqCliBKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCawLvTAAKCRDBN2bmhouD
 11BOD/wOWxEE1NUCUKcs2+SyE+AzNrVphSVPqzKnO9eImXvzOFeSjI6oyVZEIc5IPeLgkXHPufy
 RKKm6ZwsjTo8vnXQg5P7Zx1GOHdK7zERmUBLIB68MIYVWmELnuqAiDB8OvykpN6EjzR7aQgHOfH
 lIe8vI3B4HmU1x4AYlvkPg7FbbI8iZLItyoPTgNRuoRbVLDcS0jnn5BHaUZKvehAYUSDh7PPc+h
 FGpvlZ6VxRp577xkWCqcSsW13z4+FVVczoipzr6QD/9Do6EM1dj1Zdh5g/iZrCeSsvet12v+2TK
 YYh1BhDPg1zPsd70Nzrq842p8H6ei/PgirjPgVeVUqSFi8Hbd3YVvsWszVE3zyCkuQSdIxV9F8f
 h+/SHsrJsXP3ij6LBLqKXEM4/2Opx144ZNL1fpfvwyZE9jiYXhMuHAQKaBJ08svPHUSCOlcdjvk
 mIUIN0iyjBDBpOrdQ6Ct5RI+g7KVFMTe4Oxc2Zxh6iSP3zKNNbfyJUbFHUGRQzONJIeTz35kpAp
 eVdv28tKvc7iyPGLZGpZhWikWZYvbZKzxzY0c9aPxorCZK/5Xcgkoy1iopM74fUUNNVHQ7JErTo
 aEYQduZZudur0asiutDtfCf7RzJuTHj0KN8UT2XZtbIQX9MhrPLVJF0xQpX69NTS7sYXUvjH/lZ
 fOsRYPjj5kKWFrw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Recent commits adding defaults to clock, pinctrl and interconnect
drivers left a options inconsistent between them, e.g. SDX65 clock
driver not enabled by default but its pin controller enabled. This
should be a consistent choice - we want by default all critical drivers
enabled.

There will be separate patches for clock and interconnect.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      pinctrl: qcom: Consistently restrict MSM8917 to ARM64
      pinctrl: qcom: Enable by default MSM8917 and SAR2130P
      pinctrl: qcom: Consistently handle IPQ5018, MSM8953 and others
      pinctrl: qcom: Correct indentation

 drivers/pinctrl/qcom/Kconfig.msm | 67 +++++++++++++++++++---------------------
 1 file changed, 31 insertions(+), 36 deletions(-)
---
base-commit: 6f925fbadc8a5c6908d4c5294d0d9c757c61aeac
change-id: 20261121-b4-qcom-kconfig-unify-pinctrl-732c9b734825

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

