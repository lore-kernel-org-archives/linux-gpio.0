Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB7133938B
	for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 08:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786609930; cv=none; b=d2H2feG+TKO5XR5eyI7jNeXukzBVBY7KrR9S6I9hm9eEj38neOvBx2ZJHxKH6/FEL1q0VPUZwHjvOP1EFgjRI/RSEP84z0pKyy5XCHJXXswUeZWLznWpEu4YnH0erkWZJn51geFJFGAJxPfK0ubsRChRxFVtNLyNzfEDmGHKK+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786609930; c=relaxed/simple;
	bh=qnoa15ze5DUpKabscQR+og3fSImuV2NRNDkI/+NulA4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aBsSvkx1+hvJsCit7wKgcT0hR/bTmP1d4H+QjjCR2iXgx89W+vakaU4BlMj7dDJv3YfahPPzuRE02ASnPl/5j1KPT95HnQpTbxu2opXyYuQ5HM+3Q/ZNe6VlAOf08x0MW9QM7zgvXCmJyeEsuyMKI46Nv7OhlQZUou5fp+bHJhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ooS68aOB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ON9mh8Uk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ooS68aOB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ON9mh8Uk"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67D5fvDn1875015
	for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 08:32:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ibxx+McGZQ3qOEMPchSlE7JCqLlAERV2125
	ddwWZMu8=; b=ooS68aOBmrURZgb/25YyGnk8Gmn6EcHtdrhc6GnwQPNBgjU/XXd
	Pjmd4JuAV/yqgzsvrqWaVf5oAV07SKru8xcJr5yFAkJ5xU+1EWyL82QJS16WueyL
	m+fRVVCeXmh3vxFJY8+drJrSKvGg1PVkM+KJ3ITodp3bqm4zWxyPTA0/09po+myu
	4qDMfMSt6PiL9D0YrJzm9vN9u8/SIjl3V4FCITu4ZU8Avbq2DZwLq++2I4aLpdT6
	n7Mb06qsifO60eSqc8nMzFvHJ8MMk+NC7LFGNxWa5ot7sBHUYPS6ECpK3BuC3t54
	1Wkr5FotXgsbLT46av/DzvgjofaQpMRnKGQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0wt8u24p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 08:32:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bf321d786so28343851cf.1
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 01:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786609926; x=1787214726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ibxx+McGZQ3qOEMPchSlE7JCqLlAERV2125ddwWZMu8=;
        b=ON9mh8Uk4TMMPq3Ge94GV0I467rH46xF94+aLn1SA144fgulvca1LxaX4lKYnuzz+s
         9L1JQ7JhGdrC4NdT5oFuo+unS0Xx64bxEL/tADTX2bFtCE268EVYqfmHOT+FfcgwNzk1
         Dx8JoHei8GWCE1RWL6lhF+6H7nad0vyaMCEqDbDF8irlG05EwIr7nnCDN/EeHRMsBSnp
         5hMHo/cfsmB5p34BOjkbbRoG88ZIZV6sK9LQMLkvA5AhaPzqw5IeHVfEAfOog2xZXrTJ
         fYYvAQ5/D2TRE12HOSBdTxknG/HYIcTNoGFixc0lc52T/IbudROt+dAP6bPi/VGwHpQd
         ACUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786609926; x=1787214726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ibxx+McGZQ3qOEMPchSlE7JCqLlAERV2125ddwWZMu8=;
        b=gz8B5WsRQ+ErCp4Iy8IQqehywX6GacAJGiMQnRHmB2pST9083j2fnvrnJS9Vz8y9Jd
         P6rmpeBj4blZoxmgaSwJfHn7+Ok6oZwhIrInzhoVWnNNT6SRt3ZPufNC/qjqs/P5lsQL
         WbuM/bp7Y+qYEcxFZXzzRr863f4GJkiQ+u/WbwOBSSRyFUqmxF8W95sI95nGtqgX4iGb
         NSRFcvepVsAJk6oOdvNZjz/n9YfoGRfDF/Yjzpe3CYUnKZJm+PK/uPEq9r0BxjA/osQ+
         6SMgD/XI7Bs3MifoYD1ObhITceJGJ9FJGnS8hTCvCJeeTku2O+icsDWT9HkhGOUAU+YQ
         sUFQ==
X-Forwarded-Encrypted: i=1; AHgh+RoqgHhX6OukfY2BAOifg3FZgOWO393/LOr4Q4qUV2Z0bNNep+DF6nrS/FMOoE0BgRW4zDlxvwyNgsu/@vger.kernel.org
X-Gm-Message-State: AOJu0YxLxxtdLFn4whjQVB8mAoKCY94RW5lzLevesiYpAx+4bfQcik8D
	+id8FzsP4h2gzwYPClXbeoEW1sX8qRwUWJ6OujCVZGqXypxOxNP+gerEBMz8f+aMAXOuXUWTGmU
	wiUfkKnq9fRs9d9JHS1wEjMz2dkMOD6equ3VkjSFgAhqSpZPdLooZ77FA3dJzPXrB
X-Gm-Gg: AR+sD13+xzp2jrZDzLIiEbZOLthjxXFCvlBLQaGEupxoNyBiqEHyHuf1fzN4qC05TJc
	4IoHHnRw5jHSL09hBZvf6ON1IMIpqsULJ3hU2950NAjyn1tkPL5OJ/5RTTbCNYLqDUnNMw1uryt
	XLfKg1ARIBB4lnANrGWtlV1bbgwFi+T3hEZ8FTFFtJDrg5bZPJhEOvySrTamUIjIA7KCWx9SujP
	cgbh7xQffT8gi5ksNTVH/i/hQnpvlXcUJ1KvFu2IqQUurDJ9VTrvJACXP9azBRcEjURhRp7aTjt
	Tpaipl8V1Ukx7c8FntJCLmXvgqSKOBccgyr9LlleZS294oQYHdLdsktLSnAbE2HjY7ub9rK4nqH
	OOS+XfqNhfX1+8VcMmIytT4ZAbezrz67w1MNnOQ==
X-Received: by 2002:a05:622a:1a82:b0:528:3882:386a with SMTP id d75a77b69052e-52d73c49386mr39248321cf.11.1786609926415;
        Thu, 13 Aug 2026 01:32:06 -0700 (PDT)
X-Received: by 2002:a05:622a:1a82:b0:528:3882:386a with SMTP id d75a77b69052e-52d73c49386mr39247921cf.11.1786609925943;
        Thu, 13 Aug 2026 01:32:05 -0700 (PDT)
Received: from localhost.localdomain ([2a01:cb1d:dc:7e00:4b5d:4abc:49d7:be98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815a5c2842sm4400526f8f.35.2026.08.13.01.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 01:32:04 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm pinctrl fixes for v7.2
Date: Thu, 13 Aug 2026 10:32:00 +0200
Message-ID: <20260813083200.10387-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YLqvDxGx c=1 sm=1 tr=0 ts=6a7d8107 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=LDc0BXCEZu-BGFyMREwA:9
 a=O8hF6Hzn-FEA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA1OCBTYWx0ZWRfX7UtlBR09Udev
 ovXro3QX6Kw8Tq5N7MR6GeuRyZNIPmJa0q8RtXbkk1J3WyfY/17iO0Xy0g+cy0xyo3Wjb0clfWr
 FGL0vtTzZ6/qnP4vvheZBTS0u1U2nyf4Xqolj8L+Fp+SP+VcY23i7AhnQigsafeUtWqzocto617
 W5HBQSEWsn2uD4soEIEM+JVJd3FZlUkDuRXmKRM8uBhaBZjFYal4s9RZUkmVIpJG2fUXdXQR5wu
 zrtojnxNaYkddA72hYmzX8ofWYADHMazuUfV3iRPIVzZYb7vEyy6kwSAMo2nrbYVw/ok4vu4gJm
 6lR357rs6rhOK7CNXtUnuHC+bFnlk9jc/UG6ys5S6J4lmJ9+DO3z+RvXOSQXhZmwnIWM5N8x2O5
 +Gr+4youIiA7XbyogX8E2VQR5xWaJ4tpAfeb/L1MSdl8FQ4iJpy50qL6Ksb0WDTjDDHibFh1m2w
 rDAyKWmnDpA2Uelt2fQ==
X-Proofpoint-ORIG-GUID: UjqVvaMg_lqtHJVfTaqAUUayxF1kIulM
X-Proofpoint-GUID: UjqVvaMg_lqtHJVfTaqAUUayxF1kIulM
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA1OCBTYWx0ZWRfX5FO9VEiPsPO6
 GIO0Hvcy6KiksTIWT34FIo+FzA7P6xiDMwb56bT2+PRT9kYHVdume/aypo3Z4WulDD9u77PxkCE
 zi8cA+Gftd99P8wtOflVjL+7FwdBrM4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608130058

Linus,

Please pull the final one-liner fix for Qualcomm pin control drivers for
this cycle.

Thanks,
Bartosz

The following changes since commit fd46760956509f580f7d3d25db4de10e7c6f949b:

  pinctrl: qcom: ipq806x: mark pci reset as a GPIO pin function (2026-07-28 11:11:20 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/pinctrl-qcom-fixes-for-v7.2

for you to fetch changes up to 1e7b04c12c077e8829991833a9aa2cb3bdacab61:

  pinctrl: qcom: shikra: Fix intr_target_width for summary interrupt routing (2026-07-31 10:31:21 +0200)

----------------------------------------------------------------
Qualcomm pin control fixes for v7.2

- fix intr_target_width for summary interrupt routing in pinctrl-shikra

----------------------------------------------------------------
Komal Bajaj (1):
      pinctrl: qcom: shikra: Fix intr_target_width for summary interrupt routing

 drivers/pinctrl/qcom/pinctrl-shikra.c | 1 +
 1 file changed, 1 insertion(+)
