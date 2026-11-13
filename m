Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586292;
	b=SHut1LyzsKbLUtQJ+clo67+u7FFFbtuZgIJ1e09Sgyt5/wEpllZiT0MJIebT0G72XLdT
	 IxoSJe0Xh3CNxU9I4AWz6c+Jx3nhRiyPFmgFp3E/63tSJrEd3FYGxcbpGg98sSop0ekGH
	 0fgiyQdpn7r2eEiufMpg0S8mfOkX+zD6HUcj1A61o61gqU2dRHEM051g8zi2o+DX+9G9+
	 03+ygJGU0vAaGbwXxBMiwIIGVzNQaIF2UAlVH8CAK2VIA6SJ1det76lE/1XMg85wDQUPF
	 obvz6V3+o+Y+lIiE1/rByRMGmvj2NBaD+27vxmtoP2ql7Ih4M0+ajLaqAg5cg2aEEFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586292;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4LUGD2Z1OxVUhNrmytBWWKebaTfhvUmsQJIgh2WdKo4=;
	b=jyPTjRAPofE98KKIyzVO8m8mntmLUAinjr1/MEc9qg+YFUgbmkxmNgeKfqvj3nvq4aj8
	 znYG2K8uvXe9C7BpcsZg83xvotxPmnzMXut/BdoHXuegkYX7q+F5ii3pKfHEXd6I+LP1+
	 Hbcj6oRyMYCQiDj2dA5S8PSIlKFZGyWSeyMoO1xsKRtQvnyeMFCETRcNRI17DjZQTMYzw
	 ePoYF3QjZ0ln08imu+MW/bZlCBYN5hC+u+yIdkQb2gNBTP6KIsatU1p0NeICK28jUU8O1
	 q2rU0rMFHlTGF1irdCp23QNOjIy4TzNCe29DczhG9LoJ5YGmwNLsCkZMloeMfLkKKsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jgj56eqi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Raep9uUt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4521B606BAB6
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 16:11:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4521B606BAB6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jgj56eqi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Raep9uUt
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRK183619307
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 16:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4LUGD2Z1OxVUhNrmytBWWK
	ebaTfhvUmsQJIgh2WdKo4=; b=jgj56eqi3jJEwA23q3UdKoHj2IVs4IYzacZtPH
	Ohmhcb8AZVR5e6SxDb1oouW10SHbv9UACBN6v+DJCcavnfmRYdvow+hb+X+bJMM3
	b4B5tBU6Ym20Ogs0vZr1N69KQjgsvYoZeJ1sbHKOeVCjzLIE8rbtoSav882bARtc
	g7Qts6ld3mu2SmzjTD0WN37nr57niKk3r6xl3m8rxeyFQdb6Pchf45P3sB+jDf5S
	6UUYaK3iqFs/bZWInK0nzG7U29sqE+ePtnxKe1a8VtPjUwKUKPEQKhReyou77gQx
	n/Al0uVxJ/1N8CHSLnTq5BBhd2GVKyxD938p7J03qgn2gf+A==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwg1bcsqq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 16:11:31 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99be6943b20so1184654241.0
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 08:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794586290; x=1795191090; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4LUGD2Z1OxVUhNrmytBWWKebaTfhvUmsQJIgh2WdKo4=;
        b=Raep9uUtdLfpw3dMOZFp4uX2xRd3jfMWNCQShUYfqsoALvTQaZl17Le6tTIOQSvJnP
         xDpi0XjKe7DA09DWa/Y4+pMsGJVtM7Mjn1qTYqsm4mwhKj2XXfAXTj+XQLUVFQR9ZC1Q
         8MKpEBBGEWR17T0AqEfcGLBf+Kqhfczf8SrTY4Hii8FusHsgW27SJY+80+/pD1I0YSWd
         fT8tQORAsnYojIPV/7KTbsGRc5P9jPD1SjPX84FfkHyuPVTK0QZZwtGyppcDSVTd2Od3
         OKEW+5wGbO47LEhcN9SmkNVXcB1DjcvGyusO0PLEy0dZo5UlLSq7tngmGFiKU3Z6Fu0C
         px2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586290; x=1795191090;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4LUGD2Z1OxVUhNrmytBWWKebaTfhvUmsQJIgh2WdKo4=;
        b=LZPXJHPTu5ratMtAy0M32MzN6+8JhhrshUAJ8ZabWIqI079dGiBt4xkULrGC7wZPKT
         JtHT0bek5rqbFwC3jLqYxihGVLwe/tgj2lGSZ40s0CAaeIau5oU/z5H7ecRzlH0gHB8J
         VHqUfbTcM2+hJxCZF4lC5zr2S8f+nJiOm6Bv3KfXw+fpVSEAVIu4rxJqUHnGZ/SuldL0
         j/Vf5ywcEvWfIFLUd92mlZbNexsTJOZpusrxvImWhNh7oqzuD4INdGQ4xvTiQz5e/vW1
         aRGEx5qY0VQMuuqNTne1wPDo4KPp8drWf5H6irzs/aa8PY74Spk9txDlM2aqDVkZP9v2
         4JWQ==
X-Forwarded-Encrypted: i=1; AL+hErErjbv2H4zl0bu07B359080D65KjtsCxXcteZsgllRD3hZvI89fl42UmKeMWjo07scap/Ju/2CULA5Q@vger.kernel.org
X-Gm-Message-State: APuU4Z8cvlhhCyXrSdHzIcGdMlCxxPYJQRPRx/NKnJhSIQmNJ4Yz1rOJ
	ubaKuBDo80/ZegryvtxRE/8Ei75bs1nY9MTKHaVBk2XrctqrSuOm3EsSZOkpENWPw/UNZlBiLnx
	p/TcPNQ4b/5PZ1FMN5TYGU/6rui2N04FVtDMASc3LNl0qfdgO0PR78b4QT09PLatE
X-Gm-Gg: AYBFou2gMxZXLS+m8s/qAvpLMWKc4wE1jzPUrWQ3S7aM0jnN4tdlC5Fj7DzH1eJhbVZ
	SsE90Ph2Bmp8fN288wb8a9GCPhRz4T13RihGGhHWf6GHrbPM0iZ162c2wsyxD1pG6k+5J0r4fcq
	2+tqgtHO62PfJmJyN+W1E5pOr5GN96K/nY5CWfzY2bWsBVSUcVuTN858p0+cRrPZSwhOzqxOnxE
	VI1TITxEknCN4LZ8R9dzU6+Zl8OknwTkfUM3IUYbvjgdAfUmbC8KRLgxywCEw7isDzpdENmtSHr
	CYVDFXVJHhfeCkP+zti6CDpDXhPvma/vLlnGNg+B9xXYYllnZU+W9OPgSz3SeOqd1mgJu5ijKFu
	3alNgrNEC6Fut3Eh2S7xRuQtFoHNGmLx3oxCtSLS6QTqvouw7CkLRrzF2FrxLBITa797MECH8yd
	XZyA==
X-Received: by 2002:a05:6122:178b:b0:5ec:3e18:a8fa with SMTP id 71dfb90a1353d-5ee34afd0b3mr1266375e0c.20.1794586290504;
        Fri, 13 Nov 2026 08:11:30 -0800 (PST)
X-Received: by 2002:a05:6122:178b:b0:5ec:3e18:a8fa with SMTP id 71dfb90a1353d-5ee34afd0b3mr1266330e0c.20.1794586290019;
        Fri, 13 Nov 2026 08:11:30 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm6191547f8f.23.2026.11.13.08.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:11:29 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 17:11:27 +0100
Subject: [PATCH] pinctrl: qcom: fix incorrect pull-up reporting
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
Message-Id: <20261113-qcom-pinctrl-msm-i2c-pull-up-v1-1-0eaf5c154441@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAK4292oC/x3MwQqDMAwA0F+RnA3YTAfuV4aHLsYt0NauVRHEf
 7d4fJd3QJakkuFVHZBk06xzKDB1Bfyz4SuoYzFQQ09jTIN/nj1GDbwkhz57VGKMq3O4RuwfH7Y
 t9WNnCUoRk0y63/17OM8LUIJxqG4AAAA=
X-Change-ID: 20261110-qcom-pinctrl-msm-i2c-pull-up-93bca429d5a2
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1653;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=qENpHSvjG0OILGspIeuGYed8DR95/mcpbr3JC5vzuhY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9zawOIlsCCw6UJnBvKKinLIKFGP9eaFeaQNnT
 R/HK0c/EAGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavc2sAAKCRAFnS7L/zaE
 w+TtEACp2L3URF14/tI1QXht7ZgNJhAgYs55HtBCCyjUatNwfi1z24FxQ4JbPgiwIdU83yZ3xSf
 s/QBXAsqDzPb6oB6V0xgldpQOoyXHbSYmRsmyIO2tZlrI2j//RET0QzHY6SPpdEwy+HRKEyqnBY
 c7MpBWaRf9AeDVMZBRjkP8jbG4EMODEJUGCMWulX72RcjASSukA/T5yC2tRQcx3rKhlMhXXQMAb
 cHyA9R3VTfg8DORiZ4aqxliBCkkU58y51zfoUnY2WDr03rgP6wV7vy8Myslze5hJNuhZOZyLZxt
 iuslHDs3hS2CroAFH+Xq73cQYO9o3QImSM1XtLsWY5XruI92A4CosEpmOGEBWXizE8JPM5MQ3pi
 JePuB0Ur4uor8B3nDGw+rFPdQ4S6eIgYttF0ncvs5NcyPjGQNOXLVETryYZSMuIgJUj2dzOdtTb
 QwyAEQ7Z0vj2dWYlEwq+BGzMnAaZ4/Fu6bpvg0I0j14hMHR1QeK1+wmRkEappMyH1mN8V50iIan
 gc18swCkRgaCIyUusLzYAs+/uCrQQV+n9IBSOB/Znhyo9sSE2b93jol6k0tg20pBRwCe6/my6cR
 OawC3tRcPTisnZVeZFzeCdbv+gham7jp5ssqRxvo2oW1+Ybny6VYksjFxBnAKs+RUv7gCgBAtuS
 GQbfBRt/NxaFtkw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=c6Q+0h9l c=1 sm=1 tr=0 ts=6af736b3 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Gl397SsdjGjx4eaZ7aEA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: 4I1_YpF68oMy94qgUtyIHffWCcN3tmg8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2NCBTYWx0ZWRfXw0zOors8LByb
 cozlYzatMQUVgMR5cfEcimqPNJZFFyCY7L01SNsd8L1gDrJWKYhADY94pyHXQVFXC/68b7YRvhO
 DWF3ZIg6qqrN06da8f7fQbeN/9WXZVxW6jikcPWyGfP5iPb31Sakmfqmb5vG0yigXn3rrJlSx5e
 P3mVDLiOuLoSQj+9/I9MF62Rvz1F3A50SJFeaRFYqCpG7TqwhkaB0w//ejsh12M77TJbFCWnPwl
 zKTBJLT4+EpQBUCENAnEA46ynOUuKwqNYuGiF2aSxO3bifrYEXReFOlQwEmYV01qHjO62P/GOoM
 2lWuzrf76ZI1U9oy7kcsvWYpacFEp/C0BkOppW3FTEZ4Cf0CBOvllt8p7Ljt9OJvCNdtPKb8OUB
 XoufDRVkvbXYeT5crBRPH6pW8ueGq6rd5hhA6tF2BZqNxRIGNCrKI7aVMPSrQUoovLsNiaSV6Y5
 dhZsqqGQqKISCwIcHfw==
X-Proofpoint-ORIG-GUID: 4I1_YpF68oMy94qgUtyIHffWCcN3tmg8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2NCBTYWx0ZWRfXw8oT6HN28B1X
 91HIlyul8Qe0UMaZv0BRxEfTb2axbXfZUaxVfQmTGCyr7LjOHccDyKMsRGbKMxltf8XlanC9esh
 8qGhQKbEILAymbIo1QoGYaUD+sArbbA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130064

In msm_config_group_get(), querying the PIN_CONFIG_BIAS_PULL_UP parameter
on non-I2C pins incorrectly reports a strong I2C pull-up bias when the
hardware is configured as PULL_UP or PULL_DOWN. For non-i2c pins,
g->i2c_pull_bit is 0 and the condition is always true because BIT(0) is
1.

Check if the pull bit is non-zero before comparing it against arg and
match exactly what's written in msm_config_group_set().

Cc: stable@vger.kernel.org
Fixes: 099f37a539e6 ("pinctrl: qcom: Add support for i2c specific pull feature")
Closes: https://sashiko.dev/#/bug/linux-42fe82f8-2ab3-4bdf-9d87-6f46c976e49a
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index f953d3d9e0980c535e08ba1c1765d835b8abb88e..7230780ee8d2982c56f59738e5f92dca7ff5e991 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -396,7 +396,7 @@ static int msm_config_group_get(struct pinctrl_dev *pctldev,
 	case PIN_CONFIG_BIAS_PULL_UP:
 		if (pctrl->soc->pull_no_keeper)
 			arg = arg == MSM_PULL_UP_NO_KEEPER;
-		else if (arg & BIT(g->i2c_pull_bit))
+		else if (g->i2c_pull_bit && arg == ((BIT(g->i2c_pull_bit) >> bit) | MSM_PULL_UP))
 			arg = MSM_I2C_STRONG_PULL_UP;
 		else
 			arg = arg == MSM_PULL_UP;

---
base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
change-id: 20261110-qcom-pinctrl-msm-i2c-pull-up-93bca429d5a2

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

