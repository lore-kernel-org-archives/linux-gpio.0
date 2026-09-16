Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7996830EF86
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 00:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789516822; cv=none; b=uDP7pqAhR06Je2vsXbpKplDzOMEE/VANzGDGbCYD77oqAJatGhJmDv6aFotIvbBY4HJFqh5YZHVYX7mXCXgaSb53fiOCWQsEKA1BEn5PG+Rskt2PtrHGzZpyMU6jBd0ra5pnGpspSS3jU83v089PJxvMj3Y1IVRRTdg3tnlYFZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789516822; c=relaxed/simple;
	bh=26C+ToikrdDEucP2YwD27WA7DtsKW71JwRXumcGVaH4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZZ2cBoTmrzoWTtnGfWiYShfA5IbWnLfzp0EUG4c2UQvEHozyVQG6rDjlLAjsgP+UlLKJ7dW52RA8uVB6woaltx5KuVcmFXJgLcpZ/5Y3xU0IMRx1+Ci2UHih7q77DVGstWVnR66Q1crft6PgHfHWOtN3PbA7h6LbtTt8fJhc5i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dvTFTQdr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f7KML/I+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dvTFTQdr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f7KML/I+"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLZCgc080117
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 00:00:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=220jgmOFT1NOZxBi5UiZyD
	ErfSIXzTYSIYjd/SsRggA=; b=dvTFTQdrkxom2LSqwjRpDw+cshoPKlI8+yXZrK
	WC4A9+C4Qo+SBc1tNzcct3nkWpKtb7f4+5OpJ+X1G1UP4BPfZr/NMA2zXTimpTZw
	cP+f3dHQuOuGOjAXtHopd0MJBHrnevxMbUIjG+y86OvzQlbfmljqhOU2WxYhCsBv
	xDs5tReetOco0dtGC32e6hB/aIcGzLhYHCIPQDytmyH3k25bl6oAqOJo8n/9o3/K
	0259uww3LqHdnJJo7WOHUKw9sG0HgK0X3gV6DGoVoxE9A2JnqzJkxQkSdtbRVghY
	ifI6kRDOzl/F3KBJV9A+2wnGKcozViYOimj6y0r70ONtC7Ow==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqagehf4j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 00:00:19 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e9fc6dc091so5236404a34.2
        for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 17:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789516818; x=1790121618; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=220jgmOFT1NOZxBi5UiZyDErfSIXzTYSIYjd/SsRggA=;
        b=f7KML/I+XmbtGB+l5fOqJQvjhkFrFEWKOPxXP7oWOqzZuyW0C3tr+AJyOn/e951xSR
         l/C+yAlsf8v9EoSgielexLzMSQgAvS41ktsDngBgktBN4sfsSYxEdURFUvk5xJxd76Ee
         jGB+vrQDvuALeqwDyg2G/J+WuZED1e5fBLB/NvSKJdZRFNygy1C11OJ5WQgwBCk162Fj
         9BJVlTmq9M8YQuIEujwcVC/pOcZyAliuyzemsVvbQcKfYal2VGbz0zoqoWBhuminMYQM
         GexbwwTgI7eh4Vng9fcDPIvhXIoBhjhBXsMWp4p5CtBTP/UWILawR0lG1piJ9FjfRs/g
         UEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789516818; x=1790121618;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=220jgmOFT1NOZxBi5UiZyDErfSIXzTYSIYjd/SsRggA=;
        b=BO1IBX8HeYCsbMIbUvKZFDPB+q9HXqWEyJdNYD4YTQXkXT6cQ6ZTNKX0Gl2OuUj8kr
         IFw8n6SDI4mV/I5FxFPlq3VboA0fPbVDBqRgLhBEk7Xiavbb3B0tPrXv4YVNfqYRLzU5
         u2YGAJiXy8gdpOD1619Bf3brKeTNkd7RusckmHeDAOaoJjh/Rxup8IR+hWFm8yZVHP/3
         d8/9MZIxc6e/0ykr+eUt15ls2DH1hAkv6BYw/SwuQt/tiMPNuCU14bRIBgfrTMzxWlfD
         Q5ye9JvCWcGVQkInEzDk8Fuz7zxP5E4oJ+3ssmi0gIiSOEuzy6yy2quSd+TDUdO5N4zX
         2n3w==
X-Forwarded-Encrypted: i=1; AKwUvBxPDR+x9B3lC03KqmWY77xBz2M79bIQEcbsYSCr5oaYbID9Ustdrcv6wS4sukBUs2NfaipSCfvobXRB@vger.kernel.org
X-Gm-Message-State: AFuF++kjSeIV8Ocv9pRwGSKQYX5S+kbjw6qi1+1JD4ldGFSajI1thKHy
	mTN8kh6Yo5t66hQcnEj8fYU5C5eEffIiI037tf1K6CxnHXj4T5x4o8Sjs+ajJ5NWMV20a4BsMo/
	ufcVkjKzN/bVGuepxzFpFQZS4qAZkKF6W7efgei7QeoJhBFRm8NPJ3uxu40xfd2Drq85F21of
X-Gm-Gg: AYBFou2Jv14CFRVsf4j46xbVvA7dfkPAmIhGCWZ0ImBqWQh/TUr719XHwNhJ5kvpJ1f
	ctvU4CCaJa/2malMrp6Q9OUadOLEqjqcHwDaEoFnTBPnNvaMnrISTmeMuWLxJZiBkUpqePFxE71
	0BCtzZ7phrds0huCJsyb8ymEqP9MoPD4T5K79it6fe4HRY6OwkttNVaJuFL9rh+AO8IuuJ3/SNP
	EvPXnO6lrLxJv6Fp1SdSayJOC8fFEPZPu3qFJP9cIDYASEdJlkWnc9in2XRe63l/EHDtA47HxX6
	BMtGFUfbXMnSKILDhEMgWcsGXD0knBK0oElGIu09D6dD4egLBf8qEZ9rJB7gkE7sfBrHOW6IkdG
	3Q9Yi1S32Ax0R3gu/Ja91WGY=
X-Received: by 2002:a05:6820:1899:b0:6b7:46e9:9702 with SMTP id 006d021491bc7-6c7d44e4575mr620292eaf.50.1789516818403;
        Tue, 15 Sep 2026 17:00:18 -0700 (PDT)
X-Received: by 2002:a05:6820:1899:b0:6b7:46e9:9702 with SMTP id 006d021491bc7-6c7d44e4575mr620266eaf.50.1789516817972;
        Tue, 15 Sep 2026 17:00:17 -0700 (PDT)
Received: from [192.168.86.45] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4842a67ca40sm1242613fac.15.2026.09.15.17.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 17:00:17 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 19:00:15 -0500
Subject: [PATCH] pinctrl: qcom: lpass-lpi: Include value in debugfs output
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-pinctrl-lpass-debug-v1-1-bc49766c9f6f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDQAxA0atI1g2MAS16ldJFHKONyHSYqAji3
 R3b5Vv8f4BJUjFoiwOSbGr6DRnlowD/4TAKap8N5Kh2TVlh1OCXNOMc2Qx76dYRn8zEDQ2OqIJ
 cxiSD7r/r6/23rd0kfrlXcJ4XLr0IVncAAAA=
X-Change-ID: 20260915-pinctrl-lpass-debug-7aa2a92f0225
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1601;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=26C+ToikrdDEucP2YwD27WA7DtsKW71JwRXumcGVaH4=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBqqdwQaOgjkhXIQD/DyXMlg602HvhNPIWeWhYUw
 pNJnAMhhNGJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaqncEBUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcV9JQ//eAWTfCIdBFv3DyViURTiQSGaWlMOiuTTSYEZZzy
 pscM86Afvr5L3i/YILd5+wP5YKzoEMAleUaR+JCGQrCW1vpbOh06RlG7wS/8pgYutIJlir8PD0J
 8LAKDZnNiYGY9P/OEQn7TEgT9p930KtpThhkVK4bj4WxvgTrDgkMdv1PCUanVTEKFe+Ppbo0pE4
 yvT+INsCnuLOG8E+DKrK4Zvb0RgCtiBQciJ9gH7aUbdG/b7H8LkmZRmwBNCOS9OMNb09YqtZBAo
 pzLH1revkUVIMlghHZyb6yCYGiZWfUwn/WwRWXQQBuCbJUYPHvA7e98zXNQCdzScBpYFAlf0acm
 R2bYt0HYqzsxaeafoEwTVpVajolS4f7ZxoXCUOoeGSiy5EQSA5n7VFQ3oe8V87dkMYYHJRIRukz
 QjaauDxc3CUQS9WhAlmPixuRK6vGbUxZPwU+aH8hbQHfZiCyc8VhazSLSan0YBMfdCfIf2OBMz0
 ERue/sWUGkmAOKHdgmL+AcN08pMSuS0N8VzrCy/KbA/Qw6R5fFNfAgm8kJKL7lTbQ/zW2CTo8bO
 xNFuJSzOV1Y12evl1KtB9FNIqs1xNnmsNVeO++gSAgjGDmXoGYmDMdZcy/fHd03MTzRa37YzYCY
 NvucUrKOvBBhnB8gQX9me8oY4Dkhy1qakddjfBJq4f2E=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDM1MSBTYWx0ZWRfX1UZMYfdbCRUu
 ILnf7eX7EdC1KUspms4NZpCWrcDyGWF0CTgr6XtmE8mqnBY6f1UP3HAzk9we83hnvGpAnBykbDd
 f1tB9CWR5rBlSAZfUdA2L9BSAFLgh1o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDM1MSBTYWx0ZWRfX3HA9VCN/igHZ
 0zo5cHSEp5wTplbq8+/4SuPXqnPX37eLZIT9/IYP8kgJYeguUwwJavfJtGzWeOy0fJxDMl84L1K
 izKbBLugpKwxjVjU0+PtZrbM6iiYu/j8G7dI3u82vQImAbJlNAWVc6cU+8tYxIopPQKOJIUz45h
 VebgMpLYewDZ4M/zeqYx/z0hK3zbYIV6lQJ4rIXI5rqne7jEwYn/GZucciX6vj6PskzlsAhuJ1o
 kJPbIUP3JBpODvvMUF+p0YCo0qRzer7f+oCT8ZobOIzx0FEtpEARAb1L7ygWQkMYzq3ar6NrEUK
 AfVcybku5GGG5peNn/FFeOjBYoU0BEjbodqR9XpQAra6LC2FDCC0fnYsMABiXBXnsqkhTvSOOXb
 PMb1azLC/8XmuP/HnXwB+uFPTa+EllHZ3rA/b1gpMBXh+r0AyKg/Y9c04g7pAHUrARGAO7BfzVH
 VzPN0uCCLmNge22DyHQ==
X-Proofpoint-GUID: T2NRwpLW_JNZg90Du-eIy2eQ784kH2ab
X-Proofpoint-ORIG-GUID: T2NRwpLW_JNZg90Du-eIy2eQ784kH2ab
X-Authority-Analysis: v=2.4 cv=PcZqFShd c=1 sm=1 tr=0 ts=6aa9dc13 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=P3g009chSsC6MAKsTMIA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 clxscore=1011 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150351

As with other pinctrl providers, it's useful to be able to inspect the
current GPIO state of the LPASS LPI pins during system integration and
debugging.

Extend the driver's debugfs logic to read the current value and include
this in the printout.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 5fd4a4eba654..9412fd36a4aa 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -421,6 +421,7 @@ static void lpi_gpio_dbg_show_one(struct seq_file *s,
 	struct pinctrl_pin_desc pindesc;
 	unsigned int func;
 	int is_out;
+	int value;
 	int drive;
 	int pull;
 	u32 ctl_reg;
@@ -443,7 +444,10 @@ static void lpi_gpio_dbg_show_one(struct seq_file *s,
 	drive = FIELD_GET(LPI_GPIO_OUT_STRENGTH_MASK, ctl_reg);
 	pull = FIELD_GET(LPI_GPIO_PULL_MASK, ctl_reg);
 
-	seq_printf(s, " %-8s: %-3s %d", pindesc.name, is_out ? "out" : "in", func);
+	value = lpi_gpio_get(chip, offset);
+
+	seq_printf(s, " %-8s: %-3s", pindesc.name, is_out ? "out" : "in");
+	seq_printf(s, " %-4s func%d", str_high_low(value), func);
 	seq_printf(s, " %dmA", lpi_regval_to_drive(drive));
 	seq_printf(s, " %s", pulls[pull]);
 }

---
base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
change-id: 20260915-pinctrl-lpass-debug-7aa2a92f0225

Best regards,
--  
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

