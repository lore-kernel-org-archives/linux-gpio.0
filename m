Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688488;
	b=sZyuwRKNe0SDRwzNgEAvefQuVaM1J7ZjSRZVkFdo72rilC1rHTkCgRWx/iGGSM9pNcq8
	 mQlSOU3pVBEBjw3ioOlakwAuu77BgaD6+fbPj4QafZ15sXpM1pNDoDrw65Q3klMWTJp4D
	 x0CE42a98NQMqLLXzwT1AK73uY71AAIcEkxt9o/nVgYTQ5fiEuTv2CQ6xQrR8NjUf2ggp
	 XVFUd+rZ7PG7jb6m0jbmQz+vYcAsHFpIlrfYSDZOzO+CUliBzH8/J5vjGiiQtexIPWO5T
	 6ZoxwlB1UpDs6Wvv+CyhTJUhzWdt4hlhSmWlmTNEExaf/RR2Ztq7PS+tx8Ju8sEEiGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688488;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gSMmE/tgHywg+Ku8MuFxxbFDolusK8It1lOLAQ9JkzQ=;
	b=d8OqN/fgE+lXcIU2Jp4YhywfAGVd/1tyTNoWonzPoxhjvEa8z0hiDAz85pJiBieB/UFl
	 DNT8QLRoeSqHh2KdaZBtRkg61yBkWrXjhyGAYwBje2IqbLx5Dovc4Sn2uJ2CtuC4kn6GY
	 AUruWNQ9Rk4+J69Tao38imF8ejgmA44LcYX8iUU0BIfN6sLsfH1PtuSlqMwtaT2WDTWCl
	 xjt0vtLXGxjBoZBAF1Po5UIMevujNYbbevYRXIucW/mPWiiOTvwAHKeUoHVmiFxSwZ+ig
	 1Uif8EIWezVBG4tWJ6K9vnqLvLQ/mAufR3ffUtWByUvCpWWYhroM12AMdsOAs4C7SdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YQNAa3KV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Iukfzc2x;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C755606A326
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 10:21:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C755606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YQNAa3KV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Iukfzc2x
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B9jt1682683
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 10:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gSMmE/tgHywg+Ku8MuFxxbFDolusK8It1lOLAQ9JkzQ=; b=YQNAa3KVzrUGRphy
	yHAh/HSryBqZZt4Naj0EX0LISornqJaCvbya2KYWOO6CkHdZGdSkgaQHb+VqVdy2
	DHM77nt/uurT9cw+a3FTeqxC2LPT0w4CEBMVkDkvFR6pgGDI4CImRayaxnMCzcf0
	SjvaZs2j+Mx//+ukhQfMpJPhIFL6N7C3N+Ff17JIrFuDkdb3OopW/Lgnf4EinRYM
	ht9BDhDSJh8ALWiMwXAmw9N5isueDffVq3EDGEW5jBDTD3GWNmiCdXM4GJPQ0xgs
	lFubo36SZTaPZJYw58B8C/7gOsM9NGkYdutHpJC8nfHihqlgdvwYbAMt/lFvNFhD
	kDgWVA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62aeknxb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 10:21:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93909014c85so1251246285a.0
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 02:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795688486; x=1796293286; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gSMmE/tgHywg+Ku8MuFxxbFDolusK8It1lOLAQ9JkzQ=;
        b=Iukfzc2xMswq8CWtY/PARIDkGUncaVsw8lCWr5buylh+4NjoOGvmYsdvEM6EFf9Klr
         5MyHbUZHAh/ZsZhWOJLGB+hcR/bM+X5UH+jT17LtqKLTnXX6gNTkJ3OcJ4saSDUXFb/N
         rLYR9mlaJ90Yxy60F8jxVfCHHJha0t+Cg6dWq64w79StB+7Lrcz3uFbOZJay/5DX41N4
         u5FrNIPUfiZLHT3PJYd0mdCQKRFMnoMknk8swVL8oc/nELU9V4zkTrgdxlaHuezJNnQQ
         T9Mx1d3JTx3Wrn7fdK5hLVDz6QPe/BCZPVvUyBjp5rGB75R+cmn6g7qZhmJnsRPvWCB2
         uRtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795688486; x=1796293286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gSMmE/tgHywg+Ku8MuFxxbFDolusK8It1lOLAQ9JkzQ=;
        b=EK6uy31Q3J9eY3wa8MOhVHP/dYvqs3q/NCvfFej7TasiBo5FBFIE5C+XtOD0I/J7qo
         boN1g9M5TiW9FxLoKMIop+52syxoqSVWvBMv3jA+8fhHnHchz8GBcXQJlksni5Lbv02Y
         BgiO2fXPylUMXeEWyKQc+GxJGWobskilW8PYfyBsSUndi7dDEl+dEjyeI67oyjkL/1TA
         Obj/JLEmbTDS7QvXvpZKCIFMZ/gCKy8bJ+Kj3O4O+Yw4E2JUNLX4sYOBcGJxoRUjoVT9
         GLaOw/yBGOLx9LU+JBCPTX2rI7AALASiBMGjM3YsqZbzf5n6+9UZ9UzJSHOdTMfG/vcY
         390w==
X-Forwarded-Encrypted: i=1; AL+hErF1kuoUKUJdVnYT/obJ0gbrEF3NipP3scznzV34+mMGoY0aCHgdxJWMDt0ivA1aP0nUdHDNOeanvCMw@vger.kernel.org
X-Gm-Message-State: APuU4Z+6p0ya9IoPIKlWg9p6yN6xtmlxrgnmpSEe04BkWQQjn0TGrJc+
	LBfzj+HwERhtBtuzd8IXJ3VOtSF3T/4tJsTdNpkHZNvgXv7Nhpd5/H6aFJdqrBMo8GxNeANPmUD
	eDcNhLVD/9T65Fx5JqP82OmCLEPnJmV7Eoa8GQ1JsS+VzQ9a0y6CBQfPIecTlWskp
X-Gm-Gg: AZFdTZdsNDvXrH/FbOH0mBeTOzI06dtiucv3S7zZLf6JX0ClPCNzmyypOMVj/flMnne
	vbbU5TpqZRCwaxsni55VwPflJ9yxBabhkINkfj8Ou5lK5ecOKGImYx2lyGSb/fd7ib2Mw7PFpaN
	M5mH6CEFdc6jLNQymE/zw8EaGxFb8lcvnLCyIjSZSaHv/0+2JpjBkh5oeYUMgbPtn8mb/VWX67D
	0LB6ASH5xlTVTtjQe197bRCRS4UNTeZCwrCprByzIldPq6rbZ9SXuethC966Gs/jN5HUsRmskgt
	ZmMjXYCT/hUFEL1I7Jwrx27FenX+YM5/dHsZfhmK5+YWc4vidKqdxUMKz/TgbnOr0PBgrwWkMhY
	urCqAjX0D0alBfaULPTZZpbRzzdkwjKbRCabwDgWiB88epw+21T2Cu0pZsBGGsbg2IJqQgzqTfC
	Hz/kYOLMPBe9uKm1IrbsR90kayWBk52YX/7j8yHNatfCeBzAl9nA6u/KUovMxZNHY=
X-Received: by 2002:a05:620a:2949:b0:949:6e15:e1d4 with SMTP id af79cd13be357-949ba9fbe56mr3585125785a.56.1795688485735;
        Thu, 26 Nov 2026 02:21:25 -0800 (PST)
X-Received: by 2002:a05:620a:2949:b0:949:6e15:e1d4 with SMTP id af79cd13be357-949ba9fbe56mr3585122385a.56.1795688485284;
        Thu, 26 Nov 2026 02:21:25 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm658817885e9.10.2026.11.26.02.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:21:24 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:21:10 +0100
Subject: [PATCH v2 06/11] pinctrl: qcom: kaanapali: mark egpio as a GPIO
 pin function
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
Message-Id: <20261126-qcom-pinctrl-egpio-v2-6-521fb057d3bd@oss.qualcomm.com>
References: <20261126-qcom-pinctrl-egpio-v2-0-521fb057d3bd@oss.qualcomm.com>
In-Reply-To: <20261126-qcom-pinctrl-egpio-v2-0-521fb057d3bd@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Sean Parker <sean.parker@viasat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Stanislav Zaikin <zstaseg@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Iskren Chernev <me@iskren.info>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1213;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NxZjSICPl9X/NbtdwNSDoCfWXakeOJNPiqBVm6AQlSE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCAgT/O1M9gwwpG4og3v18LGeCALWLbDFzqiO+
 dLC78I/wuWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawgIEwAKCRAFnS7L/zaE
 w6S0EACwJ6oFlDzdg2+Ukbx/H0iFJtaVtQuHK6TERMpOzXCHo68afBjKEY5CHTi5F8Yh0mz1qyr
 6/MI/KklQBfeIIEY15+bZOge0Dp0kGeCX79ayWBqPeaoIC0qk4JkuZK2Mz0+dMK03BKnVqeSN+6
 Dok+11wF7f4QiVmehB7jpzRpKgyq7/7bOtwWKW9r690odx8wycEZcoUALAgJNaxSMlac1GkhZwG
 K96Fm1kLDvjmsH7205dLU3gLRpK5q5JjpJp0fZm79UiU4jug6cLCI7b2G29muSpx5UWnScZ5olj
 pccieYYC3rkEglNWyEepqYUaZZUkRNIhzvv1GhlaqBiWO7JNj7vT/62Rbb56cE4vOrfsPojFNa9
 9Ke2mMA2Fkkmv0tvWZ4HG6I3/tvH78sm9f8adha9PZyJSvabr59Akfpu6pozUtElm3tOQlyZ/7a
 5oxOOPmDF833LQOruRGMp662FFqMwG2v0g59Je4StwU+njWtCqAqKlhZJEs1ejwbEuCyyHvDcxO
 S42rQ32iAOGvAG5n/9Mr41K8lOOQa8xCA+wNeLUr6P6KS3ZG76ciZIlJSyvToUcaGpEdMG+6o1f
 7MNTzBdPKFYm+6+VVDsbZndePSzBdUzJStQ8uPV4ntuF0GjFec702PtpqXgMzPtcpJbiQcAqSfH
 WHtg9ZQDo/UMDZA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX2/+HOU4AOjOv
 xdCvu+PjvGJV5mlSE4/S4EHCv/LrJ/9Fo37godKNIhCXPgalSThJVAyxU+C2Rxxe45d9KzMx8vs
 2IXoAEgSdIKWRWa/Y4sDgo7kDGyqxCh+EB5V3CEkZwq2/cL5E6Lg3tEP2Zkca+O0MgA3GmXBhiZ
 aIL4uYMv/xpY3mKyk9Lz4zIJGML7GtRiC/fZBuTTxcGFFcaxZmiorkleAb5+4h/PS1C9U7GVqPz
 XJD+EGbGr4JkmjpL9rbm7UE5NqCbvOgBhvHPhsC3B5I0LaDVpsb/R9MmI/27SvpZu2LnP+sT0ZU
 Gzc7c9Djt3vAvJZjvoieKSpnOiTFLKJcsCXQ8tbRQ3TBlPc/ntfbNwPZ/bvZuYh95tsUxedIIJ3
 zkyNQzePkdFkHQ+8ftBClpaZ1c5sGLuesm4LNR8/oTaHjXV/szjAiCiZlFfkjPqAyBFXrEDXCYw
 it1W71z2iW7P3taAmJA==
X-Proofpoint-GUID: mCNX6C4Z7RZrZr7SriRQCDAj1yOTNirW
X-Proofpoint-ORIG-GUID: mCNX6C4Z7RZrZr7SriRQCDAj1yOTNirW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX5AaZyQd2oWWe
 owy0c8Z9jD0u/RlI9iXYkvIeBSfRxldmwjrSqtlEXjn9w7UJgChMJsNKSQlEPSfEE+tKmvPeX2P
 v+CmxBasALyeHY9x5idTq27GkjQAnac=
X-Authority-Analysis: v=2.4 cv=PqoG/AM3 c=1 sm=1 tr=0 ts=6b080827 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=eqPcoR3FCcofXUvmvEIA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260040

The egpio function in the kaanapali driver is registered as a strict pin
function. With strict pinmux, a pin muxed to egpio cannot then be
requested as a GPIO.

Use MSM_GPIO_PIN_FUNCTION() to tell the pinctrl core that this pin can
be used as a GPIO.

Fixes: 35ff9c6b318a ("pinctrl: qcom: add the tlmm driver for Kaanapali platforms")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-kaanapali.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-kaanapali.c b/drivers/pinctrl/qcom/pinctrl-kaanapali.c
index 2c27eb2255c30777310e6280f6767b426b12fc79..04e47b475ee60fd4990b2b54774f566360ce643d 100644
--- a/drivers/pinctrl/qcom/pinctrl-kaanapali.c
+++ b/drivers/pinctrl/qcom/pinctrl-kaanapali.c
@@ -1379,7 +1379,7 @@ static const struct pinfunction kaanapali_functions[] = {
 	MSM_PIN_FUNCTION(ddr_pxi2),
 	MSM_PIN_FUNCTION(ddr_pxi3),
 	MSM_PIN_FUNCTION(dp_hot),
-	MSM_PIN_FUNCTION(egpio),
+	MSM_GPIO_PIN_FUNCTION(egpio),
 	MSM_PIN_FUNCTION(gcc_gp1),
 	MSM_PIN_FUNCTION(gcc_gp2),
 	MSM_PIN_FUNCTION(gcc_gp3),

-- 
2.47.3

