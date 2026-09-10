Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503F1488210;
	Thu, 10 Sep 2026 17:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789061403; cv=none; b=pf4sukhgYOz5Z4bXCCpfLMGMxkxKFtdivDj9v4hb0YxQWlJb+dr9JKy3FFXnUbzlZgBVojqiDgZUO16SFHNJjfbJ6/KwZpmPwVzZQogGcPTLKmpsucpPXUXYZjejW+O0BVNwtsnvMDFjky56drRi4S1RslavByKw9tcfFvyHReA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789061403; c=relaxed/simple;
	bh=Af5OrrJ+bCyBshOoUk9uiJhzLB72aDPfATvZVCrpLp4=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=dRAYdrucPrvC1uVTVA0AkD9Tk3Xsresc21TR83ik/mNq3TqkWob/CpxRgQHN0D4AIInxLa/5r6u5XB8+thOBd/Lpf8uHRl0uc5t+jjCMGoGsCYVPkZaSW4b3Wz6ULxsy9ZlFePn/gF/Yinkf+JAmeoh+arZRlv6f8Aczd0+t920=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=jLTv41sI; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="jLTv41sI"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AF80uv3830389;
	Thu, 10 Sep 2026 13:29:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=WjjrF1YTCsE4rUcLZ6fjU952kYk
	Xe/913H32DPYOZtU=; b=jLTv41sI+TFB5UCNlRegchs7wl8T0Hcq82416t8Rnwm
	xInaLyxKlIDNl4spzJwnZNbEzVNVRY6GPgIfKuVWStsPT/qsdU2TKc1uKVCx/5ZQ
	64099mdzioG6fsCFgFIWipdF/n0gwUEWxNtzhrGF5B4KKsQu+lTXgZ7eL71ZX01w
	VXXAiXdpxKxNila5OqLN7dPwiLvkiA+0lnegohuVh2goNj/IXv+67nIhUJ2TbaOx
	mh8ItHuSHuce60dRt1L5U2Gni+hVHBPKpFUREJFVwJu8f8FFTQPKv5RWY/3tsqyH
	U4UUekPPEOhMEMM+djPYOkmCKFta51O/e10pztAYiXg==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4gkcxad1f7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Sep 2026 13:29:30 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 68AHTTDF037788
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 10 Sep 2026 13:29:29 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Thu, 10 Sep
 2026 13:29:29 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Thu, 10 Sep 2026 13:29:29 -0400
Received: from HYB-e1y2fvUQ3cx.ad.analog.com ([10.32.225.204])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 68AHTIdo018670;
	Thu, 10 Sep 2026 13:29:21 -0400
From: Janani Sunil <janani.sunil@analog.com>
Subject: [PATCH v8 0/3] gpio: Add AD7768 GPIO support
Date: Thu, 10 Sep 2026 19:29:09 +0200
Message-ID: <20260910-ad7768-gpio-v8-0-6aaaa15adeb3@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOXoomoC/23MQQ6CMBCF4auQWVvTltIWV97DuCgwwCRKSWsaD
 eHuFlaSuHwv+f4FIgbCCJdigYCJIvkpD3sqoB3dNCCjLm+QXGpe85K5zhht2TCTZ8qJWlRlI5T
 hkMUcsKf3Xrvd8x4pvnz47PGkt/d/J2nGmZKVwl63dVPaq5vcww/n1j9hCyXzi+0Rm4wriaixF
 9YJPOB1Xb+49fCa5AAAAA==
X-Change-ID: 20260903-ad7768-gpio-4a19153b1470
To: Michael Walle <mwalle@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Jonathan Cameron
	<jic23@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Janani
 Sunil <jananisunil.dev@gmail.com>,
        Janani Sunil <janani.sunil@analog.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789061359; l=3060;
 i=janani.sunil@analog.com; s=20260903; h=from:subject:message-id;
 bh=Af5OrrJ+bCyBshOoUk9uiJhzLB72aDPfATvZVCrpLp4=;
 b=BLI0U51tx4U+ng+PKaNGmfjZuQkZO95PZLE89pTi6nSg9LyktUaDidp+c6a4MtJ1THINy025p
 jJFxxqnwV8lCjijOturpgQ+4vVYQPXwYnl1zTyv78dOaVcCYMRCh7z7
X-Developer-Key: i=janani.sunil@analog.com; a=ed25519;
 pk=0UJo4rLJeMHBMco/+wcMHzXI7nV8k1T72+XQlBNV4Rw=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDIxNCBTYWx0ZWRfX+JBEci2ynFEB
 X4F90WjC6tqXqakxz4G07h4n8LWRDvYN0YyR911qhzdco3NyBggcEvdNElIEpMAt+H8zCNCjuwp
 Q45NZ9ahzl5Mx20IMh27keOajoNVSl+TL8tpaRcYoLZIVNcE0ifq
X-Authority-Analysis: v=2.4 cv=Ao17T+9P c=1 sm=1 tr=0 ts=6aa2e8fa cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22 a=gAnH3GRIAAAA:8
 a=VwQbUJbxAAAA:8 a=ojDj4eUIg0KLFcp6xugA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: LmHyjQWhwOuRYLfaQ3djfu1Dcy02n67L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDIxNCBTYWx0ZWRfX4Lrifjzah6un
 KeGnlFbn6DBBHWtVdfHhQdxIaCKfczG1FbJbSgxMCuSr+7dmiiPN6OGx5v04IHo96WWiahlfQCV
 ohsrwMF9u+YstigR0QFUi389RiN4qhwg063RBVI7KeSPqyi8C24ryn3Ux8mb92EZ0+nQKOV2rEF
 RmLdSiNHni3P+7laZRER2N72/rFABnaGehJFVF3HjHQefU3llCM1Bg2ZdvAKRRSF6jYRNarDT5n
 /qoBL1UWdWRLDWUEd4tIenDWbLndWXXpUcxEPFd7SjFAwiUbMHt1OTakMkEwo2Qr/h4iwYqUjVa
 CwUaU1spaPNAfuDdurtmwaBY+WrV5g2YTrH2M+4xRTqAkON86W7iAkwBkrCULDZJM6CqMmT/OZP
 tL0feCW6/3lKkXhOg1jxkkNSo1OCiZpD5REwN9MWG36ZsIWpJrqNEY0Oxg/94F7A7V76jwahdnc
 XE5/NGbCI3a44Y+du7A==
X-Proofpoint-ORIG-GUID: LmHyjQWhwOuRYLfaQ3djfu1Dcy02n67L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_05,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100214

Add GPIO support for the Analog Devices AD7768 and AD7768-4
simultaneous sampling ADCs.

Datasheet:
https://www.analog.com/media/en/technical-documentation/data-sheets/ad7768-ad7768-4.pdf

**Device Overview:**
The AD7768 and AD7768-4 provide five on-chip GPIO pins controlled
through registers shared with the parent IIO device. The GPIO driver is
registered as an auxiliary driver and shares the parent's regmap and
runtime power-management state.

**Features Implemented:**
- Use regmap_test_bits() for single-bit gpio-regmap value and direction
  reads.
- Add optional runtime PM support to gpio-regmap.
- Expose the five AD7768 GPIO pins through gpio-regmap.
- Read output GPIO values from the output-latch register while retaining
  input-state reads for input pins.
- Reserve GPIO4 when it is used to select the crystal or LVDS master
  clock source.

**Patch Summary:**
1. Use regmap_test_bits() for single-bit gpio-regmap reads.
2. Add optional runtime PM support to gpio-regmap.
3. Add the AD7768 GPIO auxiliary driver.

**Testing:**
The complete AD7768 driver was compiled and tested on the
EVAL-AD7768FMCZ using a Zedboard with a mainline kernel.

**Base:**
This series is based on the GPIO subsystem's gpio/for-next branch,
commit a2cfc48fee416f0ea78e7dc38acbf2ce072574cc

Signed-off-by: Janani Sunil <janani.sunil@analog.com>
---
Changes in v8:
- Associate the GPIO chip with the AD7768 firmware node and use it for
  clock-source property lookup.
- Link to v7: https://lore.kernel.org/r/20260908-ad7768-gpio-v7-0-52ee6ef18a1e@analog.com

Changes in v7:
- Replace bitmap_clear() with __clear_bit() and use bitops.h.
- Initialize the parent device pointer at declaration.
- Link to v6: https://lore.kernel.org/r/20260903-ad7768-gpio-v6-0-4254ef6c9b38@analog.com

Changes in v6:
- Split the GPIO patches from the main AD7768 IIO series.
- Rebase onto gpio/for-next commit
  a2cfc48fee416f0ea78e7dc38acbf2ce072574cc.
- Adapt the gpio-regmap callbacks to the operation argument present in
  gpio/for-next.
- Align the gpio-regmap runtime-PM member layout with review feedback.
- Move GPIO valid-mask handling into the GPIO driver and reserve GPIO4
  there when it is used for crystal or LVDS clock selection.
- Link to v5: https://lore.kernel.org/r/20260828-ad7768-driver-v5-0-e33ca6f841a2@analog.com

---
Janani Sunil (3):
      gpio: regmap: Use regmap_test_bits() for single bit reads
      gpio: regmap: Add optional runtime PM support
      gpio: ad7768: Add AD7768 GPIO auxiliary driver

 drivers/gpio/Kconfig        |  12 +++++
 drivers/gpio/Makefile       |   1 +
 drivers/gpio/gpio-ad7768.c  | 121 ++++++++++++++++++++++++++++++++++++++++++++
 drivers/gpio/gpio-regmap.c  |  98 +++++++++++++++++++++++++++++------
 include/linux/gpio/regmap.h |   2 +
 5 files changed, 219 insertions(+), 15 deletions(-)
---
base-commit: a2cfc48fee416f0ea78e7dc38acbf2ce072574cc
change-id: 20260903-ad7768-gpio-4a19153b1470

Best regards,
-- 
Janani Sunil <janani.sunil@analog.com>

