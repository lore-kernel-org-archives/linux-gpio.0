Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688477;
	b=pjKmCQGL1VRPrK1J/TgaZOTetBVjNbj3pvEqP3YGmdqgH26lOVUMhxoXjH1UEAGwWdIs
	 HJeP0gJBzDKzXX0EHt4ow9YLE8Ai+JkA2oC/7bVTk7+VbA+fn9aaWJ2nhIi+NGmuQWbPC
	 Q4G5l+OTbjlcNr48phS/OzQijaNJXTj5vN4Pmnh8cDxS4UbpSnUjgI+d1FybYqHznoCDj
	 Jq5c4EyEXKFoPjfkYoqJm+lAYyHkrabHw49F0MQRdhjigZb8zNOPUayag4IdFAPgemiD8
	 JD3T2sQv8GDv+9FBUDYfsr4mZIPfuibDU+R27zUh82rPZPx71dQzKn24Np0QAfTBNaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688477;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mqIzFznaIqKy/d1APlvOVs0iwxm09UxdIX49QA8Dc74=;
	b=Wof9HxEgVmPqEmu8B9yBEKXW2CYwGllJeRFomf+oyYwAxf0SJhpLgKBPeytCpJbjHtef
	 3C82Xja81PMltAQqJ8kejbEQ+3TfWy9OlLHTbg6NSlGyf6I99a9YgadlSUvId1xSI2Q7S
	 yxg+FTDIhWmxNaZ0ljjqHudarPhK8FpryMH6ItjM/9hpLMhNj/EiH36iPUrJx0cUcvwr5
	 xI7SX4XFeVDY4NRAMrrKihx3sx7l+lANqeerk/fv5q4JqtN5EfftDeAD13wqNPBFJ2BNz
	 OrLVxbGQL3LUhe0xIDAO+Nj7QywEfsBrDPrDHGkLjae1vmVA3+1+Wy22YQYBrlBDGqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cel+veus;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UDYDXEZD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7DE606A31E
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 10:21:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E7DE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cel+veus;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UDYDXEZD
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7BAvv919580
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 10:21:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mqIzFznaIqKy/d1APlvOVs0iwxm09UxdIX49QA8Dc74=; b=cel+veusijpS9hNf
	IpuDHqhFg2B/FGsum9pCNmeuH8/HOY0I+lgdM1hL0jhjfVOMqXn5UzSitb7ZxAUN
	w/KNaBUN9zHT4gDv/SWr1IfBCMLsWxyj/CtnSHpzn6ROx6wcv2k22PdJNSGXAPmD
	JB4NLj8EqMPQ5GYAkBA3vnyYo/Od7wHdWd87YzJVPmwTApW4cFxNMm5kpkGold8M
	A+GNfUNpKTzrAN/9G3FkhKsnuT9CZvY43m0I60LVQfQHmvmmN4XbG8amZu5jaBmU
	g6tiDW+5I01Dx4SG9T++smMe3y1QxlgwlC9gzd7bYxXa/skAl25ytzWwJrfIEhTL
	Tq0+bg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y2mjg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 10:21:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f33438950so1157443285a.1
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 02:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795688475; x=1796293275; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mqIzFznaIqKy/d1APlvOVs0iwxm09UxdIX49QA8Dc74=;
        b=UDYDXEZD5QBY4H6RgTHkyDhE0yST6vBWjPkT+VteaEpGKpkYzwcL+PvAxL7lwu2oS7
         ZD+kjCt3OL9VqIM1CsbXSrPtY0Oui0tCD4rXcXEICbCn2pdmD2j5+1IbOobWml1AW65R
         W2H0AZXIqZDqd4FIczVyX+YAM85hCRLZqn5Jb/hRPM1iVqd3f2ShNe1qwt/HE2P1no/i
         iW8+fGRZ3FhFIrmPpxw/Z4dI2+juBef5oJFsR5mCO0mzcNz6yIWe3Y+KqjolWCqgtlai
         qCtFugAEPlpYDllsFuiB5eqaT9yNdaxI0E/DGc0bvs5vj3dBPgMEI4a6QaU7gvj0aHeU
         /RbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795688475; x=1796293275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mqIzFznaIqKy/d1APlvOVs0iwxm09UxdIX49QA8Dc74=;
        b=L5h/ZpuKnW04lKEjxeGT4WtajvJnhCzgNMRYQJiyvceZuwVRC1PSDSnZy06Wob50kC
         D+N+Ybfl2Lgd0+ju7xrRoiWa7+3NNswkEHiZ4oP6h3gjeb40KjNiLsCjEzK0U/dNisAr
         6M4t9hfK872axr9mGXKh/uOxKSc0EaB0scJ8hAxnvmbXoDvxuKgYYmnEpSNnxN/tEQeH
         X2BnQp1KUcVvw8DXTB2fs6ozE8xbTq76lQZnpYbwq39fqTPMqYAAndTWB1JrZoHNshCI
         Zh7ahrAKgaFztAyEerOLeoWB4JRdWR05Lq3DVjcO81Nas5qbGh8P3XWs/KDUrXM7Oxje
         WpFA==
X-Forwarded-Encrypted: i=1; AL+hErEWykqYQdM8m4pj3T43B37fepLthoytSXk0GV3zFBzE/9/VLBPLJlpbzA1V5Pwu1RWBRkJO7D8en9uM@vger.kernel.org
X-Gm-Message-State: APuU4Z9+efDCh+BTWHcdKkAeVxbE/cwbjpS09CWKnyAp/rghlrzVbqfH
	UWunr+gjxBfkAzHhy9gfk76S3ufr3kPLigGdbWCnFbcWUoG/MzFdLCOe/QxHlS71CS0UMl8A4ZX
	ntc+/iO8VUqAZYRjYc9RPLgZXp8adj1y5iTu/kLRYJJEoQ2X9se3BWknrWEvpv1La
X-Gm-Gg: AZFdTZesl2OtpFt9AAtMNu/cGdtEWTCDnA3jj98NfpQrqSuVA+SWEKdHizZmwxmZjef
	wtjzxdFebzAT95gwLEsGkyfgqyDKl4u0TUxdtI3Ccxrx0x/3ml2ZeZRmcmxCriXVXfA66h+rzm9
	MZDksJ6nultdq8Z03QxnsxX2+U0uDL19oLJvDmm+MoKuVUmuu7HueAekrUGt8+QDMqlWQ8/dMmP
	xjf5DEMOyY7Eek7iXUxvfuHqG1PGtFiWHyeaMC2cnm2fVCsfiG8a72/MG0ElucHgLcFhoR1iPlA
	oGkz0cJUhV7J17/JHc5s6UhTV/veo8G0mxoFIsb552obgQoedGhxQc4w5LI9hacYHmfGounmN6A
	WeVvMgwwwvv9XFSx7wDJTrBNe0WDuvIWd6C+bhoXbAExhabS2sK3SV2h6UpOHQVx+i5FBjO8Beg
	mCukU712KoyZ2SXAhlBVlaa7frCCp1YBV9c87FgIpVF/VSIy5BuuyoaQcRJRODSU8=
X-Received: by 2002:a05:620a:6487:b0:949:9a8c:7052 with SMTP id af79cd13be357-949bab1577cmr3086813085a.70.1795688475275;
        Thu, 26 Nov 2026 02:21:15 -0800 (PST)
X-Received: by 2002:a05:620a:6487:b0:949:9a8c:7052 with SMTP id af79cd13be357-949bab1577cmr3086810785a.70.1795688474836;
        Thu, 26 Nov 2026 02:21:14 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm658817885e9.10.2026.11.26.02.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:21:11 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:21:05 +0100
Subject: [PATCH v2 01/11] pinctrl: qcom: sm8250: mark egpio as a GPIO pin
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
Message-Id: <20261126-qcom-pinctrl-egpio-v2-1-521fb057d3bd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1172;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=HuQaVy0w9sKhfLfcac7vUBnQCG6ABvcFlLk85ZOsULw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCAgTTHs0R4uOlA8vgXUYmQEhLdFLXMWcy0IGC
 umTJqNPYhiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawgIEwAKCRAFnS7L/zaE
 wz5wD/9Glzv7uPllPNGfQuUx1EHN3JQhGMFONxXQy5iBEqnFvMKyAaDGxc+to0UeAyAcX1zTu5w
 vt67t4hc0rT46DGlnbsdSsoYf6P+3JQpDJ+SaiNWFUb0gw56BYL1JJtLCOu3b6vCQm7drEk5Dv/
 P0LP2p0jPxUeYr+3NS3A78mMvjtGnDoXN9es5KTy94MN8F7db2xwMM2YGDt6gFvJa9DyvMbu+4r
 lfujdzqd+VubD/VOiOYOT1tpCz17y/CtTuq9UM7S1OJyt5Vo7ETpOWZMqVULfRZ2Ls7O6Uw6bAC
 ijucnrXGK504DhpQqhFQcyMjfVughPgZaS15YW9gvjgSBEKmpD4SveVr+VkYymZxec4p6dIjtlr
 pBY3n9HbXXVnnpRv6GSZUvhyC6VQrc/2XXpIwp0ZLiEi1UGQM9ZRrtrvAwOfKpoia2TSSkS6Kr5
 AdrCKt7lCkz4mVrOneOkC6qGI08e1RQ8LmkF4hlI0xBUclYhxhj16MJ6OhxR2Q60c8bIgkAo83c
 g4r9Asr8twrXPurjKcYUSUNp4SwM0r/97ay0Jcil1vRtuqPhGXiHyWXuGFI47DGyZDOT30bbQGJ
 NDN5H5a53MmrXoVc+8FtfihqpJvmtbfUtaM5NWThnh/zYecetX/RY+1cIm9kPB0NOlqqy6C6oRD
 mhC647v+Xsha8wQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX73amy6Xq0ehh
 p5E63w35BZHpP+t92temqMXenascxFL86O9Uj/EgKjMJhCk+F4MIssb7AmKPXu1o8ySxCX8N4sQ
 HaSda/AModsxhZ7DpTnvAsh97EhErsaKUwbM7kDkNhhOOGFrURuAWXqQd8J3Af5ntx0fkdOGQj1
 tyZnyqcftz2Sd7wVPG10JzRY0WgMPS1xe0CR8LrxYIfVHdkPWV1DnHTRHc0fgULISPuZBDquVFe
 Y35YJXA97cvWxyx+9+AKLM/kewUhddj7L8h7IgZGQNh7m0pK73F1C6w22RTr6eV61NjGsZyeF6r
 x/b6TbFhvRfkufy8EinVPG2WDq5C+aNyTUFSu4+X9suQIUZ81gC3Pgo/QSNBrmG0HSe/6bnbnb8
 cRYg+zJ2Z5iWoWNoFbOvL0xutD3rrlL3Muse/EMFJT0G0nUQ8qNBbGilyrE+BVDOyhZcPHBq0DU
 2HUfZ9+GWrpChIMqQrQ==
X-Proofpoint-GUID: qQM6DVzDbTCDKoqo8dNRtKsKPeS2lTBS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfXxreTIuC4S99G
 m/kVhCVOjybRss2js9VIAk5/sH15nFTlXD9ZQ62AVzFCQ6Zi80o4WoMLHgA/BFeUPvZ9oQr57Pe
 FNFw7eekan3VOIBJUw2Z6XubndTCykU=
X-Proofpoint-ORIG-GUID: qQM6DVzDbTCDKoqo8dNRtKsKPeS2lTBS
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b08081c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=6-PDsE6mYu08rWp6JRYA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260040

The egpio function in the sm8250 driver is registered as a strict pin
function. With strict pinmux, a pin muxed to egpio cannot then be
requested as a GPIO.

Use MSM_GPIO_PIN_FUNCTION() to tell the pinctrl core that this pin can
be used as a GPIO.

Fixes: b39e9199fbe1 ("pinctrl: qcom: sm8250: Add egpio support")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-sm8250.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm8250.c b/drivers/pinctrl/qcom/pinctrl-sm8250.c
index abf5f68ef62f58eeee3354ed8731d194d6d60b5c..8791b4f0dde415e1dd2e61e2219392782c4752d1 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8250.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8250.c
@@ -1026,7 +1026,7 @@ static const struct pinfunction sm8250_functions[] = {
 	MSM_PIN_FUNCTION(ddr_pxi3),
 	MSM_PIN_FUNCTION(dp_hot),
 	MSM_PIN_FUNCTION(dp_lcd),
-	MSM_PIN_FUNCTION(egpio),
+	MSM_GPIO_PIN_FUNCTION(egpio),
 	MSM_PIN_FUNCTION(gcc_gp1),
 	MSM_PIN_FUNCTION(gcc_gp2),
 	MSM_PIN_FUNCTION(gcc_gp3),

-- 
2.47.3

