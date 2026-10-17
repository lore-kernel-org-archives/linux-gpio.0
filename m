Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6583D171C
	for <linux-gpio@vger.kernel.org>; Sat, 17 Oct 2026 04:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792211801; cv=none; b=gGVChWI97qdaek9364NEJM8QCkKO2bje2MsfGnHbMfDQYBHpbVeMiqtVoaUuCTocQ6yDk0a+NfpHV9flbd9wcyl29Hs79sL6WV2VExsQC7FRY2daiS82nBk5mlMKDGP7eNO2fflSXWZnv8QgfQr1M5h2tHxEPuuKRjXwmQoeIRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792211801; c=relaxed/simple;
	bh=/6F/aLJSv5Q7HhM5eYJG9nxGTi2Lx3k7CUsBksszwKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jsjpjGhGG9N1HlhTdYXfJLfYPKpB43tEeiZRkwl4D1xYUQxgsNwv7nVmV22GcsU1tI/wFMnukQJX5NgI80Z/WnYUPlP7TDjNQzN288W6HDY+RXk3Z6MOve3Ggd/LmwAJ89wdpaQI/7wKqt2cgRykWCnss0tsA46gpWaXB+4rAeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C9j0PdVj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GMsRmxxA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C9j0PdVj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GMsRmxxA"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H3ZGFR4189966
	for <linux-gpio@vger.kernel.org>; Sat, 17 Oct 2026 04:36:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GEJSdsCp3bn
	OA3Rmz28fYbHxbHs4bqwNwIhoTb11yWk=; b=C9j0PdVjDvzVFl500gqyuPZytfA
	J++L3ztimkGl3FCp7C9v/hmMCMfexHvFJJ5Q/3cT1YKHTGyULaNUpCB41m5mEnPp
	UcJ2atP0U4mu+G6cRkWDdMX3yni+eV0tMzdV59pwFGcz0Y2OpeW2EPpx7hLH/tJm
	zzYAZ73kD4ZD0D7iX1oeO58wyj2QjlYRaObdjTtOTMwhkotOIzAJmq5GKsDZThT9
	WVigPQ++/HejlIXbq1i4pz/Pxx7QwSAE91ZEDCoLn9oLqa2F7yKwNUpCmg/5ljqv
	JElJU1coiURT54rs8T453lTYnXakpJrsVdlgp9laUYM5HwW7ENiQwb+J6ug==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc18383n0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sat, 17 Oct 2026 04:36:39 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-152d1363a29so1952621c88.1
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 21:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792211799; x=1792816599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GEJSdsCp3bnOA3Rmz28fYbHxbHs4bqwNwIhoTb11yWk=;
        b=GMsRmxxAuTjURYtDX6iHu9IgxczP1OD5YMS6kRtQvxIVX73QP7UXxv17MqBWm1mIF+
         LeHZUjlKOQfIrFraYVpzaZ5Hm7x0qyhy3Kd9D4rs+TRfv2sY4sd/StTFq8EMg9VOKpQG
         XmOnK9MQJQ0nLLSwpQLm5uxxCFy3D9XJI+Px2zThilMClZeTXg2ddtZhfm9zd//Xldsp
         9Xz1EcgM1BOKm0N9zEFTQ3QOnRdOsACsf3oG+mbtrFyyrrVjkIdR+wAPs8F8ojGxBxqK
         eC3m4by2RYbAJ0ELrC6AzUuoRtb4juPDifCkfG3qtoaMkzsqdk+8e78v6Hpb7Gp/Zv1H
         6qeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792211799; x=1792816599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GEJSdsCp3bnOA3Rmz28fYbHxbHs4bqwNwIhoTb11yWk=;
        b=Dd3BwFiIlf+0G19uc/Jyc5XH35xIjNd+iFzxcwmQejgHWard0EMLxFTsTsitMvB/3u
         oUZZkkSmi6IFphzpN7ch86L/E0EPbj9UWp35GhxfOTcUOvY8ELvo0o2H6VoAKSML9C3E
         tRAAPhWFTxhPNQnH3NZOPqrq7C8QK4jI9x5aWkD+sceegYh7L5jZuzR6SjnM0nbhRJr+
         HAkdlgmCwXojWF0HwWibvbpA/fKyXzwXbDrDe63GHIshLwc8Gsu6ajCQdeuj9uqGgRYF
         OTshI6AwfguVhZNvmGQZ50AU2RN1gEdqLUeYVOP19tVWMGcRdNIya5N2PGfCyl3tDJ0W
         x38Q==
X-Gm-Message-State: AFq9FYKQvYNhjhLXzwzujlZIGnOYndBn0A9ZgtFazH1if2Ohm4fxucTr
	b+3ZzlO6vM2QJmpSJKuYPnalFB+YYlyVYON4f3YFJEUDxydFq2igz/Qx6+ZqIz9MEIcHS+4aucq
	pQDZdmIMtoyR59iD/JwDrEwUQOcXicgkCOELQqJ2Oqfs/rqUC5NgFxmyQEp0ww6bd
X-Gm-Gg: AYBFou2zn5zY71+jKdsYvloB0zpaja2cooYEFuo02gnpfBFqOxSYZ/WpcQFSs8xMLRX
	6Vtphw8K25E0xImiX1E48jYpW+2tSLYu8qZAr7DarKweeEO8FfrrWVBAzatAv+ufYPVb6Li4dFd
	amw3kA24Y3Emq2ELxLL++Hir9S6k/j9kPkKcHB5jXNLgI/sVPm7nF/w0eOCPs/nFWmuaNjzXQfz
	5uc4edeM6b3jyyyEuEmk8Cab5hLPDkyviEduO0yTwi7Y0lRl5EWsr4qAnIc9YBDJkHZXZw58Veo
	v2IJ7noNOt8WTj609el2SdRkBSCLW/G5eUGg5kE03uN2PvbBX/Sijk4cxWEtvLQLyFSfUa14lpx
	s5m/glu85MuTj0DJGVzQAno2DKGfa0CxGrYYEVZhz8cnrCRHl3MClBtDWbEs=
X-Received: by 2002:a05:7022:7e83:b0:144:c12b:dfc6 with SMTP id a92af1059eb24-18514a0bc6amr3147175c88.44.1792211799114;
        Fri, 16 Oct 2026 21:36:39 -0700 (PDT)
X-Received: by 2002:a05:7022:7e83:b0:144:c12b:dfc6 with SMTP id a92af1059eb24-18514a0bc6amr3147132c88.44.1792211798526;
        Fri, 16 Oct 2026 21:36:38 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa7bbsm9771425c88.5.2026.10.16.21.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 21:36:38 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v4 2/4] gpio: shared-proxy: Drop the vote of a released proxy on write failure
Date: Sat, 17 Oct 2026 12:36:03 +0800
Message-ID: <20261017043605.1503563-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017043605.1503563-1-shengchao.guo@oss.qualcomm.com>
References: <20261017043605.1503563-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxOCBTYWx0ZWRfX0kcycfuZdUEH
 EzQbcIr1/pTJA37Zo7kQJyHPxH14EgOsgwl6BPRRN0SJJBqhXx1o5mEozgImgMy2qM2dxn2aJeX
 K8wXjqYdXQ9KmpqPGL1jC/nV4NLeEbw=
X-Proofpoint-GUID: k0h7RmWecPxwmUaXk_66LIny6EkSiNyy
X-Authority-Analysis: v=2.4 cv=Bu8IUoX5 c=1 sm=1 tr=0 ts=6ad2fb57 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Vq87VKjZgZ7Zzh4gvRcA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxOCBTYWx0ZWRfX+FUusQRlf6QQ
 MitqI/kGsTmzLAmO5FzuOj8UaOfftMlYLd50e5+F6ngW3X3VX6R7e1mI+C2vx90TFT+dYC6Ps2J
 AoP7G7ZWNrup8lh6xWUo7lI1GY+NHtvNdCk69d2mAkp0QdA2Wlsz/brxP1ojwOKnztwC5FdSZ8z
 hat2edyJMlQI5zPnN24r4G0ke5Bj+Xs6I+TAvA0niEEJ/amPJmzcrJg5mvw51Ibao4aHBfw+N0/
 oln8f8KWwDAGVH37IjVxQt53/2iklufMvi+W7eB1wUuaT7MyHMw3rm++mT4oqRwAFvF+1EaD3GF
 SJjK6pZHrzOawJo42lNU7l4vjp4m/21piDIoMuDAOtL0fP4cWTbdClLQrI3XIT0sxlcjCcaDJDB
 guT4H5kWIUA+bVeNWIFWHOxN0lp8DIRYNQekRiKHWBBQc0mu/LbxprScgLr48Ra3j2OTvc4TsOO
 tmKGObSt8xeE+bzjxZA==
X-Proofpoint-ORIG-GUID: k0h7RmWecPxwmUaXk_66LIny6EkSiNyy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170018

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

