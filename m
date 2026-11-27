Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769410;
	b=rmMtTlMTTq068WEDVYGRXv65ujyKWI/MKFD3AGPm+2RTd9UkA8exBa1XwYXtJG9j78XA
	 Dz25phhkbA+cuqHpWoFptztclwP+HFc0dHWcmywyV1RL+q/9ulbwNk+uOrLfQmqRnAACy
	 Yri/PvvWuxe77Txg2WN4grZC9yMzDJ4Z9rSkt1sSE2kU+Ut66BvPlM5l3Fleb2QxteU6O
	 lCYEOuNN3v+LQxCy8z6JQ/GV3uT+NpyTyy/Wr1CMegGeTnUJNLZewTGSzaREjMlNHZt+e
	 Yp7mLw1wBzLgIXJMjJemBmy5ejLlHa48FBuqoOPGGjtiZrhyvMuF501HsXWvENnIDVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769410;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6vVA1OTONlzXQ64t6vgGmxkETkrXzMbbt0qtf4DPU9k=;
	b=ubvM86/wJx6cxMEV264mDnx7pZ4HY2+T3iXWhZmqNlE2pHAatC7yMOGmR0S+D3npsAaC
	 RZTz2ycPsbxpKq8XP/DRtvllAcjw7rMimCGJ53MwIZqFp6vZ52VMvGkRjQ7tZtoodxHeV
	 gsNxg1SBbD2vh4YdMJZ9Ar/rEH+1gxQT9ELPu9JIvb7cPk3JZv93vONbGgTCVqMC9keH2
	 NPj0+N6d/b/1AKfYXyLpvpQX9lQ2EFrFvaAnhldTroJucoDuo07Jvv5XMA1q+ksMj2yik
	 3bFQ/1REyEDmON9Sl/R6GY8rvFhn7sBGbzbfkqaG/nqGzizcWXgAdkIxSLuUcTlMEqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="M/prkWfv";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jQjcXe6L;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EF9606A68B
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 08:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69EF9606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M/prkWfv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jQjcXe6L
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GpEK560431
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 08:50:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6vVA1OTONlzXQ64t6vgGmx
	kETkrXzMbbt0qtf4DPU9k=; b=M/prkWfvUL+aBOyCrTKUeLXVongmOLg6dpnTti
	f9RjKosgi6WG8psu8WR5YYWdRL0xfXU+ICqohI/YxEIaMl/Vnxiu2bIhVfKj/Hr5
	HF2VINEcl3jmATzmXDUEfFWQsPjYGme9/O+hYlZdsWrsUCTdDCudeaDyb3x+tMK/
	KeFibN3I3ftSf3hWKkPwfC1/VDL5GzqhxeJFjcrP1gww7DZr1C3NHc41PsCPDft4
	N6lcQPH+vEb2WhejZyldcs6PjwzAO0Obg6rVxRUjZqGQsepBENLAQIXrR2WB+IrL
	XPDVVXY9L/gDbpCmuB9z0z5DO8Ue09HfBLwcV/C1H7DTjH4A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqk3bq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 08:50:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f5844cb60so1292755085a.0
        for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 00:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795769409; x=1796374209; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6vVA1OTONlzXQ64t6vgGmxkETkrXzMbbt0qtf4DPU9k=;
        b=jQjcXe6LxaEC83ZqODpongs22tl8ezuDBQe+g6r3+N+TXvZlQkYZU0H/VzlNMt1GnV
         I4i1mpHQK4KTaLjaYvT6A0zPU8/M6yFYwpVj65w2SWcnOGOwsurIVntedPmjdM7YZpMq
         7PxCOmkBqelWdB8atre8hPIyC4U+2oMSyEhCUoMweVrBsU4JFVgGNVty/OoQW9+37yTo
         vdK7+UY35TYCAksFPiAbzoC9Fb3WW5hq81OIf5/p+gqGSL2l49vYj075+ZC/xvQhM/MU
         N0oATJ6+H0UBv3d2RjuuzZ06qxkABuNN1zdJQ5FLtDKDSTGbPjFiTC4lVzaI6TH+YK4m
         7xAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769409; x=1796374209;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6vVA1OTONlzXQ64t6vgGmxkETkrXzMbbt0qtf4DPU9k=;
        b=Gqp86jawoLi5Nmyx83eTalXyUgfQAcAwonf6vxVJL1AWIhYxGzmo1gJJKJmLTp4hAo
         Lhap6krdDECEblx8/2cOqruZACpS3QAGsEVw3wAuN3xagBU98d4Md2o0h7nFLSmkwEYt
         rMas25u1A8H3ZoQD9/uCKKQ10GpbkNbeVqax+FAoqZDNvcnNyBNHb1/qqjhWSfK7Jq4T
         hBNdEqbmX6GLKo9pdncBlZzE9ih+LBINFHgQ//wRR4nKd6QIsRcZUIsFrj4mWtYV1G1E
         XZEG49CR9y2fL1rNhLD0ttI2TkpAp1io0S5cLxeqcmFYWjtPE3XnHS2ZB33/X0KREWZy
         QcgQ==
X-Forwarded-Encrypted: i=1; AL+hErHyo6YDn8jXQ8hZZATLrLD5xU8qmwvlL4RfKqysW4S1p2qOYTuHw9QOoBeSrhOVuCOyjWCqy52YyeR1@vger.kernel.org
X-Gm-Message-State: APuU4Z/gk14IdrJcFrIyXiEyvbRQ8uu/yXilSFkdbM0ieD7hISg2PjqM
	9q/ESSXuCdNmcjnqpGSsCLmSu3U7vbrswVJDgYO6qOxG0ywvWrfK0ZsnF9U/dIx/PbKgHtCIj89
	tuQBxVf5xX3348aen3yn/vbNG0hmsdopaIOGjHB1SsrQWaWhVSc3QLo/In2LTEXns3plhYY6g
X-Gm-Gg: AZFdTZfLVpey+uWBj/4kiDAkxJ+p5XpAoyYxs+zFx1HDXKE2ZpYohOFjZL4iGn/uMAg
	a8E+K5K2lVHMyBRxdUn3p0lNHI+38zw+5jh9H04hjmLDu84iTGO2DnP7qIXJ3MrOjdOQwzHLa+q
	ciVVZepAFhsa+6XaZIhVzfFndF9dG8BaBerGe6KCFtBYYfj82zIWzeX+OC9pYEBKE8ncW+ounbG
	F3HEGsIZWn5IPfmJJrfxDLi2bWIaphtJwOCA85WhClLlokcGSOLQ1YtDZUchdKmMrFypPxUdHFg
	UP9LR/642fMnvfCclr1iIaHmB5ZoS9eA4amC6n/vzFf/lfutj8UAuEPCm2H7350shT4zkPAJYEm
	E8Yw5iPks4PVllrCXoqqKvG8UucRtPUXuS6Bw3GM3+2HiISw79gYjCzSGkPr3B1YEj4mqX7S4W9
	ZLvpDYLa6WEOsEpG6VsNMeBipMq1DJnbBsLRTgnaPs/NyFYRMjLNmn8Kypxs0Lrw==
X-Received: by 2002:a05:620a:6919:b0:949:7da0:af86 with SMTP id af79cd13be357-949b35723a5mr4256300885a.10.1795769408609;
        Fri, 27 Nov 2026 00:50:08 -0800 (PST)
X-Received: by 2002:a05:620a:6919:b0:949:7da0:af86 with SMTP id af79cd13be357-949b35723a5mr4256297585a.10.1795769408077;
        Fri, 27 Nov 2026 00:50:08 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm46329864f8f.20.2026.11.27.00.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:50:07 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] gpio fixes for v7.4-rc5
Date: Fri, 27 Nov 2026 09:49:59 +0100
Message-ID: <20261127085000.18053-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: c1Q10sNpd0aWPLm4oK0fiF8y_VdVIWlA
X-Proofpoint-ORIG-GUID: c1Q10sNpd0aWPLm4oK0fiF8y_VdVIWlA
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b094441 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=zypKjBJkCBVBe91fG_MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX6UQK+Ef/eWIz
 BnysdYhLRDcCK95KfvCW3XsBkM/95dTCCgb9tn5TLmPjSg055aEyUM+lKnGU0J8LiLW/lpoDFHx
 dN7isWz7zoFEXzFTbCfm2a/xqtm6gJs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfXyZeKNcY/fCK0
 XDXL8/BByoaZYNgSf5lOMHXRrzZXP56SSrvkXWvg4/WYcYjq6jzewVTTN8cUXllfQ4ktb04mKlA
 IZ0DxcwHsrIRCxGBG+p/AYPGxbV7nBrYej2R/xMBt+sPoHawLXrw8xufH2WqOmrpu4XT2csZww6
 qC8o87n9MTwtXEFP4AsTpT/xZkTNGrcKpBZzXxQ+oxdExMw+aABlz/GeaA9JcD+SyzWuvwOoUD6
 8v4kUxFdgVRmyw1aE90cbFRxWTLf0lpO0q463JDtCBaOY1YsiOJLGx0JpduknVb7avSO43O1vzw
 GcEyrcObELkDiHRwtfXQxNSsbmXYcA3ckRkx2IF0yW0FR5+WpxjZ7pWS3eWOQcwr48VMd6jUQcd
 /B88SYs8H/AsXcN6ZfAFdf1i6B/bMdILtdjXcFC0GcuexxX923VD1QT7QQaH/3BMYq4YSuGfaFr
 ULCeXbd/sBlxMvL4SZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270034

Linus,

Please pull the following set of GPIO fixes for the next RC.

Thanks,
Bartosz

The following changes since commit b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f:

  Linux 7.4-rc4 (2026-11-22 14:57:40 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.4-rc5

for you to fetch changes up to d8e27d04274746093f8d5a4e909efd9885262166:

  gpio: mvebu: fix Armada XP per-CPU mask register save/restore (2026-11-26 15:46:27 +0100)

----------------------------------------------------------------
gpio fixes for v7.4-rc5

GPIO core fixes:
- fix several logic & locking issues and resource leaks in GPIO
  character device code
- fix GPIO hogging for controllers using the three-cell binding
- fix inverted trace values in gpiod_get_array_value()
- remove shared GPIO proxies before freeing interrupts that are still
  requested by the parent controller and fix a race in remove path
- fix UAF bugs around the GPIO label cleanup

GPIO driver fixes:
- fix a use-after-free bug in gpio-davinci
- fix an issue in gpio-davinci where the driver could setup an IRQ for a
  wrong controller
- validate the number of GPIOs in gpio-mvebu
- use correct registers in suspend/resume in gpio-mvebu
- fix non-kerneldoc comment in nsc-gpio header
- fix memory leak in gpio-aspeed
- do not unprepare the debounce clock twice in probe error path in
  gpio-omap
- fix resume in gpio-pca953x: restore output registers before direction
  to fix potential spurious output-high pin

GPIO tools fixes:
- fix command-line arguments parsing in gpio-hammer
- preserve the device listing error in lsgpio instead of dropping it
  unconditionally
- return 0 from gpio-event-mon on success: we currently return the
  number of read events from main() which is interpreted as an error in
  shell

----------------------------------------------------------------
Adrian Ambrozewicz (8):
      gpiolib: wait for pending label frees before cleaning up desc_srcu
      gpiolib: free the label of lines released after their chip was removed
      gpiolib: cdev: do not free line IRQs again after the chip is removed
      gpiolib: cdev: don't sleep in the SRCU read section in read()
      gpiolib: cdev: don't leak the IRQ name when the chip is removed
      gpiolib: cdev: don't report a failed line read as an edge
      gpiolib: let the character device free its IRQs first on chip removal
      gpiolib: remove the shared GPIO proxies before freeing the remaining IRQs

Bartosz Golaszewski (1):
      gpiolib: use the of_xlate() result when hogging lines

Cong Nguyen (1):
      gpio: omap: do not unprepare the debounce clock twice on probe failure

Dean Sellers (1):
      gpio: pca953x: restore output registers before direction on resume

Guangshuo Li (1):
      gpio: aspeed: Fix potential coprocessor bank map leak

Jan Schär (1):
      gpiolib: fix inverted trace values in gpiod_get_array_value()

Randy Dunlap (1):
      chardev: GPIO common access methods: repair non-kernel-doc comment

Rosen Penev (2):
      gpio: mvebu: validate ngpios before use
      gpio: mvebu: fix Armada XP per-CPU mask register save/restore

Sahaj Chaudhari (2):
      gpio: davinci: use controller-specific MMIO for BINTEN
      gpio: davinci: allocate bank IRQ data before installing handlers

Zhu Jun (3):
      tools: gpio-hammer: Accept the maximum number of line offsets
      tools: gpio: Preserve device listing errors in lsgpio
      tools: gpio: Return success after monitoring requested events

 drivers/gpio/gpio-aspeed.c  |  12 ++--
 drivers/gpio/gpio-davinci.c |  26 ++++----
 drivers/gpio/gpio-mvebu.c   |  11 ++--
 drivers/gpio/gpio-omap.c    |   2 -
 drivers/gpio/gpio-pca953x.c |  15 +++--
 drivers/gpio/gpiolib-cdev.c | 157 ++++++++++++++++++++++++++++++++------------
 drivers/gpio/gpiolib-of.c   |  10 +--
 drivers/gpio/gpiolib-of.h   |  15 +++--
 drivers/gpio/gpiolib.c      |  54 ++++++++++-----
 include/linux/nsc_gpio.h    |   2 +-
 tools/gpio/gpio-event-mon.c |   4 +-
 tools/gpio/gpio-hammer.c    |   4 +-
 tools/gpio/lsgpio.c         |   3 +-
 13 files changed, 211 insertions(+), 104 deletions(-)
