Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688483;
	b=G4omhZzUEXMhcyva3c7qSQNOwSPDB18gpo2Maxo1QWp3pi8hMI+AP+NRvBAZlxbJN9ys
	 2A4QW0Z4O78t8e4SPLfMqg6eY/KV0n2rfQHcN5wYgkJDzl2egNUPIjwAxVikeQZaETz+C
	 szbyT1JA3oYOozpwN6aFU+PBcHAGUBI+mRYuhw/YWmhqXXrqeadxmhglAmwdu781vgIVc
	 DerxdN4nAmuBtBsOZfg4UW/yEAXbWdf+ZCgRe7duMqzhKXDQtERM1CDxxwuxgelx6AFyH
	 rRx5TEIuwTWDW5xFGuPkKUwEUqwM0oYlTSpBu0ngtsmeM4HQZXYloMKCwnR8Ro3Ktwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688483;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kk6Dvk9uLFBzq3m8NlqZhzmZsJJP02j16A42P149LX4=;
	b=LReBxi9lleSBWWa67b/mIK9qDGZhOfcI3Z1je1H7sASLIFuBoPZUIgfKiBPp4tBdYwht
	 4HXIrHh3GYyaBF7Qma4RxHysdlOuZn6YvxXLZtCPxjhQucWMm3FFgN8J5P6By1DN4DGXf
	 SfKRN9H+Q9etQaOHpK2NbnMByh0ljQzNe/vdDUs7EWaFlCdRVgal1Tv0qB62iAQBOxIKt
	 D92/QCiNMbApB1jLYWNywYP+AGNLWzoRDT8AnT2ouP2Xj8MLdZmYv+Gjaeek/oNbvQBSc
	 j71m972vMioNN1hR1GQgB/YA7kOqe1Y/Bd7FiqnLqkKVFVlir4KlC8HfVMeDXqOUdXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KOG2qRvn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GzEf+Wvh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73103606A31E
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 10:21:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73103606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KOG2qRvn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GzEf+Wvh
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7BBgk3548522
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 10:21:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kk6Dvk9uLFBzq3m8NlqZhzmZsJJP02j16A42P149LX4=; b=KOG2qRvnNuZ7nKqk
	53VsSii/wPSbblR1nDMnInkFzJEk1kYer+AxEfb3VfZU+ZrLrQoc6W1HgkzcrKhM
	m1SECI9yxO2B3X5lDfpsyuTBG+570BV9XoyTyxkvsZw4o8BxXc42ktXCxssei7re
	2EeVnu2tvLBBq2I3oLoEA85joCGvn5Dw7SXQm/vb/mUmDUG93PV4HfV2le8qRdTt
	UjK2JGfBBmqoREdORv3Elq9aZh5V7jslL7jFRyjSfjTTgyU9XsGCO09pYQJT3m7i
	HQo4BznGouiloEIVbCOaNgFMSzGPyvlDIynQ1suquwnkIoeecMzXGzZp+DJvdjWe
	5KIuYw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vaug80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 10:21:22 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-92114c39cadso125178096d6.2
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 02:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795688482; x=1796293282; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kk6Dvk9uLFBzq3m8NlqZhzmZsJJP02j16A42P149LX4=;
        b=GzEf+Wvhm6GhuIXdkVy+P3uFLLVtXVvYEzmNhD66pfvKBplaOMNxUOWxH2Mv933Cap
         2F4OpRmq9QCVkhthPrfdoAFfl4F9v7nOmpydHadg1q+x5JZ94zWnu0lasJybBlxqDH9m
         hzeAMJFy9jrvrWTpy+o1GNUNrMm3EABlxag2xJszOuzlVx+qI/NB1oH4ywqaSfcC6VhJ
         8qLMDWYKCPASSUZYZHOE21jhpkTGAiFsuwf4kVLgwFk7CF5fseBhXpxnejpa+1JiwzCt
         WtjrdoTjzgiZ4oWilQjq7cGIkuSK8SL7GcE+uOezotAIR0WVjNvQaR10NU7685Dx61BK
         sOOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795688482; x=1796293282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kk6Dvk9uLFBzq3m8NlqZhzmZsJJP02j16A42P149LX4=;
        b=ZXNj118zLjyAO1zOKBrwll5HSJj0oOHNsIEFXsMU6raDBJvFGm8fqvhW/fUw9xIp6M
         Dpx8mRGUerwsNMuc1hZ+UXVRZM+0/04ZzW/2YD8tzZI1f0zsErYRhugvu6Tm6EVnh9jt
         bqtoe/V+qFhJUDFpiYGk7qw3dGBhDfgtHpqMxQcuzKVhf4ehBM4jghvjVQVZPbvu8GS9
         mJa48x2erGENjPWaTEpijgHox3RyI3wy+3zb2SIkF3ExcI2+SJElh4+E2dors05nhsZs
         le0S5riCJ5pJ+YjzKLtxYd57V7+KjG4WimYQyHiWnwaP1E/YgxT3uhMNCGQS1FZLe9aB
         esAQ==
X-Forwarded-Encrypted: i=1; AL+hErH9AHwe5DxB8Ny7DehO/RRdfbZs+nN72ZNS/+hIx0bM2d5SUAvG4+uzdaE79vzlmoZtS64OWdRg99sm@vger.kernel.org
X-Gm-Message-State: APuU4Z8suhPsRzdEoZbRxWmW/TUwszvNT7IHFDW/oke5Tk/3nWo1uFji
	LDrSgPx61bloRl6rmbzYZoMHWaQh4Jr8ooruPpZNCqVTUFq+ZfJe3Rfta16Glzc1L0d+3hmiwY9
	w45W9eQi8IHwwWcWnY2ICrllEBquMSnroq4kt0KgjacAxWb56Tqsca0qTrC2pQrWD
X-Gm-Gg: AZFdTZdbK7hyiUaKkrr8hYRqyfHC8uctWPibymZZ7QjRHnlXtvsVfy63qlr2FYNsJXi
	1hp7+ArgJxOoeUc8vWOfSOc+byYAVl2WFC2YOuRgXeCSJJhZOgV6UpnBGPD1SHhIAao4MDJjVx1
	oSMaYUoD/IGY9QczNDii9VXGwawMesSODCvurBiv81MeCm+LTQKCyYj6LkBioqMlZYMAURea0U7
	lawGp5Nkst3Owky1SryLQuHN1utCQR96/oCMtCdNs0asWvF9lEny6x7KPqJZP0wGS6zcWvcY8LB
	Sx+fpIkgAP463sSllGgRMQEzPTx2VqV0CH5FODQaut3IDCiqe40fCDykxkbN/GqG8IlL4o90/GF
	asOmQecn9djYzimYPIGD45YGxFmxDHBf6/+MizOPt3xRAk+AwOOiHHOQfIrsvxPWWoIwXqdApQd
	fuXTMSHV60olV5p3wEeZHLEHADfzy2J//6jKZHx3idX2BPHciRohCyKKZudOVkzAA=
X-Received: by 2002:a05:620a:258b:b0:93f:633b:ee13 with SMTP id af79cd13be357-949ba965a39mr3603799085a.28.1795688481614;
        Thu, 26 Nov 2026 02:21:21 -0800 (PST)
X-Received: by 2002:a05:620a:258b:b0:93f:633b:ee13 with SMTP id af79cd13be357-949ba965a39mr3603795585a.28.1795688481196;
        Thu, 26 Nov 2026 02:21:21 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm658817885e9.10.2026.11.26.02.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:21:20 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:21:08 +0100
Subject: [PATCH v2 04/11] pinctrl: qcom: eliza: mark egpio as a GPIO pin
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
Message-Id: <20261126-qcom-pinctrl-egpio-v2-4-521fb057d3bd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1167;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1vLjlyqfqbwX9v432amEbSWIntuaOGNi85SrnQeiuyY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCAgTJndVMiweTa63kSLTfWiSLHI9ya+Grx0K+
 8FEufJbH1aJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawgIEwAKCRAFnS7L/zaE
 w+dbD/9XFRxY5QizMZmrvZ1uJedK/YVP2nea7Vrxje8QfnAviPb1SfGLyvQAbjPXFDL7DNTvFvH
 kduNHNYwAz0JsJo3RYOe4k3mXKwtUfZjD/tAP34klgizdbqfmz5hi3JCr4gxa236wzXkzFrZn1T
 YpelyNBanT00EMAoULeWvhf+eln2DgR0BCY7I4Kg9bN0RfoR+J35lR+b42bReTvKsbdAZI9Nmv4
 ko3+3yRxOQAyrRYI6q4Sl95cQFqL6XiE35ztL+rKtqmjtRddCcYBT1fYoMADmeFasQZiAH27XLC
 HPYLR5Vzs9zv+a5Z50rA0jOEYujnPxRDtlUQUAcfkIoVp5iBarjR9yg9YXECkAXhNv3UjyNE4jC
 e8vOhqoNKRsgJxWR+KxNHdQ5jwr8VqjDViDmMbMh5kaSRkZ4A/nU7IAI1TR7i/T7v8sC890Yixa
 d77emTj9ayN7TPfmyry0rzLNr9EZVmQrIUVmkVM+M2OTezS6wkhHnT1Ep7tstnend3wI5reY4FR
 ujGwwMRK0XHpPCFMIWbc46ECZTUjr8rEYcErOH3hzOozFPDN+DLcwmLxNbbQ1p4A1eojqgtOMaL
 HUNDvECLMdgI35t8Db5vfvv81atXnRBhu2NTyPsUP6EonOONW7NZqto5bD7v1du9+Fr8k1mZObh
 HyQBe0VS5ZTPuxg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX5mzrf3fwKb0C
 05o5KjXYpoGGJbgh8aExmyRiL3AOr5DJl7GLMULtvXCevIBEtEMDc34WSU9rVjoHu0K07QHkhPp
 yRZW+z8G3YIrVb8y0C9LljZoiasMNyE=
X-Proofpoint-ORIG-GUID: 164V7S12YLXT4_K96xkthzpwvSQio_Od
X-Proofpoint-GUID: 164V7S12YLXT4_K96xkthzpwvSQio_Od
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b080822 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=WQ8GYrprbdz2Ztkh-BEA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX0sB9VSg8CtRh
 wRWKJYXtD/wZs2i3JinuF9kOlkJxM3RJ1Ayl6R96sdUXjKsr730l7/nPN39Njfzz8g1cxFvr6US
 6sFQmxOWYPeiL1Q/aZgJQMC8wXXndkzZ2ejWzf1ZbmVbQGl+OoeuPowxHgyd/zlyLVsrjfE7xqx
 RGuiUZKVWPZPoALx3zmBUV3MmZJdMVPU2wU9ANWBDLKxIxd59ldfvLGeU2iPwJCroQfzI0mI4fW
 Q44CfDZTj6QZ6szIqJvICDC32/PcVuCb5NtVA+VIqPeFRjjlYUGi87L/YoYdQn0j/f4AJ/8iCFh
 i8533f8qukNWCQkyzy8ipjq9WTOaCMJ4paFM3A3fd7w4vDVFx1f4LtqPcPkLnMO2PTnZkMHVerR
 AlnyqPHNx02WFxOXBs9xSZ6TRr6BbOevJDc7Ya7i4JK5NMPm1D/NLjCSk/SfQeM8r2t01hYwfgz
 eZbpeW9RF91lJjEwdvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260040

The egpio function in the eliza driver is registered as a strict pin
function. With strict pinmux, a pin muxed to egpio cannot then be
requested as a GPIO.

Use MSM_GPIO_PIN_FUNCTION() to tell the pinctrl core that this pin can
be used as a GPIO.

Fixes: 6f26989e15fb ("pinctrl: qcom: Add Eliza pinctrl driver")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-eliza.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-eliza.c b/drivers/pinctrl/qcom/pinctrl-eliza.c
index 58545e14710e2730b2b8b97d8b7e85ec2b04ad6b..8e1f67864872996786613de5d42d5b6ef308b2e7 100644
--- a/drivers/pinctrl/qcom/pinctrl-eliza.c
+++ b/drivers/pinctrl/qcom/pinctrl-eliza.c
@@ -1239,7 +1239,7 @@ static const struct pinfunction eliza_functions[] = {
 	MSM_PIN_FUNCTION(ddr_pxi0),
 	MSM_PIN_FUNCTION(ddr_pxi1),
 	MSM_PIN_FUNCTION(dp0_hot),
-	MSM_PIN_FUNCTION(egpio),
+	MSM_GPIO_PIN_FUNCTION(egpio),
 	MSM_PIN_FUNCTION(gcc_gp1),
 	MSM_PIN_FUNCTION(gcc_gp2),
 	MSM_PIN_FUNCTION(gcc_gp3),

-- 
2.47.3

