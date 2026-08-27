Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E43D499F2E
	for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 17:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787853101; cv=none; b=RMnHcI/nBq7LGkZgg66l6XcSUU/Cjm9kS+qA5AZw1R662TdE7CFvggFL/Sxc9uNYo+Zm/fLjLUg0Hdn17h2dy9pGkjGB8fAeJSj9csK1osmslCTg4xFl8fxbpJhxhdNotbR9Mxsx5PDGkyctPdKzmNhfOXSXxH9EvLkjmh7h6q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787853101; c=relaxed/simple;
	bh=ZHsN8zM/JbhignLDIxWKpOEJ0dJLsvtVmGGylPc0eUU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=leMyj97rAsCLeABrMJo2gpM4Xaq5EHxrd7wJUu5qK63IYC+QGYop1pjgaYNo4vXSfnhL/H7F/lSAXmW2Y3uH0puziKXzqeT8KSNofl4EaTxdgLcYT/2cddwvqUZ9tXWZKccTO4YX3Zt5w6IAV8l9QIDXxuIYq2OWPwifTqQJjXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zu220O01; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FGbfvHU6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zu220O01";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FGbfvHU6"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RHXauu4178250
	for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 17:51:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tKKYzTTyUQNx49FteOTvUbeUFOC22ARPMGkTLmOUYjE=; b=Zu220O01n5yJNHX5
	ySNhJyILhSpvi7mx53R3ja2RAMxFAAyh0WET2xjnoMBnNZMZziK09Rnwvvsypy/o
	DCqfCeKDCb21BWS1Fknfyk6WtYfTaS6YG1+yy9nIBdlxKbnqTPteYujtBBaaAiQu
	e6x7PwmPYrQVWGuxq6gHdb4tJgrphRNfzjfH4CaPB7pPDMI0pjn3+KyyvTj204bX
	u+9y805bwL1jRuMLN801CmC7mbeWdD9D9qYbDKadhPvEZ0oXcHPdgU9esRbg4rHX
	Ovb8ABQX1r6DRL2/sgDS2GOqzLUe3K1rc/mDtIRqoaCud4eCP+UhO2g/i8/Wgl/K
	PW/qHw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gaphw11wh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 17:51:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-396638f9a18so288080a91.2
        for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 10:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787853096; x=1788457896; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tKKYzTTyUQNx49FteOTvUbeUFOC22ARPMGkTLmOUYjE=;
        b=FGbfvHU6PN2aMlI67zU5m9IPSlPWWH+4MPhu23fWjzpu1zMJU1MnMiaqWrv22YUyo9
         Tj3ytE5FR13o+663T4m6AQXBs0B7K1+jOs55tRr6IlGW29yAQ3gDm1Juy5L/UvG86x9Q
         nCdKXzLq7DjoNeBeY8/JtFzKa7dq/qDZmEiz0MAjmGTgF0EjvqabKx7xPW0IfxqhE5bk
         duDZM/gn2UvVtS7/7vwbwS63HsweMrA6M/ruySVFvtKRSZgEby/kBW4hs0Horj6puxl9
         zQH6WTjRA7JFN6KiVi7eD71lY2FrC8xYsOx2R6UdkjVu+8xKQx5V1+i9gSeNEHELWhS0
         LH9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853096; x=1788457896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tKKYzTTyUQNx49FteOTvUbeUFOC22ARPMGkTLmOUYjE=;
        b=VhYJ19fFZNb3yNSemxXF8WaO3wv8X1+BYPj8K45tR110yZV9JVUa1xEoBtem48kovD
         e2Spn6KwFQvbpb2eBL1h1PELvPg3OdB1b7rVc0+HYSTT2GJVO9Qwn03fUaMTIJYEul6a
         NIyS8xhTNUsuNyxYR0L92tvS1do4k7+ujCvs5fagcWAG65uwBtxujBfeqxooaE4WMh8n
         Tv2CxGdlkVUWEInoQSkXRH6d33WhR12p3p8NHtyN77KrYSdQN5UxAliuDL77efwQY1Zl
         JuGdeDAb1XZCcflZbMHFfAE/wyaoROg16Xdc7P6jJDA6W+ipWoZfD2llTsfibpu+8sY2
         wcgg==
X-Forwarded-Encrypted: i=1; AHgh+Rp3SXGUr4Ljt6QxY0vVTnRg9WMa25RfqoZlWVXOPIM3IT3hGZYkv1U4jWrVikvbHY+HBLcEyk+Xvwdv@vger.kernel.org
X-Gm-Message-State: AFuF++nmvHRRt6S6FdOqPmRvaK2NScU6Pa1WhR/8PZQvfAA1FOYigI5e
	szDiwV463S9Qpcq0lErG6qaDpFJMax7KqxYMi4n/LYVgrUrlM7Y2li0IpXvQnDZG/RavpXTJYih
	PDAkZtE0qnFlSCkeTX+EkPCzcaRQnM9EotSwRcbbWfjN8HlxUvD6Wl60P7dJVGg1W
X-Gm-Gg: AR+sD11o09YSeJjoXHiUSwjiKX4fpSSJ8loOqXaXrsc6G46CKtpZqCkjhIoG1Qvso2H
	LNk/wjOE/J63pA4wy6+OhXkNg4vuMk7z/gPqgwTvOyAKP7ND49T3C2XnhvqeOJQZ0U7kENzeQB3
	Y1tIABZ88aLp+6lVr9LU6X6B1AmA87x1EHS0PoPvL8V51rYpS0TB0xXBsxkwY3j2XeglxZzb7w6
	ZsLV6m0kuMwNskL04nHDD2uSSzRbroGF6o5wRqPzREqYPvWkLxjgrvGNibn3t/i1TcuzeZhAfGD
	iKOlsC3qdzWYPWPqyK7jGyD0nCqHCqI7UpKES2tF9GaPNdnHO/ERM4rxyP9qbyTO9B0TfyShh01
	ikFdAxAJ8vXOsq/uMqEkYusbVmBq/NEGzKPWt/5Oppqsd6AgMINAgvUQzDKwq1TJ21nBwEOxIzL
	W/xhKujGqMO714TIrw1gNvBIc=
X-Received: by 2002:a17:90b:5443:b0:396:4cbf:45bc with SMTP id 98e67ed59e1d1-396d100313fmr1670013a91.16.1787853095936;
        Thu, 27 Aug 2026 10:51:35 -0700 (PDT)
X-Received: by 2002:a17:90b:5443:b0:396:4cbf:45bc with SMTP id 98e67ed59e1d1-396d100313fmr1669920a91.16.1787853095439;
        Thu, 27 Aug 2026 10:51:35 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60d25esm23889316eec.4.2026.08.27.10.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:51:35 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 23:21:05 +0530
Subject: [PATCH v5 02/15] dt-bindings: power: rpmpd: Document Kuno RPMh
 power domains
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v5-2-6d47636a8f09@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
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
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787853069; l=871;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=ZHsN8zM/JbhignLDIxWKpOEJ0dJLsvtVmGGylPc0eUU=;
 b=vzpCJkMB6+PuXviINwNp3FHtz7nk5WS01Bo1zaRtxjr+lSRFC5WQzJQ1BawfNs62WmAgjGZz3
 7ciUxDb3xWuBXJwtYwyZR+4oRn74aMGz3NiBwSWu57vDqmcxYmMWTid
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-GUID: HvS3EqFN7gZKdLpxW-HOl5UtE7wu0PO3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX14LISmSZTmo0
 jp6YglpsGdzYGaBBzTE+pm71E1d2gcnPSKiXZxfl7yfZKPA432NidlzcYyNlyuwbaEtyIj6pn6n
 Vf0xE4lAl1O499RVXr2jlxv1UFMG0ig=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX23n215B0+g8e
 g6dJNGkdA3vefDSZTK0y/rhayKQRXjZbFJGd6tPtAG8VCTx4c+1RNUrVWg5eV4+8NYaFfpl0ab3
 PlN8L85zbVH2Ecbbti3eGShQCn44ayGEms6kViBckwrNv2E5WQjfrpHN8lkZq7bm9LQ6dBM+DaT
 RyEQ8w4rridpjfxiVfyjvpnEicWKNUN6dyT1OfChe9xEltJHQLYg+zcX3Van/p6GEq31deEeICh
 3gUbWJAuomn8PagXcaw2OhMaNN3C3Sl592n2KUopX2Ukyln/YoVdRlKkisXiRJc8RiWON77bNF3
 iGr/EsdAoa65bnvbiUy/gnWXXeuea955dl88YWJ7xZBsEoq/JYojWAfB24lFr/sMuFmxr+30UWf
 jLT474Hh2ZUWfTLjssBh1WUI94A1kLaCOp1aRemu1YJ/YiaEl50RvDKaIlKaLUpanng7gWfZ6Dp
 WI2IKIUypSSUx660ddw==
X-Proofpoint-ORIG-GUID: HvS3EqFN7gZKdLpxW-HOl5UtE7wu0PO3
X-Authority-Analysis: v=2.4 cv=E8b9Y6dl c=1 sm=1 tr=0 ts=6a907928 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=lHgBgSUrZIjjmBdF2hoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270151

Document the RPMh power domains for the Qualcomm Kuno SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 0a45e1f55062..7fc3927efa27 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -21,6 +21,7 @@ properties:
           - qcom,glymur-rpmhpd
           - qcom,hawi-rpmhpd
           - qcom,kaanapali-rpmhpd
+          - qcom,kuno-rpmhpd
           - qcom,mdm9607-rpmpd
           - qcom,milos-rpmhpd
           - qcom,msm8226-rpmpd

-- 
2.43.0

