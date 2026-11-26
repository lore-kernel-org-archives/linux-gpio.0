Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688501;
	b=JnZyf8JBTbe8uMjZWQKtKckXEX4rEEH47Dynu/7SEIPNb9sBFsUIadnP9fQOxQ4d24pk
	 T8y7f6YcBnYtUamX3StvoHl8Ytr9HiaYdAOXeIkDzKh13svF02P4UO/o8uQe0S3CkZDJt
	 IG9NaUnNezV7BHhwJjVikQiiy9Y87t+XNy0750+5XGQi8jiCLPw4heK4v6Nd8cjon4TVb
	 ZSeLpcIrmeGSwW5pez5uw4hnCIvLdLMkxqexsjXOKYRJFLjHJPaI930tA7FLDJzdbFSTB
	 ZL40iae2gyFr3M5Qz+woXR6+wywuz+heRIbShpRGywmupYEy1jfvRMnGBkQJrX5YgRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688501;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0llbn1EpJF3f0GgglXjD3dkMdWIzIk15xH5hSErMFXU=;
	b=R2mIM/KKLUM4A/q7zB2/QDIT29IEqUHXr0uLOzHxbWQrImTcrfOofVw0suBkjuuSRwSI
	 5GsE5y0UG5gK4LxjaO27hDniDYNui4fvMv9w4+y3y0wbOhM/CdrieLM3tU3dhh+R/O7g6
	 wt9RIgy0gFM9JcGSR5U1GZCqMMFfQHKjVK/NvsALC9mVrdTMuaWy5pOOl1JpWF8HC8ME0
	 mZNF/ifl/ATBEIT/HPao33AHF7/7qpKt+/ug2KEYlDWHuBACN3HkSA7/vUE6fNZFppKIL
	 njnhZr442ybdFv7TEs3XPqCrn6tn2SdkgcI7xKCSEPYo1vj0n8AGxHAbyr63sKFrJHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A05q+inE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="dD8U2U/k";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB655606A321
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 10:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB655606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A05q+inE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dD8U2U/k
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B2Bb1682387
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 10:21:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0llbn1EpJF3f0GgglXjD3dkMdWIzIk15xH5hSErMFXU=; b=A05q+inETtJuGRb9
	po6lXamGxSvspVQC8AB9/YdHmQTSzE3nkOSmFWDU1Q+kLbNVvYcZLt/TrX4Hpsok
	OYLqedtTAdTCN2nqK9+iOG3/X/FOhBgth+sqiqablx1xHznJ4YcvoLdRPoBXMbMm
	iCz11jeka8nHrQn3sl0cQU3S9pM8SRKit9vcfbYekLk0KGRtqQ5ftyzsLQrVj256
	xTOLlJ+3Y7ohVGLXzcyK5M14e3Pust0/+REMkucEBoqYxMz3RfkEW6UV9XxUYpE7
	77XSmN96oDE1aO0OCOMoqvMORUlwEYcYA3UyOao2lsP14emrtj9iI8iwQEQP2NA7
	7KDJLw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62aeknyq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 10:21:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f32050e72so1492368585a.1
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 02:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795688499; x=1796293299; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0llbn1EpJF3f0GgglXjD3dkMdWIzIk15xH5hSErMFXU=;
        b=dD8U2U/kjqVXuBwmzkmR37JGisTUZuTvq5w4IWfrfzNI0J74P9YuOC7B3EGIOn52xa
         PxTpz0i8ybpEC5oo874mQzFqfihP0M1CfnKZGpLadng2xojEJweIGHOImyfyhS4t7n2D
         U3ewPPCIIvn+Zi2McWYdoKpk0zPi9OXpMj05yqw7JuX+ldyQGyKbRYcDPWy/ffVXmT+j
         9ab8TFP0nvqDZDgnXZhCJzrW0Jydui+bM7qzlpJ1H4FM3QRDs7asnOnJA45+WRQ4FqDx
         qIZ5dJgzEjnLonoRJUDHs0k4UyhOguk1aELbmolzF1GLMugS3FiRwPs9ZQg9JvF58nPr
         ybQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795688499; x=1796293299;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0llbn1EpJF3f0GgglXjD3dkMdWIzIk15xH5hSErMFXU=;
        b=fMJ+CezyOZMegy9YGq//q8iYfL7UczgZddhB/7ai01Er+xnt3NjotTAhMO4xLePNLO
         9OpVmkPzBkc10m8kB1Axqkk5xJEkRjOWPENo60UHOeZ8QEy21LH3WPTSqGI9ZxyRFTd5
         PBv4mgqvXt4P1BjZSU/fNuhC5TLRSu7D7Y9PILw9IvPDPEmiAsvpa3NNeJpnrkrNJPhb
         S7xG5NMcLSRQq4tQ2IY7BI0RjwAJaHEzOmtorfIUXL+umupCOUM9A1+MUD28ZYa5Bfll
         lrCfYn7gZo3pgldtlUvbMJR9rzTaMl6zfUSOhjw8mM/g72LzNnbTDuQVBAP/Il3o9HEJ
         Hb3g==
X-Forwarded-Encrypted: i=1; AL+hErGLmxKx15s/R6C2kUWxyw1eh+u5TYUKlHi4edmEaM5o0QfQsXG0Ufk27Pk88syiKGwdJlY0KEsGjCTu@vger.kernel.org
X-Gm-Message-State: APuU4Z+lh9PzJrHTBra9sxg2WtQoAM3P4z5LAZy8rmlGYCVWwBOU45NT
	VyQ7VfoV8xWmwZtNC7AjgrJhHWueDHhNyGaqaZbap5/6QvY9mz3p2XAIekXLD1hfUA8jLaP5KYF
	+oIcoKqPV+mLBRHLC8KmcUZxwnn4AZD6mSNW0gKdVYzdohrFjv6KqSWs9ortgI6wU
X-Gm-Gg: AZFdTZcBAz8CIG4D/vhYP1V8hsdeKrjfi2nDUPtGjjt75Zps79GDsCEovE37EcY0wNJ
	fHKIi5kWOuzmA0BatZgINBpof9d6YiJwnAdN1505golz5sLQmIuDdXqS3L1Baq7i9Zmh9Ce/MWu
	zFCmUzRh9u92SIYuwYJgaZpUky9iDO+cwY/nzq82MOcyeL8UB+TDrCI3V1Wg7Oc5krOm+sJrN20
	BiFoLNfyxuGLNlZeOJO1bvm5LfUa0r7sStnEZiV9tHwhYYygHcog2J/7HljxJOXVHV/7u5KS4XO
	P25EbVbvSqbZ/uz6MxKdCc0Hz6oaDberSmUCoAhndUdg/PAVptjlhu6SroToSU1GucImDnExvr4
	yysCCm8X+d8vPwFxwVUNiubrXkQaa9zJSxJmnWMjMq/9S7U2JPfCpF5AMU1iSuYZ3v7hL2hgQEq
	YCXBudUmu+i1CKEQ1poNskTCMr1UkhG0oghspIKry35tBahS4zR4fvbG8UggOe/Ls=
X-Received: by 2002:a05:620a:4387:b0:945:d148:657a with SMTP id af79cd13be357-949ba99cd7cmr3269450185a.24.1795688498963;
        Thu, 26 Nov 2026 02:21:38 -0800 (PST)
X-Received: by 2002:a05:620a:4387:b0:945:d148:657a with SMTP id af79cd13be357-949ba99cd7cmr3269447485a.24.1795688498433;
        Thu, 26 Nov 2026 02:21:38 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm658817885e9.10.2026.11.26.02.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:21:37 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:21:15 +0100
Subject: [PATCH v2 11/11] pinctrl: qcom: sm8550: add the egpio function
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
Message-Id: <20261126-qcom-pinctrl-egpio-v2-11-521fb057d3bd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8211;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=X57StljxrFqfhzlljzvvpjvWIl9o0MhcpLr1gtDzyQ8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCAgU58Z9T4tJlXl81W3nAjEyJqnSrOlgWpO0P
 ANMqc7LaiaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawgIFAAKCRAFnS7L/zaE
 w1uPD/9a4+oQrpI9hh1YwiMVAoheH2i752jhDgjCGPAvvxOdN/kOcY93SVXkDj7UOTHG+iwoNNd
 eXd0D6aLgoRpHwCQSRfV2/iYumOIq0vsD7bLzfVt9lLlcKOpZuWFJqlad7k8BJVDomT268O8+wp
 oUIvJX2NFY1sHpaCaA3C6qlugWlGhGcTMOq8AdAJ+yfIRcBdSPc3MzSkZhp+EZvzDutS263ARdL
 vml2kG6EkkX4VndUDjgVGhsUg/hr0rtzT6EGboN6s3TmnwHPSyBJWT23Gco93vxgpI87l5m2tj2
 XxDmCSFgQ3erNnaQUNaMJLqEFRcr/VWdJU3rvnpkyag34lq1hTLrP6DJTwPreShx8oOUZCX1FMl
 GeWHRwWjXeyqDDJa9Y38Vq5/UmNbnmWxv1N2Qoi+JzFZAxGMmOJQa39QvH2gx7UD1dVaI2IliTh
 3yD6MYdqReRVoKp79uiYMFjML6A5KEb/euvGJ9MGI/+yuZr5aNCCIbdoeLiw6S3g0irBB1NgKJR
 hRDfvfF+gO8YPMdFCgRrpDw6FMmx+9gheUkcWN1WkIeGzpcoLPaipUPAGlFn/LFiwHn4QySJIKB
 WfJYT4gyUdzUWrIcSjAr8G++YRmmLoG9KX0ISZyrtXVi2wGQNckxWbuyvt43DocYYuwcpEsRq3J
 YW6i1xF8T7BCqCQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX1y+3tsl1jW9l
 oxzhuqIP4K4C6kq+w3mckGdBngPidICBfJH+VfTvBMLZIAIwrGILfNcYOoHo0kyE2WHRcf6fwt/
 XD4S9ZDF5/zRppT+KhHXuDVAQUoEgUE7rkIDyW7BKqRK63pamho2TpyzFt3OITgWPeuf7CsliHc
 EzChupxqv27BZ8pdOpPvKEL16Hmfo5cl0l/rzItsRrFlmgUXMtiwKYOecAo76Rb01f+HSOzr46x
 GBkm3oU26mf9hHP4tfukUZLNqlo29J9cjFXdy46lJyAjafFE//22R4L/QRdOAiDxpGU2S2P+hyy
 I3tdE3IOBTp9d9Fq2sl50WzYvwr+pQeMO4jt1hUesKeNeajoVButimGgMBWBGMuRJFkoaepctmv
 TTM/ltcuJEKE09wx66WkTxfG72wCy5jmrKtuft53igBpOpluvkZYyyewMdbHp3Pc0pEmD5tqEEX
 6C91EHdlFHRsC5UqlTA==
X-Proofpoint-GUID: MNYp7YTV8r71jw9UB_mGkAdFePSWcaDi
X-Proofpoint-ORIG-GUID: MNYp7YTV8r71jw9UB_mGkAdFePSWcaDi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX9K+meq70f8Nu
 lcg/0b1GGf7yOFnhAFLVTt1oqT3LY0SzhThF6wIN9aeuL+K88zrblbrp2V9jJTSuRgANdDPyWLV
 Wkm4evTPkSHJ4TGty1IZmL/IaNbMQqs=
X-Authority-Analysis: v=2.4 cv=PqoG/AM3 c=1 sm=1 tr=0 ts=6b080834 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=rtxmPCpGaZ0uCJ4zFhEA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260040

The sm8550 driver sets .egpio_func but never defines the egpio function.
Once muxed by the APSS TLMM, an egpio-capable pin can never be handed
back to the LPASS or SSC island.

Add the egpio function for GPIO 120 and GPIOs 165-209.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-sm8550.c | 105 +++++++++++++++++++---------------
 1 file changed, 59 insertions(+), 46 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm8550.c b/drivers/pinctrl/qcom/pinctrl-sm8550.c
index d12256d970a0c23142e3e633a1eae001e3a18958..b73ad324f883debc029417f15c783d4fe7b9aa93 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8550.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8550.c
@@ -568,6 +568,7 @@ enum sm8550_functions {
 	msm_mux_ddr_pxi2,
 	msm_mux_ddr_pxi3,
 	msm_mux_dp_hot,
+	msm_mux_egpio,
 	msm_mux_gcc_gp1,
 	msm_mux_gcc_gp2,
 	msm_mux_gcc_gp3,
@@ -844,6 +845,17 @@ static const char *const dp_hot_groups[] = {
 	"gpio47",
 };
 
+static const char *const egpio_groups[] = {
+	"gpio120", "gpio165", "gpio166", "gpio167", "gpio168", "gpio169",
+	"gpio170", "gpio171", "gpio172", "gpio173", "gpio174", "gpio175",
+	"gpio176", "gpio177", "gpio178", "gpio179", "gpio180", "gpio181",
+	"gpio182", "gpio183", "gpio184", "gpio185", "gpio186", "gpio187",
+	"gpio188", "gpio189", "gpio190", "gpio191", "gpio192", "gpio193",
+	"gpio194", "gpio195", "gpio196", "gpio197", "gpio198", "gpio199",
+	"gpio200", "gpio201", "gpio202", "gpio203", "gpio204", "gpio205",
+	"gpio206", "gpio207", "gpio208", "gpio209",
+};
+
 static const char *const gcc_gp1_groups[] = {
 	"gpio86",
 	"gpio134",
@@ -1367,6 +1379,7 @@ static const struct pinfunction sm8550_functions[] = {
 	MSM_PIN_FUNCTION(ddr_pxi2),
 	MSM_PIN_FUNCTION(ddr_pxi3),
 	MSM_PIN_FUNCTION(dp_hot),
+	MSM_GPIO_PIN_FUNCTION(egpio),
 	MSM_PIN_FUNCTION(gcc_gp1),
 	MSM_PIN_FUNCTION(gcc_gp2),
 	MSM_PIN_FUNCTION(gcc_gp3),
@@ -1612,7 +1625,7 @@ static const struct msm_pingroup sm8550_groups[] = {
 	[117] = PINGROUP(117, cci_timer, phase_flag, _, qdss_gpio, _, _, _, _, _),
 	[118] = PINGROUP(118, qup2_se4, cci_timer, _, _, _, _, _, _, _),
 	[119] = PINGROUP(119, qup2_se4, cci_timer, phase_flag, _, _, _, _, _, _),
-	[120] = PINGROUP(120, cci_timer, phase_flag, _, qdss_gpio, _, _, _, _, _),
+	[120] = PINGROUP(120, cci_timer, phase_flag, _, qdss_gpio, _, _, _, _, egpio),
 	[121] = PINGROUP(121, i2s1_sck, _, _, _, _, _, _, _, _),
 	[122] = PINGROUP(122, i2s1_data0, cmu_rng, _, _, _, _, _, _, _),
 	[123] = PINGROUP(123, i2s1_ws, _, _, _, _, _, _, _, _),
@@ -1657,51 +1670,51 @@ static const struct msm_pingroup sm8550_groups[] = {
 	[162] = PINGROUP(162, qlink2_request, qdss_cti, _, _, _, _, _, _, _),
 	[163] = PINGROUP(163, qlink2_enable, _, _, _, _, _, _, _, _),
 	[164] = PINGROUP(164, qlink2_wmss, _, _, _, _, _, _, _, _),
-	[165] = PINGROUP(165, _, _, _, _, _, _, _, _, _),
-	[166] = PINGROUP(166, _, _, _, _, _, _, _, _, _),
-	[167] = PINGROUP(167, _, _, _, _, _, _, _, _, _),
-	[168] = PINGROUP(168, _, _, _, _, _, _, _, _, _),
-	[169] = PINGROUP(169, _, _, _, _, _, _, _, _, _),
-	[170] = PINGROUP(170, _, _, _, _, _, _, _, _, _),
-	[171] = PINGROUP(171, _, _, _, _, _, _, _, _, _),
-	[172] = PINGROUP(172, _, _, _, _, _, _, _, _, _),
-	[173] = PINGROUP(173, _, _, _, _, _, _, _, _, _),
-	[174] = PINGROUP(174, _, _, _, _, _, _, _, _, _),
-	[175] = PINGROUP(175, _, _, _, _, _, _, _, _, _),
-	[176] = PINGROUP(176, _, _, _, _, _, _, _, _, _),
-	[177] = PINGROUP(177, _, _, _, _, _, _, _, _, _),
-	[178] = PINGROUP(178, _, _, _, _, _, _, _, _, _),
-	[179] = PINGROUP(179, _, _, _, _, _, _, _, _, _),
-	[180] = PINGROUP(180, _, _, _, _, _, _, _, _, _),
-	[181] = PINGROUP(181, prng_rosc3, _, _, _, _, _, _, _, _),
-	[182] = PINGROUP(182, prng_rosc2, _, _, _, _, _, _, _, _),
-	[183] = PINGROUP(183, prng_rosc1, _, _, _, _, _, _, _, _),
-	[184] = PINGROUP(184, _, _, _, _, _, _, _, _, _),
-	[185] = PINGROUP(185, _, _, _, _, _, _, _, _, _),
-	[186] = PINGROUP(186, prng_rosc0, _, _, _, _, _, _, _, _),
-	[187] = PINGROUP(187, cri_trng, _, _, _, _, _, _, _, _),
-	[188] = PINGROUP(188, _, _, _, _, _, _, _, _, _),
-	[189] = PINGROUP(189, _, _, _, _, _, _, _, _, _),
-	[190] = PINGROUP(190, _, _, _, _, _, _, _, _, _),
-	[191] = PINGROUP(191, _, _, _, _, _, _, _, _, _),
-	[192] = PINGROUP(192, _, _, _, _, _, _, _, _, _),
-	[193] = PINGROUP(193, _, _, _, _, _, _, _, _, _),
-	[194] = PINGROUP(194, _, _, _, _, _, _, _, _, _),
-	[195] = PINGROUP(195, _, _, _, _, _, _, _, _, _),
-	[196] = PINGROUP(196, _, _, _, _, _, _, _, _, _),
-	[197] = PINGROUP(197, _, _, _, _, _, _, _, _, _),
-	[198] = PINGROUP(198, _, _, _, _, _, _, _, _, _),
-	[199] = PINGROUP(199, _, _, _, _, _, _, _, _, _),
-	[200] = PINGROUP(200, _, _, _, _, _, _, _, _, _),
-	[201] = PINGROUP(201, _, _, _, _, _, _, _, _, _),
-	[202] = PINGROUP(202, _, _, _, _, _, _, _, _, _),
-	[203] = PINGROUP(203, _, _, _, _, _, _, _, _, _),
-	[204] = PINGROUP(204, _, _, _, _, _, _, _, _, _),
-	[205] = PINGROUP(205, _, _, _, _, _, _, _, _, _),
-	[206] = PINGROUP(206, i2chub0_se8, _, _, _, _, _, _, _, _),
-	[207] = PINGROUP(207, i2chub0_se8, _, _, _, _, _, _, _, _),
-	[208] = PINGROUP(208, aon_cci, _, _, _, _, _, _, _, _),
-	[209] = PINGROUP(209, aon_cci, _, _, _, _, _, _, _, _),
+	[165] = PINGROUP(165, _, _, _, _, _, _, _, _, egpio),
+	[166] = PINGROUP(166, _, _, _, _, _, _, _, _, egpio),
+	[167] = PINGROUP(167, _, _, _, _, _, _, _, _, egpio),
+	[168] = PINGROUP(168, _, _, _, _, _, _, _, _, egpio),
+	[169] = PINGROUP(169, _, _, _, _, _, _, _, _, egpio),
+	[170] = PINGROUP(170, _, _, _, _, _, _, _, _, egpio),
+	[171] = PINGROUP(171, _, _, _, _, _, _, _, _, egpio),
+	[172] = PINGROUP(172, _, _, _, _, _, _, _, _, egpio),
+	[173] = PINGROUP(173, _, _, _, _, _, _, _, _, egpio),
+	[174] = PINGROUP(174, _, _, _, _, _, _, _, _, egpio),
+	[175] = PINGROUP(175, _, _, _, _, _, _, _, _, egpio),
+	[176] = PINGROUP(176, _, _, _, _, _, _, _, _, egpio),
+	[177] = PINGROUP(177, _, _, _, _, _, _, _, _, egpio),
+	[178] = PINGROUP(178, _, _, _, _, _, _, _, _, egpio),
+	[179] = PINGROUP(179, _, _, _, _, _, _, _, _, egpio),
+	[180] = PINGROUP(180, _, _, _, _, _, _, _, _, egpio),
+	[181] = PINGROUP(181, prng_rosc3, _, _, _, _, _, _, _, egpio),
+	[182] = PINGROUP(182, prng_rosc2, _, _, _, _, _, _, _, egpio),
+	[183] = PINGROUP(183, prng_rosc1, _, _, _, _, _, _, _, egpio),
+	[184] = PINGROUP(184, _, _, _, _, _, _, _, _, egpio),
+	[185] = PINGROUP(185, _, _, _, _, _, _, _, _, egpio),
+	[186] = PINGROUP(186, prng_rosc0, _, _, _, _, _, _, _, egpio),
+	[187] = PINGROUP(187, cri_trng, _, _, _, _, _, _, _, egpio),
+	[188] = PINGROUP(188, _, _, _, _, _, _, _, _, egpio),
+	[189] = PINGROUP(189, _, _, _, _, _, _, _, _, egpio),
+	[190] = PINGROUP(190, _, _, _, _, _, _, _, _, egpio),
+	[191] = PINGROUP(191, _, _, _, _, _, _, _, _, egpio),
+	[192] = PINGROUP(192, _, _, _, _, _, _, _, _, egpio),
+	[193] = PINGROUP(193, _, _, _, _, _, _, _, _, egpio),
+	[194] = PINGROUP(194, _, _, _, _, _, _, _, _, egpio),
+	[195] = PINGROUP(195, _, _, _, _, _, _, _, _, egpio),
+	[196] = PINGROUP(196, _, _, _, _, _, _, _, _, egpio),
+	[197] = PINGROUP(197, _, _, _, _, _, _, _, _, egpio),
+	[198] = PINGROUP(198, _, _, _, _, _, _, _, _, egpio),
+	[199] = PINGROUP(199, _, _, _, _, _, _, _, _, egpio),
+	[200] = PINGROUP(200, _, _, _, _, _, _, _, _, egpio),
+	[201] = PINGROUP(201, _, _, _, _, _, _, _, _, egpio),
+	[202] = PINGROUP(202, _, _, _, _, _, _, _, _, egpio),
+	[203] = PINGROUP(203, _, _, _, _, _, _, _, _, egpio),
+	[204] = PINGROUP(204, _, _, _, _, _, _, _, _, egpio),
+	[205] = PINGROUP(205, _, _, _, _, _, _, _, _, egpio),
+	[206] = PINGROUP(206, i2chub0_se8, _, _, _, _, _, _, _, egpio),
+	[207] = PINGROUP(207, i2chub0_se8, _, _, _, _, _, _, _, egpio),
+	[208] = PINGROUP(208, aon_cci, _, _, _, _, _, _, _, egpio),
+	[209] = PINGROUP(209, aon_cci, _, _, _, _, _, _, _, egpio),
 	[210] = UFS_RESET(ufs_reset, 0xde000),
 	[211] = SDC_QDSD_PINGROUP(sdc2_clk, 0xd6000, 14, 6),
 	[212] = SDC_QDSD_PINGROUP(sdc2_cmd, 0xd6000, 11, 3),

-- 
2.47.3

