Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793190924;
	b=mQRA8DexnJoTW2rDQrER7aD93YNu7jNSa0UYTYyAHD00Pff9WSZE/ZyffyXZDu9pNCIa
	 FYFhzDgeW81l4uyPHgmtuZjrc93xi4uxxARoSg2djv1uPrKSRWT2gXG8f4ft9TGwbreAf
	 R1fkVU8bWbIweGg5dyXJME+wch3D7R9QsUnUCcu0FyyJqKox9k8rjYRvY91meQBuyTqyL
	 Ph+ARwmvUP2Oy3FcUUFrhbJhVS9sOF59TeguwSEmxh+QeCrnHAqCl/MyFDGUmD12poSZZ
	 VgFI50HZtnxiMSDlnDQXE05rsALv0kCBtDyINL09rWHi1n/xzWPe7tNzMqdPt7q05Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793190924;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WrlFesQrP1Bu0qzO9q4AZ4Gc3JZGfspE+azJFM/95jA=;
	b=ank0JUMOnOvpwxNrM6jnHBnOSIlmR64TedYYnY3/RXV5gxLpB8OMS/S0xwIPm+btfwqZ
	 8Huj8/vpUsXET/l+RcJa2ZThb+NME1mK+wk9yKdaVdZrNZJwHKs/+9o1BpKKOiT0L9fZe
	 g+/MHmRDvQzbgIHNGhIfmASojy3eYzhO+QGAP7dNGTzvfhGak0/z2sL2Sg3H8KZkOegaK
	 M5y1FtWbPwWwFkVoH0RuAe0QHsM29Ahj5DIOUHMHqLxNpfBFiTY/RixZh7Csp58hQnP4+
	 r1p2tiwPrMnIC0Wknq0pD4GPTunMaSdcK6y1IoSlFpbTcc3BVoSrZ/gZ8KMT/v4fPxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cAOev4zN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P+7Iof10;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355CA606A336
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 12:35:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 355CA606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cAOev4zN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P+7Iof10
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe1Yk505287
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 12:35:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WrlFesQrP1B
	u0qzO9q4AZ4Gc3JZGfspE+azJFM/95jA=; b=cAOev4zNDSNjtAQ/t0YzeZYiQDV
	8smOJeYqce1V7UlZpCGy8xGDec5PWmtlS9nZX9bRr91qYQhJVsGpn77YitYgOMrF
	NqUX2gXs8BylCkWbFfQCTS5VrouNHt8NGFB2HV4LDHUYXsQzPORgAxvxCUy7vwR7
	L+6f9rMiP5s8GEVMcro+TOI7BDfZikqDyWGz7t8UuxIjbQfYTMdY/6A0zJwID5NR
	jBKVEVenbh1vZOWe4kHED239xCX1AC2YLBVirDEgjTP2dZj1LFJ3mzhrr+WvolpA
	nN6ATPV/oHCvDjtaqeWpyMSvrk0uni7ZHX9vaFS8lGi+UQih7amAgEedhag==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy6g435x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 12:35:23 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36637676140so1425966eec.0
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 05:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793190923; x=1793795723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WrlFesQrP1Bu0qzO9q4AZ4Gc3JZGfspE+azJFM/95jA=;
        b=P+7Iof10/3f/TDLIEz/MxkDO276n7xMRknJq+H1bxfEmjv6hTifqr1GsTYBO/sHC6s
         7TXgABL9eaN2c6cYIQ/laraaNCaOKplRq2lhySRbdmPLTkyDac6+/tq7vtQS1h9TBMzh
         EBbsqhVu71dBp1yHi9NiHth3vxb79st1Lpm/eICtiGBLfCEt8d+3yFw3F4ZnKxyuo8UO
         di9Wckgp6mr18pTUkGSchRwAYRBDvj7r56n3Kpy7/DkmxeRmYG7TZZDzEkmk46kQb18B
         fPG1Vn/xlPkDhWqRJR2dmilVouo/sKd5W8yejZPxshGSmue/336D5B0Y6E52GrDwNcSn
         Q0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793190923; x=1793795723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WrlFesQrP1Bu0qzO9q4AZ4Gc3JZGfspE+azJFM/95jA=;
        b=qzEiA1ZLHFMGONvbVMoEuzEvv+4NiGpZUHJOG//vnpNOb3FKVRnMD8gij+QX4zmMFA
         z8CP+CwK2peZ467q3muUPPFrFj6gnXXnc4NwFanrs7HjP/Jq7L9IUxmMCgO6uLl5O3oh
         mFc6/FWMsEPdNhybfPRuEDeiUPVPoGGfZhTZUG0j+Ox8DZQnCRRfIhUdsVptDiI+LVJH
         /81wIXtwnJZW9tQ4bZWmYLp5EBR+RAo6NNxZ2YmW1CgQOFk/qtMhzjtT2D0ZnlTRiah1
         LOMpMkMi3za7DkCDhFCxIh+axWr4oB89514/t7/aKDrt/Cu163WHWH+sHDrixHJkSSG5
         bKIA==
X-Gm-Message-State: AFq9FYLoLPjwSApGPYzU826ZLg9ewixyVwGkrhsmwh/WreeR7oGFDgqE
	1HgmAbLzUJj939N40efc1CNR0wlp3ivCVATKsqkhL5uieZ6LYoRtF8KVXU8cIy3F+itB1dCzER4
	yLq+iEVg8IxHT5B+UwT6JeuQpF5Qpk6JLAnEWHHTd3lWsMKYlCbJF+LaJJYPljfcn
X-Gm-Gg: AYBFou3oOAqqLbl1NG0v5KuPVTezJkhJfdGcnR+YWTlzoCn5kwUyj+Pk5m9GmSO8kya
	K496yzw5WUHmWlUUkJPWjSUCOKq3HhEiexrHrNVWjlWFkWmwPxffD9cmJsEgx5aAGgJ6r+BZ1xP
	7BN2o10de3vhsH5kL66GPRxar5M95515UiS9qZIuEgkbkuHbu2woKFZq9BPf7SI//XLxA4HG3rx
	Ddczi62zFp/dS7JAo2UyPFzNIjWtquuyAfLYjW3NzU21jnYd/ujvjBo1LwO8XdidvVk42c2bgGn
	wlKNYWy0EP2mArYMWQGJDtkq8gJKZhjqglOwQdoA2Gr0ARV4iinehNViwZLXpq4PZKRE+sCYFz2
	6amVU+Wf5VRrRRL/I88/RmczQE7ypowT9mb+572518V9YEjM00PXRprZxWsYYXNgPXTqB/sJiQS
	pxMsUKq0cUxo4EIvg3AeOJVdLdMdy5Krq7
X-Received: by 2002:a05:693c:20c6:20b0:369:f9da:a70f with SMTP id 5a478bee46e88-36a200beebcmr3514461eec.17.1793190922636;
        Wed, 28 Oct 2026 05:35:22 -0700 (PDT)
X-Received: by 2002:a05:693c:20c6:20b0:369:f9da:a70f with SMTP id 5a478bee46e88-36a200beebcmr3514417eec.17.1793190922034;
        Wed, 28 Oct 2026 05:35:22 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239644efsm10015881eec.23.2026.10.28.05.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 05:35:21 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v5 2/4] gpio: shared-proxy: Drop the vote of a released proxy on write failure
Date: Wed, 28 Oct 2026 20:34:46 +0800
Message-ID: <20261028123448.510401-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028123448.510401-1-shengchao.guo@oss.qualcomm.com>
References: <20261028123448.510401-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfX8h4MVLecRu9F
 ADQStkL81V8nKVL4SymDNWSB7Fjn43lRpsC9beHIL+jHGjlcumQ+FHpWA/VPbJ2Gwp04Io0r83R
 x+WdBFehLPCu/+/4GsmwcaMYQwcgVdor8XZX/nfgSjszhfy/28/Zuj3O7epOs2t9MGU3tga0tq8
 sqMCiVzb8yQFIdAxtqqQ4R0hneGBycavMuIMoJTlj9qw2Y7Ucobwm6ys+97ak7w618Ppp/k4cj8
 6Ri5k010CB2M3Fw91mC+qUV1cifmKcxe4HoFtf5sZXtEvT92k6Ce1TjwL9bqNe24DP5AmiVtHW1
 e/W2P5mnGkUoRmIxZqqVIWMO5INv53qkAuLCZwdtnlHuUtFtXwTQg+1RyyRgxxxbhDVSaPyo4Ek
 FzAvlLC2JKvvIrhwZKDFv25TnCQCSXR9kF8cnJkkQS9WUEP8SUZ/QOeEogSGJGjInBzbI6wt9qb
 qaF0bI+FUkGPVXTvnQQ==
X-Proofpoint-GUID: Y7tTjLu64xiZJ6iBO1E4-f_oj-CkabMI
X-Proofpoint-ORIG-GUID: Y7tTjLu64xiZJ6iBO1E4-f_oj-CkabMI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfX5nvfOtHH5Em+
 Wx1B9Lr3o/r00wSnTNxsqTCaYGZp+FZx3/xMU/XRgNXvC+yER0lbAwZSf7U7kDxc0GDsxZYQ2X0
 EtmcWSrSLjTqUbRuAmknHiXU+/+pWYo=
X-Authority-Analysis: v=2.4 cv=dKgzC+Zb c=1 sm=1 tr=0 ts=6ae1ec0b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Vq87VKjZgZ7Zzh4gvRcA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280050

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
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/gpio/gpio-shared-proxy.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
index 2e9ccd8a8d83..4eae3c9a5168 100644
--- a/drivers/gpio/gpio-shared-proxy.c
+++ b/drivers/gpio/gpio-shared-proxy.c
@@ -138,9 +138,13 @@ static void gpio_shared_proxy_free(struct gpio_chip *gc, unsigned int offset)
 
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

