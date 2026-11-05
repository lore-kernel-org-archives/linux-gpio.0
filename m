Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793882791;
	b=jLtmLeCCbHN6tTsnPL3pw4lbEjcuB/ybzX+zQugU681BJN/nicy8pvVAQ1lepfkPlKsE
	 G7UZlZe9hGNTeMVihMJnzwxycvX+G/nRSfvC88zxTpHMadkQ4t8Pg9YlDJULTykXvCJ2f
	 jmryaHi2pYmqR3wDtIi1csU8AAV7k6+NksDHPt/NcCJrhYONPmT9oUCGAJqriVB//lHQ8
	 uv8tAsffmwdW0W7aOV+drkmbEq21oejHbBWlYKftKeSqD7x6QoAHFt+BcdeWdes34Zhzz
	 mlqNUwCjTQbgC3tUlXGOttUtIke0PFhleMveoZcM6Db21wMwntUUVD8bSr4tKPpsnLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793882791;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IMSAIlQUHxsrVwK1rBDy4tctUKgRwlHxS9iZdXXuxeo=;
	b=A/3AxhCnjsbtxJ9Vu77/3zztEiWG8WlsYyNFl0vmY3kiXYig7+KNHTbbFPr8wcAzkTCL
	 uW6MdQSS1bz7wqt2L8WzXOkFOaJH0yFXIbyFBju66Q+i1yxuf6JEYrd/DuFtEUhB40qLo
	 UxwJ8vHgURXMxjbSrKMVcENow8hwsVg8VYMIcHRM0LbkWkNiYiWE3dl0Ob1YgfNHXsqs7
	 VN9m1+0s4aGnIe/Z9J6Tzlq402thAuqfb6ZSeZqrsAYc2cc6mM4fC4nhS9wXD8lbZmt/+
	 U4Gq3rTQkWAijNqIpZ8g7BzAQXqqr1qQWs7WtG/8zB6XBNGW2Qby0aPPSrXDLalwbyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KakxBheD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DBFEwhYQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179B8606D806
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 12:46:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 179B8606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KakxBheD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DBFEwhYQ
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tc9n1028252
	for <linux-gpio@vger.kernel.org>; Thu, 5 Nov 2026 12:46:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IMSAIlQUHxsrVwK1rBDy4t
	ctUKgRwlHxS9iZdXXuxeo=; b=KakxBheDcKi0eSX8X0QgILgx/oy+IDQeMbXDyC
	IKj/cju94VVixNo447OpBo0NJXqy71GLgnW4FVYeLpChjmDXgc/g4I06sA6FbSiN
	ioaKTk6SE8PUXSJdUXdw5eGiano7K1Fba8PmgNzxXwaJxDKfmDE2MrShkl1syXjP
	ypnn7uwCAic5+bzKqu43ggl1me69+YhjYuA47EQ7t3W9xArQA8VS7yWJbA59VHiH
	x0a4waxb6v96/Nk22xrHG/g6lW4PjCPpVTRNOlOkzJ8x7Q0ha0lwPFds6mrmj39A
	7pxmn3TlF69L1fkclZaiapEb5x3pCsEzoAF0fhc+1INgKd9A==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrkaq9tuy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 12:46:29 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-98c6374b678so1461152241.3
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 04:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793882789; x=1794487589; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IMSAIlQUHxsrVwK1rBDy4tctUKgRwlHxS9iZdXXuxeo=;
        b=DBFEwhYQ3QnsmGBJgXrgpcMOInVpZbC/i39GYhfjlzbiXAMEz8gW9+RE6Gtt+veLwM
         Go4BKuUKJ4dRaR+XrRWCnZIMAe/AbzvZRGNzWNKQchQiWecXnZTiW1hq+gjeULHtU1+9
         sRTnDRmVTKEMBlQJ95NmS9VvpetPXv3ga1/Rul6AEjWMC+tqRAH62Bx05m3hLa2nkNCR
         LYNh6BfBRS1rkunrdo37eUZtE96ki4qc2R4zit5TU/lGEhxths2nhIjo0l5Og6phN8wY
         +MlDeV18pYxxNYJiajoBXOH89j9lJx5qoOfAQjZn6y+NJ6mqpaeF+xbL4oE3vXeKUw/D
         MOcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793882789; x=1794487589;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IMSAIlQUHxsrVwK1rBDy4tctUKgRwlHxS9iZdXXuxeo=;
        b=iig9MmWGrcVhCcQ+dj49MW4JbSYQpI58XnGYnlEfatCen848i2VhxP/tVCKX3XGh8a
         JrHVsmTkKkeVOKG1Xw0OuA4+vKvz+UG6gj+5L1Mj9gbSX8dtTher/9517KLD/rgjkdGM
         ZARsHptK62SQKPILD29gTIQV+H/kSaFsY3bnqW0fSDYX1z/1zWI6yx9rIh4AL7Pa2RBi
         SVthrBjX4cTpA6Gy+KphTCV2GOLhLTHiYwv6ibYlFgpHZop3P3Dy6YqQQHb4V8LSO8sL
         GkTF9XVkpyj0VPCuX3EY+4X83YE3u5Rqa7U2KWZESoLS3b6CGRiO/DA6NvtdcH42KlbQ
         X6Lg==
X-Gm-Message-State: APuU4Z91iWgyEk0pfWIZBHpPYoXA3d/fEtfJ4wPPLt+0snGnOIHpWxbi
	RgZjmCpA+TuuYO9GxnGUKB4D3viBlueKjxrtgfeQTDEiTUtIdZZopTuOTnDu5+H3wb+ZftcBiZy
	2vUOMKugaq6g0AqLbk+3fb3UepM9T6PW8yEWZJgn3sw9Yb9bAlMvqEDYAslydrS3H
X-Gm-Gg: AYBFou3FzOJjECjb1u49IDOJDlapN6IC1v1uxCPUAajovUGpymm6VcO/GEWTBBl3uiy
	kSyPEmWptjfcUsJDBjlCLjJq9sCvs43X7KFu+i1JB7ISQeq5pjoyC+rCjBb/1wK/eCkdCfMPQI3
	D+F1vblgJt49gHdfEcfB7szn758AI7G5y325n5cylCdKyfXsWVXXbiPzyF+fEP/Ke9B6prvI1yn
	ysWgWGHuPt5TPacfETd6vlUduh5frT5pSjjl6K8+yZpru36FoZT0E3CtT2fbRCIJrI041jvrh/m
	9HrcCR7UbBDFjvCcYXHWW+xdTLzp84Ofld6O1z5C8TTDKiEy7QGGYZDgz5Ejb3ysgVbR+zOe/2M
	qyTPO/4e8Eyj0Ub+jphBzZh02kDpJTFB+DsoAcFxT6ifs0+X5+ewKookbvXPrRZrdZV3DnduAV7
	GJdA==
X-Received: by 2002:a05:6102:548c:b0:7c1:ce61:19b3 with SMTP id ada2fe7eead31-7d0727a7ccfmr8528576137.33.1793882789184;
        Thu, 05 Nov 2026 04:46:29 -0800 (PST)
X-Received: by 2002:a05:6102:548c:b0:7c1:ce61:19b3 with SMTP id ada2fe7eead31-7d0727a7ccfmr8528559137.33.1793882788694;
        Thu, 05 Nov 2026 04:46:28 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8748sm9959225f8f.16.2026.11.05.04.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:46:27 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 13:46:25 +0100
Subject: [PATCH] gpio: mvebu: fix sleeping-while-atomic in
 mvebu_gpio_level_irq_mask()
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-gpio-mvebu-sleeping-while-atomic-v1-1-3ad7bb1c9e36@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKB67GoC/x3NQQqDMBBG4avIrB1IIq3YqxQXRv/EAU1C0tqCe
 PeGLr/NeycVZEGhR3NSxiFFYqjQbUPzOgUPlqWajDJ3rdWNfZLI+wH75rIBSYLnzyobeHrFXWb
 ubOewKDO43lLNpAwn3//iOV7XD7dxMMhyAAAA
X-Change-ID: 20261105-gpio-mvebu-sleeping-while-atomic-3b3fed029f7b
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Baruch Siach <baruch@tkos.co.il>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1258;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=thivSyhkwpeE/0FZmc6W5zleYdMpqoRl93RZ1WSCQVc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq7HqiifQg40GMX16lT6teUzPc0u3oUdyXsj9dF
 wDmzN5ickSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaux6ogAKCRAFnS7L/zaE
 w/alEACbroycZMlQKHJe0TJrLeYzLJ8SrgrjXvU83S46LOPs6KpCf41Y3ZGsvi1Q4PuV8Pli0WJ
 epUBxYkmv6rA4S5AKU0chaySwy8VlGtFSSUpneOZzdD6mPTYAQoaLsCKg651U49dRlTHF8UcS/Y
 9QGNl3liGJqIcC2V/3OeIHhk+sEMaqHWoZaAn7CuajoORKZMU9ztEaQw4uoXYZbnTRE9AnNQrmG
 TMXdhKg1Xy5DMTi/Z8Or6xupStm4cPiSgCcHa3M96NM6csd3z+7n8kNAqEdAFvewjcphGB8WjMt
 Yk6eATZb3vOK2woKOQsoeSPND7PUBBpf/z0vMZqNFeeEwqH7jw+uOg+2jjMuWoV/HIUeHgfvUE0
 Q+lIQLGPdNr0A2QjK4uwYNaobw98aOOg066DOmfa16S8i/AM0hskbfKQJqXt2cvBlbczC+b1WAu
 sZC1SudrHEeaklPx8aDoK5I6ZC1PEsGozWKRLpIzUAM+OXdqOjoT/H6jgA/iO/JVfGQ06SXV4aT
 WX+u9asDoi8JD1ohLWq2oNMu07FnzcspSWHJFENnaFt478qpJvkoznve6nXTi1eNn5IBDSGyIWG
 COJ+TtkNQ5iuUUxt+aXOhjmhhNBu5CHMH6csCxiMA83EuS3kIU4YGEg8ApA5eFNYI0wwC38jRWJ
 hjHQKq+2m0ZQYAA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 9nlXJjuySONiiJJBcsxvn3UZEpi46aQ1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MCBTYWx0ZWRfX61xvXUc3k3pL
 6tSNBcwb5r9Pe1v5qlkDyDTq1IjbZJ4WmfhK2REUYHyyhTfNr2//Mrj4oqAuGy2cqML0XMNC+Yy
 3UhyfRS7XlAhBidH1Ckz3DVejK9e6so=
X-Proofpoint-ORIG-GUID: 9nlXJjuySONiiJJBcsxvn3UZEpi46aQ1
X-Authority-Analysis: v=2.4 cv=OZoNnRTY c=1 sm=1 tr=0 ts=6aec7aa5 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lusAeXgTHze1FH2-YeIA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MCBTYWx0ZWRfX0dXJu/OMxGMW
 bVgjva2bYe00580XAlmXyhIRkFU4MZRWjHR8wh4YwaZeskMwlQPrHR7OwTG7maq4CgSjnGxj/+5
 DOeSCCpx5xgKhVVUzhnFoiyit2uWOzt6EodR/vWeUR0uZMIGZuQq6iDJ8UuaYqhKLY6dETd/moD
 0O42UWb2kl17Xg0JiQ6besJ9qTXun2Ko83xRmmTybIhwJaoo1C5yAlfs7C8/BCQ5bOaMJ3sX2YI
 D/OlXgWElpyw1WiKA5GBEhjIi4tGAtC54k5jQ8jjjSI5t+KlUte0v2u/y4BIFlg6l0H98ptI4T1
 6BFhfj/QTbUKou+bUaj94QGLedERlDmowb03ctsPnNL1xF+RIb5oipbp2Fr3xpGgBby0LVliGSh
 j1kBlrJANDfGF6MmmVrRnbFYuRpWneoJTuBPdIHr0bmKp2MhctvtVlNW8Kdc1qPUXijBqzrhvk9
 r2Pkrx0BwEBnmpN21hA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050050

mvebu_gpio_write_level_mask() is called with a raw spinlock taken but
the underlying regmap uses a standard spinlock which can sleep on
RT_PREEMPT kernels. Add the .use_raw_spinlock attribute to the
appropriate regmap config.

Cc: stable@vger.kernel.org
Fixes: 48f32a835373 ("gpio: mvebu: switch pwm duration registers to regmap")
Closes: https://sashiko.dev/#/bug/linux-6bee0c4f-384c-494c-868e-07c420195d13
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpio-mvebu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 267e6d5bacd0d1c9de0ebb7e21233bc9e2cd3bad..02d9ae5869d75ccc9ac78c41650b9f21b18ffdaa 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -603,6 +603,7 @@ static const struct regmap_config mvebu_gpio_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
+	.use_raw_spinlock = true,
 };
 
 static const struct regmap_config mvebu_gpio_percpu_regmap_config = {

---
base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
change-id: 20261105-gpio-mvebu-sleeping-while-atomic-3b3fed029f7b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

