Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2741B3955D0;
	Mon,  8 Jun 2026 07:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.178.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780905476; cv=none; b=gKkt9LmO96id0TbBlacEd2NFKhRVJv5V3M5xJxaT8vAoOSckcWySL3OeWpMgi5KJORZw1Oq1WFgnGpuCeiwTd46Cfd/uhaxzigedpKGn6L/omqUGDYAii1k0Y5MbK4caxkKYYx0PgK3Xysm11sFBA3Cbe8ejgA+hE2EQFSNlbnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780905476; c=relaxed/simple;
	bh=0M/4TAkInq3fH+D8c5Ym1xl7CJJverf29yLn+S61YbE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AH+g99ogfLjlnNb2ZMZnXjo6nsUkcKIgIrF00e1dVTlHBCscwIRb9oU/CtI9QUnnXkVFFoPqUAa/1752rx34ja3sp4665131WMEDMsCNU+qZ37Xbccoa+ejo4eyH19mQ8OfEE3X/TVVgLx/JUa7rdId9M2SeMGYERd5HZ3hG3oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=QtZvwqNB; arc=none smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="QtZvwqNB"
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6587sYqF3637646;
	Mon, 8 Jun 2026 07:57:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=XgWdjLKRg
	5pIGgXbBGlTt71drpnQ5xgLfxc8qLl0WUs=; b=QtZvwqNBZXaxk/Xv9tozJKhF1
	VHWRDf0nSs63CVek2SUNQvcl9boqLjNBxyvZVkiUn+vNm71DUpy8EwlXXUWtjR24
	OL5ge/t6YI3YIKUbcPdvkydrPH16wwMhdAW2lNAfHeJcNSWQcQPzgrkVMRHZl/fw
	u0ExUUpdVfknfEC39ZMhBvYkaGmTfXH5eSdUr1tbXP3ojnUxMw7vcibPFhST16Eu
	9MLa8m4QCRIHxq5YUq1ae47RoDhJOspujt6Wpbe5hdCRVcKKecCPX4MoyPl4cjnd
	m9HidKUoffnZBH3yfJoArG0gERXylUjhS+d9fmCO4M1xXJkZB40XR0IJWWcVA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4emah7abty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 08 Jun 2026 07:57:45 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 8 Jun 2026 00:57:45 -0700
Received: from pek-yzhou-d3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 8 Jun 2026 00:57:43 -0700
From: Yun Zhou <yun.zhou@windriver.com>
To: <linusw@kernel.org>, <brgl@kernel.org>
CC: <baruch@tkos.co.il>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <yun.zhou@windriver.com>
Subject: [PATCH] gpio: mvebu: fix NULL pointer dereference in suspend/resume
Date: Mon, 8 Jun 2026 15:57:42 +0800
Message-ID: <20260608075742.2680700-1-yun.zhou@windriver.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA3MiBTYWx0ZWRfX9fRGdo+xb3K9
 QkQeXYeKv8PZPxHV9stMhtu5UCeoSVbTmAkfeE2VoZbgrA6EBXWqXCSKIJB8KPjPd0xf5oX7rlF
 rfw+vFTPHC2i0YMXOTRGvch1NR/IJkOxv3+6WRvFu+9TQVQO2d9wHkeD6UrAbkTcl35lJfzLy1H
 X0C9c8RKqfRwbvR75AoRXpKPrFXTYGBshDi8sX1b9/fF6ux+jCMmpZkqnwji58/RoXHgIYwJFMZ
 UIFrC+H5a19d5zdEufJZYvvR6pXR2uFczpDDPI66cY9qmlSwBb+hYSrUhGkc5xsbFYBfWnIBEly
 rB53VqL9+jAUU204WpEvbycqBv0pkJl4+e1nNhqwit6W4G90DbirDU4epj913pXbjcTLCS/czze
 /u9FAWziMZ6tlCQqRwbeZ88YRotbaMpVKUJQstnx1ZNj9q4bhgaITgoOf5/4mY9EQh4hiW5Ksvl
 lELKuibndOqK1ubegdQ==
X-Proofpoint-GUID: toaX4I4pKbGwWZTHtB6FQKV6aWzr7QfB
X-Authority-Analysis: v=2.4 cv=NbDWEWD4 c=1 sm=1 tr=0 ts=6a2675f9 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8 a=bgq-gzGYpSYZ73kGfkMA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: toaX4I4pKbGwWZTHtB6FQKV6aWzr7QfB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1011 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080072

mvebu_pwm_suspend() and mvebu_pwm_resume() are called for all GPIO
banks during suspend/resume, but not all banks have PWM functionality.
GPIO banks without PWM have mvchip->mvpwm set to NULL.

Calling mvebu_pwm_suspend() with mvpwm == NULL causes a NULL pointer
dereference when it tries to access mvpwm->blink_select.

  Unable to handle kernel NULL pointer dereference at virtual address 00000020 when write
  [00000020] *pgd=00000000
  Internal error: Oops: 815 [#1] PREEMPT ARM
  Modules linked in:
  CPU: 0 UID: 0 PID: 406 Comm: sh Not tainted 6.12.74-rt12-yocto-standard-g4e96f98fb7db-dirty #353
  Hardware name: Marvell Armada 370/XP (Device Tree)
  PC is at regmap_mmio_read+0x38/0x54
  LR is at regmap_mmio_read+0x38/0x54
  pc : [<c05fd2ac>]    lr : [<c05fd2ac>]    psr: 200f0013
  sp : f0c11d10  ip : 00000000  fp : c100d2f0
  r10: c14fb854  r9 : 00000000  r8 : 00000000
  r7 : c1799c00  r6 : 00000020  r5 : 00000020  r4 : c179c7c0
  r3 : f0a231a0  r2 : 00000020  r1 : 00000020  r0 : 00000000
  Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
  Control: 10c5387d  Table: 135ec059  DAC: 00000051
  Call trace:
   regmap_mmio_read from _regmap_bus_reg_read+0x78/0xac
   _regmap_bus_reg_read from _regmap_read+0x60/0x154
   _regmap_read from regmap_read+0x3c/0x60
   regmap_read from mvebu_gpio_suspend+0xa4/0x14c
   mvebu_gpio_suspend from dpm_run_callback+0x54/0x180
   dpm_run_callback from device_suspend+0x124/0x630
   device_suspend from dpm_suspend+0x124/0x270
   dpm_suspend from dpm_suspend_start+0x64/0x6c
   dpm_suspend_start from suspend_devices_and_enter+0x140/0x8e8
   suspend_devices_and_enter from pm_suspend+0x2fc/0x308
   pm_suspend from state_store+0x6c/0xc8
   state_store from kernfs_fop_write_iter+0x10c/0x1f8
   kernfs_fop_write_iter from vfs_write+0x270/0x468
   vfs_write from ksys_write+0x70/0xf0
   ksys_write from ret_fast_syscall+0x0/0x54

Add a NULL check for mvchip->mvpwm before calling the PWM
suspend/resume functions.

Fixes: 85b7d8abfec7 ("gpio: mvebu: add pwm support for Armada 370/XP/38x")
Signed-off-by: Yun Zhou <yun.zhou@windriver.com>
---
 drivers/gpio/gpio-mvebu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 22c36b79e249..c030d1f00abc 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -996,7 +996,7 @@ static int mvebu_gpio_suspend(struct platform_device *pdev, pm_message_t state)
 		BUG();
 	}
 
-	if (IS_REACHABLE(CONFIG_PWM))
+	if (IS_REACHABLE(CONFIG_PWM) && mvchip->mvpwm)
 		mvebu_pwm_suspend(mvchip);
 
 	return 0;
@@ -1048,7 +1048,7 @@ static int mvebu_gpio_resume(struct platform_device *pdev)
 		BUG();
 	}
 
-	if (IS_REACHABLE(CONFIG_PWM))
+	if (IS_REACHABLE(CONFIG_PWM) && mvchip->mvpwm)
 		mvebu_pwm_resume(mvchip);
 
 	return 0;
-- 
2.43.0

