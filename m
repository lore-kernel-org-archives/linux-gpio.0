Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530580;
	b=dSP9UykCIAbxD3fi39XoZNX/BDY27Kg9rdo/DmmZSmlRvs7fUNT6Agam84atc11mC7Mw
	 CrLJa8KnhOOIULT2e4GDY7Qz4zKPsFug6ne0Q/vvriz9PSD5N1O5eJdu20XLkOpT/p3ti
	 qHc8yZZmGapR8AVcCGHLhIGKclTyvPVCzDPZnWKaO9isTVuJDIADDToi7PANbffpV8Zsu
	 XPjJZTXB59PsPZaBC1uw5duHBJ+xHZrDwa+ZpgYH0jIVth5WubGv/C0JHNoHPJAeVZelF
	 y7ilK54RV8n8LXQZ2CZisBGGfRmFm0B76rYKAglzYA/dKOmemvAUTiQX/5CFkxzxK/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530580;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FFxDN6KjQIlR4M7e1vnAs+RlqOVkqzTjThBPVkt3CKk=;
	b=xwCP/xLGvUSyPpGUdF0Y4kWjvrfDSj0DiIqHnWkAXb5LuYN+xtg5LYhOKCWEdD/Hpq1D
	 SMffc7X36Th5c2/cvdJKZPAtIr8yoNpvb6Lm0rX6Qx8wikpJYYLwaSygtRFdIHlGLgfot
	 1rj3p76wEydVylEnJnLHCtYkROWJ9ky4KWT4Qlk/xy6fuA/xs4r32h9zIJh/oATgDAW9N
	 Dey2DjH9x1U6HmGzyZNiTL5YJw7HmoxlmMIaMGE+l04yo9upWfRQQr5CIOnHHq5S+hqjM
	 ig8Z1LZRxnu7a9+pm/Z37n6AweDfw5/Mh4MY0VKJqDvIJjhG2uY6HXp6pHo1ZeLn6wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C3nSwHwp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NO6sCouW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3B8606A32A
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 14:29:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F3B8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C3nSwHwp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NO6sCouW
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuXNH1736812
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 14:29:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FFxDN6KjQIlR4M7e1vnAs+RlqOVkqzTjThBPVkt3CKk=; b=C3nSwHwpXxUDTOlB
	Z85mhzPKE0SsE5aB3/HidBUKWmlKlr25LDxh9UKeXG2xMPj9jaPk1YM3kAjVC8/d
	9FJFnxjtN+O2rJ2FcLcBh/mChv8XKaCkoTfRpzotXZv20RFo1kYnBGKrVIdDuQOC
	vRLxW54aZyqRDNwvqETo3SYEhoVmPHlVDQaDe5fFyYbwfdnf5ipw1PNkewahRVsM
	haIL8uRD3dh3wB2hFx5SpPrR6uzxwgq+kAbdmzTwcdPSFz2vgY7OEiqMoxISninF
	A1/FAk00cGp4qqNSh543qm7RgWXkhEu1Hj1V+8XBP00gRvXHGc5ACW9eI+2whnKH
	3tfHPQ==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvd39k5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 14:29:39 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b4d1cfe3cdso43516087b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 06:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795530579; x=1796135379; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FFxDN6KjQIlR4M7e1vnAs+RlqOVkqzTjThBPVkt3CKk=;
        b=NO6sCouWLZaP4DluoUnnxRT2XDWx9etvBkAEbbGDXRGEAx/FIV2+Ikn3rfMPkaDgwp
         p9P8jqNajGBHPeI9QGNes6OJm3i5BeWyklJ5/39VVrSv2KvKcvyYpsMAFQw6S2q17Us9
         41kDAuBIjrZLj301I5BuQDQIvqfiUvvn5L2PN8dnFUzgDQ8DTtkcpLrLIqrEvEvG4ZEU
         NF+zgmNKH+bY7uSgLoskYifXaODrfZ/lwudn1EA4+8xtdKuEeBE7AkHk6rNcBWl95eRd
         Ogrb3jnue+8veWKx13Xm9VCtF69w/PHRHEpTThY5YqAACSpOCoZkrSCFmnAiSGgtYkwX
         l8Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530579; x=1796135379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FFxDN6KjQIlR4M7e1vnAs+RlqOVkqzTjThBPVkt3CKk=;
        b=pCN2X5DVcWlH1+DyvwHM2DEB89lXfhprcGCIWNgtQAfFnyQCrFSsuXSG+Ktkb54W+Y
         FD+s1S/k8KGwqQMiGhCIpXwN6Ere69TGT+k9f9YFgCQ6zdNmISRsgg870lWj1hFLgVJj
         YMo3LpWdWCGwO6pj8qJhczzYLmBtn77rnj7jbjKyD9FFjudU4IyWLx4iq9zDRVwWwMW2
         pzg26Qu2849g3QOdgAEGjcPOaemqYb+P3YVF+adzF5E4mAox+8XfrI5XiUs5IXGD64lc
         iKfd+FEtCPYQ7sCflLAJM4Y992Eecxhs1TM0p9S39I9Z284ByCIyByicZ2dgyWHbc7Mi
         kihg==
X-Forwarded-Encrypted: i=1; AL+hErGez2xBmho3myia2LEz4VXfU60GD3gcY2wa02kAXLuMMcKozd2FsqGZ9xZd7LSOW17yqk+3c+gKcqWn@vger.kernel.org
X-Gm-Message-State: APuU4Z/yWtBBiFm4+ipy8q8kw3U+mKGIqZemsWaVMMVP2AYCYJ/u9lxb
	p/Xw5VCZy2HtQSZqTYi3q9t/KttTeF8E6P7lixS9JzLygFWxuiw8qnoRaQz/VKxM6yIQLjoy/uA
	o2HIKrXX7kmqYRYbW2fLS2bEeZ8IPcN6ReySPusGRT5eIbUfYv4m4qQCGNfN74NIr
X-Gm-Gg: AZFdTZf/u0RHLOET63oqzQ/J/NLqkrPIwq2hfrFt0xO3TDhpaAqkb8WYyDV996J7u0I
	XogAeKQwFp6Ge68W46bnAtDmwzH5dqnZZaOO4/f80ajGk4wBS9YAeXq63MPDC6b4oXbfYMCDpuj
	eI1DlhXBZMxnhLcWW9X2bER1DVqZN483wcEyBALApc3zZ2rKfBg2O3PLKSJBF5AiJRQ0EfwCT09
	Kv+4/tmovK5074DahP7WtpfCs070ucsg52frWT3mfDTj8N7tjywIkDn1l6b7nu1xpBv7esZaHLT
	VNxNKZ2dxeTSZ6KxVGVHT5y5Tq1o/7XzTdLkWud1W76Iv1WA0Re+GajBa90diSfvm656sOtE7F8
	8bY3+hFCoddtJAukooYobZ+iCXFLu15dqFt62r8UtOesc8rDtb3quYdxWvh6HUWh5QBE/GReXzK
	xuykVkxyVJyUsIHtGLG/9EZStxal8TX5zllagvEevAyTd1XqOcU9HPT7dj1NZg/fQ=
X-Received: by 2002:a05:690c:a003:b0:8b5:5dd9:40ca with SMTP id 00721157ae682-8b55dd9415emr14058007b3.1.1795530578739;
        Tue, 24 Nov 2026 06:29:38 -0800 (PST)
X-Received: by 2002:a05:690c:a003:b0:8b5:5dd9:40ca with SMTP id 00721157ae682-8b55dd9415emr14057867b3.1.1795530578309;
        Tue, 24 Nov 2026 06:29:38 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b34e9c3ffesm12013821f8f.19.2026.11.24.06.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:29:37 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 15:29:23 +0100
Subject: [PATCH 06/11] pinctrl: qcom: kaanapali: mark egpio as a GPIO pin
 function
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
Message-Id: <20261124-qcom-pinctrl-egpio-v1-6-34f2c06b2658@oss.qualcomm.com>
References: <20261124-qcom-pinctrl-egpio-v1-0-34f2c06b2658@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-pinctrl-egpio-v1-0-34f2c06b2658@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1152;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=d4nSpgsFUhJq5DuzeBsfwiXaQce1w0wxuso7kWB2flw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrBZ9C4f58IPpoMK+d+Ar5hpwv0SmQQ833MMtk9
 N11m6G44+KJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawWfQgAKCRAFnS7L/zaE
 w+CxD/9xq2Al0MTuM20HayP4V0JFM0INq/iryR53a4qal+8W1gxajf1vJSt1JcI+AQT/WfFZGA5
 StVbRo49yak2t3CASMR7YFvUGz3nA7dvvSzjYJa6kwCsrirVF9VTHo5FN4NypxBUQrKQ3bEUhoy
 ZApb4FkjRnJK1r4mKo2ub3bGXUS2/N3XSuMrD1OVA2QzJyy7iygowDNxxFKt8T9ztnCO1mwPMGC
 r5MlFeeW8Z0gPv/l9EZV1apFYBSwrJ2s1an+hYOdMMtIZ1uBE3cdLEmbO1P3NBL6gEJmG/wVyuG
 55632sVzG8PZOqawl1HWUezzrCd81cYUx7+WuFPvG9StWqbMKxCq56JmQb97O/WXK4AOQ9zj9tY
 uTPjiIFMAm1w7sM61Rl9SbZBA6ShFzdI0NW4cQR+b83QapHrKGEw2BvBV4kkvvfaUPw5qDmOXnX
 kBn9wU7NwVfE6xCTZLpsoWBKV9/MeimmREPOoIBEZBV/3eCgroDD+4YLaxK22XpjcH6ACXgOYSQ
 aQ3R3yFr7X7g+VRGZtH7bRhGG/Mvt/SOpcfcPypu1duemGdfJCvXUi1PJABhl2ZwuimGw/Ktwoq
 h+Y/WYuow+MBtVnplSM7F79G4X2i5RVXfYIGrwXpm/JwxKChfgXI6zSlcCRdhQNfbPYDlczcN7L
 97mcTaICaZQJSYA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=ZYeIpcVA c=1 sm=1 tr=0 ts=6b059f53 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=eqPcoR3FCcofXUvmvEIA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfX8AXFFBug2+2L
 xwgybHarFQU0wSISwMWZNi+s5KfdCN8C+sutfx6sK1xhrBKSuTXTpzH8vdXM1bT9T+aDdZLVgfL
 3e6xpSmfeKu3BxLvwLQyv1s4fEJv48qKVipfBPu9afCL/gayoed2vUPCzR+f/wlMWMOtWZXopHn
 BHDj3rZ/piualHYlKqVfJOvCH9bxhUn0wAYIFWF5QqfQ0ClsUriFKP3S6ro/c8N9/AO5uyYm6h4
 DfU4UiIkeNDsSA84OneNtPDO9ewJAQku/V0DVks8JgrJLn7kHcx5Pj2sOh/t8yu62lkRUWl86z6
 xGjTEomElhkOodi8qFNDb6OwquNGGHqHQz6gl5Etg0VLc0i4FNJH7Rl+wxHKsH/+IizsU4QS4UL
 ztK3cRL+QVb7CvfazVPbaNmLw0TdRnrfIgsFDdyrsArUhxel1I24Q5Sth+1cvDY5ilq7Mpsm3Vf
 nEqDO1lcB040gbgJeqw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfX0YfUDcBynWrL
 V/AVDdCUaADa/ddlwTXvhaIvS+difE3by97YTEz3AzIaC/tldKh0iG9jxpqDLhaJ1B+romq31s7
 y0K3wxtC7dNvUM9MeoSqbaEyiC1ZIOY=
X-Proofpoint-ORIG-GUID: AmI_MuIFF5ipJYp3ShMf-YheTJT78Tot
X-Proofpoint-GUID: AmI_MuIFF5ipJYp3ShMf-YheTJT78Tot
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240056

The egpio function in the kaanapali driver is registered as a strict pin
function. With strict pinmux, a pin muxed to egpio cannot then be
requested as a GPIO.

Use MSM_GPIO_PIN_FUNCTION() to tell the pinctrl core that this pin can
be used as a GPIO.

Fixes: 35ff9c6b318a ("pinctrl: qcom: add the tlmm driver for Kaanapali platforms")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-kaanapali.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-kaanapali.c b/drivers/pinctrl/qcom/pinctrl-kaanapali.c
index e9351e29d38ed90b093d6a23572805a5a41a950d..85ff2f165c004e2ba0337170f8289661d6080103 100644
--- a/drivers/pinctrl/qcom/pinctrl-kaanapali.c
+++ b/drivers/pinctrl/qcom/pinctrl-kaanapali.c
@@ -1374,7 +1374,7 @@ static const struct pinfunction kaanapali_functions[] = {
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

