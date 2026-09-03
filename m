Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D1A49F103;
	Thu,  3 Sep 2026 12:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788436921; cv=none; b=BzUk+IiLCcl+UgOkyOeiZadCbO3ooQ0dNAlLKXzIzNRxiD7oA5jhDQ4hE9MRUHbd5ohMAtF3zT6U4YL778M+j7fdlo++AoU4jyPUadoVF/V0EywBK5tvfPFVfj1/JxIZDkUfWBYUm3uqlDG92Ah/1Ux438a3Xxewq9V1ytr7Pzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788436921; c=relaxed/simple;
	bh=0jgrCz0gginZkhHewjctm1DAngPT+AIqHjY6DqWbKDw=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=PP6SJ+JKxvEF3Nd3v+em3Om66jAur4qdkz3eq9gSSk4PMBtdiwpnGFQuzmTOcJz5TbbkQeJr3F9XhNVTGNEwoDStKQ5nyUeVWMMa0N0r0qWM2G87T0yy+wX9xmYtBdKdvHFfFNupJ2H6Ou8YPcJ9jA0D8mPK+U1EEpJg72t0bMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=mILqoos1; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="mILqoos1"
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AFDkO324776;
	Thu, 3 Sep 2026 08:01:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=UNusIhAqoyrlkmH5xEG4eC8Lz0U
	EwqsDH/ogX9UgjYI=; b=mILqoos1fCaBih/4b5vlQU9ScVoeLmCDLyktGPl10OU
	95wy5EHYuqt1+SU2wUTtAtamMMzWrv02AWNt84ZJms4qiE3UhLGHO7wV3NSdlsWi
	TxyrFeAaQ4en9lmf7Q1xgFTR+bYJ0hqApZKmu5zxEyViWDOuiBNFLlh6hyfqi8+y
	5pgmXSbC6Aqd+rgHkTNjn0GsQS1w69HofoS0HjqTU9y3NywKpvDVvu05dLaQjzKE
	ac2Ta0wDJ0iDVFpid+oq/kFXQGEBhchZtcNQ/cLInUnyhooy2rL8NfFSqRdgwR84
	Bw9K2Ji3OABZ8QsG1SYX9fG/kT0QkeRQr9IkLNii8dA==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4ge3v1rxu9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 08:01:52 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 683C1pBY003593
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 3 Sep 2026 08:01:51 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Thu, 3 Sep
 2026 08:01:51 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Thu, 3 Sep 2026 08:01:51 -0400
Received: from HYB-e1y2fvUQ3cx.ad.analog.com ([10.32.225.204])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 683C1eKn016937;
	Thu, 3 Sep 2026 08:01:43 -0400
From: Janani Sunil <janani.sunil@analog.com>
Subject: [PATCH v6 0/3] gpio: Add AD7768 GPIO support
Date: Thu, 3 Sep 2026 14:01:25 +0200
Message-ID: <20260903-ad7768-gpio-v6-0-4254ef6c9b38@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJVhmWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyzHQUlJIzE
 vPSU3UzU4B8JSMDIzMDSwNj3cQUc3MzC930gsx8XZNEQ0tDU+MkQxNzAyWgjoKi1LTMCrBp0bG
 1tQD5THmdXQAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788436900; l=2618;
 i=janani.sunil@analog.com; s=20260903; h=from:subject:message-id;
 bh=0jgrCz0gginZkhHewjctm1DAngPT+AIqHjY6DqWbKDw=;
 b=avm9ZVUPd2N5u+f25qY78cNC3dxKtzOH1L7cZAm5nWG21jmI/FrtKWYp25bpOvdxvL7FuCaaU
 iHlk7MhZl6DB8Xj/ayQZVd1mKNbGfT39hE+RW0n0td60DRF0rP7wtxX
X-Developer-Key: i=janani.sunil@analog.com; a=ed25519;
 pk=0UJo4rLJeMHBMco/+wcMHzXI7nV8k1T72+XQlBNV4Rw=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=bql8wkai c=1 sm=1 tr=0 ts=6a9961b0 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22 a=gAnH3GRIAAAA:8
 a=VwQbUJbxAAAA:8 a=ojDj4eUIg0KLFcp6xugA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 0TURa7733c6zCTXjVomJng2H_iBfCo37
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEwNCBTYWx0ZWRfXyLWlWUm3JBkQ
 cVG/j1oslPxQOYXTHajpeG6sMrgPh7sM/3cmQNBUgyskqjxUTY1ptWadmkdXGBs90icZwdJRYlB
 2EEuq6QZvQMeiKl0BkGtTsvUAsQeaSt8nEUVtiIVKvpInDuO9hLc
X-Proofpoint-ORIG-GUID: 0TURa7733c6zCTXjVomJng2H_iBfCo37
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEwNCBTYWx0ZWRfXza6uDjX0744E
 6fNtNCBRpVLzdjhO4vWVwkjDrZA7/JDFTo6LKRnrzeZfdjuFk+qD6WUe6lpyq5firrvHubRlDWK
 676QwK9awf/16p3njWcOpa4yh6QY17EyfbqqRX08wdteTWEuUZOdClindcTA4RlyT9FnTjjyD36
 g+lmzpoyRELKmZUqsGSqY9Y2a62KNKGqRHTJ/S3l+TvGku+VO0Z8FKSTws9phEkR4bcVrdz+jhk
 6Jg23POw3/Yu/yKCWdrWRGCy6KwmLRE1V+iO7y8cbfc13aJNd1LFQoRKZQyCICOq70o/70EVUS/
 and4h7nWR9udth4EpNz/x1xN32eCxCGl72SokLXMdd8jpo+fmbyPf01vbVkiMq6MWyrEZv6C2Yt
 1oVvfVlmSVyGxTYBOa6H6Dz0F+v+3YSltmSYwKd3nOMtM+r3uQXcZSbooxxJxf9r88eiKr3ABTY
 Xwlrr/VU3YgUlxEuxJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030104

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
 drivers/gpio/gpio-ad7768.c  | 122 ++++++++++++++++++++++++++++++++++++++++++++
 drivers/gpio/gpio-regmap.c  |  98 +++++++++++++++++++++++++++++------
 include/linux/gpio/regmap.h |   2 +
 5 files changed, 220 insertions(+), 15 deletions(-)
---
base-commit: a2cfc48fee416f0ea78e7dc38acbf2ce072574cc
change-id: 20260903-ad7768-gpio-4a19153b1470

Best regards,
-- 
Janani Sunil <janani.sunil@analog.com>

