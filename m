Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793868156;
	b=aFpOHGr+8TsrCBjWcy/Nh+a7CIHIpNp3W1LXa+Wmf6zFxCbbkW3ScDbd2zf/3rEmk4qo
	 4dWyBwCCruvaruCb6dNNSuilBeGZuvvmP2aBgT11P+e63IZuxoUiVTDm6JdyCEpp1ZRRz
	 CRKafNRgKGFDw8pLWCgDwGybLpm2VhIkcS2rIGPrzFYYt7j2wAjGNoqZ+UJCbE/0XcYwS
	 DIbVR5sqA8my2rSZKm9OsJbKr3TDd504DBFI8I5KrqeB9HXQ+mY3vuVHgLjIZ5YJA9tBM
	 t+q92muEagrMP6vLG7mpkAztdAjlVHCfr7FJhyHWyTR85pp0o4JMNiVXcNATSR9O68w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868156;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZjM2RPR8MuyY7swVyfY28Db6o5AjdPyIfrWtJgN5Fx8=;
	b=FUMxOm5dvhZpRFtlqp1kbmNsJlZCXn60BjMwendTwO2DxXTuWZPMDIO688YQClcPH6na
	 VqLlwl/lEblMivgjECJDbYDOsxkuQEAEVrHLWZMwT4zcyl9MfVlLG22qUqXhh3t2KWkqJ
	 bqojA9qygldSaYFPokjkPVGErMTPdupq3c5IRZMkVpMdtIB4WPbxOoQVCdCw7TUsfjyNj
	 cJuutOOYvnF3WJrE4+Z3uQ4EWx+r4unMBQOwnmYJWIpLApi2zoLDcUtz8zXt7XC2+Z7qg
	 PdC3f/SZRyeQT+VTbqCkTlyEL323M/ONbPTAQ6pGN5abMxy9EZnU/dfgff1POc1dxHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nz9nNfDn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fUenW1K7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2372606A32C
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 08:42:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2372606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nz9nNfDn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fUenW1K7
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UAN63819632
	for <linux-gpio@vger.kernel.org>; Thu, 5 Nov 2026 08:42:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZjM2RPR8MuyY7swVyfY28D
	b6o5AjdPyIfrWtJgN5Fx8=; b=Nz9nNfDnWomMg3OuQGuzkZBA5pS40urQnQZjJW
	TAazBiVPIH8N0C1BF4OVCuGlivdUdMx0N86LMjnynr56noyhNpaNzZftsnxojVGD
	JAhy/rKu+OrGuYjaaAtTqtpNA5cQjwkvekDk5d5XPgS9e7AvOSk7ixEpYJvzhUwP
	DRXNrsxKhxmZwuYhd+DouKRgUqIBu5MmP0YYtOHuYHHsjql0La2xYE4xxYmtkmI8
	QmRdiAZqOeM4/nE55v6TJ6v6SFkqGm2hFfTo2u1DeYwXqPMMv1E87IBuzgNG0vo4
	HfktD/ZLUaGyoG+e7su+QAtTIBxmQHzI+VJB1Y4/f/8YCNRg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hra5tk0ad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 08:42:33 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91c8a517107so44793456d6.3
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 00:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793868153; x=1794472953; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZjM2RPR8MuyY7swVyfY28Db6o5AjdPyIfrWtJgN5Fx8=;
        b=fUenW1K7aZ6v+gWC9+pFwMsIIVH8U1b9CQ+bqWD3nfvVyz8xEqSbYYIJLz9bXkQeWl
         t2Zc18DtPZX2bvev9w4LtiKbCPg4/JJxzHtarlL/7cT/pkdw9pz0BRLORYSJXxbWrw6w
         ywqH7Aaoi1j+EVAksyUT6p6yZpyaAUUi9rUtY1gLVLce9LKPmDTdMHGi+h5OC4hgODZD
         UmJVxsh8Yd1tI9Qxfk5RieaduOIWl9GvTFtQI+N9NmYz11PcxrPMBwcaskuNQsG1s4fK
         lyTqnhd6cyR77Gj2XjYIGfnt9MVhDcaauutkKtGfT99XS/z4sk9SWxRwT677BVZOY5ZP
         ayxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868153; x=1794472953;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZjM2RPR8MuyY7swVyfY28Db6o5AjdPyIfrWtJgN5Fx8=;
        b=sLsM7bIhC0+WiKRwxuYF2uXE2D9l9skqC/PvRJrSZT4FOp+slz4rHTrzEeHOCm3cEv
         yFe9awrByqTAglYdfrnzLb8W4S8a4qZMfxnzacXT2uD+s5uRTclQuqIr94MjYlnvU3uF
         nnrvorGQ5y1TC2vAvW8sbtp4qu19HH4+pNvE/yS0+ZP++zS7TLsbClKJHq6pAmZv7Pk4
         leN53VBvd1hzuTb4emHKZhIv90ZJhEtFq+01M5Gyeivy6a8CTQ4ag7BZkGhg+IFzrBMO
         q9ifgcsm5gaL/oa43ETjM4oJWPkgmQp4RvnnpDA8s2wCbw6J/b4n+GqKBgPaBS39Ax7r
         Wsvw==
X-Forwarded-Encrypted: i=1; AKwUvBx8R9n788yrzjYsk+KQWXbhn8hqKsaNdKp7d878IAAAyGJQA2Cyg4PB5TD8g1Hh6yF3UaRwLxO/5AXT@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ug6OiUZ94IPJEr1AdfqL8ShAHl7iUU2FZ9sRjN1JrHwkGjOnR
	QlXdEwXlADGmSLfhN9sLutADbvLni5JKti+lbtcHCvYwxktc9U8IUptpqmSZcTz/WihaBxgCv3g
	mjZGyh6m9ovbbWq8mjcwQPdtHnXYBjkLWFFAiGNGhXfAVyIrjpWeE77Ips84hhStMa9r/zZvt
X-Gm-Gg: AYBFou2GQb9jnmLYd2TLsl9IVQb8r8gUByfkhUU3QNOiZjy/i8aezp/KzFB3DsZNguU
	AEYQn+oE26LKqQvG8i3a5+6PgmTEpf5zlMEKV9jYGpb4AaPBO0RR6t+kQKCR9kQ3asOofSnGdDk
	9Mfb5f2EOadHI6xnfJWGVm7FWoZN0HTbEjlcEVpYslYHcRfAxeYd8rYSKKqbsm0cFwEnnhOJBZZ
	I6uxpr5GYLryU57FLpqEl1b2VHr4MXqZbpQJVWkAd+vR/yYVGQnE8GurJZCKSUggoFvj2eptOSs
	q6r+mXmhiMeRUH6tlZ6IceErbzArq/NcdM4iUGHqCo24B4En7zDQwqrKbthL6p2UYTUePtkCB/L
	H3X7E6gg6cZ52mxAgelSJw5PRHQL/u8SMwmXM/aymyqMaXsm7dCHkhD4W7BsERD2qj8hRUtW67Q
	0FLQ==
X-Received: by 2002:a05:620a:4155:b0:93e:d364:c9fe with SMTP id af79cd13be357-944216970cemr2986439785a.40.1793868153066;
        Thu, 05 Nov 2026 00:42:33 -0800 (PST)
X-Received: by 2002:a05:620a:4155:b0:93e:d364:c9fe with SMTP id af79cd13be357-944216970cemr2986437485a.40.1793868152534;
        Thu, 05 Nov 2026 00:42:32 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e58fcc6sm89119515e9.2.2026.11.05.00.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:42:31 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 09:42:25 +0100
Subject: [PATCH v2] ASoC: codecs: pcm3168a: do not request the reset GPIO
 as non-exclusive
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
Message-Id: <20261105-pcm3168a-non-exclusive-gpios-v2-1-982577248ed6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHBB7GoC/42NQQ6CMBBFr2K6dkinBARX3sOwIEMLkwDFjjQYw
 t2tnMDNT95fvLcrsYGtqPtlV8FGFvZzAnO9KBraubfAXWJltCkRdQ4LTTmWVQuzn8FuNK7C0UK
 /sBdAXWNFqG/aGZUUS7COt1P/bBIPLG8fPmct4u/9UxwREApyHbm8pBqLhxfJXms7kp+mLI1qj
 uP4Aspf3X3PAAAA
X-Change-ID: 20261103-pcm3168a-non-exclusive-gpios-10918c1070f2
To: Cezary Rojewski <cezary.rojewski@intel.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2001;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=0tWsyG9rE9BQEfezWGVo7jJJr2q9NPf4/ZW7zU+IisM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq7EF2kBLqD1AN7auNgWegCGeGIznSpzpZlns8A
 zTsGOOnzduJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauxBdgAKCRAFnS7L/zaE
 w2gyD/9ROnXzIksewPI+X/kCHlQtC76Yg4XD7AKhci/LrWlZWkcntWkOe0rZ5GzBhqMbrVcZFHI
 5xPqoFjR8HdYlbw2+Fu+Ifw+bFDQ2vsm+OC3Vm8gvfiWodHXl6Bv6V2/Id1t2ajm8HhCG+odNB3
 opOjBSZmOE9GySD71RrklEIHo2kOK4pUAY9E8gJQkZqvnLSOg22jkIap8yhn6FrEB3M4MmarQNY
 90Kz9FlXHDqf9ZSyNtTKc0LpSSI3RYqMcYoeLrwIGiTmP02CPRs6Q6HO7LhVgHE3izzPaSe6MAn
 b4KskzwUkXbwSm0NBLWTMEDnRbA+BsJIWzu4wzGhQfAPoFI9hnD2LBcMAoPj7CLZDfKaeW7BTHq
 L1CKmRooV3jfKVWViY/MoGxt7fMxQxhVZhUW9rJA/BZwxvZn1j0Qski6V1SloIArTF4Agaji5tX
 Cp1gQNz0AHBhP5ky0gS7PM4rR43djHSX1xcxa5C2OY80thO2UCiTxUqB5ucUCHMnhTTGuPpwvVE
 0eRuy61vfFX0PgFQb1A1PAeaiylMAyVgVfNcvcxSml30epApOPlzbDvJqjuavm2oFVFyxb4BYns
 ixG+KUTw5sY7/EXRO5dQAHMJSGU7b1vvE6rO0jnjsCzGRFti0A3m1fho+Tb7mlU2LTuqXKN88IK
 AfXz90sKumn81cg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNCBTYWx0ZWRfX++/u02X4vB4p
 RmZR4HbxmllSqlGtTcNwnNq68TlCGIucfe86nPtpvrkOcr4RLk7ocFueD2O21g4A7Mf6LOBb0ur
 KjuPEne4t/A1u9WSJZtQD8Q8RhW/tEA=
X-Proofpoint-ORIG-GUID: MKEb28kNtaIJp2l6svpW5yaPyChbvDwv
X-Authority-Analysis: v=2.4 cv=P/6vFSAu c=1 sm=1 tr=0 ts=6aec4179 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=RTQ-KL1RhNhVEIJxQikA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: MKEb28kNtaIJp2l6svpW5yaPyChbvDwv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNCBTYWx0ZWRfX1bK3h7cSd8hr
 zgfhw0zgiaeey9prlOD1jZnBsKhrAbO6+WlcyqoavVDPIWvyUZhQ2MfZtLf0Oxbm5b4pSln7j0q
 /HSlJ/EZf2MGKgHezVfkg3lg19AYgOTKi9ajUYo1rl6CFgU9cSaEEEs1a4N8vEL1+p3Kw3A5zVx
 NpnvC/JGo8ArB1+6r1xtB236pGytBmLMGykFURsd7RoPZiSlSITQmHzoRo51vx3+05w3dnkFf8T
 qG4mDFTcGtUJpuAGbo20hG79Jh1JhAmg4mehK+g9LMN2K9yKFsG11YDn73fhayZptn+6GY+T7Mu
 UsoRmeBcPx8xVXGJAKmYY9UARxkHCZLkJUQLJqe9BMAELYRzC7ZC9421qn3y73TYx/JK5ChgIBr
 v8En6DTCBVwP1Ngq/8zA2rAmY9uCb6PfvA9zECZ//axR5SiJzMGGjlx0Pg7IfeVmW61DtwL1yMT
 H4JS5EESw5I80IbZ5Sw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050034

The GPIOD_FLAGS_BIT_NONEXCLUSIVE flag is deprecated and users should
rely on the GPIO shared proxy. All users of this codec driver are either
ARM64 - this architecture now enables shared GPIOs automatically for
everyone - or x86 and don't share pins.

The driver no longer has to care about the sharing so drop the flag.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Tweak commit subject
- Extend commit message to cover the non-arm64 case too
- Link to v1: https://patch.msgid.link/20261103-pcm3168a-non-exclusive-gpios-v1-1-5cfdcf36c915@oss.qualcomm.com
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

