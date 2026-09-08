Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DEF334692;
	Tue,  8 Sep 2026 07:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788852313; cv=none; b=BejrBxQlLMfFsFrZQ1VLdljMzD/eFEoD7jQDKA8dTiFc5c2MknAP30m8bG0bTqq5H06BqVJhOfIGrTTFf0b4Sy73hRL2BdRZGq0FDhvdegRWRAfjqEbVBIK6sGUZhtShJ+g1GlAvTTvRtqcWZPyoNgmJVzx9DL+Cd2Y3jmWezLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788852313; c=relaxed/simple;
	bh=n3QSIAyArM8B7EMBxAcUnvqsb/xdb+R6cqQZ6sAgHns=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=MbekZgH76yK0r7X7c2FXB3ETpWhcWCCp8mzAXYsAbsOersPXb4YULp7L8VNA0OJyHmeg55sLtMwWDOyby7zsTBTS/ZV/Hpx/qmJ7OnBJdqM/f3UjcEzlRLHcXTCmLvg+hzBoAcgZkPB1DWf/Uif1Tgq3aL72SooYgSwsGnVWGLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=v6KVHl3F; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="v6KVHl3F"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886QjFp2130814;
	Tue, 8 Sep 2026 03:25:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=RGF3vD8ER87uFu30MzpvNo4Enau
	CoC540b+7+VFC4IQ=; b=v6KVHl3Fb7vx3Neu9F6+vmrGMA0wfbVuH1Nd6bo3Xyz
	qQy+wBjT63QEYH3WV35exUR47v3qgBFZz1Z7UHeDVJdXzPK//vzbxgAQzixQGbl9
	B+Jggevv8H8JdjoXypmJb5Qk3By2JGIskBH9lZAWLuFN3oimEG/U2u1TBqRTNdEU
	XhwfqlEcYOLLAUIdPgEf4h2KtcluQs2zaqhWcPVCOZdtAwMMQADBqSvuHAgzQRGJ
	N9tPodRu8ep07IJVfZgdzovUX0idJcaqdu+nu877dGYJyvb+qH8IaRo52kgspOIG
	Wwj49DIJyK4RwlfXNoWYN2KRbpjdSeqICIorVOTV8LQ==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4ggcx2ums2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Sep 2026 03:25:06 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 6887P5NS039587
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Sep 2026 03:25:05 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Tue, 8 Sep
 2026 03:25:05 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Tue, 8 Sep 2026 03:25:05 -0400
Received: from HYB-e1y2fvUQ3cx.ad.analog.com (HYB-e1y2fvUQ3cx.ad.analog.com [10.44.3.59])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 6887Ot8c016290;
	Tue, 8 Sep 2026 03:24:57 -0400
From: Janani Sunil <janani.sunil@analog.com>
Subject: [PATCH v7 0/3] gpio: Add AD7768 GPIO support
Date: Tue, 8 Sep 2026 09:24:51 +0200
Message-ID: <20260908-ad7768-gpio-v7-0-52ee6ef18a1e@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEO4n2oC/23MSw6DIBSF4a2YOy4NL0EddR+NA0TEm7RioCFtD
 Hsvddzhf5LzHZBcRJdgaA6ILmPCsNXQlwbsajbvCM61gVOuaE8FMbPWqiN+x0CkYT1rxcSkplA
 fe3QLvk/tPtZeMb1C/Jx4Vr/1v5MVoUTyVrpF2X4S3c1s5hH81YYnjKWULxxWO7CnAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788852295; l=2846;
 i=janani.sunil@analog.com; s=20260903; h=from:subject:message-id;
 bh=n3QSIAyArM8B7EMBxAcUnvqsb/xdb+R6cqQZ6sAgHns=;
 b=8zA79g1UY02ui3ykQyLOyzpTREjq3TPfr/1R7nhX29s+SV6+WUKp9n10fAq3Fg7i+fweRv3sh
 +A5a8sRglHpCpXCPMq7tiarcHvPm0X2LWbHupwHnwxFsEp4hIGImcQQ
X-Developer-Key: i=janani.sunil@analog.com; a=ed25519;
 pk=0UJo4rLJeMHBMco/+wcMHzXI7nV8k1T72+XQlBNV4Rw=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3NiBTYWx0ZWRfXwTXrDsBIrS8U
 5HUfKmLijI9iLR8TBKjW5Ewuy3ZIDxLjn27wAYICjazfp2+22smg+WoyV91wxE37NBbzKnIiL2d
 Z51nl9YqAbyEwnTGexlR8MGhamV9j7tGtpatMzY4OvMkcLqMlAGI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3NiBTYWx0ZWRfX58+A9bkMYNBA
 AZ25r08v7D4vWbKBEFK9JDWa6Ep5s/PgctBI7WHbE6ysVCrIL5qXt/ko+fhHpTZ4U0b6eGbqMqu
 CVQG9FSg25TvpH2ek6L85+UYNG0rLOdbDDmiedboxuM4y7nKQ6BzipIGvk+FWJQACSL9K8lDX0K
 JalhSDNw1WedvquVoJStqdFz86C9abJ0QPPKJJIDMoyYCe6f2wWbwR58n41p20wXE/u0WcIPKk7
 JhfO0Qpg/6V8Wnu8GoptzFBGwaFn7V8lDByqO1lsCKh0RBaRfLnxBQUAQ2Z0lKxG7+IpRd39asz
 jt+UYYWDdLKGuNJNTSvbq1WrV2QUeYYzFbJNFkbmNXbMb/Fs2HT7THLn6kmjr+Vzi1xj63QdUmz
 SCoB0DHw0ARdnjndy4Ss+X7Ay48xQbgV9UqPIv/unJ6xX+21+OM/3EOs6uCZrP1DLa0ImUUGrSO
 7ocHBVpNqe0dqgyLJMw==
X-Proofpoint-ORIG-GUID: SSwmymooWYcloNnFo4rR-s2MwL-BmAxW
X-Proofpoint-GUID: SSwmymooWYcloNnFo4rR-s2MwL-BmAxW
X-Authority-Analysis: v=2.4 cv=SOdykuvH c=1 sm=1 tr=0 ts=6a9fb853 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22 a=gAnH3GRIAAAA:8
 a=VwQbUJbxAAAA:8 a=ojDj4eUIg0KLFcp6xugA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 adultscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080076

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

