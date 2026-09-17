Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17CA59C99D
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 14:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789655971; cv=none; b=GiR0F0E/8bvU8Hsh+oB7VRdg0NLc9bRqvgBHhxfzjzrccS8Sws5Be0RHXibkmxgqCf4M7c+U/AQgeT9f2dgeU5o27J5GsitF1iICSM9Kc2IuZAxQ6TBzxypuf1ZTFmh0upjrHGDDRPrtHIr4uqx2B+C0/vkD1EGKGFWz7Mep00A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789655971; c=relaxed/simple;
	bh=KJGDQz0jClEuVNq8PSHBBrMlIymEy6de5iMIMZaAPaY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WwQL0BZ0m4q5eL9ug0/ntZAXIhjdb32GKCEUKRGCMyYtxvBFRATv16arg/ayLJQVWOOYZG1MLVBxkM9Os+5POFo4/nPf5/+TefkvOT2izbql2YaHxzwLmmRkxIUPb+AbUcL5gIPjUPB90np5SCOOgFQwzGcGFj7LyK21wtoiax0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KvSSbAw/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UZ46MDg9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KvSSbAw/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UZ46MDg9"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDiRMZ2265064
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 14:39:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+J3SWA5v2W4etnoMRMEzJG
	kIa4Z0oDr+xyxUG6dh8NA=; b=KvSSbAw/0ykVoA9UBQYTdDSIFpYRQcLAQ9UrEM
	n3d6f3sUMlbgpMTRum+JT0fS342oIZGVA2hBu0jmqsuH3QxE8vHoa2p8395vV84Y
	ZZyzYdBa7pfeoBBheBwigDRdqFOdj08oqwtm1M6ojeg0z9d4CMEGGPHdIoYS3m7Y
	3fk/Wk5klIkLF7RmqFBia2kuYHakAYf5q2c5pei3pD/D76WoJTrdIjR7i/TfZEnG
	w9xpCX8F3j4Kxjr1v8bq0VVtwVVFuly1VikfL4sJ1HWu+QFGlMM5UGt9/RADpRbF
	2Kee+qhdK9hMlLsSOxTd0t7k/TLBtPkKPmZne6iWJ78ILA9w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grfppgrrh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 14:39:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936aa34873bso156009485a.3
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 07:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789655955; x=1790260755; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+J3SWA5v2W4etnoMRMEzJGkIa4Z0oDr+xyxUG6dh8NA=;
        b=UZ46MDg9lD0u8TOZIWZen1fZXt1tGYMkzEuIoLwhkUBSHCwar2uz3CYZP99tVbYSaM
         pECsangbC09FtvZh7Nix0KCIYadCSFL+rw5iATE3WGS/+InLXkB5gDjsvm3KahNh6zz2
         Zcx+InmyikDOcnaxtgBnpqz86bSk6odW9vXvh4bgt11QUtk39mUBPfBWcmzhAf7qM4f1
         QCbkLNklQeDR8P5nMbdFOHan3ZQKCOPRemBBLzVTl/8ugdiwdyM+d+B3k0t45hzLFT7e
         hppGje6ASniZv4Is1LyCzcHPdlLdGV/VH5bA3Lz79I1cMErV5kn5ZOmSGrC9cZgINSd7
         Sv1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789655955; x=1790260755;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+J3SWA5v2W4etnoMRMEzJGkIa4Z0oDr+xyxUG6dh8NA=;
        b=xhleRq33t/3qUxRFLCCcJ8NsDdHh1gShNPaeHOzawI5L1WpD+gMhsp0LVJD3uraCV0
         3hod/LBE46GIDV3D61Dh4QLyjl/qp7vwVlgxHG0F3tbRtcD4Qy7m1xpQ6GWDykphclBN
         hh/Pvnwtnm7BsZ3YnSRvLuQEadA8I6zFLq7e+4Pp9nXtmTp2U7LtWmAZQq6uGy4ndhVK
         4sHqMsGZ5hJ7y1398+zMayurBbsv+nJcQI4c1Yf6Vk72YwMV19lTaOfR1l1HDBwSJa4e
         RxnoDTMoiDtleAIIEpSw/m+DwVnhZRPQwJ8EMC55VP+Dc9NhpjlJpQ05c5vYN46udhyq
         LpGw==
X-Gm-Message-State: AFuF++kGnMw4WzY3l9F7VeaWRmDC3zSLXmQJAMCvnQpnhB+Y5oFtPcqc
	nPI4Pv9cjaHadBDtOZu7kPxB2JnCBmBBYif6EuwqgunThCqg/qMF/W/njcspUM+uK73drT29rEJ
	40p061iXHo7E8YLMUMM4A7YTEjr9g+jj2y/Xed8wpx0D3fh2ch3zizMzjIqZbO6cW
X-Gm-Gg: AYBFou0oPRKBBVbsRIOpkrVfGeMvThKMT9lrTqqlIIPr+NE3tbqHrM/YPIthnOnhqkK
	B9nv9swDKTjzPRJTFaJoWeAvd8ltf06/By/rU+rjlvbtommxMSUc6XZjtJ8FpuNnPBXQKeLzmWr
	8SQW40AwQdQQPHaG4ljo+r01Ghey9VSlo2YjpClWTDO5Mwr+5kWdz3yuqNwcgaSZWdSRIxBmlSP
	ttPWpJgn/KftBHs8+HOwhRDuJPqLWX12cx6s8KNMyPoRtlxg/2V0G5IGFtRXE8mKaFB90dNSdR3
	+K4iWK+3Vwt3P8/RxHiyjcrcxAaXPKmiJoMKUIMdUY04xKse7RWoqyFfwTwfNqnUy+XERePOCRm
	qxX9N1nbdTae/yqw5s+mHCtOmXA8=
X-Received: by 2002:a05:620a:4611:b0:93b:d7a2:83cf with SMTP id af79cd13be357-93bd7a28b6cmr95862585a.62.1789655954562;
        Thu, 17 Sep 2026 07:39:14 -0700 (PDT)
X-Received: by 2002:a05:620a:4611:b0:93b:d7a2:83cf with SMTP id af79cd13be357-93bd7a28b6cmr95857585a.62.1789655954108;
        Thu, 17 Sep 2026 07:39:14 -0700 (PDT)
Received: from brgl-qcom.local ([90.161.207.100])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5dafdcd26sm16584001fa.36.2026.09.17.07.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 07:39:13 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 16:39:05 +0200
Subject: [PATCH] gpio: cdev: fix kernel stack leak to user-space in error
 path
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-gpio-cdev-stack-leak-fixes-v1-1-2bb52879e49c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIj7q2oC/x2MwQqDMBAFf0X23IVExMb+ivSwJE+7WFSyIoL47
 waPwzBzkiErjD7VSRm7mi5zAf+qKP5kHsGaClPt6tZ1/s3jqgvHhJ1tkzjxHzLxoAeMQyMpdD5
 IC0dlsGY8ovT997puX3hY1WwAAAA=
X-Change-ID: 20260917-gpio-cdev-stack-leak-fixes-84ad8918a6e0
To: Bartosz Golaszewski <brgl@kernel.org>, Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linusw@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1507;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=KJGDQz0jClEuVNq8PSHBBrMlIymEy6de5iMIMZaAPaY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqq/uLAWr4ZOYTHnn3qvDYcPIpcOIPLN97i4ed+
 4qwQwvNjB2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqv7iwAKCRAFnS7L/zaE
 wzpAEACCSlb9HMiTLkOHsr6o0L83DPdQFlrW/F9IwZqRERPM76qoWjZtjJRQsZhX5tf0e8Nzp4T
 P5lDOUyaMBdmD3varnRKgJDEc+erO1KGywhADd3+Rr5AT4VCIzLZ1l/fZ755Mo6GyCT3ANR4BMV
 An+mT68/d1JaNTlcy7UwNM6EFl81xCJ7OyNqWqHaO8bWtr+3O5H1PfdyAubjHSdb9sv5etk3+B3
 5q/zFLrkjmkmSj5uYCxMfG1oaIG5p3yBaQKT+K5yE/vcWh6kRAOSInB2uMpVrsO7dStvey2fjUW
 cc3mVZiUhtExcI6eLVm4pUJh+CWRmljc80XGT5LUsTAXKv/8UoNmkNdJSSK/TOgaR9PRXs/LIED
 wLgffb4m5OI1SBURvWGHyDsoyDa7QkM9bhFlG6chOirDRR0YIetM/Jn9FQpdfg6W4TyS4qT/AoZ
 /XF1E51Hrl1cFpnCTbAWYCbqT87nGOKp8jE8tj6dv2cjyxz36Yym4/L9hNv9nbH3qhmqNwZ2nHY
 8Zq6EkZd1nBlZFebkjH5ls0Pilhk5+tSF7y6S+43xTntapEPU2ZtINOa37BWkk02fU4eBy4cVk9
 8g2JNESzVHt9Ycf2OT1BbedWd388xw0K89ySdDYnQ5e4dXe9hSuANfrcfGCvKpSJzkPvyG8IDib
 Zodh8Inp8Sh1I7Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: hbyh9vzU4oA-SBBpVlJ9xDzuh4qO0os6
X-Authority-Analysis: v=2.4 cv=YcYodARf c=1 sm=1 tr=0 ts=6aabfb93 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=BQ2oiuy6hHN+kKmom1QVvA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rv4DqzIR5Y_92oHlb8cA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: hbyh9vzU4oA-SBBpVlJ9xDzuh4qO0os6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIwNyBTYWx0ZWRfXzv8AJvDy/b+N
 G9ljq0qBADn01im9yaCFK2dEK/msdylybFZa5g0rwpNpThmKAe6ig8xn8S70TPJ5J4XtfDffEPE
 6AhRlU9r21HyzRUypu83WMn+C+HuZ+zWJ9upCk7RrM2TdcLFHGAg1BLV7pZ8VQXocsNGOf9wpaY
 jdwiPtoE77L/rPvvZQ+6oFSPpmVKLHivdaWMLSkbwnA8+CX+233db/7ZodzffAHtbnvQYNsYP9Q
 w/EQXiWiD4rvfPFiiFuyk9NMaOF9f7Xee2+d3OwzbfK8M2Q/32dzQY26G078WzA/vwmtobMMwD1
 zeqZxYIwThyz4rl8pJ/LL0TOrL3P7cPAeNE/whzYoXO1HYKd77Wxjb1t17kPlav+mtW4QHsA5PA
 r0rNGBg9eEbguIPNkUoJshcQMPKrIO6VKhYBK6JNhhqtSxmPWRaK+ZFz69kJ43MVdYgPpzbHYKz
 6uG0O9Sd9vcfDYTT2Ww==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIwNyBTYWx0ZWRfXwcJorpZkrGtR
 5qHR7vQ5du1vO+kLJsxcRRr+xuLQ9ZQudVWVmYlhKiXbUAwj5UZZnJVaHddwe130fuX3bKknz8a
 iOnkxOcUzf35SFryJQDOdTEPHapggYo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170207

If we fail to acquire the GPIO chip guard in gpio_desc_to_lineinfo(), we
return immediately before zeroing the info struct we'll end up passing
to the user-space later in lineinfo_get_v1(). This may leak the kernel
stack contents. Move the memset() before trying to acquire the SRCU read
lock.

Fixes: d83cee3d2bb1 ("gpio: protect the pointer to gpio_chip in gpio_device with SRCU")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260912123529.7951-1-tzungbi%40kernel.org?part=3
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-cdev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index b5da6e8566dcd777ef4e7784989b722416c07fd3..ccdb3584c727613334875350cefc13a6877783f9 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -2181,11 +2181,12 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 	unsigned long dflags;
 	const char *label;
 
+	memset(info, 0, sizeof(*info));
+
 	CLASS(gpio_chip_guard, guard)(desc);
 	if (!guard.gc)
 		return;
 
-	memset(info, 0, sizeof(*info));
 	info->offset = gpiod_hwgpio(desc);
 
 	if (desc->name)

---
base-commit: 0d9d0dbf2fddcff5859d623e90ca73c4054276e1
change-id: 20260917-gpio-cdev-stack-leak-fixes-84ad8918a6e0

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

