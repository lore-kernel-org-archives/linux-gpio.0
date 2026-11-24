Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530572;
	b=xz4a5C4Xwd6lwqJJoBpclDkqak+g8eGXFOKIeh+2HS64ArIRBr3vOAn2nhKzfrDj4GW2
	 Am+gvA1zMDD71j+4mhhj6TxDejxxevpfad693BMiB/m0ELCBJdPH7ns6Sz3mLnd/K/9YI
	 5ilcHKXdHRJ3Vc6ucYZpy7XtD3ASs85TkMCyymSdD8/LIMuVLMrRLpvky8eY+C5R2t6Uq
	 RVmFuWb9/IEj4JmxGVTCNk6Bk76mVRjp0j/iCAZJI13Sst8GetiXiziekayNPM+7SGfqk
	 l0tmyRb0MoNahm3Luq5+pAKofnyG0dBnZI39HK9XWW6F8z9nsSmlr56IALiK0UMg+eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530572;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IgOw4S/YKKSkgXu8zGtaSLb8x75hEgzqlSeRCTv02xo=;
	b=e9GQWf2kzNgjd/yvn9yDApCZRDGZ/GbVhFZy5xaB2JaMfOnxtEjn1/P+DleeOjhI7Izj
	 LBGGxjZrKZcNlL0bmynY5vz/RGziF1JxK+Y23BOekOYN9zgr1g/q958f7OrnekJ4ZqvV2
	 rqMocj3HRb/foiB4bNAmHWp6+Dl4xQFKApF7rHjd1AILGLLzdddxRfqldAllKhjiusToj
	 9PM/Utn39nQ+tFqo8SXtAVEdQbNSBvVCEZiXvVwdkW6YY/oSxRl43j82yYyDph2bOswhT
	 mZNWqMK2v9cg921YqGum4EinVNfeUdoxX2yd8ki8KbdDHETKUQJ+YOFCucmVxwFvQEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kVpTECvS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VHK3QoU8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136C3606A31E
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 14:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 136C3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kVpTECvS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VHK3QoU8
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuJYI636642
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 14:29:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IgOw4S/YKKSkgXu8zGtaSLb8x75hEgzqlSeRCTv02xo=; b=kVpTECvSs64/Obqs
	L8KudiNXFPfu3gqyBk/48nCFs72AyHc5J1CbbM52oDrCm13knIlWYXHAaQdqIVue
	VqEV2MO08ksFLXPUYmuJK38Loa21lCtc51Hv66kSuPX1uHjuxirJxVixsgKY3VK2
	yBfGpNB31L3kXfDi0mUX+dhhCUdyTyFgj9D2Dt1UK2Ugf5xduae/F/dhyEJCm647
	5YhfOm4JRgBBpF1zu6hbZD5vIkPxSxp3uEB/LQrgb1RB+oP4ARbk89kgYpw7OAv0
	wtM9Ov1usT7GnDSadnntRVb8mucyAjvJ5XMaVH0fb2YNH83d0VgefOhEVcLYmCs7
	UXR4cA==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rpj8ay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 14:29:31 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-67dc4e966b5so4497395d50.0
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 06:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795530570; x=1796135370; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IgOw4S/YKKSkgXu8zGtaSLb8x75hEgzqlSeRCTv02xo=;
        b=VHK3QoU8cNg2uizCfJN0BJYtegnhW7GFzcPsf2JoKEKKUDL4t9c4kvAN9quEng1DDM
         2ABCU359O6Oz2qmeeThpOydzjj8l/KXgMXgWlzodN+3jf3wuBmhAKY59Lxve5BaHsSjn
         7YA3k2rwRFAXFVAL+qLgNaZCB39a0Fmun3J2WfQiT61ull0xwrJUDFVPibQQTIrYos28
         DHHZam1tsdxbTN9RL0/8wUXbjuuTsrzZwAv2TnbVZ2hTCxijV2Z/pwypM6yE2c/acmJP
         fC8ZcjtsWkbxRoftgLF+/x8NVuuG31fF7TsbZ7hViL4pVQP0KBzTWiJ29PoRPbTQr5pr
         smbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530570; x=1796135370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IgOw4S/YKKSkgXu8zGtaSLb8x75hEgzqlSeRCTv02xo=;
        b=dufN6vCkdsmoolv7cBBb+ibSIDi4VaqydOm6Rv1f8oNF7wi/wjsp2yBNeDqYAzdlJC
         ZSIDwglmhV2ie4JPwuLfKpTMFsQkRaodrCvl4NJGgcmxjoF6pNl1WbqYMdzzWuqs66TX
         Bum0mzt+9ZGmc+3TJgj5FUMg8HUD713GTyu6islT7a50E/xb8stcu1Lu+H/rvz+PpNED
         llrcUCOwgrdUtx3nzCj6lbznnYybuhV2w6xRHtaaPWkeSSDL30/YiBVR9RxdT5v7wLJ5
         P2wwOT5v+efRl1Tf/7YYGwR9J/DUnwTyak5T0d4B9a2eHnJQGqD3okNREOvrArjtO4aQ
         aQ2Q==
X-Forwarded-Encrypted: i=1; AL+hErH/yOsZWu9o56vJ5BVV3CWNOYKmO9WoXpK9DKPFzhQpVNJxXJx8rpk7fVsWossLyCEjoh2y7StAXX8r@vger.kernel.org
X-Gm-Message-State: APuU4Z9f9E46N5nw1IV3CLe21xCOTRC19xnBzbmfFD6FbiaZeYlDuvrR
	BmRJ9ctUCE1K8C8cV171FTI5vhOu9XiH8vQTMg75AczQEnXuqnGRwVLDCc49ZzmxnNobiA5c3zy
	limhb7263v7PxY01IlvpjhPIl/aECbIT1YutbttYK4h+pu8ca1bxJv3fnTK2wMyKB
X-Gm-Gg: AZFdTZcnZ4nS7FP9iy4NzESR0Cuyz5LRNvGNLNYFnMaUy9HwDkpfU9bYUTr223DWUGJ
	Bh42gqWylT/6R1Ac+7BxYM7/gdZdt8UtWZm9tblKA+Z/qeV9AlkmgSx7YGucywkyPEbtUdl22Bx
	HX4e1fLCc/mnn67DRv7ygsB6xntCjkypwSwvcdsoNVVP0alPhp4P4zhwhnXYMgLY98XVAQSC8Uu
	Des4BzKpZM0lp5MwSjYgl3pVkIdAXtyUQqRrzp3IHav0XmHZpVGuvo4Lbt66eHWpTurjcrE9cS0
	Db9OhV3J9irOy0dXHWjU4AEuz8EDJiC45OJNrBn6XMIRFQUjtOGE5vPMzE4SN7Z2NVT9mhmPW6b
	ycn8x098ZhzfiSU0mma8wMQQXrTjFsv0Mv4psgf2+FmnmGDX03aAuYf1m9m2MrhUdAmCR8uP6Pk
	wq4tArAUe+m3iJzl2vc6b3KRf7/5oAw83kQkpw01D3YGdLNgXM8FWJqMQHyV0QVuE=
X-Received: by 2002:a05:690e:128a:b0:67d:b729:eee4 with SMTP id 956f58d0204a3-67df42baf2cmr6444067d50.1.1795530570603;
        Tue, 24 Nov 2026 06:29:30 -0800 (PST)
X-Received: by 2002:a05:690e:128a:b0:67d:b729:eee4 with SMTP id 956f58d0204a3-67df42baf2cmr6444035d50.1.1795530570084;
        Tue, 24 Nov 2026 06:29:30 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b34e9c3ffesm12013821f8f.19.2026.11.24.06.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:29:29 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 15:29:19 +0100
Subject: [PATCH 02/11] pinctrl: qcom: sm6115: mark egpio as a GPIO pin
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
Message-Id: <20261124-qcom-pinctrl-egpio-v1-2-34f2c06b2658@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1113;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6L55zPWwXoWKqnOEiZumw3Qxh5x8aXSZJfNQ2TIlUOs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrBZ9C+k/fI4eyCOqb3VY6O3SvcmiJaMnmzWgEy
 15wcRfgxsuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawWfQgAKCRAFnS7L/zaE
 w0inD/0R2AsSV48q45DDF/zJTtrXQ4BVrCcCko8A9Mf3tIW4tVkuDx9TIoxiS67MdmKJKiNBRtR
 lTq5Q8OiFmbFVcu1OpvhRkSndpD0EBY9r6t3fY0khmeyB/6h3M/a1iqS2zT06ROtkq9uhIlq/bj
 ly5r0me74gXQ7o4fw6M8C/eX3FsKQ/7fyxbwYnZtzgP+EWqJz7OID3PcTVfm/Jzhp6KuV34Zcse
 b2XyzSag6asXJOxz+Z4cu/qPJmEtzlwEJmuZKpPKK9Gk9XaC9JHx+cjIQkmwUjCXts+fOAodxMb
 d7v8JTEVIglsgba+oa74QIfNgm1ZiGFkAxeWgbpZqy5E44PoFQjrwyiyOrovE1qY28UuJ2ORqGU
 etC9ejWeHIwMNttThx9/j/2HootZuWYBxhFBOYAwr8mLgnzEr+01fJJiM14DhQ8XQCrqaCvWeUn
 2j0+Gowd8bC4z7t8JDZMWE9LXwUG8N4mLVb+7fUFcyLRbT06948XODTuBNFhWEgfUkk/gqtdLPW
 IX/gHR/7pbjuEKiFbWilYikN35+zGHZFK968FjK/WLNJUDoOSAgVNmrxsP0z3ylS6kPIzm8u+Fl
 CqNvENRNSgxcmSzPbpTwHnH0I1vnxChoGDD5ZOFq97GhW7Lyno695jKFAh+yG8Qw6IyL3kdJ7n4
 /MJjUwKwtSrGJmQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfX31heArhvktU8
 /2jq9kx9uTLO+ua6yOgU47DgHeRos+HRxs2WsnQmWyyEr4NwatHT5YB2LnZ8mNgQQbMU8C9ggW8
 QpwJPR/i3dlDcRtlexVj+M9NHqOghhDH7foVMsZlACARuPrIZkL5/uB0dCgkmRxZ/lvQxIchtnR
 3DekGrITp0Dpdvwjb3enSgLa69ToXV6mrk9CsaOK+1BnHEydXTM7gHGEQJezbOH8myzes9n/zPl
 P7kWmahcKG5xtcUm0Wnnk9hbJdk+lqGEvudn1zUOiMdO8/IDtBEbcb3zMBEKoZH3EZlZFLZ6xo/
 koxyZu/Ve9KwxRoETGohPYJ/x91JlSt0o+mPH+cQiZWNAyZ1Dp1VbD1WjGS91AvmzyBytX4cbwN
 l9xiDdYgQDbcERbens9JbjLYsEZABEUHbc5zlEBZmPHW0SWYNnxzL/pNoLesc+AqEaei204AB6g
 HJrxR4jTCyQoBwUh57w==
X-Proofpoint-GUID: siBbgh23lyKKYuSleiXv13ISz9tmuFcM
X-Authority-Analysis: v=2.4 cv=MvbHeGae c=1 sm=1 tr=0 ts=6b059f4b cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=8nAbR0bechdim5sVv1AA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfX6PEHuFV87ine
 3DEvcJA+/UI8gYNxIGxhG4kqlFqOxqjns1qZIlspQ0cK0CP9d3GsM10vW2whs+ftoJh7LaiCNq5
 19UHGAywKQHiwQ/RAQM7FAZnsiLpeFg=
X-Proofpoint-ORIG-GUID: siBbgh23lyKKYuSleiXv13ISz9tmuFcM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240056

The egpio function in the sm6115 driver is registered as a strict pin
function. With strict pinmux, a pin muxed to egpio cannot then be
requested as a GPIO.

Use MSM_GPIO_PIN_FUNCTION() to tell the pinctrl core that this pin can
be used as a GPIO.

Fixes: 0524a508b2cf ("pinctrl: qcom: sm6115: Add egpio support")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-sm6115.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm6115.c b/drivers/pinctrl/qcom/pinctrl-sm6115.c
index 0099c474c44222c71ef281dcdeb25b7eeeb4deef..7aae2bb15a435a6f64e996a864c49371dc1fcef3 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm6115.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm6115.c
@@ -689,7 +689,7 @@ static const struct pinfunction sm6115_functions[] = {
 	MSM_PIN_FUNCTION(ddr_pxi1),
 	MSM_PIN_FUNCTION(ddr_pxi2),
 	MSM_PIN_FUNCTION(ddr_pxi3),
-	MSM_PIN_FUNCTION(egpio),
+	MSM_GPIO_PIN_FUNCTION(egpio),
 	MSM_PIN_FUNCTION(gcc_gp1),
 	MSM_PIN_FUNCTION(gcc_gp2),
 	MSM_PIN_FUNCTION(gcc_gp3),

-- 
2.47.3

