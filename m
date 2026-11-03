Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713699;
	b=Z70qRPjpjQ6rtD6JPzGhyFJsDzfz2YA4yShhmCEpFxXOdr3oBvF5bbuZbmUKeMFQuh2z
	 Z+34weqpZemdRS93nloJlbR/RLStAZICq00RFxNtSwGvaFxady9ZQ7XZzxBge549NqGeo
	 JS2j0nscfgxZvzJotGSLf2Rh7FKv2kPGow9ZFVgjc6TgoNu+t74qvI7RmDFzXjQgqiWLy
	 kjslgTKeaFQ0kW2I+yElXVc1rgNucosairXW/vNL/qTsT+76VSwsiGVo9oiRrdA3K2fKW
	 V+rp6ZM3iMYarJkGTVa8mig8urVuoECCw7qNwFwa4KcSJNXEnUeRSx9CPv8IssyFy0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713699;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QMKVm+mFH7XNX3dJ+CLq5uG8xadpJM1yNzclNMJoASw=;
	b=ZE3Y16MHdG/Ag+Q+RnmnWba6rUcoaUDgfF7Fc4Rr+Gpc1qEdxR1dL9SyFeNB7GzHZ6ba
	 MZaVfnk6HVDp7Oq7O/tyK+OHbosYl/XOcHoLifBmA8PDeM4wIg+8WMHYsPSYDCkYONjnv
	 lgVUVm02N2o3wcQyDDizzThnHS1+KyTjpdkDDwGya+hCM8okpiYQUcr8jvf7rgn3tEfNb
	 rV0j+UMf7k+akEDO5Nb+R6uXHcuOs0sjrL9Xw/NbxWeGI8/mEg962cJzc6aApZGeyd0bp
	 MFBlKo8st0GF1HkCCtejBy/TlxU2X2RCjq4x8I2k0MGOvnFuiMDe0y2wYHx8tKoXTAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YcE9shxk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="dB5/14SI";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB6C606A328
	for <linux-gpio@vger.kernel.org>; Tue,  3 Nov 2026 13:48:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AB6C606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YcE9shxk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dB5/14SI
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3DZg8H1926084
	for <linux-gpio@vger.kernel.org>; Tue, 3 Nov 2026 13:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QMKVm+mFH7XNX3dJ+CLq5u
	G8xadpJM1yNzclNMJoASw=; b=YcE9shxkeYClE6VG30Kleq8AprjzntTetuIpYu
	A3BnCTaDZCWgL2gZTOO+ripLJuIik/67bHIpmUCpYCoh7m+aXx5Q4T+FEb/N5bGr
	Y7BF4d78YCwUyCZmiK8tXyR0OD60dKc+CsN2AHyiaby8KmhPzSRJjrd10oeZL9cy
	M7NsGMC7FoMhBVWtNO8Ym2FWJ9XFJ9VV1Q6RnJ8jMHchchw0QnF3AACQMqPWNHyA
	9tCyFnouWueZJKt5qYVNg/T0U5v5a9YD3KxbXwBhLPRD41Qu+TtkA8pYpDiqh/xo
	EiIVgtQaf6F4XsyO3nEN69U3uS6b63YxmSUSPdCGZT5nae5Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq8u5j1vn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2026 13:48:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f26dd2165so634089785a.3
        for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2026 05:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793713696; x=1794318496; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QMKVm+mFH7XNX3dJ+CLq5uG8xadpJM1yNzclNMJoASw=;
        b=dB5/14SIqvn8rITO7K1TNCWYePzuYRJKmGePR2rH9Fa9G617qgYK0o4v0bMBNQur5V
         uqmgKpuEYyEDnSEPLSEL7EUuNOlHDmHK60ljwgZY9xgTkeyyyWhLJRq7eEJpnY2NjHt/
         z/KbN5vzY3XGhodexmLx4kRlT+PC1HEhPsSEL5hm2NLADTxG7wKvU9mT7PHa32kXTItZ
         glDietFntU1qTd6HlNAbVPgkrmbIzXJQ7jW3eIFggRrQta97ipBIG2YrkmV1/lsbwJc4
         nZNEzvA4zE8FPTTOHmCcywLEGKrfz49CKwJ0j7JYn1GCpsoQ3FXr8JXZ9kVkKPq4rv77
         ptEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713696; x=1794318496;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QMKVm+mFH7XNX3dJ+CLq5uG8xadpJM1yNzclNMJoASw=;
        b=hw4VN1gGL9UV4iCxbvDjQEGoehlFf7gfpyZQNIW+z5UlF8Yluk3d1hUZg1uh7Eo3jE
         wWSJUm3UQGnp9xqDKwqHaxLvwkJVwmDaC8+iOyy2MAxfaIa5kcz6Ej138WqqdNJKwMEB
         GuPwA/ZCYwcqknzn+2OScsrfYT85uf0KgSoREjSy/RmysE6ZkWhAueOGrcVBInhpzJ1P
         CWX+QvsjWIlu17yuGwlPGC4cCun6Q/QEpbqhD4KQ9MvN6neODwhHJlGmIPa2lMReBmmL
         DCsRE6dhyT0k8w0ILQIAvW7K2tlmu7O4F3dssKoQSi/56dGpH5VIkTAxNJvJ6H3hB1kK
         vN8A==
X-Forwarded-Encrypted: i=1; AKwUvBy5kcVkt2EXhubiIHwlOR2FvcLj6r7PjEoiVWqX94+dyPQzYNTOFpmApTqyzx/Sd1Qmph0uYxqG978b@vger.kernel.org
X-Gm-Message-State: APuU4Z/iz/0ywXxew6WK01xMaMWCn68fnhvZObWUWJK46J2+rpkSAzpj
	JEmCCpkr3BJbWCrDONda9c3uPQu2qBL2Ol6KVWw0Mpgf9rlTfx1d0bg3P2NVUImREx0F/TsGtVG
	+LqEvKlhtNWFdNFjPCpN5CmwLvvmqMeI+NbERBJSkQCm23SePZuY3+xlPeGGFPqcF
X-Gm-Gg: AYBFou2sUtL4m2drp5RFkMe2ufLic/rXDSlHA7Xp9PWB6atFPMUy0rBRHxp3svC0tBI
	4EVVxe07ONlhHwEXWA6OgZ2CIPiga2lbzQjvzp2VJomiGlgLs8eLT7zSx6PlKK5l6Vqe3/9bmDU
	OxlXtyZmpoUIV/kH5TpO/Iky3Rx6nl6nccEZEa5aRwLSlJtSMPjL9176T4l2BuLWgGCsVJXmYq6
	38k/OBtjCgs8vQ9XHjTCvD8revy9wk5gpMvzgVyQtUh70x0NfSxl4O6x3WaEc7kl0aapMeNJoJ1
	kSHJmR4xk6DDlR9Q17s3foV2e1p3is+EpiNED7tLhYtUShH48rPTXsyzWi2v6YhWupO4PsJMtEV
	FMRuo70g9OcL187dmerrclEcfdzUw2HfpsL0d2DX8jNN9HA27aV/ZNjNssUczxUoF61fuy9zO3S
	IsjQ==
X-Received: by 2002:a05:620a:2710:b0:93a:2e8:5af5 with SMTP id af79cd13be357-944214dc4d3mr2082622885a.6.1793713696458;
        Tue, 03 Nov 2026 05:48:16 -0800 (PST)
X-Received: by 2002:a05:620a:2710:b0:93a:2e8:5af5 with SMTP id af79cd13be357-944214dc4d3mr2082618285a.6.1793713695970;
        Tue, 03 Nov 2026 05:48:15 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2afee292bsm64445875e9.4.2026.11.03.05.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:48:15 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 14:48:12 +0100
Subject: [PATCH] ASoC: pcm3168a: don't request the reset GPIO as
 non-exclusive
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
Message-Id: <20261103-pcm3168a-non-exclusive-gpios-v1-1-5cfdcf36c915@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABvm6WoC/x3MwQqDMAwA0F+RnBdIKlS3Xxk7SI0a2NrSMCmI/
 27x+C7vAJOiYvDqDiiyq2mKDfzoIGxTXAV1bgZHzjNTjzn8evbjhDFFlBq+f9NdcM2aDJmePAa
 mgRYHrchFFq13//6c5wX8WIN5bgAAAA==
X-Change-ID: 20261103-pcm3168a-non-exclusive-gpios-10918c1070f2
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1750;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=5xo07OYm0SeDrgdQSQeYnj47BAStuVdTnBufjs9Uu8c=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6eYeaPuq5MOiXyMJQLVX11+K5CPHddyNo4VCQ
 EKxe4wsrdSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaunmHgAKCRAFnS7L/zaE
 w/RnEACVKHXpPbQLfWI61qABDe8AwFPmGd9guHC01zlwTBbanUyvNA3CmYHGKtMGx1dDejHZxwi
 uYAsr1wO5Bk6Izcbd4z7vZxKZhkTXtgtZ/zBLy0JZKZr5HsD1TKQ8shj9RR5LyQC94LyC2oGAX0
 VVrWNZF8vjuhbppUvhOWJG/n5b7Grot1SP9gFocMpyxqiprbtKPLECJtt0vefOh+7nWLB/0r9db
 lXpqatfeUA1BO1nZ7dXcle/0ffvTgi8p+Zb7aPpHWhx/LxTJdYRkYb2N06OKgfciaHz5jz05qtp
 SVkvpCs/yI8VSsrhPcAf4vdhQ37Z76VI50wHgUbbHgGxTl2WB7W+1h7OP6WNbWNrAZDudVT4usY
 xcksA2tB967y1FucpTqOCGqO1RQgLo8/krlhjk2R3jwh4yESXiohonYtLhxG4px/Cjal9+lWOK9
 4aHE3T0Fcaa/I5ZpOGZbf+uDhPpTuD1EwCB0991Xgiyuie2cjRkwigNH3CECU47wZGYukD+KNUC
 /Gz3RlVXa4HtwqdB9bo8TaDpVjDaIqNU+1BpjMb7tED72CHU5kCC4HbkdL3B34o5bwe+PrF8ENX
 /n841MLPdI2axz8LKeu9885RwjEnOMcJ0PFuPSKGAq3XUGEuYUHaWlCSE+vz/krmoYrLkkD44YJ
 mqwVMakQHGYDv/Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: G45rhTdy0apmGXz7ZwhaLOdyd_iEkvPt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1NCBTYWx0ZWRfX8iyYz6+ZcTgv
 PnnAoPwHQd1xnjCk/ARQInTLCBi6ab0hABmV2Ep/x62vWbF64y+8wVtgsGmb/X6gyj4VgpzM2R0
 pv73E2vwF12hr0TkYpcRU7UBaIN0t0U=
X-Authority-Analysis: v=2.4 cv=RZ0FmFtv c=1 sm=1 tr=0 ts=6ae9e621 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=RTQ-KL1RhNhVEIJxQikA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: G45rhTdy0apmGXz7ZwhaLOdyd_iEkvPt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1NCBTYWx0ZWRfX1b+FGcHN2bBF
 lOtCL5jwmvPOnJ4YnEd/wpvD93XTC13gwg+sXiYYMvM6E6yru5HXmgYPoQvVj13NzCpIPZS23sX
 lBpLLJIsHVrVtCPXx9e5VGuRNRh6zd+YSKo51lsDR0L5RLuBFGXh5z/nDGBBn1aVGKLMhqCcxAo
 QOsY8169j25S6zTdLqX8stVr0cYF5IMPl7IH1XomgNN20XrkAGODbV56H3SW8PRnGnu3/lHdjVO
 FExlbC+NRfemtOerVesC5X0GkE1fOWtl8vTIgU9PhnTCZzFHQrrr+QkgLJW6rPV72/UJruh0a0n
 UoAEFhwr7dPaFpWlXECPbD2TwyWjsKoMGx7eUYrB+wFYSnQ2H35MOzMXH8EcKx9shXxgFGNCZO4
 oUkiZExFPBBFDRi+Wxy9gsoj5xKoGI+eYi1cW2mimoLgZk/eIPpMPWGNLbXF6ELgjoLmLsoLmC8
 iB7MM2JpUHEIlA9fi/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030054

The GPIOD_FLAGS_BIT_NONEXCLUSIVE flag is deprecated and users should
rely on the GPIO shared proxy. All users of this codec driver are ARM64
and this architecture now enables automatically shared GPIOs for
everyone. The driver now longer has to care about the sharing so drop
the flag.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 sound/soc/codecs/pcm3168a.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
index 6f45ea4869a75d77344b06e1092aeedcea160058..c1a263216ea6d88757053e93d782b8c8c01f8d1e 100644
--- a/sound/soc/codecs/pcm3168a.c
+++ b/sound/soc/codecs/pcm3168a.c
@@ -725,16 +725,11 @@ int pcm3168a_probe(struct device *dev, struct regmap *regmap)
 	dev_set_drvdata(dev, pcm3168a);
 
 	/*
-	 * Request the reset (connected to RST pin) gpio line as non exclusive
-	 * as the same reset line might be connected to multiple pcm3168a codec
-	 *
 	 * The RST is low active, we want the GPIO line to be high initially, so
 	 * request the initial level to LOW which in practice means DEASSERTED:
 	 * The deasserted level of GPIO_ACTIVE_LOW is HIGH.
 	 */
-	pcm3168a->gpio_rst = devm_gpiod_get_optional(dev, "reset",
-						GPIOD_OUT_LOW |
-						GPIOD_FLAGS_BIT_NONEXCLUSIVE);
+	pcm3168a->gpio_rst = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(pcm3168a->gpio_rst))
 		return dev_err_probe(dev, PTR_ERR(pcm3168a->gpio_rst),
 				     "failed to acquire RST gpio\n");

---
base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
change-id: 20261103-pcm3168a-non-exclusive-gpios-10918c1070f2

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

