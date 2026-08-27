Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BAA47DFBE
	for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 16:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787848821; cv=none; b=sgyQplCT+ka2GFuucXRvbRwYdL6UtEVQRKU4UMPibgiyAT/ngYJHHwgRe9GN5tn4rTXE4S+OgQuFn4BTBa7bTptWIBvzDX5BZIiM1nzHuIJ3L7IiJ74bbrZW+1yYyzo7Ol9Lmv8vfS7Gn1gkPV3pt7EaQ6VfrR0P3n7+3jvAzT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787848821; c=relaxed/simple;
	bh=9JHmO47xFcHiKwRcWRppqe+FIDEC/EmRY/1PhD8wx0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F5p1Ecn/xdmNZIUWQz0vE5w50JzI0uvtULv2C5k6NcSh3Dw/QNi6zT2UfZJxbl4hVRJ+WCiYKAUKJa1Qy8xyf5TmxcNEIpo51CihOAU3C0Rsoj2u1Gml0BlCszigsF7RGNE97rV36NgMuxN1Y/oa3DSrwVKesBuLV2rEb9vMkK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N8vvVj2v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R1RnM+Ai; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N8vvVj2v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R1RnM+Ai"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFblVb3921197
	for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 16:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wOoRRo1BzWfxcKIRahahL37V6D+SA2lxSIowy+5sCk0=; b=N8vvVj2vTDZzGwDP
	A67C1JtkqcTDE53xyqIRB/SYAAMWMy+LHtcy8zSAN8PY7N29uUmX0BftGy8MdN7K
	EGsCSXD3ROSR9NFgNiMmJST28GA3MV6h01b6mlJQw69l6zmbhNWZz86bHrgrTARb
	Za2Twxone3gG/EmKGplJ9HTEkfLX45P99ffP93JTuHFnRYTGSNojLt4T7c/l8YQS
	2O7SWRYpBFVuVK41L0YtPBDlGLIfXXebfV2bu3KUHCdu5e8Tt9Guwc4to6sq9ULF
	WvWlXfLLed1KZ3r7anRbhygqYvy1GXjHtI0O1Dfr/IpkdFhP8EaQ3SH0THqqz+0x
	AocL7A==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gaphw0nu6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 16:40:18 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-45952ce9ee0so249864fac.1
        for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 09:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787848817; x=1788453617; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wOoRRo1BzWfxcKIRahahL37V6D+SA2lxSIowy+5sCk0=;
        b=R1RnM+AiFb1vvAYrTfvpkLn1oDos1NnS03rpGFkK8D6r+aZ9uMxVgki4YbHA5D3osi
         OawSqXBptHGVAom1hzf1EHIYW9C1jQpezWHU15BhXdwVN99g86fmnRX517qcF2lOJ91q
         9pbF5S5sGAu4UhwYASO73myal+/mPanDXcW68HBdTGZ0BSLVYeJ35XykT0UgxQGZhaUp
         BRvdHDnvV+eAJGBtQ0eggZHKie1U9yCuxf3kNyRSbZ4d1xufQ3leuKiaOeHhG8Azb5mX
         Kq8SDRWt66cJAyF3ArRb8F3gbxCpqF2j3yc3WSzuL5e2RweHzOUvSOhHsT8Ye8w/jwwa
         9zwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787848817; x=1788453617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wOoRRo1BzWfxcKIRahahL37V6D+SA2lxSIowy+5sCk0=;
        b=DcTaPz8D+fE5EKBuxiVo+lKtRvADcUvh9Y+/h4CLOprtdr/G2QREnJlB/I2bAxLJDC
         E9Ubyd1PIcTHvI5MN1oGknJtolMc4QY4kBCtYMH8pvIfxIwxskFpg/RJJ+E+M9TF5DUq
         qttIF0Z8Rcq6+d9qRpEXTTK4Hl2KGs3ZUMU+PBqrKUwdPyUqqU3vz4qK79S2JlC1+TcV
         HnvJsWAsWY1pxrF5X7qTHDK3AgW+NfBeRp04oaiFcE4GCF3vplYQ2SqUuAY+djxCcAvc
         ak8wvO9FgOaYOdpDi2awagofN18ejA0gzUuE5bW5KWGSJ1w6CMd77f0jRhe3ULDVbziA
         GKhA==
X-Forwarded-Encrypted: i=1; AHgh+RqghvDdEZjQNMamZBUwI0Gr0hD4jKwGGAapTk8cb76o67rKxzqm3KXGBBN6yPDNLQhX+2+DppLbNmmP@vger.kernel.org
X-Gm-Message-State: AFuF++l6/PMNlpDwKYZCqcljOGtOsTHppgh0uxh0db93HTEKwx7nSdtB
	OEksSKjfaotFmB5I4cfAGKfRzujC3lGZsFLLXKXyR3EskGTNkEt1AWVkxwWH0hN6cUX8T1ejhAG
	yfEmNcWdb9BkjxAAxjgLAHl4B4KelKCwaqANW5F0+WuqS5FnfnJddkePiZQPLu7fw
X-Gm-Gg: AR+sD11J5xtT1AciB3wRcYLIRhcc5w/Mx7MaZ+0XjA8xOQgQZRC1fSFuA4YcwAE+EM0
	qmQrts2w6YXgZI23O8n4x3t4c2U2dFn7mwLwRG/KOaB1PBAAX7fidwBBb5Z491bP13UZABmGNGH
	mMJsyFcC9D5uUB5CHfUQ5MTvekoCqhdonAoa3XkyhoukYhSGsG4Bo1UypLCf7w+h+hJae2Mw44r
	THwrmENP0hJyJ7ObALtq7wFrKNCMZpGds8I13Rf2+UOgZe8wdP/f+Kq7yqBn4i5HoIPFaqqDOf6
	gUScqv3o1h0YWKjWnSVKhdvEYVdWKYKtJZHRldfR6ejbWBimP+OE6XdPLRko4eeXUcHj0K7h64P
	lq/faRDP+7k6M3CzI6CSP/aBNbeZslx7lsgbe1MbOobDeJ76AQ76sGkX/RsUziInLGguSRwtqNy
	q9eOJi9CjTac9jV7uvvcyWM4w=
X-Received: by 2002:a05:6820:179:b0:6ae:a950:9fb4 with SMTP id 006d021491bc7-6b1a052926bmr13261541eaf.33.1787848817494;
        Thu, 27 Aug 2026 09:40:17 -0700 (PDT)
X-Received: by 2002:a05:6820:179:b0:6ae:a950:9fb4 with SMTP id 006d021491bc7-6b1a052926bmr13261458eaf.33.1787848816972;
        Thu, 27 Aug 2026 09:40:16 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1a24bce78sm4253171eaf.3.2026.08.27.09.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:40:16 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 22:08:14 +0530
Subject: [PATCH v4 13/15] dt-bindings: firmware: qcom,scm: Document SCM on
 Kuno SoC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v4-13-dd34f235fc1a@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787848688; l=871;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=9JHmO47xFcHiKwRcWRppqe+FIDEC/EmRY/1PhD8wx0w=;
 b=FzE4Q+PBujlIxnBIqlmOr7wAj0IwjS7m5ptJ/dDcSO/NJAOnDGcge2UvSXP9Ldwdg4J2npUQM
 agBO9OVl2R7Cj2H8FreXT0fPbuMGanegKflD/GG71Sg7ZNDymSJR3cG
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-GUID: sNBmFbf02KruG2YBO6BjRrWnLIpzR_yG
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfX9vfF+vBDMFSM
 SlXMtHZkwJTrzN+VOExxF4Kxi9oA2v3LUrySDikjAtoDRF++4cXzQ9BqmV9/QEpAD525jOTtAGw
 lV5uWavZdXdk4znS4KXLXHyOHeMqTtk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfXyPAwHEnkK/a3
 +YIQAfs3IYrEjJmr9L4hScN1xqAQUU5Xyw1X47dm33Tz1AvGphG+Ep6RquIGWd8jMyE43FI0gvh
 QIDAmcwmQIDUb6HmYN+m8wEBs5xmJP03yrNIu24MJsB+9qo+mzO4p3y1AE16rzrmA3Palcc9Qm3
 FEsSuLRLwu/dVBXMhqeLGdDl+kpKZtREuKatyg6bfIl47II7Dp3MHyJpVSoi3wKfyiwZM/4zhD8
 ZSHFWeirP4ccP5Zj1vgtD/9kkfWE8QjDC7zJ8GaX6mJTW9F5X0LA0eEU4fb+pKS9ug+pAjIroJ4
 jk6psyBa5fviq7Iv4EA36Qr85MfWo8w37bmI9zxutkC0fCV2OjdnLS/USR1jLqAmQQ9XmW8sLtb
 kEa3Z8EKvu26WMOSLD/QXRWb3hwBdzit7AEl87jtUoDkGbMSVNmE3lWAronF5hue7T4VNLEkpvA
 ydCH8d2BRbkn0arf/Ww==
X-Proofpoint-ORIG-GUID: sNBmFbf02KruG2YBO6BjRrWnLIpzR_yG
X-Authority-Analysis: v=2.4 cv=E8b9Y6dl c=1 sm=1 tr=0 ts=6a906872 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=M4Tw70yJP9P6qS8g1QAA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270140

Document the SCM firmware interface found on the Qualcomm Kuno SoC.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 037d4ad8f718..ecee5aef65a7 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -37,6 +37,7 @@ properties:
           - qcom,scm-ipq9574
           - qcom,scm-ipq9650
           - qcom,scm-kaanapali
+          - qcom,scm-kuno
           - qcom,scm-maili
           - qcom,scm-mdm9607
           - qcom,scm-milos

-- 
2.43.0

