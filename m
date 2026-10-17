Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D75377A8B
	for <linux-gpio@vger.kernel.org>; Sat, 17 Oct 2026 02:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792205029; cv=none; b=hM0nGPisGabKnYc4PscVbnei2SD5WXF1B6yc/OcJX4lXYdx7C0H7g1UElbVJIpqVidKbKcm38vn5ONXBh41Cx0+IHNuaxjni143WXAxwC6gPNkDoNPyhDRuk9Wk/ZGb8gkXopCV8/kiMLAHzHEyu8UWSVE6OFFCQ+RZQ5AGYZZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792205029; c=relaxed/simple;
	bh=TKeWP2gZ4ypXDdjxEZDA+RfB8dA7543LL3hNL9UwqaY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TB4kbWqEGMbhEaLHVWrwg5aRjgyFxTOHSRZoCyFN+FdrD3TI9XryyWvbqiJ1XW0f7eSFzhKmxGl6xLQkQK8hHNUU8s5+GqAUrLGNj8cLSGoAPrJMiLr8+Q113oLT1BKp+HDGisgHloO+tsXOBOiwuy4DneOCWb3UKGOHwcfz0O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BaRx16ue; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W+tDqD+f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BaRx16ue";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W+tDqD+f"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GNFeAK2616479
	for <linux-gpio@vger.kernel.org>; Sat, 17 Oct 2026 02:43:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=XNyBkeAKJ6ZXLDk5POYG/oemSkJr/PLVPfe
	VM1HcCDg=; b=BaRx16ueiba/Pe1aG3hn7gXuvZ5SPiV7JPNsbAudENzaFQCkdvF
	issFFq4S7ZASAMJImvoIB9CssvLDRF/m4wLs/24ygeA+w65MqIMM0Xai7Fud/qJP
	7WP8H0fkr72csFQ1eozMMdhDP69+suSnqr3gSiOeY+G3muvgSyTo3N2RO2guZxAZ
	HZyvwuDk91v3zbFZublKht+5xuhC50E12ZmmAgeuUXRbuLuTR3A/e3GxiVb8yJQO
	tSvPcNdNLqwMXF9USGqN2Awt5Y8fAcWXCb777wzqSmyqGc9tzIpHC5/2yxtrwiaS
	T1UgpjcR0Iy/AyKWx8TcXTGDHgiD6d7GJaw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbhur347e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sat, 17 Oct 2026 02:43:45 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35a04491c56so566365eec.0
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 19:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792205025; x=1792809825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XNyBkeAKJ6ZXLDk5POYG/oemSkJr/PLVPfeVM1HcCDg=;
        b=W+tDqD+fg4LIIKua3PZZJTKIT51RLi8VL1JE1/kPP8TqTVMQeyTnDup8Yx/IzJ2mjn
         KSkUcSuIqmX9Vc7kEleIY+BkFdNwHgtKvFtnduDuO0Hb7nAPLhnhldD2zRjWJzeTsTDF
         e/HukZMDXnzpI8H76KzqAf721UfpWt7QeWKlEEy0hC/mE3IUo2JnOPBQ5EEPREv5UkxC
         +qPOyBL0BlOfa3odC3LBk10J6RM5gzKpyFTZRmLwB1sL6NzbCyAgTOjn2uAh5Y6yV7kS
         7c4Md9yJec/xeIf2aLj1MQy/mwY4NuF0vBzwa8i0zFWGCy/1jXrQt1L6Pjqd1RD+0Gth
         2waw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792205025; x=1792809825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XNyBkeAKJ6ZXLDk5POYG/oemSkJr/PLVPfeVM1HcCDg=;
        b=Y4ugV/BKovocAuAcJbOliIImbh6oXpULont/8qoAahjoFaILOKUaczjVvxLuRIunBj
         fM4kFZkAz3ayTfouJArh5VKzUvCB1dkjtrP7ro6jUzWOpuiZ3gth42XYn4xKaw9ecMW+
         +18htZTxWSTT2ztGtdd2Vvz6WwBlU3rd64Sv3y9ZNj7ph8+niPzvkNhPy4wli9Q/FNan
         t4w37Oz4gVMYQnQcXLyyjpp+1BfMTj5VMoWwlbNF1WY9t5vyDfFEBzDTOrlEtrhhYz7H
         5980ffpnmveNslhfBMTkiCz2gXyrVh46CnI8jdRDf0o8eIRXt4/b+lt+h1XiSNKa6yv2
         rsvw==
X-Gm-Message-State: AFq9FYKhljLF0GYbkNw0L8iZ9dgxMxTJKzB2mpfw5VdAJoYfFN4kqYxl
	i0UqJ69jHBIaMc8Vu5GLbMQN8v6hUkLRGz1vkDSez0sqThuAyieBdevHXYvt5gt1AyxuVLfVse4
	XlnS2YWITJIRyNAB/CiGfTZik9guI64lXlf8TO3mQHjw/PmN7QAD+E00VOq1aeLMk
X-Gm-Gg: AYBFou1O9siYhVHFN1Z2zaOKJJWcl491pDSeptwHoIku75t53jkWAIwRLHwf6xyO5vt
	tX3N2gYYNMUVZVC0R5TWsX6iCBZ7WlD6RtcdSWevHFoirwC7M+5339tdreAe2ibx2wIduhLa11X
	SWXECqu/M1PodlPEX4WeZlx8ouZxMzQyp28E1IjIWC+EY/FIqoyeEZPUevFsKkHLp5Ei1kPeXRB
	TMdZPmk7dpL3E8M3HDYUH4aMynnKJ7cCRJoi/tm6cFxNr2C/g0QY8heOUy1tr/Z5iSAopr1vG4n
	mv5WrU9I7LsYmolQ6I9ZLVUnELVfllB/Ayxt6QzBICLFvS5SrXgW3lxiQQae4CLFoYrAxnY7U4j
	VowvymuRFKjkKIJWtO+ZU96TpVcu9CN5fzW7x4JbxMZGWSg8CL28dFdTPvfE=
X-Received: by 2002:a05:7301:2710:b0:35e:af84:bf1e with SMTP id 5a478bee46e88-361a2053227mr2243473eec.7.1792205024581;
        Fri, 16 Oct 2026 19:43:44 -0700 (PDT)
X-Received: by 2002:a05:7301:2710:b0:35e:af84:bf1e with SMTP id 5a478bee46e88-361a2053227mr2243446eec.7.1792205024034;
        Fri, 16 Oct 2026 19:43:44 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm13066829eec.3.2026.10.16.19.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 19:43:43 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 0/3] gpio: shared-proxy: Fix line accounting
Date: Sat, 17 Oct 2026 10:43:32 +0800
Message-ID: <20261017024335.1432020-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxMCBTYWx0ZWRfX7RuTVYMzRsa3
 pErJAL/tikaJruj2t3wAjYLpqLcW5lKVnWedu1S+KtYWX1jrKN4l6oYTD0IAoGIzk2mh0dfX6RJ
 6Ibv3XYsU90BbqGdYvxWlmIY167O6O9lYqCdoRnmDVyqTft4CiwZo/QaAV4q8BLlfEE40Yhr7eF
 b15Zlqrirw8r69891Wad+z+xBB2F4MBFrwmxW718xBA5SnH+AxEgJ7UA/7jThxodueXJE/sb+sT
 doUlZvMEN9Y2G+OvJb12dKVyIhc9AGl+Cw2fy76065nu5DWNUaRx9MkelEu+fB0/iJYUa4TbsyI
 lLC94+kTL1LyK2/rx3YAZpqG/sKK3fwHQs0CbUmUvsXFZ0NZnGNuZa2zrVSekT5TLu4Xpa/coJZ
 J7Vh7fPVaPFkt0VaOTE4vwa3BX6/7EKc3bBcYmR2pk3ikhb84uAFdWL+8Z8EeCdXuSDgYN4Ylhz
 37eRMQUQUCei+DkUQ+w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxMCBTYWx0ZWRfX/LYCiPqNQINr
 ptZ2T0HNgY5NvWGFwW5iybzzZOVg8TcrD61zXBWz3KI+8KdL4CJc1AVsJ6Q0gL8xmKcuWY8XzA2
 O15o+m2viP4zuIDhDwphZIdRsddGIiI=
X-Authority-Analysis: v=2.4 cv=PqsG/AM3 c=1 sm=1 tr=0 ts=6ad2e0e1 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=wt_9iJvwzTYOAWNau1kA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: JUKl3LFZxPbnExljN_2q-3f6rk7w2Iif
X-Proofpoint-GUID: JUKl3LFZxPbnExljN_2q-3f6rk7w2Iif
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170010

Three fixes for how the shared GPIO proxy accounts for users and
votes.

Patch 1 fixes a race between consumers that request a shared line
concurrently. Each of them sees usecnt > 1, assumes another user has
already configured the line, and fails with -EPERM. On Nord RRD this
intermittently leaves both DAC supply regulators without their enable
GPIO.

Patch 2 fixes a stale vote left behind when a proxy releases the line
and restoring the default value fails. The line stays at the
non-default value for the remaining users, and votecnt can underflow
when the line is requested again.

Patch 3 fixes gpiod_set_value() to the default value doing nothing on
a line that was requested with GPIOD_ASIS and left at the opposite
value, e.g. by the bootloader.

Changes in v3:
- Patch 3: New. Drive the default value to the hardware when no votes
  are outstanding. It predates patch 1 (Sashiko)
- Link to v2: https://lore.kernel.org/all/20261016144919.1362846-1-shengchao.guo@oss.qualcomm.com/

Changes in v2:
- Patch 1: Also use gpio_shared_proxy_may_init() instead of
  usecnt > 1 in set_config, so concurrent first users no longer skip
  the hardware config or log a spurious conflict (Sashiko)
- Patch 2: New. Fix the votecnt underflow on a failed write in free.
  It predates patch 1 (Sashiko)
- Link to v1: https://lore.kernel.org/all/20261015122740.971792-1-shengchao.guo@oss.qualcomm.com/

Shawn Guo (3):
  gpio: shared-proxy: Fix race between concurrent first users
  gpio: shared-proxy: Drop the vote of a released proxy on write failure
  gpio: shared-proxy: Drive the default value when no votes are cast

 drivers/gpio/gpio-shared-proxy.c | 91 +++++++++++++++++++++++++++-----
 drivers/gpio/gpiolib-shared.h    |  1 +
 2 files changed, 80 insertions(+), 12 deletions(-)

-- 
2.43.0

