Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C7A48CD7B
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 14:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791815955; cv=none; b=O7mfV7UTAjJGMKtSp+WL03QjGjpnU1mlcY3ZRbEqG0IenjYv+IxNW7yDvMC4SXkxm+iCFaENR+zXkftGCJZsXHKC2UHKAu82L8WsCeCQBDcvtBtwZh9VvPJT2AZ2SIDl5GHCHIFYHfrDE5cCJi8q2YBPkyk8qlWrL5r/sgm8brI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791815955; c=relaxed/simple;
	bh=dCzNsc/UyHSNWyhMujVFFjX1xweeJKNf9QhyoZ11TZY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=n3ZHCwvYsGUrHCmhBYwSuFUAzUQ6eI7cFtENxBYEPq9m0JIVvxMo0XbOm+WHpwkBk4VnX9FnbJYrNykkqOpHcPa1AEUr+L/7OcAWDWhyYDi1G+uJXkH3ac8+zJgj8GJNDcwWUzi2gWaXvyLrstH6sJ+mzx58Xf5P3m54+7G6mBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h2ArXta9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ODU1H1Rp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h2ArXta9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ODU1H1Rp"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0dJH2679960
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 14:39:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cD5qIIrI3b7fIHsYT5GgI2
	tgrbyN/JfOOCDSMZMQJME=; b=h2ArXta9WZ1qE6jY6P5OJJJDkw7HbuHSHWul3B
	7nNRIkp8/p2cxBIn8HiliDKB9xNrjustzLdZjQ4GgDOFMhhp/gTzIGUuN/oBc382
	RPNcNKR5YEdMml5cusrrGz+bIKw4tkDULHIoLkgSIQQkPFK5CJ5CQwMebIf7YkOU
	EiuRqhG/BvH6ZyCMuMa7RBqEa4P/tNQlcGkLaN4RbF7FwkK6jFJ783L4UIIJwtv6
	tgDWfNeMzlRd2mtsCUTGPZzr+a/JBp0w9GQNlBditqsazTp27pdh03P3739NBJo9
	KVHGSQA1iJ/sEllJww772zzKN2fgJKoTGSzJbJi0rlg2WbJg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sd1te3r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 14:39:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc359d9easo335186785a.3
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 07:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791815952; x=1792420752; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cD5qIIrI3b7fIHsYT5GgI2tgrbyN/JfOOCDSMZMQJME=;
        b=ODU1H1Rpkpocy1Rz5Ou6Jh0Vu4YlISoY/cA2MavAPoGErpo8zZYIkmXdMfY9Zb1rVu
         aq0VzTCMkH000e/q7hfzW90kewKVMMl4MHAUwQhXO8jM48BmzVkLJL84hw2ye7gru02u
         +L/YZJCD4Pbop3eejj0NIK7IeQpx7IgH7FUS0vbxWMPi9sojXt+KHtfwVsUcDg5hp7oN
         P+dYgjV8isbhb93aoXdR8oA/5T06PDDTtQdo48i04R0fkxDbKAh0jQmoZrz0pCSd4Q2E
         dwdlFsDd5mdZl9EXYe5TJ8PaOIOcZuWux3Y2cOdcTsuIjbfD3gdMBsc8zMfKs/te/may
         S9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791815952; x=1792420752;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cD5qIIrI3b7fIHsYT5GgI2tgrbyN/JfOOCDSMZMQJME=;
        b=qAv16QWhx1/Ch7ObIsKSlAyJS27pZWWosMQT3xH1ul85WAM3H3qLMkkl7oO7OBorV+
         F81JMcNOF2LgSLFBwTOFfRd6EBjRe+DINz6Pfwm+Rr6iE/c2a/1Zx+wYL8cK9+eS67oi
         9XWUvgyHsuGxSfO12jB1z1HYd7JhXxlZjVbUfMmu29ik7PldlzNR8pha23uPN5T/qKBo
         q9GqhV7j8RMr+GGjMHkJQhn3o19hXkcI+uM7fWPS/7KuFwrj6AAj0W52CDrdMG//951G
         j2dfnPn+panCeP87YpM5M9gLnzYYdYAxX/FttGXw1qgfnYWKZydHvEYBTvmCMd9Wz00+
         wgKQ==
X-Gm-Message-State: AFq9FYKcinPhtC3xZPSj0u7DGOVoZsQdRlbABnhtdFtu7F+mSTRpzeed
	OrFDf+hrmwyySuGpICmQsUDsv69HeQcDYhh4l7tmMZ0UerEthoiXt0kqfqiMaRmbyqMIwNKC8+3
	wiAjjzMHGqpzxFmy13PqSOhhQY4oFeVRWsK/xTCziHEiUCF9QDgqtYj+3f/OqlQCf
X-Gm-Gg: AYBFou2WdUYjDJQdhanzZdCH0MwSgMULeFxuyATCeadfrYu0REcBUplYPEt+ZBAMGx7
	ocCn/DqoKxDutKOhEvpY+S+g5kmemgdOR8HJFcfo41qPI/vvBB7w4TIlLrOHgj827I98OoGPe5j
	MzpIhtK97v3Ewi+xSyHMqFmWHtfbK1bUDTRXyDAaM4EPKGrL3FYzQMRzbOGKB7N4/RDfQ4FdHbP
	kp0O9zERutBjtxJehy2/UyywfEp2a3QylIsbd0IxtGcXN2sZClQqQ9uwv+oOs8fKfeB+jEhPX4Z
	JTZQaVKQNMxbfkSdZJurKBUwfNqbZRsjAtPs0yMgrqZgfB9m6bLn5NL1KBtuMMxosxrOynbhb/S
	jigsTXFEkDyT2kTBBQmBxIaNQlJn4
X-Received: by 2002:a05:620a:2993:b0:93e:5870:12c5 with SMTP id af79cd13be357-93ebd1ddbc6mr1562406985a.16.1791815951713;
        Mon, 12 Oct 2026 07:39:11 -0700 (PDT)
X-Received: by 2002:a05:620a:2993:b0:93e:5870:12c5 with SMTP id af79cd13be357-93ebd1ddbc6mr1562402685a.16.1791815951208;
        Mon, 12 Oct 2026 07:39:11 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18beabbd0sm340396725e9.12.2026.10.12.07.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:39:10 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 0/4] gpio: kunit: add test cases for platform lookup
 tables
Date: Mon, 12 Oct 2026 16:38:56 +0200
Message-Id: <20261012-gpio-kunit-plat-lookup-v2-0-553b0d6446b9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAADxzGoC/4WNSQ6DMBAEv4LmnEE2i0M45R8RBwcMjFjGsQElQ
 vw9Dh/IpaVqqat38MaR8VBGOzizkSeeAySXCOpez51BagJDIhIlhZDYWWIc1pkWtKNecGQeVos
 qS7P8djVKtQWEsXWmpfcpflSBe/ILu8/5s8lf+1e5SRQo0meri6zOm0be2fv4teqx5mmKQ0B1H
 McX9LhNTMMAAAA=
X-Change-ID: 20261001-gpio-kunit-plat-lookup-6434597e66f8
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1089;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=dCzNsc/UyHSNWyhMujVFFjX1xweeJKNf9QhyoZ11TZY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqzPEE1P/mnZ8LiO1K5wf45pJAY5YSkBgeEYYa+
 Oo1n7evp4yJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaszxBAAKCRAFnS7L/zaE
 wyPeD/9HAO8OqRtesmPrca+7zZxjY7p72crzoAsoICPz0i0MPbLNLt6Sg8t6OBnPHN8Do0Z/7SW
 3no+Eh7wV6v/pRkF3ZPGzHoPVx/81x4b1hfNYsvvSuS1XJGTXdgmitpRpuBIhI+XRBKHwXZrkvh
 A8TZX2mIDjbv/hjtThCCrpx2ISMcIs+st2qyCGxEZYWQCHkCo9LevTsGuxDco8pn9xQisO0W6fN
 aNN2IaXOavrjcZAyvOiivEZmWCYUn7TTnIwgGL0WmyV2DMbgPvgJNQGQiCphWYxPUYkmNCXJ6CO
 /jhQ1P9CnTHJ5Y4zOGOQUF5Upx/q5MG5m7McQFOrycXgfPQ7a+nDxKPbU4S3PxLJQJw/pt4tCrq
 p9NZBXulk0BnMtVBILMmNesVDgpDZvh4KeVME1FnLVThm1hdmcFqbrb6p6I4B/qBFWCSrOTMlyJ
 qaaQDmHnurZyae0hYT+2bxUgzaS4fBKycLE5LM+lkaeCHep043sEPUubdMzTwBZmKNaSjiUHwsg
 MlJyuAWYIHCJJuFGyxtiLQqeVjjqu43yBISW9LrvMUbgJnIxJFynh2E/J4ltyDq5dYvE8KRpjLZ
 JbYItwiZCY+fQ7hbgybfBw2QWc9N7upwLP2vDFgLmqH2DuC457r9FiC+RQvHmGT8Hhytg5NU8B5
 arAX08mhsiCU2hw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: lnPxr1nZe_Y0f6ZEc-_Uw-SukFVMCfzh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1OCBTYWx0ZWRfX0UZkJOEQ3ZTF
 qzsKr8R8OiR0v6lAmSZyhD8i/+PqaS8wD8UOIrKhho1y9WZ4q6PoekR4e2WVG28JEiYG2V/ZURu
 VW07U4gUmOvTZxfA0RLKd/8IZng8/pc=
X-Authority-Analysis: v=2.4 cv=QtHLTlyd c=1 sm=1 tr=0 ts=6accf110 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=aOpRayBpXG_u9rxlwAgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: lnPxr1nZe_Y0f6ZEc-_Uw-SukFVMCfzh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1OCBTYWx0ZWRfXxJBTo9tqE8NB
 py6ppMRFWtlNX7alAo01h1L8Tqm8yjSMhHRTEXkYgeUBticJ6kZ+P5FJsr0ivcp4F01GwRBB+I5
 FBiMktZz+VHkXur/fJnM56eq1+Wk19hoScL7FJ/GHIzXPnFMIW8rXM708evCkhith0R0zklmRlm
 sfc72JbHI64oPvUb2zNHIBTHg3OWwmA6SBEEXyHigWX6+RXcO4MKfpbGoLO9dRmQe67D5yXyJ3x
 U0+n9U7Ct3BOLznn1C7hQ/a6YnECIHhZSoKCV/ZAF5uoPIEif2k/tq+Dqj1TY3x9LYbXHMmi3bD
 pzKaBTxK4P5hjIlFJ1bv3qk6vnr/53hAuWlX9cs3btO1Ti0kK5Gpbib2U8sQJa0x/HeJbOofi+q
 /cbz1ZU7n1sDnSS30C7D4SkUMGE+HEKdiMbjG378UZdGAySngh01Mp5qFipO1Yga4sWKYbWBQQ2
 K37WvhTs/T3UtKVWd5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120058

Add test cases for platform machine lookup for GPIOs along with some
minor refactoring.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Drop unused variable from new test case
- Drop no longer unused define
- Fix one leftover variable renaming
- Pass correct flag to gpiod_get_index()
- Link to v1: https://patch.msgid.link/20261001-gpio-kunit-plat-lookup-v1-0-03bfa84c5dd1@oss.qualcomm.com

---
Bartosz Golaszewski (4):
      gpio: kunit: fix the label of the dummy GPIO chip
      gpio: kunit: factor out common code for waiting for device probe
      gpio: kunit: rename the swnode consumer to a more generic test consumer
      gpio: kunit: add a test case for platform lookup tables

 drivers/gpio/gpiolib-kunit.c | 233 ++++++++++++++++++++++++++++---------------
 1 file changed, 152 insertions(+), 81 deletions(-)
---
base-commit: becb95e45ef0dda9ffb35156d909d3da7a2789c3
change-id: 20261001-gpio-kunit-plat-lookup-6434597e66f8

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

