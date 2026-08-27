Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C48480960
	for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 17:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787853185; cv=none; b=I4gfkI/y1Im0p/JUPjcsEvFvPitu4XWWguB09huemEkhTXP/sDTdAOz+lLFgkjAj9GZsLalILxYtFiaxbx4uRbSyYKCDwRgzwDKgpbVwUDpPMIUAHhjl8so8GnG1OtKgM3+6i3U3tAjEUVXmfq1QLom4GBpMvpz+pOLyMXYy/bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787853185; c=relaxed/simple;
	bh=+/+CnJFkK28UfCOUz91D0FsS6GYOqD6AEiwdg9UDtAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BYk8H6FtMz9rrSAZgpYAImC3gDl+7Eb9XyPzbx/VsIeYfX0BB/MvlmutWEm3cNd/wHXPXELQmsGs85MEaKmRRs/a0+GCi/gBCo2yniuhiRZoe7cWJhaJ12WDcXEI1eeQUR98rZkrBExclYXCDhKKT4gagfhdrG50hp+IweuAVBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XveKuayk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dRWcldDQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XveKuayk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dRWcldDQ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RHXic33613337
	for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 17:53:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GsdXzVEg/opOUMCjXIMLe0tWNQrrcXZla2NfQwnp4TE=; b=XveKuaykkN0fyFu0
	oyzT6oSjYAB1CC8LaAlXMiNGzxKK4bODPslUpyRn/9nO3Kf/QBwXzzRvR7ddSitD
	UIoK4dEm55z0GU1r1+2qSljuF196tNvAi9zQS7gh4FPvYUppdo0DVyPz4FQ7mmk5
	jxIH95dYG1D4Zc1D2sdeIUJs5Wf5ZNMibzEES444Cpib+vFG7MlqyKjtVDLTBwRO
	yUjBy5BeP6my5z6ISXHM0M0rfOs3yiDQoiddXcObRTvE3WzBNT64Ndb5aUczdYSP
	8/h5D76PWHQCn9Q3M3UlYJTnKjox8D1QWQ3NBdethPYFzjgAsudHoqDfmtJuEyxg
	Drh2Og==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gab7t3x5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 17:52:59 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc640dfde3so897455ad.1
        for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 10:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787853179; x=1788457979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GsdXzVEg/opOUMCjXIMLe0tWNQrrcXZla2NfQwnp4TE=;
        b=dRWcldDQlJI+HqvNLey3KHeQbbt2jP2S/GOyDeLVho8zLcECDhpIvpAtYeI0SfW6C6
         kkf2zBYMbqdCICQ2o8+r64+uvgOjM4XIKNRNoqTFrU3UrsW3y6V18WCySQemJ6cpnDnD
         +hfnOssj1w/vD9LFU2AhirQBQcrKazVxz5HKRXfHzznM2JOfT6sRuxU/wmEXzBmcRkdM
         5g+V/lUczGdVplEjSLdVV7tOFP0golZXrvEGAXKLEnB2Btd7DhKdEnH9w/jQ0jOdi8Wv
         js4e/rVmTX1VAUR5u9SnIiw0klZ8J6Y5hBs6fbFQL3TU4TPPMnmCGPEcG3vnJR8XN/Ud
         5nbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853179; x=1788457979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GsdXzVEg/opOUMCjXIMLe0tWNQrrcXZla2NfQwnp4TE=;
        b=VL7zw5VZyuxU/9uz8tM9lX10tJrggiYOFZE2FYCH3N8yJ2R7ZTVv7YKfSM0FaJBZm9
         AeMKTROOcs8RMA6MwTZtXKfXmDPGybTvJ5DvsNzNXpqOq+EOVChl/GBs3K7lnuSaiEcg
         pTcT4R/hi98XjSWfOYOUKypOf3IRlFUldmRk1KpWutd3b9skzreAhx9KcxOwym74/nLa
         og6+HE5Lx8jZbkyfskltTiPMRP3AIUenqdKX8E25HCTrNNzEN/VWWXL2c7NL29c8ObsA
         WUHx6aQaDgP6f5hMLmf+RnR3+4jA2jirZr49f48qby9n8ClVCWCu9wFHAI9uCAbz8oKM
         xCTQ==
X-Forwarded-Encrypted: i=1; AHgh+RqWNNBcf9XFd472DLnEPjckXe947Z7buqIDheAp3KAGkM+cnh6AnKs1drH1ljadItb7HEy98DWvgGJ8@vger.kernel.org
X-Gm-Message-State: AFuF++nAdHhB+PRXjZOHaYPBha3cUFPvHVkFLdfq+BGuSikw9aL2n07D
	wr2GD5nMfCCH8o+uUWvhWMMaDUfYw0TNJzCZjDDCdqci3T4LgQR5pEA8LAjT3v0FxRBSaVA7HZ/
	CIujyEUWJpx4QMR+uOQh7FAXN95AXU4cvDEiWzAvY5sRYUpf7xIpwn3L9b95WKCSS0MIEf3Xz
X-Gm-Gg: AR+sD10PvDEHnOqd/fry8VudYztMwVF1AT8j+LHCFnRi0r08e0OZEkkpyKyRGR5r3tM
	+/8zJ+wvgA8wLfqeP7fx/HCyruh/tgjblYjgRN6sBjHsv9c1XygHHVyd9BBjVoEX4De2sGiN3kK
	Lr8To159VIpgsMExUTRx136L2jiZef6NpYzLSp4rxWV2EWckbgY8gD4YYsi5Salloi/CMTQSRx6
	mYDlOphFOq5hbTeZNApYxKnD8aGlUvaGYUJASPUhQTwKm3mwOpvcN77tWlr7yZv5IjGgleExdZi
	kysJeKInBN7c4RtZKQ7MEIgDpm0sJJmjAMgdg3Dffnhv/uw00gTToZxgnlzns5nGK6yCe0tGIYV
	p1TdGpkZ3v5wIlBE3AW5RoXBUN7TZcitCXv/rLzQL1+Ow4KU5JyEtKYnIo6PuCAViP6//tbOVxX
	Ff3yPPb5kOSAbxx6QKpdNoARM=
X-Received: by 2002:a17:903:15cf:b0:2d7:1aeb:739 with SMTP id d9443c01a7336-2d74e1295c2mr11086765ad.13.1787853179210;
        Thu, 27 Aug 2026 10:52:59 -0700 (PDT)
X-Received: by 2002:a17:903:15cf:b0:2d7:1aeb:739 with SMTP id d9443c01a7336-2d74e1295c2mr11085775ad.13.1787853178763;
        Thu, 27 Aug 2026 10:52:58 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60d25esm23889316eec.4.2026.08.27.10.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:52:58 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 23:21:15 +0530
Subject: [PATCH v5 12/15] dt-bindings: interrupt-controller: qcom,pdc: Add
 Kuno compatible string
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v5-12-6d47636a8f09@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787853069; l=922;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=+/+CnJFkK28UfCOUz91D0FsS6GYOqD6AEiwdg9UDtAE=;
 b=5+UqgzWqWAt2y8pw+wO8S1gQhj+ILFb5zZykxqwlJVi4SL1guDDGpMcNI/73AXMXGq7fNAD8n
 e00Bc2sIs1UCSRq9bFhRuWIPh3sI+xeXRdBycjDqBUkKY4tQG6SPHpa
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Authority-Analysis: v=2.4 cv=X6Bi7mTe c=1 sm=1 tr=0 ts=6a90797b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=_KRvd0mH2JNXacczCDAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: Dda-9VTl0U_IcAuWv3S617bRnuuOMeiN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfXzEtZeZcpc5eO
 Uef8uabyo0GwsaQtS98Zr631uQ2skHPlV2CdgBajTcDAri0WvwfRb9/bjJSdHYczfC8IHNpnJuN
 HX/68tJb9gyoJ9RQbHOQDvBOJb+p9eA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX3mH5hJxAQ0Pd
 HTUkq76CTcIRuebl/kMeaEjbL52VemjqAhIohMprNFf1m60TA+hAfwP7Vc7N2RShR99eKT0mXtU
 5e2m4ameWdU8k9MdHA5B/usZEOMHbXUJMyMhbxVpLdOWXq5aDctuHJQ977lJn7zMSfvDv2zye26
 H/KL13fSozAxst7tX9ZHfjpZQ2uxM2wD49UFKVJvvbWnU4O1gpucQcF9DZuZSsh9CJO+5dj6nOj
 BKOdroy2yRH8vrWcGrEauZpilbBjzYk72bi6v6Hh86Pw5Vj4SnunoP9kVP4vtfaZ4vqh14vtSN/
 0VXt+tPuC7iJ1JLMvwBRURIRVaQKY2sOjfGk1mqErOmBtbLyv/Tn7joPl6JlIFUPNtw/IlVh+Vj
 7U4iVwV1Lcwo6aabFgmuPraX/8cI8RWsYMnGuLHtDR9MOW4mqLg5Cu0b4teoqlh3x85dhMw5WsK
 ttISEkWjdyNvqdd/jzA==
X-Proofpoint-GUID: Dda-9VTl0U_IcAuWv3S617bRnuuOMeiN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270151

Document the Power Domain Controller found on the Qualcomm Kuno SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8162a49d49a6..518fbf6b2761 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -30,6 +30,7 @@ properties:
           - qcom,glymur-pdc
           - qcom,hawi-pdc
           - qcom,kaanapali-pdc
+          - qcom,kuno-pdc
           - qcom,maili-pdc
           - qcom,milos-pdc
           - qcom,nord-pdc

-- 
2.43.0

