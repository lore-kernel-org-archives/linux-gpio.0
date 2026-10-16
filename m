Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BDC480DC5
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 14:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162182; cv=none; b=hkSx/noJIwY77xolBp4XMb+a2PIz+uGjsePV/IXjGIGkEBTNCCX6gqiP6HMcvbaDQNijGhSU3RdAotLKrfqXVnOfMdUq5YqKXJniwfrLUKWQ51sfb/qWoBOJrWTgtM67Wo9PYyu3b+qguxD3SjiIf0j1OXKu82oAS3cUdnvV440=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162182; c=relaxed/simple;
	bh=/6F/aLJSv5Q7HhM5eYJG9nxGTi2Lx3k7CUsBksszwKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rwzR3UqsOKd77deOcbosaqsG4Xu3ZfAwDQ5ZDnqUGQ3xQwddPWGru78lKCY/ByJCXklFwk153xWn4oLEOwuyWr9jl0LSEoOU692h09PoINJ3uSKpu5fE2jbbZcnHxU7XcLCgKZQgV7YJ3DHwTUBgYcWhvhFSC6t9RStdsr6cfLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M4lI+KUw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YbjYr/yY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M4lI+KUw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YbjYr/yY"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE5r0c3577687
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 14:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GEJSdsCp3bn
	OA3Rmz28fYbHxbHs4bqwNwIhoTb11yWk=; b=M4lI+KUwpgQfLo/H+78fdSrgUOu
	7T6xsJKkZ9ZRb91LQ0U+IyeVGDRK4y/YmkqYH3bJaGsYlX34qY+tET7fG9iDpY8z
	Yh4pb6qoqgUDxxQYckg9QLWFNzyCIzhYbuPWQqewSzkHppXujEq+q39vPmfY/Goa
	T3jaSGsidZYVNKNUxHASkK4J9LpZNhOXyoEB/sBYdPXK5eQddlzMHl2zJSVsGg5q
	KK3OYeQYL1niJx6Nd4AelX+7ZleA6Ki2OkX3+hKG20TwtKM9VVTVZkGVLryr9Bn/
	Hn+IfoDr8B74C5jecByxHzZCZJp3rLBEXoJEMLPinv8cZWVxKc9sc5WvZCw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hba262t5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 14:49:40 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1665200f4c2so8789290c88.0
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 07:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792162179; x=1792766979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GEJSdsCp3bnOA3Rmz28fYbHxbHs4bqwNwIhoTb11yWk=;
        b=YbjYr/yYZ1ZQnLU395QLT8LWLo9U/Q9QIl8KQIQou+QKn7mrnzHG0WhstnPO3neDKO
         WtN2uBhRSjF6X3yvS/dp04xcqQkq9lPKir8QM2Qxbpc93BgxFvlawBYYviD64gk2mxSa
         Wa74aLNTBcb9AZbq2PCalxvdaop0wldhCUZwAqrpCpYWUezVIog9O3dpDjak+A9CSfJk
         AC/c+5aCnFH9FJe1Y422Z8kpEpFdkb2uUvIuNStGpAQ0OkIHWbAiHgiLRFi4tSxaaUhr
         YBUZ/4TAN5jiZphqrETBLY4eJ8vto2TwXU7sARjf+vZX0R7dnZ+e3DN1UiICIokqhNUZ
         S06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792162179; x=1792766979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GEJSdsCp3bnOA3Rmz28fYbHxbHs4bqwNwIhoTb11yWk=;
        b=nHkw2zkilPMoHxh3pLXk0wTkupxxBkM3GVkZX8hFkY+EwcDCo0uK6A66OHxpSCYYhh
         IaE3CsFtB9xIVR8GhAugz/fg+OGr8d2F/UsUWKyAZCwUB3bIEIFKkyDzN/qhzmBacCj7
         sFeHyB1n5Imq9ANvcoRCbowBQKzoMTCS0//x1+6H4WXF4WEpM7X1MntXXoQjalgddybL
         3+ohgDvcntinW/lzrUUsn+wLF5DLefVUjuQ4FEzUFxmkG+WRmHCk/SPPiZbhyEt/QbBa
         vrvN+YR9T39xphNMOZX9D4G4bfEIJTWZuZy4QqqeaGj91k+Tw6DhlguVZbpuDvWm+x5u
         /1gw==
X-Gm-Message-State: AFq9FYKT1wLMlGmOtpoB4sXE2UUKhEkBU33zOrFrclM6+P766KV6fw0U
	AQF3OVZqup3aNrs58E8rxuQTDIOdt2OEtqiFYIXVbIpsHs4laE6KAlT0IfzU6nvWVOS5jHFevRE
	e1t1b9EUduZg2T7vFuz4BlCbGXyBeEiATFuGo86DBBIMV945WqABXZTKO5ckiDN4+
X-Gm-Gg: AYBFou2sAXN9WwHyXUO3EUJnSch+A5eoORGUEqXYrhG1vGIkgMM8pqfhyYBn8SUHDMf
	ZaY73WVAEd9rBpxrNe2c+m8i374oCaKLmapVWzGR0JUKOK2PZa60rqPFLLQKUuP8Xn/Le9rdSQT
	c/agOBL9UcjRwDB6qLMAIxNGTZrhASJaIUmlaYzEjnwtXGIqZ1Ni2LSu2x1h4Z1ammKdI9giopB
	yGPtV3GoKzWZGqyUDgfALAntEFAWxwNgNvTIzW6ErspgiXVXmSczoAr0AWb1Ua1CP1KZL2FeRWO
	J97TGPlf8NN6MlpN/nJ0N4nZN1MwmMbHs0jL2G5SAVF/Z4ovvCLDVVU202E3opG+IY4634HeZDp
	13Wi7nLhqU1F6pImOzJpHORhP//xSPg0Jr3MM7H/7nJcaiz7sdeREaSBjs/E=
X-Received: by 2002:a05:701b:2304:b0:182:9553:287d with SMTP id a92af1059eb24-1851238aecbmr147570c88.21.1792162179365;
        Fri, 16 Oct 2026 07:49:39 -0700 (PDT)
X-Received: by 2002:a05:701b:2304:b0:182:9553:287d with SMTP id a92af1059eb24-1851238aecbmr147526c88.21.1792162178573;
        Fri, 16 Oct 2026 07:49:38 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1830f213ba7sm7765337c88.0.2026.10.16.07.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:49:38 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 2/2] gpio: shared-proxy: Drop the vote of a released proxy on write failure
Date: Fri, 16 Oct 2026 22:49:19 +0800
Message-ID: <20261016144919.1362846-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016144919.1362846-1-shengchao.guo@oss.qualcomm.com>
References: <20261016144919.1362846-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bsHZl0ai c=1 sm=1 tr=0 ts=6ad23984 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=Vq87VKjZgZ7Zzh4gvRcA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1OCBTYWx0ZWRfXwMQ/fWoBwy/h
 fgPLpiLXmfgkN7+5YxaPDDjRwyQNQjXryMQrx1SypgC7Uou9J7oA0vCr6tyr/J6emEGMDlOEs+e
 ndl4NdJxWBFVk4xOfIVbShJSYGZ2H+fL+MkY1UWWPZ8Z+PaduzNspbw91UG0lXPfQ2F3IAfAXug
 44OD5wGhKLpuyaapiq7YQD3ZXeBfLmBNQRdoUyycH7wHJMi4YQu/sK0/XiEE6LRCqgm7U1ik16g
 izlq3bNSkz5zuLzg4pptYyjNbxRosmt+ERIGiOoxah4f1degT6OYNS/InZOEQgDVqdKLnYYsLHk
 4iJRNsEFqDlTjiK6mcRlqRHI4Wl3Z1DbW4euJHKbJHpXOzEE50cBXjE+3BuCXcWQPkxlQrnyZzW
 c9B4bjK3GEiTuo3Szfmkf6qtd6kAJqIb7Bah4f7+PFwG92XtafziHzZ1EtnMbUWarOQ+Ikkh9l8
 4dyEu4CruBU4sg7kuYg==
X-Proofpoint-ORIG-GUID: rfY7lr2ZS9-sDhFVmvP1FoRQNJiwzTN_
X-Proofpoint-GUID: rfY7lr2ZS9-sDhFVmvP1FoRQNJiwzTN_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1OCBTYWx0ZWRfXyIee6qX0qAZN
 gjzUx52uyDZjb6Kuxv4aacRB0qsz+VWyJhjw8lO28KiyRy9kQpasxA0Ap8JaCcleFASO9N+FLrU
 feA07JIYxvAKO0wdnn9ki3wkiM54cl8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160058

When a proxy that voted for a value change frees the line, it calls
gpio_shared_proxy_set_unlocked() to withdraw its vote. If it is the
last voter and restoring the default value fails, that function
returns early, leaving votecnt incremented and voted_change set.

The consumer is gone, but its vote is not. The line is held at the
non-default value for all remaining users, since votecnt can never
drop to zero again. And the proxy data outlives the request, so
voted_change is still set when the line is requested again. If
another user has reinitialized the line in between, resetting
votecnt to 0, the stale proxy's next vote for the default value
decrements votecnt from 0 and underflows it.

Drop the vote unconditionally on release, after reporting the
failure, since the consumer is going away regardless.

Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy driver")
Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/gpio/gpio-shared-proxy.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
index 0d1d724a6a37..24241c981df1 100644
--- a/drivers/gpio/gpio-shared-proxy.c
+++ b/drivers/gpio/gpio-shared-proxy.c
@@ -134,9 +134,13 @@ static void gpio_shared_proxy_free(struct gpio_chip *gc, unsigned int offset)
 
 	if (proxy->voted_change) {
 		ret = gpio_shared_proxy_set_unlocked(proxy, shared_desc->def_val);
-		if (ret)
+		if (ret) {
 			dev_err(proxy->dev,
 				"Failed to unset the shared GPIO value on release: %d\n", ret);
+			/* The consumer is going away regardless, drop its vote */
+			shared_desc->votecnt--;
+			proxy->voted_change = false;
+		}
 	}
 
 	proxy->shared_desc->usecnt--;
-- 
2.43.0

