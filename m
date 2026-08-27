Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3A04B04B6
	for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 17:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787853190; cv=none; b=N8N0uFp/SnRmuDB4dxQ4Hir+ID3pScdJ+qKcqe+/OUU+eVqyFYGVY0NBrucPI4V/J3yudOwidaFJKiK8aQBRqsW/oN6orAe45j3zgt4UHeStZkGyJdbngJoQgxrInf+Kwh4lRJ7ALgaiZbWMBI2LOk1B9RyqLbsAXXSXd3nObtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787853190; c=relaxed/simple;
	bh=9JHmO47xFcHiKwRcWRppqe+FIDEC/EmRY/1PhD8wx0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N/SNa+23jSVY/yIMzGZ2dc4fHV5oSk1xxyo5ovKE9NjrMW2yyMi+ixVG/ki5TjlLWBN9WKO4hwT4k399wvc+ulvLzkx/wTYoxbQljG3gnuAirBOTRR+v562iTJ50fRTYseJeq8v6r54BuMZIBmEOA7S1whbE0RJG5KMbHtwa6LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mgiw19cL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dGcgK52M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mgiw19cL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dGcgK52M"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RHXd971121618
	for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 17:53:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wOoRRo1BzWfxcKIRahahL37V6D+SA2lxSIowy+5sCk0=; b=mgiw19cLbzJcHRK7
	VwPAevQ/8uyHAndrw/snc2A7t2KInmw2k7/t1GZQLI5Uu0SxFiXzsU1Z8HGkH0ub
	cycv9V5eCxMoxfC5Cf0jpCUXs8i1uThgt+SCm1U6a3UMKWlnZKGlcgpVoqAfQHW6
	li/clZWX+3ik3xxqlm9zJh83itxcg683aGzkaaJ6AlNvlF0x35hQnaDWyd17XwOr
	GEIkEPvuUUHoq+XhI0nv+XRTtFTHfuk3csTxwuecRqaN9ap+R1tqQ64vMukLNr+l
	tU36z+SwvLHXS7vW0n7oWXZVS+xh0uggurYrejOaFxgyHdbN5xFCWKiV3sermd9e
	hirGEg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gapgv999r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 17:53:08 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1c18c775eso1427732a12.0
        for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 10:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787853188; x=1788457988; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wOoRRo1BzWfxcKIRahahL37V6D+SA2lxSIowy+5sCk0=;
        b=dGcgK52M7ZGVoARJyAYUOxL4BHeX75RTACBSx8YUmK3cSBUjse1FDxTaRdIMy0kW6y
         2YTLSuQsicw4nI+5Y5jUgGAd/BJG1shY3YcfMutyzoSKbv3MMOpkULtCUoNM2jwMEEei
         Z4is5IVAzY8rmXO1D1nJLYHWWtIs2o/yFUTe9TMxgDMorlElu/7y8+pRFKvx5mN5+HFx
         kQe1GVoswWXaq94VfGljOVtPr4k0sTYwK5vsyUmsOuQW8TzPfJfqkw4Dl83mNsWTM+FB
         G8A01bEWhABrIR7fXE6h3KEFIr9ANtPpmiIgQybUTr527gPMkwdE2KWT4tFNM82ji/TK
         n9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853188; x=1788457988;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wOoRRo1BzWfxcKIRahahL37V6D+SA2lxSIowy+5sCk0=;
        b=aO1eJHrLjBCtptAmFpUGxZp6+GAEvGB/tf7JoBVSsZqbdqpUdY3lpA/rzoozPd2qWp
         L21uP3VTT3lCx4hocLeWoY5K45XXR7twAHvMIZw1gfj1ccpMF+Eie0O+vd4YZMXhJoko
         6tWs7pETBbh9/G88VfEAt9hEHJJvkCDhVY/zyNi7nuWnlhbWnMus83cLntRTZ4iwbq1c
         GXLH7buAxKz5g6fZSQxrcwNlj38NsZSVD3NCHy+daR8FRK2nLLVAApJbEq6vS+mOMNqH
         ftptb7MMp+AysEJdQOtf8N8yHtyIJo6t1YWD0ENvAQMWDGBVwFL/UxFPzCaLnkqgCEMV
         Ej8Q==
X-Forwarded-Encrypted: i=1; AHgh+RqfzJNx/bG2veg8WLIEys4+liAdgvBn6AarW7Vh9+dKL9Pha1Q8LUgNH+ahYN7QT2x7pmUkTcJ3oj5l@vger.kernel.org
X-Gm-Message-State: AFuF++mykiXjwFcokvdD8YQaXggSC1VdTimmQAI0rez/h6SPa2ZNqL2p
	1+DA61tulz8K36n28wVIQ7wwXRcVyz8qH/XfM4ZQASg4KT628WLOoy0pO2SW7Bpe7g+u54RTJp/
	PPu9sVzox71d6dB4vZ7IpntitTiVodHS1Xhwm8Vrw4mGm/hMmCR62dnWXZOm4VVRG
X-Gm-Gg: AR+sD12Uyj9Dh4nABhtMcqOrJmMaj9XErr8biVXL6Sp6Kgp5EB+UMcgaS57sjkN3/8n
	NlQh8/4Qh72SHhD0ZurLIpS1JAXAs2WF81ehWdVsRbuBShxxu7Ak9G7EYJxhdr7f3c+xHBKhIgb
	hHifW1zj7EgteUjVxtCpvA8ugSg50rjAHlfu6fpI3soqPLGoDfz/wjzM4B/nBxTpj+znL/rKAnu
	ud+qdEvjnF6NRP9f6DlXMPaQ2MNhfn5Dh2Zb1b5mHNAtqp88Fmk/zGcHlpqkzXa/9NUb8Gn0S4P
	Ypt7BquYzWzH/xo3k+hUgsAmPp2X3MFM8wfz7p7L8Ba/O0b2A/ijC1MS2GcS8nJsyPkcNtLT+Oo
	0QuHxJCxjtv29Bh7n2YUnYW7WRe8nf8QwZhGRutinl5pyD4N0CCI9Ks32O6cJvoUwYcIaMwqRqn
	HROVhsoJbxdHVDK3GAakFgtYI=
X-Received: by 2002:a17:903:22c5:b0:2d7:1f17:41f8 with SMTP id d9443c01a7336-2d726b17867mr108846395ad.15.1787853187604;
        Thu, 27 Aug 2026 10:53:07 -0700 (PDT)
X-Received: by 2002:a17:903:22c5:b0:2d7:1f17:41f8 with SMTP id d9443c01a7336-2d726b17867mr108845825ad.15.1787853187160;
        Thu, 27 Aug 2026 10:53:07 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60d25esm23889316eec.4.2026.08.27.10.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:53:06 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 23:21:16 +0530
Subject: [PATCH v5 13/15] dt-bindings: firmware: qcom,scm: Document SCM on
 Kuno SoC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v5-13-6d47636a8f09@oss.qualcomm.com>
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
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787853069; l=871;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=9JHmO47xFcHiKwRcWRppqe+FIDEC/EmRY/1PhD8wx0w=;
 b=w78Pw/hDL8SLhPCEJMXKoxFhO6U0UOpZUF5rYcwLAwMKc44iN6Fghd4LGUQo47mNIYLcxJvJo
 zAPLDw5OR5UBab9ZlI6me33T5i3eV780/WGOyOnbwyhtJdakaPzl5cE
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-ORIG-GUID: Bk6mfJP3FhoO2YX6Yh7DTC9j_74MP6gk
X-Proofpoint-GUID: Bk6mfJP3FhoO2YX6Yh7DTC9j_74MP6gk
X-Authority-Analysis: v=2.4 cv=FpU1OWrq c=1 sm=1 tr=0 ts=6a907984 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=M4Tw70yJP9P6qS8g1QAA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX6PJntRMF1bel
 WzKWLMhPDi2e1e5o1mYRmllTvlPaY6PB9/WNBSYtcj4+qSFSDET4bAqZm/ZqDlKj78e01jVtxCp
 rtmCR6sPHu4Uwb3x4pXsdabf7UkW1OYESzQ7M0xvJbcGSIp/rIHdHhcVYFQqWD5+7+wSKBtDyqb
 kQGcqCxTEjvM46Ih85AZpkfaHjmGqAPqIT4GKqWIlWaKO7zPvTa1xHFp2MHs0X9YCelh6AaU5Lx
 b2vtBuSbEIwp+b2TB9G9X9DbeE8+8CO+4tjJM7ey3LScOUgC1XwxZFHQHPhWDmq1wm9D40nFqjO
 rkfpdYR5DRFTSJTDV++BjR2irbkhJXfWZK38UeQGQyFj2H4a5qRZjBxQ07rcp83Lm1hVrdubx43
 eTHO86GIO01gUNj9mfjYRptqXS93EPLqbRN/moCzjgaVBXtxts4ypReocUc9ZYQG3bKZp3pMjZh
 TjP8c8E4dgymLVoOmnw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX4V0D9PDCjp5l
 489/VMq9O9edEkwF5osxlPrUyE3WAYmZwue/A7zcf5EEzWwTtCEmT0OWovouwgPY7ahhE2SapfB
 5IcvmSDHnstSHnHX97Q+7F5442dgH+I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270151

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

